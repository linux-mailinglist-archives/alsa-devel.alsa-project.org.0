Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C725E5D0
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Sep 2020 08:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00EA1AFA;
	Sat,  5 Sep 2020 08:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00EA1AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599287183;
	bh=JGhILqCzejFN4PgB/NPwA8DkW+GH5YHyw9L6eI3Yq+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKYXITaOYUkfLaEw6/0KLDTBJa6JT0l5hF6XK0vnvmJMOBCrI5JA2pEQ2Ed5R1Yyo
	 WwjLK1pojNlo8J/S/Zw7sP/fb9cFtnN5D3VixgE+G/OJ4+LDIoa8cS8ANXc6IzIfWz
	 TDAO9EKQJ+w3F3QS/NMKr0xSjNCFfkSyrsSMf3Wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0DB4F802E7;
	Sat,  5 Sep 2020 08:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87D5AF802E2; Sat,  5 Sep 2020 08:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7DBF8025F
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 08:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7DBF8025F
IronPort-SDR: J9OOrbQlcAnTQEyatJrMcjk1nLU6odj3XFTFaJlFdNlkkKRAsEM5Kikx96BSTOrOwP3+Zlbohe
 t9SnzGhGYo7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="145547462"
X-IronPort-AV: E=Sophos;i="5.76,392,1592895600"; d="scan'208";a="145547462"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 23:22:51 -0700
IronPort-SDR: XHKZPE1pnjJxVEqYHA9SQHCGYf1cI1IGLzueIWa1oY4RSdmcaJrtWtCdTpA97zCD3b+7FS0S/v
 ddaKZCMdNjgg==
X-IronPort-AV: E=Sophos;i="5.76,392,1592895600"; d="scan'208";a="478804292"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 23:22:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v3 3/3] ASoC: Intel: sof_sdw: add dailink .prepare and
 .hw_free callback
Date: Sat,  5 Sep 2020 02:28:54 +0800
Message-Id: <20200904182854.3944-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
References: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add .prepare and .hw_free callback to dailink.

The companion patch for this patch is the removal of stream operations
in the .prepare and .hw_free callbacks at the DAI level in
drivers/soundwire/intel.c

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f251e046d74d..16503772965c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -195,6 +195,25 @@ int sdw_startup(struct snd_pcm_substream *substream)
 	return sdw_startup_stream(substream);
 }
 
+static int sdw_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
+
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_prepare_stream(sdw_stream);
+}
+
 static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -235,6 +254,25 @@ static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
+static int sdw_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
+
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_deprepare_stream(sdw_stream);
+}
+
 void sdw_shutdown(struct snd_pcm_substream *substream)
 {
 	sdw_shutdown_stream(substream);
@@ -242,7 +280,9 @@ void sdw_shutdown(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sdw_ops = {
 	.startup = sdw_startup,
+	.prepare = sdw_prepare,
 	.trigger = sdw_trigger,
+	.hw_free = sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
 
-- 
2.17.1

