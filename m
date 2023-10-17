Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933C7CC975
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 19:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E877BD8;
	Tue, 17 Oct 2023 19:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E877BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697562348;
	bh=ZZIVS7LGy4lfy4xEbOY1CN0/c6fEIjKY2D/mLcl7D1k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bchVN7eDWBr6/PCkU/dny1hEiWIv31gDrmVICo5qohu2vjwRAAGcTS6HbvJjK8D8J
	 lnL+54IS5L6306NjGwCe+Wg1E2sAWobNQ6NfEA2NNXNbSUZtKtdrwj0hJD03VItZaK
	 JVGEnhWsc3jaTsoiHzkLz7gL+IiKD0P7/aAyEXIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35984F8025F; Tue, 17 Oct 2023 19:04:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF1CDF80236;
	Tue, 17 Oct 2023 19:04:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57B2F8024E; Tue, 17 Oct 2023 19:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6919DF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 19:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6919DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GamExADn
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32dc918d454so512958f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 10:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697562278; x=1698167078;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYhVgVukknKnttKNru5mCHTZ6wmo6E2zfS+vFjWMe7o=;
        b=GamExADnJHW3ZB1uSX71dhWg+FDsmqVkyuhDxWzFIf7TQs+62mGRSEBsKivRp4KnDL
         BQmhx3UocGBUuqEM9yjSkXYYdshHgXEBuHfBu5S1DKUtqdLw2wIdX2oJxLIJskbaNqz3
         yM25jWQPMBMHSkJQIGZt0eIcZNrur51qk1lQiFb1LvqPug99QDuLyCh+rdBY3oBO5mPH
         gTMfsB+JUslMDHSJ8rfLQW+ipeIaHlryNHIt7sSnNqZiS0xnRWmYR3KD4Jmy4UGdNh56
         BOK4qjNiLXbsc8pPywTROKT3PKjs9/TrM3cSuo7tnPQHbmQO5iO/8in5HceN/s7P/Gfw
         reEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697562278; x=1698167078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYhVgVukknKnttKNru5mCHTZ6wmo6E2zfS+vFjWMe7o=;
        b=eSo3IgVlsnvxv/cZ1IdQHyv49wHKxWS0tEj8ecGXSiQbp7b146mgWMg/BH5w2vJOlu
         kt3zhhfHnPsOQQcLNf6HvHoZABqdPhVZmlez3j0EN3EPvgR7dZTm4gZyjSa/DZF2Ekjb
         b8uJ7O6MhErsGYitvNVjJMTCo5B03Tt4pdJU/u57xvHAasbVoKtIcsKGJZ5+VtAFQiww
         pOsIW9t1PqiGPjadJFGON+X3Kf0rdeIjSsrlfFMh+YPytHL3wYXMCDj7/7eZv3LKb+6i
         EXt0rqqQuqn6GeBvhwMI4RDHsOIF3mZtIdXGdHng+IJjHJvPf0ThAhpOAiQCGC0a/VAm
         7tEQ==
X-Gm-Message-State: AOJu0YwJKM+Vw4KA5dOmY7+y6C0jvS15CO+khMvAjGvNAelPfYRdbpZO
	ANTM12oBvS4E+3VgRZB5TMY=
X-Google-Smtp-Source: 
 AGHT+IFtNy7l3EGxYkZCWkiAhFWEYsg/TRqDQWID7CtM3pnURtITPTRRkvuHyQUSXKuBI5Nf0blqLQ==
X-Received: by 2002:a5d:4e47:0:b0:32d:65ab:2228 with SMTP id
 r7-20020a5d4e47000000b0032d65ab2228mr2287392wrt.11.1697562278015;
        Tue, 17 Oct 2023 10:04:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 z9-20020adff749000000b00323287186aasm191730wrp.32.2023.10.17.10.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:04:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: tas2781: make const read-only array magic_number
 static
Date: Tue, 17 Oct 2023 18:04:36 +0100
Message-Id: <20231017170436.176615-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N5FHTWVNGK2SO4ASESSPYRXN72ARX4ZC
X-Message-ID-Hash: N5FHTWVNGK2SO4ASESSPYRXN72ARX4ZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5FHTWVNGK2SO4ASESSPYRXN72ARX4ZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Don't populate the const read-only array magic_number on the stack,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e27775d834e9..4efe95b60aaa 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1757,7 +1757,7 @@ static int fw_parse_header(struct tasdevice_priv *tas_priv,
 {
 	struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
 	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &(fw_hdr->fixed_hdr);
-	const unsigned char magic_number[] = { 0x35, 0x35, 0x35, 0x32 };
+	static const unsigned char magic_number[] = { 0x35, 0x35, 0x35, 0x32 };
 	const unsigned char *buf = (unsigned char *)fmw->data;
 
 	if (offset + 92 > fmw->size) {
-- 
2.39.2

