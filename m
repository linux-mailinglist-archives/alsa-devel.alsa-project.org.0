Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0408B3B5B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84853DEC;
	Fri, 26 Apr 2024 17:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84853DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145240;
	bh=2aq0nHn6IbnZHNu46EkbGXm35IXWPUwj6ke+P365UoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CkRarU9TzQEF3aDiZjFE+rZ6H39nvUu0CcPgOp4YRNArOVUESJDI2drO6fwREtksV
	 6nF3YwjZCLeZUzK0OX8RLBYzmyHqDvhOYyFeHHOqjAFQ73s3vH/k+fHl4EjgJOHJYG
	 wDHpd9lCeJWt59JRogfCeohwuRZSbAMcPDJ/LP7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D78F80655; Fri, 26 Apr 2024 17:26:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC9AF8057B;
	Fri, 26 Apr 2024 17:26:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77ADFF805DA; Fri, 26 Apr 2024 17:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60692F80580
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60692F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Js9I5obu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145148; x=1745681148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aq0nHn6IbnZHNu46EkbGXm35IXWPUwj6ke+P365UoM=;
  b=Js9I5obuU1tV8vz5CbWjAa/KL5e2x3mTGcfBSvhuvn79rYoqERWTtGRu
   MM+BxahFgDnbjuSJ2PIn3cAwu5XZv5DDwQA6eOIRDmXTv+tP7RxgQksIh
   IlWLluQDblWHgxWgeYjninvQL8d+YC7zPqUQGa7alb6T+AAUMvX//jQLN
   JOlKoS42qQco8h5YiLaAQVRo4r4XTO4Dq6N7T6Kr87zN5Kc/d7IjeZI3U
   LE9dHPQtEnuxzjsCh1fKya4WV/8Cj6jsYnXwMFZ1cLhAHRL91gKe+S6dv
   d53uBthkf64kS2td7EJ7MldLIT+VH1+zaq2HcBL9Apfnhzw83fxr08kPf
   Q==;
X-CSE-ConnectionGUID: 6oSvow/bQoW+Y1/RVel6bQ==
X-CSE-MsgGUID: THT1+/GoQz6CfGM4fHOIvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291304"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:44 -0700
X-CSE-ConnectionGUID: 2TW9sPgjTOKpiI7RsuAv9w==
X-CSE-MsgGUID: aunn/L5FSFSepFaasOBboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259557"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/23] ASoC: Intel: sof_da7219: support MAX98357A
Date: Fri, 26 Apr 2024 10:25:14 -0500
Message-Id: <20240426152529.38345-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KEXCBPHD5HZ2IXME2R746XOGJN7SHAUO
X-Message-ID-Hash: KEXCBPHD5HZ2IXME2R746XOGJN7SHAUO
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEXCBPHD5HZ2IXME2R746XOGJN7SHAUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add support to Maxim MAX98357A speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0abb71a10a72..610b5a8e0860 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -267,6 +267,9 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 
 	/* codec-specific fields for speaker amplifier */
 	switch (ctx->amp_type) {
+	case CODEC_MAX98357A:
+		max_98357a_dai_link(ctx->amp_link);
+		break;
 	case CODEC_MAX98360A:
 		max_98360a_dai_link(ctx->amp_link);
 		break;
@@ -393,6 +396,7 @@ static int audio_probe(struct platform_device *pdev)
 	case CODEC_MAX98390:
 		max_98390_set_codec_conf(&pdev->dev, &card_da7219);
 		break;
+	case CODEC_MAX98357A:
 	case CODEC_MAX98360A:
 	case CODEC_NONE:
 		/* no codec conf required */
-- 
2.40.1

