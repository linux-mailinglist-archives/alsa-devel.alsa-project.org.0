Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9999806141
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 23:02:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B23C868;
	Tue,  5 Dec 2023 23:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B23C868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701813771;
	bh=AkPu/oDMqBmK6GGTDU4n4naSkVwn0ixUlP5ozIAIlt0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eVBvs4YhLrR2+s1+S8bsWJLNpxhXgtkfKxKROzD4qvGMqJ78b8iM4YV25neA53Od5
	 Jg1KdiBn90HK9bkAp4yajfhAKOo5xNvSkgjw4frgFJv342x37f8eHo2n9Hse8TOI9w
	 Ld9W6KTHNWL46I4V8EmIkjni9IGNRjaODh+WN3+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7966F800F5; Tue,  5 Dec 2023 23:02:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A605F8025A;
	Tue,  5 Dec 2023 23:02:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82501F8025A; Tue,  5 Dec 2023 23:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0DF5F80166
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 23:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0DF5F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XLdgmQXa
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d0bcc0c313so14240075ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701813717; x=1702418517;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzBMv2W2IEcJ/FXME55CW3PKKvDzbE7hKO1BU/Ge/Xs=;
        b=XLdgmQXa99Kx8Bs7qOrMtI5yJSz1MtcnHaOTOsV2laLAyuVHrd0+PSavaXzeQTOjOA
         WAksQdHQlOyIgsTttU/ss/5uuba/EgHCT9ma7k53nzbAuvPlpR+q3uAZORwiITvUT5jT
         +nmeSnBOIV864vIQGRWJkK0AFlaIUc8U039MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813717; x=1702418517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzBMv2W2IEcJ/FXME55CW3PKKvDzbE7hKO1BU/Ge/Xs=;
        b=bbOi52+4nlHA+IXryf9WyFWFjozqR9MC818KrXe0GGAPC4rgbGiPBYFmgsyOGfyaze
         DbeUBKNyiK4d4C7DRK9rTYnmbwZnGxCsr3HH1kJy2akaVOqPzroc/qjky8HmPyK5cnVr
         AN/IZgUsg2kSh3h7Um7WBH1sSIMrajMm2b5Y1MNFRAEOV+orfzlN3q977FJsQq9I7i54
         WCN4WWThvAoUqqrl0mOYeZDt1bhByzSHiHFw0xomGG2wtFYG84Y5tBSS4Xl5KSK4f9NP
         UkoAz4cm4K0wGT/7IUvvKYnF1KMWbZo49sp6AHPM0O0gd3IkaEPy1zTaWgvvaewutUnB
         1EcA==
X-Gm-Message-State: AOJu0YwBx+SNp7ILUqYbBPHQX5b5xboSiSfn6Rxo3TG21Bx/IIwyDoG/
	uzbhi2Nn/+0jhWWANBA2SPpPw6pZ+7OJ7SzXbA==
X-Google-Smtp-Source: 
 AGHT+IEWsGkq6KIx73ug8Zxkk9TYD/i1PWerdkd2oHiAV9/5G6+44jOiX1bPqiL4/NuK+1BdfzZPiA==
X-Received: by 2002:a17:902:74c2:b0:1d0:5878:d4f4 with SMTP id
 f2-20020a17090274c200b001d05878d4f4mr3255745plt.5.1701813717350;
        Tue, 05 Dec 2023 14:01:57 -0800 (PST)
Received: from localhost ([2620:15c:9d:4:1f6:6bca:e65a:b2a3])
        by smtp.gmail.com with UTF8SMTPSA id
 h6-20020a170902eec600b001d0a6f31519sm4030693plb.188.2023.12.05.14.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:01:57 -0800 (PST)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
Date: Tue,  5 Dec 2023 14:01:18 -0800
Message-ID: <20231205220131.2585913-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3FMVAODN5P2SDGXSX7ZJA7SNAXCZDNXY
X-Message-ID-Hash: 3FMVAODN5P2SDGXSX7ZJA7SNAXCZDNXY
X-MailFrom: cujomalainey@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FMVAODN5P2SDGXSX7ZJA7SNAXCZDNXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.

This is not an official topology from the SOF project. Topologies are
named based on the card configuration and are NOT board specific.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 1d37c9767986f..0d2d7d697de02 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -548,9 +548,6 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 
 static struct snd_sof_of_mach sof_mt8186_machs[] = {
 	{
-		.compatible = "google,steelix",
-		.sof_tplg_filename = "sof-mt8186-google-steelix.tplg"
-	}, {
 		.compatible = "mediatek,mt8186",
 		.sof_tplg_filename = "sof-mt8186.tplg",
 	},
-- 
2.43.0.rc2.451.g8631bc7472-goog

