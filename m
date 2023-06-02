Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B0720A50
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C7E6A4E;
	Fri,  2 Jun 2023 22:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C7E6A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737817;
	bh=2z3Vd3lOEguGVEcvhpfG22WnXI5fDrgZFfD/jENCNjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J6t72ekXtsLmbk0Gkr/yhgn7jTytfQtqDyOyXIdeWbIbPlpCKKbnkfSWmhZSrKikw
	 93dBsaJFP2GO83eXVmywaDxfS1kJMqjz1jxTBcPw1Yv79FoEr7xXNZFK7OMy7g3Xmc
	 dI1C/5vnTTUAiqhr3N+xJuOjoM8fzrBQIC0CuQyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DDCF80684; Fri,  2 Jun 2023 22:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61258F8067E;
	Fri,  2 Jun 2023 22:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF70F80619; Fri,  2 Jun 2023 22:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA9CAF80567
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9CAF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gOTuP05F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737398; x=1717273398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2z3Vd3lOEguGVEcvhpfG22WnXI5fDrgZFfD/jENCNjA=;
  b=gOTuP05FFl1u8g8FEBiVpRCtaiMMHYb5qCEjd6UUz7FGafpehXuDI4Qh
   s8E+ilhftmSMRzdjW7Qmi7MGa1ZYxllyw5liZrbsT2gZ4yxm/somCCtkE
   gkuzh/weF+SEhi6RaKTT4D6AXCQSz6CaIV4k+BL962kre+kzp7KCvQO/F
   paV1BBAneZayjKeBqDhiz7K3a+RtOo9WlO3vVn2ESYTtrksBH/ORH/8x+
   p4vE0BFk5jWMai5rU/ciXDAkoz+2Jwgonxe/B0VR1W3Aw4sLOQ8uCXJx5
   S8oJ4Fd+O9YbFzBxr9fyTMipMXcFutoiTMKHUhFC/5XbYyzpanMeNR3Ng
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811329"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811329"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020050"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020050"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 24/28] ASoC: Intel: sof_sdw: Rename sof_sdw_max98373.c file to
 sof_sdw_maxim.c
Date: Fri,  2 Jun 2023 15:22:21 -0500
Message-Id: <20230602202225.249209-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VYPDHPS6YQ5SCFMVXUTYUHFM6OWXXF6N
X-Message-ID-Hash: VYPDHPS6YQ5SCFMVXUTYUHFM6OWXXF6N
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYPDHPS6YQ5SCFMVXUTYUHFM6OWXXF6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

This is needed to use the common implementation for other maxim
soundwire codecs

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile                                | 2 +-
 sound/soc/intel/boards/{sof_sdw_max98373.c => sof_sdw_maxim.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename sound/soc/intel/boards/{sof_sdw_max98373.c => sof_sdw_maxim.c} (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 2de930b1ef31..931415d9cf6f 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,7 +37,7 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
-			sof_sdw_max98373.o sof_sdw_rt_amp.o	\
+			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_maxim.c
similarity index 100%
rename from sound/soc/intel/boards/sof_sdw_max98373.c
rename to sound/soc/intel/boards/sof_sdw_maxim.c
-- 
2.37.2

