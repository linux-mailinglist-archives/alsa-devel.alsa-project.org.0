Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197238B3B66
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611CE1909;
	Fri, 26 Apr 2024 17:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611CE1909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145305;
	bh=MbT7M4ySziynJAlOypts7f8IrwqccgLvm/YDOfB9l+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJ7dDZ1v7RsEiZ8L8BiwO7mv84yKaVIu8iK+I8lpzwZ4ggGwjhZ26x1V9fXskM3CR
	 2zySLG2USRy0CnEsGT+zAg3s6lapUcT1jJc6EIoeeTkSJD2xtVYmachN8wDBaNylSW
	 VXv6ALEmigtMz9w2SeV0rm2qLklnCeV4j8hbLU3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B4F3F805D2; Fri, 26 Apr 2024 17:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7303EF806BF;
	Fri, 26 Apr 2024 17:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 722A7F8057A; Fri, 26 Apr 2024 17:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84908F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84908F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bNiM66OT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145145; x=1745681145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MbT7M4ySziynJAlOypts7f8IrwqccgLvm/YDOfB9l+U=;
  b=bNiM66OTuWEb2HKoRUFD2MSxXJuPXDHps7EO5sive3xlTYhNpQ0oiKDY
   ci0RhN9T/rwhY/i659rZDM3B5pKA1+7COkc/mzdOTUL8pR0a4f67jdyI9
   Wo6wOQubOoqlC10a0S31utzj80XKT/q4wzWCfiITC5rCR1pjXfTihrAuz
   ATh66y5CEQ4y9CqFQql5vJ+h1fr/KNExCRP6o6aaSF1XK2Ecsrrr2jZsX
   qAI4ftvnk5HGn8R9NRJFSeoi5yhHYjAN9Kgln3uFn19SD9ltIjajTxWSg
   YHoE9Un6XX3gF1mHPTg/QK8OqEfKCheqfaLeteRzm5x7cxYVtYUE/YobY
   g==;
X-CSE-ConnectionGUID: J+5l1YnuQLaIqfoEdhPoQQ==
X-CSE-MsgGUID: L+/Z1Ge5SDKfRSfViBuO6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291281"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:40 -0700
X-CSE-ConnectionGUID: CbqReKXiTheIn/vQXU0kWA==
X-CSE-MsgGUID: PufFyFzFRlOqSwmck007Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259539"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/23] ASoC: Intel: sof_da7219: support MAX98390
Date: Fri, 26 Apr 2024 10:25:09 -0500
Message-Id: <20240426152529.38345-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZMOLZDSHVJ2CRJ46VW4V2JUPETNCMS42
X-Message-ID-Hash: ZMOLZDSHVJ2CRJ46VW4V2JUPETNCMS42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMOLZDSHVJ2CRJ46VW4V2JUPETNCMS42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add support to Maxim MAX98390 speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      | 1 +
 sound/soc/intel/boards/sof_da7219.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b122b8aedd9a..fd1f46fad5eb 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -614,6 +614,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
+	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index cbbce07ec5f7..de5b0a8b5b8c 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -281,6 +281,9 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 			return -EINVAL;
 		}
 		break;
+	case CODEC_MAX98390:
+		max_98390_dai_link(dev, ctx->amp_link);
+		break;
 	default:
 		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
 		return -EINVAL;
@@ -352,6 +355,9 @@ static int audio_probe(struct platform_device *pdev)
 	case CODEC_MAX98373:
 		max_98373_set_codec_conf(&card_da7219);
 		break;
+	case CODEC_MAX98390:
+		max_98390_set_codec_conf(&pdev->dev, &card_da7219);
+		break;
 	case CODEC_MAX98360A:
 	case CODEC_NONE:
 		/* no codec conf required */
-- 
2.40.1

