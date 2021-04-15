Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3836101B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA3C1675;
	Thu, 15 Apr 2021 18:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA3C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618503996;
	bh=yrkNooT7AzVbItMzJaJpfr/cT1VwA+WN2WJdcWf35Rk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JdrO1p2Z3yzUtao+PwdosUJOBuJB82ID6mODpCrtFtLdW+k6wJXZm70P3/J82D0l4
	 SsgUD/ec3QzldR+k5pi251YneNpQ7ngXka3hJYhj7RzeYm/bity3Hsr49eSgKXHP9z
	 RhyK8TcdrcVQ6FmxrWCu+Zlsq13pWDT17Cq4m980=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF5FF800ED;
	Thu, 15 Apr 2021 18:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD86DF8022B; Thu, 15 Apr 2021 18:25:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F83FF800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F83FF800ED
IronPort-SDR: LVq5L3/H6Tox7K33C8ToLT/8j4g8jUar14Wn8FhsQ+K8QBX8E86nne5/URzwKMm6nMAMFlJ66s
 Grbff5vh2Xrg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194446434"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="194446434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:21:20 -0700
IronPort-SDR: FIYSlztTCv2lBlOm9Hdw6y+LP8p50l6isMJxUknsFTyt1rmw6ZmZEoRMVeoFqfNe+RO/AfkSLZ
 TaBVkxC9hktg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="418796185"
Received: from juanrod3-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.126.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:21:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: SOF: use current DAI config during resume
Date: Thu, 15 Apr 2021 11:21:07 -0500
Message-Id: <20210415162107.130963-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Recently, the sof_pcm_dai_link_fixup() function was
updated to match SSP config with the PCM hw_params
and set the current_config for the DAI widget.

But the sof_restore_pipelines() function still chooses the
default config for the DAI widget upon resuming. Fix this
to use the last used config when setting up the DAI widget
during resume.

Fixes: c943a586f6e49 ("ASoC: SOF: match SSP config with pcm hw params")
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
v2:
used SHA1 from Mark's tree, not the SOF one.
Resending on behalf of Ranjani -> added Signed-off-by

 sound/soc/sof/sof-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 0d0d47dc0246..510883cd9107 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -267,7 +267,7 @@ int sof_restore_pipelines(struct device *dev)
 	/* restore dai links */
 	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
 		struct sof_ipc_reply reply;
-		struct sof_ipc_dai_config *config = dai->dai_config;
+		struct sof_ipc_dai_config *config = &dai->dai_config[dai->current_config];
 
 		if (!config) {
 			dev_err(dev, "error: no config for DAI %s\n",
-- 
2.25.1

