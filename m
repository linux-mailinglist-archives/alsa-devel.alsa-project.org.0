Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2ED9437C3
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 23:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA64A2DBA;
	Wed, 31 Jul 2024 23:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA64A2DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722461017;
	bh=TaSJA4z+shWPsD5xKsY4kzGjtvxTZrzChFedH7x0ST8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dsuAAC8O1B3JNA4mJQh9ambx47ciOnO9fZFn8II5pqktM2NxkmqiZvqyEGAjBJGcQ
	 m7D3rYmeUszdnrgWoCKZOwRvfQfXUwIGZksETZ8iiE5Murm7Nj00DJXgxf9qzl5RuB
	 E/iPpd8qLDDO2aU2M70jVsvMJU+JZiX0L9Y/amMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E011F802DB; Wed, 31 Jul 2024 23:22:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 031B0F80580;
	Wed, 31 Jul 2024 23:22:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14764F802DB; Wed, 31 Jul 2024 23:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB20F80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 23:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB20F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=RhYvrWU3
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70d18d4b94cso4584240b3a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722460928; x=1723065728;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQoygPRsO7fuc8InmrgIFH74TmYM5vf/QmGY1GXB8QA=;
        b=RhYvrWU3Cfcnrg9LnAelmSG0mln6jgIgvjydy9Oeteva797lPjr8/+7JZSOTy5ddvJ
         tr1Q0ng54/JGQzOA0PJ2OdMEjwMyhXsXgpf597XlTzLAXgXxAlSpetRMyy5KA5DNvyqR
         UWZ+PFlhJlE7Gmw7ceyCTpvQlIBDz0bRNEjWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722460928; x=1723065728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQoygPRsO7fuc8InmrgIFH74TmYM5vf/QmGY1GXB8QA=;
        b=rG7nXuycqq4QBVMJIeI+/bCmtAjOZ4GWde6Mrb/0ZNVa49RarQcdSrc6fsPLQjJP/i
         +iftmgk25fPqpeJjpg2Sn77qE189CuQVruL/SrXAmLPU/DTPGVzZSaxGyjiqi0Eu+RCx
         wQmpyKY++Lhvx+Cn08QGpSa3rPlkXGG+Rh77urTSb0iKMVZdCeUj3GDVHE8zZOOwdTum
         YgYyCB7TpqHmyMB2LtBEVpV69e14tUAe9KVolx0c9El8SIp4nAfgyFtsVpTAQ/mado3p
         ACPGQQz3pihv8Cl/w31DbRgYBTiYhMjv/AA3BJUz6IH0inkEPQxiVOtnt5BSeQfGmdLH
         1ORQ==
X-Gm-Message-State: AOJu0YyYT+aOqMHeToW27N1lNiyJ8PxTwEL7Kp9K0FrnErO/67A8g/u1
	ErycU9qebrAx8804iVrCVke7H00JIqHnk7DQuxjIUVM5BOJpp8cBGxQc1LWDcqZzhnM2N6oy4g=
	=
X-Google-Smtp-Source: 
 AGHT+IFdnzTDfvmRv5xGcTjAKdn+O94ZCOILB4FUfqHYh7QWrhEL82tbEtZTc9qKamQymC5LPvfuRw==
X-Received: by 2002:a05:6a21:7881:b0:1c1:30fc:90d6 with SMTP id
 adf61e73a8af0-1c68ce777camr882082637.3.1722460927827;
        Wed, 31 Jul 2024 14:22:07 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:6a6b:4e74:edc6:135c])
        by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1fed7f75972sm125234265ad.240.2024.07.31.14.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 14:22:07 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Wojciech Macek <wmacek@google.com>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: SOF: Remove libraries from topology lookups
Date: Wed, 31 Jul 2024 14:21:44 -0700
Message-ID: <20240731212153.921327-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J66P3DTSBMX7EWCEZLIQHFZ27FNO7U2F
X-Message-ID-Hash: J66P3DTSBMX7EWCEZLIQHFZ27FNO7U2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J66P3DTSBMX7EWCEZLIQHFZ27FNO7U2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Default firmware shipped in open source are not licensed for 3P
libraries, therefore topologies should not reference them.

If a OS wants to use 3P (that they have licensed) then they should use
the appropriate topology override mechanisms.

Fixes: 8a7d5d85ed2161 ("ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies")
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Wojciech Macek <wmacek@google.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 24ae1d4959be..1c6e035fd313 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -573,7 +573,7 @@ static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 static struct snd_sof_of_mach sof_mt8195_machs[] = {
 	{
 		.compatible = "google,tomato",
-		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682.tplg"
 	}, {
 		.compatible = "mediatek,mt8195",
 		.sof_tplg_filename = "sof-mt8195.tplg"
-- 
2.46.0.rc2.264.g509ed76dc8-goog

