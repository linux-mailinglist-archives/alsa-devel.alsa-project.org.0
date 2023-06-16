Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25E733B0B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 22:40:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A97782C;
	Fri, 16 Jun 2023 22:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A97782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686948031;
	bh=ry9yimsxlK5KJyZE3c+PkEGnjWgsyGAkzN8UBBnMiaQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t+0qZdtIY7t1maaQskQIQViJKL47lgTuO5eeyfIEuN6tGDjo9ACzYcAN1XrlgFy/1
	 V36piCWeQfNpQfQKAql2PRG0g1nFOhnbbK6zkofX+jitDQa+kAtkbsCJIG3xaxKkbH
	 T5nXIeO9wckKsPmDhdXBK18OXSrWDJOew024autM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F2DF80130; Fri, 16 Jun 2023 22:39:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6344F80132;
	Fri, 16 Jun 2023 22:39:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC081F80149; Fri, 16 Jun 2023 22:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04D6AF800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 22:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D6AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HAB8fabe
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1a6d3e5dcebso292749fac.1
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Jun 2023 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686947964; x=1689539964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1U+loW1jL11SeZryhiLsr/PxIKmxcD/E6RAZ4HgCOPM=;
        b=HAB8fabeQUAbGcuubsecAXTCLcs+EuE2fSj6FnJH6XKR79rWP1mK2nUPLSD3F/poRz
         4v3bo0N1E9DMpskCWcaWpG6vOeZGX0vRUoBBRlb5huEHjg6Cx4yZYtgBt5w3uK7jYjB5
         1rr9h9j4eAke+PHZWUVTba1tSJhLyYkQ3rWhtuF5KtcqRNSPCY4VK+nTHABUeZbsytwS
         15ck6ok5iznfkCkM6fikCI34nNjPG6imptDZQPFUkWKAboM3LWRLn30rSo3rQTNebbeY
         KRCldw0VYGdTxQMDewDRtypvoP/7TWPt+dCoeTFUQCtV8UKoAFhlTmbeMiEFcKLSzt8E
         Getg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686947964; x=1689539964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U+loW1jL11SeZryhiLsr/PxIKmxcD/E6RAZ4HgCOPM=;
        b=ORpUh7pLPGjZr+SOzJ4Mrqia+dzFSRcPz9p3QgAGitl+UI5hyxYlBjSzKVy3SsuFzJ
         /7WHD0Bl7yIugFxBGg7Biw7Bg3EbwXvRuJ3aCKAV3HSCkwr7wm/fD79O8OQ5w/sInlMk
         +9MkzeZbZ2Wn3nf5qV3ISPgkHJNmLY79IEvuW/Zp6wWTp7uirdHalLvJ9z0OIkQhWiND
         RW2Eh7rJk872snoEKRspegSaAMjm9qKdghYuob6cMIRJgMJkffX3xKWlshd1balyxO65
         0KGXpbFDf6HmwRcjiytPDIu2pDHJ1EMLBvAgvPFJ9MWUvvYFn/2JDXhK8Pt0HTFdu8sw
         ICeQ==
X-Gm-Message-State: AC+VfDzCBVq9l6/4baxNUdPDCO3GkxSXjGGyvUvUm6+JmTYg89UoPsGY
	ceEouYSAq4L+pZbLqIqNPCA=
X-Google-Smtp-Source: 
 ACHHUZ6FITAVAoqTB9jtgm9ucP+8WXRFZGuyIEUCbNRZY3CgKSGXDt1eQH2ZmcW8CL7R5BpH6UrMdA==
X-Received: by 2002:a05:6870:f152:b0:192:7328:d with SMTP id
 l18-20020a056870f15200b001927328000dmr3781189oac.4.1686947963755;
        Fri, 16 Jun 2023 13:39:23 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:b78f:b393:2fd9:c1d1])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a05683020c700b006acfdbdf37csm8003769otq.31.2023.06.16.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 13:39:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: fsl-asoc-card: Allow passing the number of slots in use
Date: Fri, 16 Jun 2023 17:39:13 -0300
Message-Id: <20230616203913.551183-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SAE2WLZXYCFSRGB6OVKD7AS2G6A7TJIZ
X-Message-ID-Hash: SAE2WLZXYCFSRGB6OVKD7AS2G6A7TJIZ
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAE2WLZXYCFSRGB6OVKD7AS2G6A7TJIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Currently, fsl-asoc-card supports passing the width of the TDM slot, but
not the number of slots in use, as it harcodes it as two slots.

Add support for passing the number of slots in use.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl-asoc-card.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 40870668ee24..98137c33f877 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -60,6 +60,7 @@ struct codec_priv {
  * @sysclk_dir: SYSCLK directions for set_sysclk()
  * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
+ * @slot_num: Number of slots of each frame
  *
  * Note: [1] for tx and [0] for rx
  */
@@ -68,6 +69,7 @@ struct cpu_priv {
 	u32 sysclk_dir[2];
 	u32 sysclk_id[2];
 	u32 slot_width;
+	u32 slot_num;
 };
 
 /**
@@ -189,7 +191,11 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (cpu_priv->slot_width) {
-		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2,
+		if (!cpu_priv->slot_num)
+			cpu_priv->slot_num = 2;
+
+		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3,
+					       cpu_priv->slot_num,
 					       cpu_priv->slot_width);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dev, "failed to set TDM slot for cpu dai\n");
-- 
2.34.1

