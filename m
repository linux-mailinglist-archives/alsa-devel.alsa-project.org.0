Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB8A7424BB
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35C284D;
	Thu, 29 Jun 2023 13:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35C284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036929;
	bh=/A8Lb5dnkYmyb2Du9coeD7VO6KZF9NyyKQgEU9BMB1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mHVB5RsnQbhf6/W0b8/oMVXxWPTsgpb6DDeiiP3CoHsCYd77WwUwDNvDQqMeBa63F
	 nEwhXFFiV1W9+hnizwfDb3riGAns55VM0uQCTrvsY7Gy0SpgD3hQQHOg57FOZPZW5u
	 LLYrJreSNYKtl1cShSc7Mj6UMlnQFoROBbM7wKzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E84F80548; Thu, 29 Jun 2023 13:07:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D1EF8055A;
	Thu, 29 Jun 2023 13:07:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C81F80551; Thu, 29 Jun 2023 13:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C719CF8027B
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C719CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M/gnxT/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036825; x=1719572825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/A8Lb5dnkYmyb2Du9coeD7VO6KZF9NyyKQgEU9BMB1g=;
  b=M/gnxT/dd8U8H+P1YncuyGWuTT0VZ0QV3bdK5d0kIAb62+3gOHakwLhD
   V34DnePbuGpNFEegOTVG/mzBSKYAJm93JwKNQf4lY59KnIKZf3IpG4Lcf
   v+LfXB77StDPdHSecHx+lltcsFAM1QqkoExdiyc8vDZgSBw4IuJy5bo3z
   X8CSl5wxV8A8eL6rW20fiM2JgEAfb9ehT5Ar5O+0e9SPFysNlCtfFAibd
   OQTFu8CbjxeQjnCQf7KGeQtCQ7VwMEP5rK3eVvYbwSEn4IBzrfrHXn/Qt
   WKbd752BHlTQRk9wS7mjbHrfn2onJReNlWhEmuv7JvhexxJiZcSLZPik2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543612"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543612"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732705"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732705"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:06:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/8] ASoC: codecs: es8316: Add support for S24_3LE format
Date: Thu, 29 Jun 2023 13:24:43 +0200
Message-Id: <20230629112449.1755928-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZPJ7KZGD2OCYRNA4EVS2WON5WFSSKNHJ
X-Message-ID-Hash: ZPJ7KZGD2OCYRNA4EVS2WON5WFSSKNHJ
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPJ7KZGD2OCYRNA4EVS2WON5WFSSKNHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Codec supports words that are 16/18/20/24/32 bits long. In case of 24,
it should be treated as 24/24 not 24/32 i.e.: 24 valid bit-depth in 24
bit-depth container.

For compatibility reasons, S24_LE is left as is.

Cc: Zhu Ning <zhuning@everest-semi.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/es8316.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 5d1fd505d6ba..7e5eb13af428 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -494,6 +494,7 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 		bclk_divider /= 20;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S24_3LE:
 		wordlen = ES8316_SERDATA2_LEN_24;
 		bclk_divider /= 24;
 		break;
-- 
2.25.1

