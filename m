Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC431442F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:43:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4FD16C3;
	Tue,  9 Feb 2021 00:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4FD16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827804;
	bh=zDspIRWwagioIMw3O+Yom+0WEbFlNqy4Z9lBuIzPOrw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qujvtS+bN5QVQSgZjlkqWKg76+Hmqk2M74++3kACgTxDasTF8Y3BW785p7hyZg5I4
	 hgF2lp5iV/qXAhl1cDelCgU7RaIxxYOs+cJWPo9qKhIafIrSuCcbKHRT7cMjxUmuh/
	 ORTaXpG6HHq3w3DiN/BQSzMrl9Dd9s/1KzmAfpxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E92CF8027B;
	Tue,  9 Feb 2021 00:41:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABE61F80264; Tue,  9 Feb 2021 00:41:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C714F80114
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C714F80114
IronPort-SDR: Yj/CRHj8mZLNtGT0twq7nQH697QG70rGQltczEaLL7l3BDAxm2lpjILwYH3aE+q/r9iPPrnufU
 +H4INgKrQK6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243297916"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243297916"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:40:56 -0800
IronPort-SDR: i+2BEftvCgK3CUPaIY1/ph3JDUXlOEeqo3RoMJivfp9EIDEc8z87PA45whygV51ASTfH73UbJh
 TWNvS1vb1v7Q==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487640920"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:40:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/2] ASoC: Intel: boards: max98373: get dapm from cpu_dai
Date: Mon,  8 Feb 2021 17:40:43 -0600
Message-Id: <20210208234043.59750-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208234043.59750-1-pierre-louis.bossart@linux.intel.com>
References: <20210208234043.59750-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

There is a prefix on max98373 codec, and the prefix will be added to
the pin name However, there is no prefix on the "Right Spk" and "Left
Spk" widgets.

To avoid getting a redundant prefix, we should get dapm from cpu_dai
component.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index c2a9757181fe..437d20562753 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -63,6 +63,7 @@ int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	int j;
 	int ret = 0;
 
@@ -70,10 +71,10 @@ int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		return 0;
 
+	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		struct snd_soc_component *component = codec_dai->component;
 		struct snd_soc_dapm_context *dapm =
-				snd_soc_component_get_dapm(component);
+				snd_soc_component_get_dapm(cpu_dai->component);
 		char pin_name[MAX_98373_PIN_NAME];
 
 		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
-- 
2.25.1

