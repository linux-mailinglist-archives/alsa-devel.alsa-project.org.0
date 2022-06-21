Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5E553ECC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 00:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A497128A2;
	Wed, 22 Jun 2022 00:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A497128A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655852341;
	bh=TY0x4skZSRtNnUTitczz8XAzbhfZ1+UkCJ8XwgnmySQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mi3Wrt3Ba5TP+5UzVskH5lQ7EIQ8NW2veO1r7T86X/FElIgs3h0wgc8UGP45IzBsQ
	 ZU9cwUtJmGUQ27Pyu44tI+j5afM1BUbtIspRsAX8brlC1mgeSDRafkppM0m1gM4Ka7
	 PZMVq7uTBnW+nqSUSOwOM6T2rjjvmqv9qqVQ9vfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F86F80152;
	Wed, 22 Jun 2022 00:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD9EFF80152; Wed, 22 Jun 2022 00:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0DC1F80152
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 00:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DC1F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FhtWnBzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655852236; x=1687388236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TY0x4skZSRtNnUTitczz8XAzbhfZ1+UkCJ8XwgnmySQ=;
 b=FhtWnBzrYEOrNDEffdAKc4Tr1MRKAMaP7muCpbSZ4M+0PNZvbD1KUq/A
 L+4aBJbPJnHxM4/tum4jGKsfH48PEDSCI1eR7/o5/kypThBGeoCHcDgkf
 YnJv0roVNiMStfLpVYAcQbqWJtZtCWvSCCiUZduR/WQ31+MrzyKhG7r5P
 DMAC9PQRI9Maq+LUk59h9j8rGznNsVFX60Jhkza5lFX94FyWi/MdC53Ve
 6eXNX3/sWnK0fIh48fa/O7Odz+VlHbiHdPlvhN4s4g1WUW2aTjbNxu/8P
 gt0wBCFnT7IvCiNn5uXF+laxxdr23puYQlpJxMD3iPtdWPsG7yxpyPicB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263292335"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263292335"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 15:57:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="914354252"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.178.35])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 15:57:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] soundwire: intel: use pm_runtime_resume() on component
 probe
Date: Tue, 21 Jun 2022 17:56:40 -0500
Message-Id: <20220621225641.221170-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621225641.221170-1-pierre-louis.bossart@linux.intel.com>
References: <20220621225641.221170-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

During the card registration, transactions on the SoundWire bus can be
initiated. If the ALSA card is registered after the bus suspends,
timeouts can be seen while reading/writing codec registers. This is
extremely easy to reproduce in driver bind/unbind tests.

In an initial experiment, the ASoC soc-component.c code was modified
to initiate a pm_runtime resume on a component probe. The results
showed this was too invasive. Instead this patch suggests resuming the
SoundWire component only.

Because of the parent-child hierarchy enforced by the pm_runtime
framework, it can be argued that the codec component probe should be
enough to resume all necessary devices, and indeed the same resume
will be applied to SoundWire codecs used on Intel platforms.

Calling pm_runtime_resume() on both the Intel and codec sides has the
benefit of resuming the bus without assuming any order during the card
registration. The first component on a dailink to be probed will
resume the bus. In addition, if a codec driver did not implement this
transition, the Intel component would still resume the bus and avoid
timeouts on card registration.

BugLink: https://github.com/thesofproject/linux/issues/3651
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2e7c27d303b42..c907bab12ee33 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1051,6 +1051,23 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	return ret;
 }
 
+static int intel_component_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	/*
+	 * make sure the device is pm_runtime_active before initiating
+	 * bus transactions during the card registration.
+	 * We use pm_runtime_resume() here, without taking a reference
+	 * and releasing it immediately.
+	 */
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 static int intel_component_dais_suspend(struct snd_soc_component *component)
 {
 	struct snd_soc_dai *dai;
@@ -1106,6 +1123,7 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 
 static const struct snd_soc_component_driver dai_component = {
 	.name           = "soundwire",
+	.probe		= intel_component_probe,
 	.suspend	= intel_component_dais_suspend
 };
 
-- 
2.34.1

