Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC36BCFA2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 13:38:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBDA11122;
	Thu, 16 Mar 2023 13:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBDA11122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678970285;
	bh=pWuq6wgxZYUjIYXxzu8zNKkNSZD39hHos45N1n84uTw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l5i/T2L/WrC5s0H/TO5fJP3WiB3HYlZbltMtWTP2Y3Hg1YMg5JUP+A2mwwNm/uAWM
	 M91c8pyVyNq1FVeW7XVZ1XFShF4Lt2NopVAgxr3epsRhJ2VVTFDTDtXH5+K6MsY2eI
	 x2qjyMljDMES4nGHfHf8OzSrjP/h6cXn8zUr/VDU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7108CF80482;
	Thu, 16 Mar 2023 13:36:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB49CF80423; Thu, 16 Mar 2023 13:36:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4401F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 13:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4401F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=Bl7rDum6;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=ZTtwAnQd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970180; x=1710506180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=optA/elZmJXfhAeNRT+3b55PWRJaR5Rj/yChsqibYps=;
  b=Bl7rDum6mD+bNrEGQPgNKCM708U9HyNFn06aG+4ia64sKtk/eyQGq6gd
   uUrsy1bgTxtnlV+dwu1lvxg8/odkLxrlxOirk4OgXXyV8/KJPqIHIciNI
   m6liBCPx9FvQct4GlCwByCUx3wRjhJ6zShd6Xp+t8vVDjw/AHhlqZDmK6
   VMw4CFhxrfPNR9DkHpCWyEwcnuGZd4A8GcY72BwhuLC5g74/tb0bdSeVm
   T4B1jyd8TBusYaydufCfxOXxJNuCcXVkMbO1RcR2ebckyYBl1P4kgrruK
   fif+PkXcvAGcfqxt1oIgWdxVX7d4Jzq4eae2BdXB2FtaQINvh04sIjNWU
   A==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000";
   d="scan'208";a="29738031"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 13:36:16 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 13:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970176; x=1710506176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=optA/elZmJXfhAeNRT+3b55PWRJaR5Rj/yChsqibYps=;
  b=ZTtwAnQd86/PaC7gY3AzVeB6Crjf44BQGc5Jn2mRK2fe9bfxhIvVOIXg
   rEZdcWwOTamlOzNxNODK7tGCRQEYFoKn93Wa75Kz0cxsyHtV2OvHVNiRc
   x5bHMW5XZcc3csRFXPCC2UBPR9NoCSZv38v1GGOdYXoTilA92t5pNNQO+
   fRiCowL0/TI6xWv5fiKDL52VJETJlK4X/zjMp0aMQkEERlga4uIZ/hdFQ
   gPCQBXsR6KuYIFtjO/5splFV6zs/xW00iBzy+NK0NeaA/EnGW2ffBF2I0
   xpE3XTE/QyHqg8wzpl+OYJ8khguKEIGtCN8ckz22ZF0cZMnnG96LEwdq2
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000";
   d="scan'208";a="29738029"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 845EB280072;
	Thu, 16 Mar 2023 13:36:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: fsl: Specify driver name in ASoC card
Date: Thu, 16 Mar 2023 13:36:11 +0100
Message-Id: <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NH3HTTXLHC4DQAWOFSW737YSVRSINW6K
X-Message-ID-Hash: NH3HTTXLHC4DQAWOFSW737YSVRSINW6K
X-MailFrom: alexander.stein@ew.tq-group.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Stein <alexander.stein@ew.tq-group.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NH3HTTXLHC4DQAWOFSW737YSVRSINW6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set the snd_soc_card driver name which fixes the warning:
fsl-asoc-card sound: ASoC: driver name too long 'imx-audio-tlv320aic32x4'
-> 'imx-audio-tlv32'

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
These patches could be squashed, but I opted for separation this patch
is the actual functional change. Patch 1 is just preparation.

 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index e956abfd50f8..bffa1048d31e 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -609,6 +609,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	priv->card.dapm_routes = audio_map;
 	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
+	priv->card.driver_name = DRIVER_NAME;
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
-- 
2.34.1

