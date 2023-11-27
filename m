Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF017FA4E6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7606DF4;
	Mon, 27 Nov 2023 16:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7606DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099545;
	bh=XdNZRgknADXEqHF4IqHONdH1Gkp9aKKF8greIYETTko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TdyamM6VN7Kp6UmCuJ4dt7eDYnq8ktBp06JKCc3bXLv0ZnlLl0T63zlWLb+ojRYan
	 aN27BKlqaS1eILlCHOzamDrqXg2zkfMftoURGbNn7QQ5sVyhS7wYoGnuWxZGm1r4gd
	 AUhawI57Pdm20cZgVCPj3XBp91re3fvKOP2Ulbhg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7162F80806; Mon, 27 Nov 2023 16:36:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4CF5F807A2;
	Mon, 27 Nov 2023 16:35:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C0A2F806BC; Mon, 27 Nov 2023 16:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88A1BF805E7
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A1BF805E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uws9RoXx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099333; x=1732635333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdNZRgknADXEqHF4IqHONdH1Gkp9aKKF8greIYETTko=;
  b=Uws9RoXxRx2XFX+GA+xwjjz0RAZjkEQkLBNyJFQ0JBpq6tGfpBaxsQ5B
   h4LBPIoX8X6gl7hl7CSID2SxmA0TOXv1kqNzqgkK+Oe72dwtjXEoPcPop
   nZadduq0pUcQ2gTqzIImDqmP1g46tnJhiThSFafLBKuWPNOWjEOeULcWt
   KympL9lKGPDdPJWN/Sbgq+yyP37jKCfM1v4+kIERw/8yO+pEDOw/cVbk7
   gR1xs7R+ji/NjMkrFQhczRaBp84cG4kCZejXADwYb14rB7sw14qtkCPzl
   2BQdvki55jYeU/tmCNrlo0ABsmCdl+mMt10xH9fKYVpfBgBLawSDsClbr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894533"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894533"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956801"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956801"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:00 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 15/27] ASoC: Intel: sof_ssp_amp: rename function parameter
Date: Mon, 27 Nov 2023 17:26:42 +0200
Message-ID: <20231127152654.28204-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H3RO3OER2TI7SVQ5Y645JSKI2W6NL7T7
X-Message-ID-Hash: H3RO3OER2TI7SVQ5Y645JSKI2W6NL7T7
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3RO3OER2TI7SVQ5Y645JSKI2W6NL7T7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Rename the parameter 'ssp_codec' of sof_card_dai_links_create() since
it's the port number of speaker amplifier. No functional change in
this commit.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 8e478d1cc875..c463bc698c10 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -98,7 +98,7 @@ static struct snd_soc_dai_link_component platform_component[] = {
 
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
-			  int ssp_codec, int dmic_be_num, int hdmi_num,
+			  int ssp_amp, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *cpus;
@@ -156,7 +156,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	if (amp_type != CODEC_NONE) {
 		be_id = fixed_be ? SPK_BE_ID : id;
 		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], be_id,
-						       amp_type, ssp_codec);
+						       amp_type, ssp_amp);
 		if (ret)
 			return NULL;
 
-- 
2.43.0

