Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9885E0E9
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:24:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE31E1E2;
	Wed, 21 Feb 2024 16:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE31E1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529069;
	bh=UL33BUB1QvPJei2j1OXIrdPDYAwHFkF6kU98ejZwiio=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ADWRNFwmIJCKxVtHCdnqYRKVDUvjNNtzzGKUPF5wp30rQ59TERuRcrVGnOL1orSh+
	 qK2yW9/XnCm1k4KiLElvoZl/GfvmeApGJhRfr1xAgIhFM9yddpVrPay+Cm690dNCHd
	 uvzeumZEVWKIdZwL0kd/3Tv7+ki5saQIyxlmr98A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851E6F8059F; Wed, 21 Feb 2024 16:23:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15043F805A1;
	Wed, 21 Feb 2024 16:23:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1E13F804CC; Wed, 21 Feb 2024 16:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E58EF800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E58EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FQ9fInLF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529027; x=1740065027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UL33BUB1QvPJei2j1OXIrdPDYAwHFkF6kU98ejZwiio=;
  b=FQ9fInLFKutF1D8uQaPdI2pqZK/yNV3FG1VFkd7bjWoI60SKs3KpVb+A
   G5wF9LZjeu5rnljT2Szh6HCWcT13iumnndzBVjS/WMNKUOFjdGaI/K9yI
   v7BMZ5vd0jYRG7CD1gjw7vnv1DWUons0qITpUQSFpmqBxxnYxydvKoB2s
   Iuu8Z0ipNTEi/uxVJXSikwZ1SCgEDJBi6X2p1Jnj1uxqVCWpVWvHfr8mE
   OeNcI+LnKFHz86hp+i6ekJNifTpKmPdp1ffcvzic6xRlffY+/LtystEqh
   D64u/PI39rsZN2V0O1T6EehvLQwC6atCLpp5D2aVhpWPBX1p33BMQs5gp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104772"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374233"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/6] ASoC: codecs: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:10 +0100
Message-Id: <20240221152516.852353-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H6ONV23EMENJ2RSED75AIV5VJG5P4QLE
X-Message-ID-Hash: H6ONV23EMENJ2RSED75AIV5VJG5P4QLE
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6ONV23EMENJ2RSED75AIV5VJG5P4QLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patchset may not cover all codecs found in the codecs/ directory -
noticed a possible improvement and grepped for similar pattern across C
files found in the directory. Those addressed here seem pretty
straightforward.

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Cezary Rojewski (6):
  ASoC: codecs: da7213: Simplify mclk initialization
  ASoC: codecs: nau8825: Simplify mclk initialization
  ASoC: codecs: rt5514: Simplify mclk initialization
  ASoC: codecs: rt5616: Simplify mclk initialization
  ASoC: codecs: rt5640: Simplify mclk initialization
  ASoC: codecs: rt5660: Simplify mclk initialization

 sound/soc/codecs/da7213.c  | 12 ++++--------
 sound/soc/codecs/nau8825.c | 12 ++++--------
 sound/soc/codecs/rt5514.c  |  9 +++------
 sound/soc/codecs/rt5616.c  |  9 +++------
 sound/soc/codecs/rt5640.c  |  9 +++------
 sound/soc/codecs/rt5660.c  |  9 +++------
 6 files changed, 20 insertions(+), 40 deletions(-)

-- 
2.25.1

