Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34309510537
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA3C18E9;
	Tue, 26 Apr 2022 19:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA3C18E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993642;
	bh=gWHKP9vbd7Vc6UOcR5R3yu+nUGcHtwMYZhreRpwKxBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEQa4cyjV6uvpM6KyT6GgRkvfUob4tcIIpHJqRHWjez0qRvB7Q89DexLlIpuYm0W6
	 uWm+4dM5xrhXaX9pZXwqFcaU05KivF40X7EiJAfm37xQkQPA1JxJKhy2tQThu7FgMG
	 OCm6jcJaFONmBvRsuSIYew6LDBLYSSmGQubv8n1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96ED2F8051A;
	Tue, 26 Apr 2022 19:17:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515BEF80516; Tue, 26 Apr 2022 19:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A62F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A62F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RUeFRZSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993474; x=1682529474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWHKP9vbd7Vc6UOcR5R3yu+nUGcHtwMYZhreRpwKxBE=;
 b=RUeFRZSQByLXsIz+HcKQR79uyxayKUgEyHN+Jaq/y17a4ta0LA3YU6G0
 ir+4xb8yEQV7WYsBtuBs1BdSHNtLuPEU2WOVcvB3teBYnqTgoeF8123z3
 KFOxIBvFYxAjCve2+bEssvvEa41YcxuQSpa5BwWiDD/7ZwSL5gPrSin8B
 0y0EVjOwhMsQihRcaMysdM9xdPris7wVIj9mVur12p4BciFp5SOhyLhAr
 1DgGS9zGQcC8pVuYKtuym/C+Acw1jksyARLcqiXrH1Hd1okmiIhY+FWHh
 j/zukfvGb7zgQgfbXEgD+Kcc0LRjEybzIqz6K7ejv2oXy2NZI+xTfQ4wn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326150595"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326150595"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431194"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:49 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ASoC: SOF: pcm: Move the call to
 snd_sof_pcm_platform_hw_params()
Date: Tue, 26 Apr 2022 10:17:36 -0700
Message-Id: <20220426171743.171061-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

IPC4 requires the platform_params be passed when invoking
sof_pcm_setup_connected_widgets(). So move the call to
snd_sof_pcm_platform_hw_params() before calling
sof_pcm_setup_connected_widgets(). This has no functional impact.

sof_pcm_setup_connected_widgets will be modified in the follow up
patches to accept the platform params as an argument.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 6242327e663e..2d21e531ac4f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -150,6 +150,12 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
+	ret = snd_sof_pcm_platform_hw_params(sdev, substream, params, &platform_params);
+	if (ret < 0) {
+		dev_err(component->dev, "platform hw params failed\n");
+		return ret;
+	}
+
 	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
 	if (!spcm->stream[substream->stream].list) {
 		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
@@ -166,12 +172,6 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 			return ret;
 	}
 
-	ret = snd_sof_pcm_platform_hw_params(sdev, substream, params, &platform_params);
-	if (ret < 0) {
-		dev_err(component->dev, "platform hw params failed\n");
-		return ret;
-	}
-
 	if (pcm_ops->hw_params) {
 		ret = pcm_ops->hw_params(component, substream, params, &platform_params);
 		if (ret < 0)
-- 
2.25.1

