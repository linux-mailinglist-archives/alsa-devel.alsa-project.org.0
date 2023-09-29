Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD67B315B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73ACADEB;
	Fri, 29 Sep 2023 13:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73ACADEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986851;
	bh=y6Mwcl6axdFMs+v5QocUpeNfVhM+JKBzo1ifiiJ1gB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZhJcuNoWcr15zwNLhyaOvXUz9gKQgMofG5PlVXKg/6MNbI48Zi1gEmTTTvG8eh58A
	 vyirOyobRSzdOaatqJAG/PcN2YGZ3ztw6vMIYjun/iOogflRpoERWeFsK49CRcKQsj
	 GpfEoJLu3a7rLNRHmi7OMUZEJSMvdL1A1kCj4znw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8491F805A9; Fri, 29 Sep 2023 13:25:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11686F805B2;
	Fri, 29 Sep 2023 13:25:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87493F8055B; Fri, 29 Sep 2023 13:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F559F80549
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F559F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LmQ3tTfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986681; x=1727522681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y6Mwcl6axdFMs+v5QocUpeNfVhM+JKBzo1ifiiJ1gB0=;
  b=LmQ3tTfdNFmAUqmtAdziZ+dcdlOpR2H49RkqIAeCBjXZcvgrjt1tTB1L
   Q8+bzEojj1oHSEilx7VgbjFdmUi0KzU/lxytE2+bxp7ql7b6Vjh70oZ9o
   O8duQNlH7f0O9pJlSBPgpEjj6hqZSqZ3QxxjtzGi8V7MXtjxTgva3VVLu
   i8e1PK6UvOgY1o5yOijI+wlcCPCi3CkueRMRJ7kFHQ5WLARfCevUGUedb
   ng0AFuGRcJm3K63M+j2NVaZAwutIaSANUlC9dFYoFVeScJfrmIg6yyZbX
   Pin2d4MKO6L3kJ2X44jdkuaLLSLtQi5htdT6MK4Sjld86Guk3IFT8XMhB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880261"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353760"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353760"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	Wu Zhou <wu.zhou@intel.com>,
	Libin Yang <libin.yang@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 5/6] ASoC: Intel: avs: Disable DSP before loading basefw
Date: Fri, 29 Sep 2023 13:24:35 +0200
Message-Id: <20230929112436.787058-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XEVE4MOMS2ILJFIDDULFFD5I4LAKDXYO
X-Message-ID-Hash: XEVE4MOMS2ILJFIDDULFFD5I4LAKDXYO
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEVE4MOMS2ILJFIDDULFFD5I4LAKDXYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Wu Zhou <wu.zhou@intel.com>

When audio controller is passed-through to the guest machine in
virtualized environment, the basefw load will fail the next time guest
OS reboots. Disable the DSP main core before loading the base firmware
to sanitize the environment.

Signed-off-by: Wu Zhou <wu.zhou@intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/loader.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 56bb0a59249d..65dd8f140fc1 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -662,6 +662,10 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 		}
 	}
 
+	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+	if (ret < 0)
+		return ret;
+
 	ret = avs_dsp_boot_firmware(adev, true);
 	if (ret < 0) {
 		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
-- 
2.34.1

