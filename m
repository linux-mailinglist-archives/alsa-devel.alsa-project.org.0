Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B736882
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 11:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 953CE83E;
	Tue, 20 Jun 2023 11:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 953CE83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687255102;
	bh=BPrZiYjHta3fPPACw5J533rK/flXCMO5EeQ7J4KwwyE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I35+WfcP5wmKW010n4jtL+e0vwbQZ2K8vZ/33L3RyBFUVbyDHhYGFW+JLID2Kcx/V
	 sWrbmPqs21h34JEZrjsk/gaud9JoZ+pBXY7Z2bbFVHXhQdVykfgNEBVmnCOfrbTFGZ
	 6b7gq4wtM+cS1nsa5aAQxBK3yGhH1sEmfkkvBOgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 989AAF80141; Tue, 20 Jun 2023 11:57:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8257F80132;
	Tue, 20 Jun 2023 11:57:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D16CF80141; Tue, 20 Jun 2023 11:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5283CF80093
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 11:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5283CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nQZMj+0R
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f69so29259335e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Jun 2023 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687254982; x=1689846982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nzfSnFwwgUKGBxhz4K3sxN6CVZIzUqaHD5LMCxLNTs=;
        b=nQZMj+0R5+KtxAXE0ZEN5ZZdFles83qKs8iX+fsg0noiCxN6QmGAD6ma8fz06kMDaR
         XQNjrEiFt3dtK1/l3kNeazgIIK42SDIEKr96LHiUIxWZJjIQv5V4iY0IFAPENO16ZAQo
         FVOmaLdV5jFqjVz2hHie1anPFYgc9EzCMcN5WBFl7npcHDdF8GgLkMWKtKS+z9mCnwz0
         30VCojhkx80O0xpnXMG/JSkVIK4hnts0+yZU8+9hBov0VwbMe0E5jJgKRiAPVvRP/MIO
         2XDGBf5iVoPFE2jvS7WVxE8nPGRuMj/xvjWkIAB9QfPodQnO0ivRf/ouX7DLff1t4/EX
         /ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254982; x=1689846982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nzfSnFwwgUKGBxhz4K3sxN6CVZIzUqaHD5LMCxLNTs=;
        b=CMh7l9kESZCi0UZH9Y0Kp5s3gV6T7SSmEbhMNP6x1nSDTHLE53kIo9tHd5r+8KxwBX
         xZ2KPdCrQJvpqjReR3DHa/duvkxuOURuzcsMTHH8ZHNPl/Llcb7/8kerWQaLwDyJEPlb
         rxHK4TkbHz9jIaIza3NmnZOIukp6/EyEKygeUtC4Jhz7fHONr34PC+Pw92uVpmKZruxv
         b+WdSkmxmGT9PlpNf9xidpQmFfYkg4Fnccq+z55Ob4QlC6audZL/KsJk6SYHwvd6qsB3
         MA9EcJLBhgCUAAzlEf0oyV3VDCLG1E5KB91VFC5Al3r3yaS15YynXQ2dtFaG+AxzSWkA
         MxHA==
X-Gm-Message-State: AC+VfDzmmQYvM0dxQplFMTb7sj04++XFSqtwScW9BoFJrNv92AF3u/mB
	rIMnJUOdoEMT/BO+X21H780=
X-Google-Smtp-Source: 
 ACHHUZ57QTB7wxq1J7LAwX05NJAArS4vx/ZblH3A3rVBL1H9ewMMGIwbkkwag/Q5ylBcYjKIpX35/g==
X-Received: by 2002:adf:e7c2:0:b0:30f:c764:189a with SMTP id
 e2-20020adfe7c2000000b0030fc764189amr7427650wrn.39.1687254982152;
        Tue, 20 Jun 2023 02:56:22 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 i11-20020adffdcb000000b002fda1b12a0bsm1659046wrs.2.2023.06.20.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 02:56:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <13916275206@139.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: tas2781: Fix spelling mistake "calibraiton" ->
 "calibration"
Date: Tue, 20 Jun 2023 10:56:20 +0100
Message-Id: <20230620095620.2522058-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6SAMFP2P7TQRWRF7WMSKVZAXTX4Q7XNG
X-Message-ID-Hash: 6SAMFP2P7TQRWRF7WMSKVZAXTX4Q7XNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SAMFP2P7TQRWRF7WMSKVZAXTX4Q7XNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a spelling mistake in a dev_err message. Fix it. Also fix
grammar and add space between last word and (%d)".

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 432b19ccec8c..cbf0aef2c001 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1863,7 +1863,7 @@ static int fw_parse_calibration_data(struct tasdevice_priv *tas_priv,
 
 	if (tas_fmw->nr_calibrations != 1) {
 		dev_err(tas_priv->dev,
-			"%s: only support one calibraiton(%d)!\n",
+			"%s: only supports one calibration (%d)!\n",
 			__func__, tas_fmw->nr_calibrations);
 		goto out;
 	}
-- 
2.39.2

