Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDC7D3B64
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 17:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFE384D;
	Mon, 23 Oct 2023 17:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFE384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698076220;
	bh=+YASCn+yVN2za7rwaS32EojgxXHV8CcjllMgP8bxogE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p/r6wwEGBH2OLiZi68y5aliKdX2LGOXXlDq22VRVwQwPa0HGn3xoLaTBqv05bdeuG
	 agl+iQ8bCAhR7qfwB/ioxyfaQUxlyfWZd1CBe6KuwJp1Xm9fHlVPgExDoaWK/mrfVc
	 pbqX4v84dapkM7AtQ2kFAQ+7Bt7dDR9/h+mmSnU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C52CF80537; Mon, 23 Oct 2023 17:49:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA25F8032D;
	Mon, 23 Oct 2023 17:49:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF248F804F3; Mon, 23 Oct 2023 17:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B230F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 17:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B230F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gNUULEt+
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso25452355e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698076158; x=1698680958;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99vvqY3a62R+FSNgedTvGTn1Ho9xYE+BPOA4cYmL7ss=;
        b=gNUULEt+DTkyTwPiPRwQDyGAC1hDmpesajYsczv4Pe+7LJ+/30QqlQpTrCTBYd9fL2
         kgHxJDUmfT2grR/G0EzSyjPehz62vIZriO3Er8B0RywrTZ0B2ABYwyZ/27Kxfal6hPGf
         DGwhfkPaEbDM1ppjPuavbqH2vgI/zelweAgtMVyNxeoV4VR9C1+NA7Mjrd3DYKfQ/HTF
         vTkJ0rxJu65htveIZkXEDUJ9HNdVTz0PDFjS+BihONayTG8PlMSrZwc62lWW3NL59rP7
         78RPeJs2omKDSoka5YPTUpkTsuwHAY2j75HgBib/sYPi9VLEGbpRyJizYbrxExLAfxEC
         gwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698076158; x=1698680958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99vvqY3a62R+FSNgedTvGTn1Ho9xYE+BPOA4cYmL7ss=;
        b=VXrxk5uSYLdFwl3T/cFf4IJxZlMCQ9MGOA7Gki0ShN9AThWlP7vARLw4K1vm5fTyWl
         WaqViU/uLSijoJllwlOzrri+po+ghh4RRmg5qWZiMT6lPBRaDPqF7gKWVu1NqX9ranDQ
         PUi8HvSXhofueAAYP5haQ7IPphOGB1Jl4uqg4XvMT2iqcr9Y2TM3p3UbcYFvcscdcZhM
         BMjVCRpemIDE2HVb0mgdgUvMFhIvYz2jdCMIfe/4Ijk6h6hBBwhrAPOCdlO8Rak7CHKJ
         aCNIDwcB49FY9lu36nmEny7u8h1B0t48Q+BPf8LDPC99y9fBXfXGudWaYucmKhnvXMrs
         5obw==
X-Gm-Message-State: AOJu0YxouzvQzcnNyaIY1qlws5g3Bd+3ezIplN4juKjGGSeQgge15dmA
	rvEjRfFVBAKGvIOS1E8dFDQ3NxB1HeGRKg==
X-Google-Smtp-Source: 
 AGHT+IG99IjlfivFo6WK5QnjYKrDjIihUfYEP6AcPPqn8XoZsXSFBeG9i6v7AO+y6rhDotBMZnRCzA==
X-Received: by 2002:a05:600c:4f12:b0:401:bdd7:49ae with SMTP id
 l18-20020a05600c4f1200b00401bdd749aemr8315715wmq.18.1698076158310;
        Mon, 23 Oct 2023 08:49:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 b24-20020a05600c06d800b004064e3b94afsm14420510wmn.4.2023.10.23.08.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 08:49:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: codecs: rt298: remove redundant assignment to
 d_len_code
Date: Mon, 23 Oct 2023 16:49:17 +0100
Message-Id: <20231023154917.671595-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N4IRTLLTLPEDDLMVC3GGN7QS7PY3RMON
X-Message-ID-Hash: N4IRTLLTLPEDDLMVC3GGN7QS7PY3RMON
X-MailFrom: colin.i.king@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4IRTLLTLPEDDLMVC3GGN7QS7PY3RMON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Variable d_len_code is being initialized to zero and then re-assigned a
different value in all the valid cases in the following switch statement.
The only place it is not being assigned a value is on the return for
a default case and in this case it does not need to be assigned. The
initialization is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/rt298.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 8fbd25ad9b47..ad3783ade1b5 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -789,7 +789,6 @@ static int rt298_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	d_len_code = 0;
 	switch (params_width(params)) {
 	/* bit 6:4 Bits per Sample */
 	case 16:
-- 
2.39.2

