Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733C700E8D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB26E92;
	Fri, 12 May 2023 20:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB26E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915590;
	bh=FJlxJmEIMnW0fENAakGjAEqhkRggHLqa/ov+Yz2NMVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UWaBQlpRnyC3+ky8PzmizrkFfCPj/qt6D524bXxG2vvf5mD+pG6g1lUvfSceNskcS
	 8n2VBH2bVJjagvL8rmXL0C1TETUESM8gyx8xTbNE8oceW1mxOPQQNNIGAlg6Sz2e9y
	 DLkQQ/L8P7Om7i3FZltBgjzePn78Dy+es56GYQ5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C1F2F80578; Fri, 12 May 2023 20:17:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64DBBF8057E;
	Fri, 12 May 2023 20:17:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECF49F80544; Fri, 12 May 2023 20:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC381F80534
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC381F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TK5lTduz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915463; x=1715451463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FJlxJmEIMnW0fENAakGjAEqhkRggHLqa/ov+Yz2NMVE=;
  b=TK5lTduzhxXiXj1/Hiil7Fdit/9+ua1bL9kul0vh/QP8foBukCAu8Pwj
   xApXrM21N1u5XVNR6f8vM547Ty/lVktxGE1p8mad4g68tWoOTh3vACPSh
   TXMAn84pKnzrat17ylr+tTQWtXiPX1YcL9PcnRfUc6SQTplmlwg4Aywhn
   BnAyGo6o7Rc+To47EgTqOEsmmhEdqafTjzuM2fC+rSRFt5lCdSVjBL3Gw
   FzFI3MAVQYkZkzjJEL+pM9tlCSe9fk7YlL48PPKAqEx2kGlaTQqWAMaUE
   S+k+dL4K7dddBeOGyi3cb1M3wLpl6YdLGnLKfBHfVN5zOrDqep5OfxjfX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223205"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895063"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895063"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/9] ASoC: SOF: Intel: fix DAI number mismatch
Date: Fri, 12 May 2023 13:16:56 -0500
Message-Id: <20230512181702.117483-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5A7K3DW4F4FKUXJDMDZTGM7KX7YIXM25
X-Message-ID-Hash: 5A7K3DW4F4FKUXJDMDZTGM7KX7YIXM25
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A7K3DW4F4FKUXJDMDZTGM7KX7YIXM25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The number of DAIs was based on a Kconfig option and the declaration
on another. Fix before changing the dependencies.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c4befacde23e..65832a38bffa 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -414,7 +414,7 @@
 	(HDA_DSP_BDL_SIZE / sizeof(struct sof_intel_dsp_bdl))
 
 /* Number of DAIs */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define SOF_SKL_NUM_DAIS		15
 #else
 #define SOF_SKL_NUM_DAIS		8
-- 
2.37.2

