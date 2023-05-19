Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9770972B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA85825;
	Fri, 19 May 2023 14:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA85825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498693;
	bh=dKM8/qjifAr/pAHw/mTEzaJ2EgQi1hYiS+/J/CVx7xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tzSipvuK9zKRtyiCo5K7TD/NlvChIyAzj4E5BMCfOg2X+cviw30uJCx2/IBIkCa5z
	 LL5SRPbUN09CNckoU8q5Lz2VKlC+6DZs/2tGySye9VwujC7lBc1wZ0Gi6yV+D2xCI5
	 EgGwiUEG54J++33y8zY78a41rBDUXi8vTDaF+sDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987AAF80588; Fri, 19 May 2023 14:16:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16C85F8057B;
	Fri, 19 May 2023 14:16:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95AA5F80558; Fri, 19 May 2023 14:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 297B7F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 297B7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eucra285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498562; x=1716034562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKM8/qjifAr/pAHw/mTEzaJ2EgQi1hYiS+/J/CVx7xs=;
  b=eucra285IlK0q15+NyFqP/PETPqK+BFloncHPhnF3RuDwkCml8MvWNZD
   u+DnmnMKqgv78UOfha9bE8RUtm7wuMnl23UAVFsCompPYgTeT3HcaYrtl
   dYf/WTxpORqzg+Mmuk6tEWqFvF1rqDnI1HGoURRbFb0LQc0Xvzpmm1yYU
   Af5IPEUU69i+52H1rHz2wucFqZh9NQnvTyeJkyl+vsNKEWnrgVJWYOPQ+
   YBat8AKsoL9dQTylorsU9JwHWPeikjZOkJ1kemawmrH2GNSbFNjTTbnkS
   Ho7fg4hlQEirtencKzheeBQCzAF5ElEBvbJSjJzzp53sjTxvJsywNFfKT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584427"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584427"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283671"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283671"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:15:57 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/7] ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
Date: Fri, 19 May 2023 22:17:07 +0200
Message-Id: <20230519201711.4073845-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 26DMUJ7QJASAA2AXAT33YIUQQTGQXZVZ
X-Message-ID-Hash: 26DMUJ7QJASAA2AXAT33YIUQQTGQXZVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26DMUJ7QJASAA2AXAT33YIUQQTGQXZVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Constant 'C4_CHANNEL' does not exist on the firmware side. Value 0xC is
reserved for 'C7_1' instead.

Fixes: 04afbbbb1cba ("ASoC: Intel: Skylake: Update the topology interface structure")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/uapi/sound/skl-tplg-interface.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
index f29899b179a6..4bf9c4f9add8 100644
--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -66,7 +66,8 @@ enum skl_ch_cfg {
 	SKL_CH_CFG_DUAL_MONO = 9,
 	SKL_CH_CFG_I2S_DUAL_STEREO_0 = 10,
 	SKL_CH_CFG_I2S_DUAL_STEREO_1 = 11,
-	SKL_CH_CFG_4_CHANNEL = 12,
+	SKL_CH_CFG_7_1 = 12,
+	SKL_CH_CFG_4_CHANNEL = SKL_CH_CFG_7_1,
 	SKL_CH_CFG_INVALID
 };
 
-- 
2.34.1

