Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8654ED56
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285551B0B;
	Fri, 17 Jun 2022 00:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285551B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655418673;
	bh=Kw+OdvwAvffqIiIFyzfvVRX8uYzhXxCqjC3UVyYGkD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QLK0G9foZbRJhiQST0OFX601IIi9UJbWwy9nc7bd2jQO2MgUMlwUz843Mn6dd3AOA
	 sZPPiWeX3InJd+q0kFTkjbF8dQkxnRr7+kVobkfrMWhXCUXKSoP8oNKj5wxSjgDaGV
	 gufPvGJ5O4C6hffkUX97Sisg3eMIj6m5ZPl2TIfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADBDF8052F;
	Fri, 17 Jun 2022 00:29:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 346F5F80527; Fri, 17 Jun 2022 00:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD921F801D8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD921F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GZf+xJtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655418569; x=1686954569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kw+OdvwAvffqIiIFyzfvVRX8uYzhXxCqjC3UVyYGkD8=;
 b=GZf+xJtJTln/YJ0NtihjgvtjPDoj+98iSxqUkqlMEvVYqRVaD1VT7jLB
 1wsVgKaPzZtfTLaEB/D+r80mOkb00CXCaJP7psmjUVfMnmcLKSoGDKATb
 R6em9mxquViGXPb/IeyDr2o+nan1F/kWvjVuEhRfr4YuC+8ixxmpGTLl4
 hsa0ekLHQLIZkXzzFxJ/EU4Oky8BhyewY099FCxZnfgk9KO6zv5EVNyKp
 ChrsRcQzkf04t6TNaApvXKCRIvFcavSB6svgqdHrWRNRz7ftqclH0hoXl
 GiMIKZKcJ/ziofY18K572q/pavlvmh1yPy+neK6dKg/rbHLxCfobrWcNu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365718821"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="365718821"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:29:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="653359638"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:29:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: x86: intel_hdmi_audio: use
 pm_runtime_resume_and_get()
Date: Thu, 16 Jun 2022 17:29:10 -0500
Message-Id: <20220616222910.136854-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616222910.136854-1-pierre-louis.bossart@linux.intel.com>
References: <20220616222910.136854-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The current code does not check for errors and does not release the
reference on errors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/x86/intel_hdmi_audio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 3b04c70a73e33..ab95fb34a6358 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1068,7 +1068,9 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 	intelhaddata = snd_pcm_substream_chip(substream);
 	runtime = substream->runtime;
 
-	pm_runtime_get_sync(intelhaddata->dev);
+	retval = pm_runtime_resume_and_get(intelhaddata->dev);
+	if (retval < 0)
+		return retval;
 
 	/* set the runtime hw parameter with local snd_pcm_hardware struct */
 	runtime->hw = had_pcm_hardware;
@@ -1536,8 +1538,12 @@ static void had_audio_wq(struct work_struct *work)
 		container_of(work, struct snd_intelhad, hdmi_audio_wq);
 	struct intel_hdmi_lpe_audio_pdata *pdata = ctx->dev->platform_data;
 	struct intel_hdmi_lpe_audio_port_pdata *ppdata = &pdata->port[ctx->port];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0)
+		return;
 
-	pm_runtime_get_sync(ctx->dev);
 	mutex_lock(&ctx->mutex);
 	if (ppdata->pipe < 0) {
 		dev_dbg(ctx->dev, "%s: Event: HAD_NOTIFY_HOT_UNPLUG : port = %d\n",
-- 
2.34.1

