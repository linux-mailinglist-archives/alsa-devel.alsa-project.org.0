Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55E31F254
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:32:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186F21662;
	Thu, 18 Feb 2021 23:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186F21662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687555;
	bh=xYR8wCP9TZ+tgvdm7K9+VwPsnPH5Y4UwOD0IevOvK9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHv2RJ9U2gwhOGrJREIEs+Q+qtKZXsgm8MOlTTw1oOmSG6jBOafY63g0lT8o3Rb62
	 Oj9I4Ls0K0ll8bjhZhUSlAJbAqxuoC8LiXS4i2hl4xhwyj7GjOYeh6kQOqCB82egBw
	 nj9iBm0RvlaAE9ANEbQHZRB/y5p/9k01WQRXfR0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE49DF802C4;
	Thu, 18 Feb 2021 23:30:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 854DDF802C8; Thu, 18 Feb 2021 23:29:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EE8FF800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EE8FF800D0
IronPort-SDR: dk0CdhOvjjlJ+KGuW8n1upBICdzFCSP02eip2ywsQFptp5vdwbJIEKQJ5gPYfOOWuHlSGeWFKq
 9lvJ9qLQHDLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875618"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:36 -0800
IronPort-SDR: 3+NegLUBX7e7tJBe2Be6oSCuU9L9MIqbGwENT8Q4of+eDckxKRvOwVT4B5CNNxSKqBwJaYn30d
 PgphIa5V2fVg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990832"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ASoC: qcom: lpass-platform: remove useless assignment
Date: Thu, 18 Feb 2021 16:29:08 -0600
Message-Id: <20210218222916.89809-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
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

cppcheck warning:

sound/soc/qcom/lpass-platform.c:791:10: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int ret = -EINVAL;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/lpass-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 0074b7f2dbc1..0df9481ea4c6 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -788,7 +788,7 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
 	struct snd_pcm_substream *psubstream, *csubstream;
-	int ret = -EINVAL;
+	int ret;
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
 	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-- 
2.25.1

