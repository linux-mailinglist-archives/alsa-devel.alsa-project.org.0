Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41643920E6
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 21:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B683172E;
	Wed, 26 May 2021 21:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B683172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622057527;
	bh=L8vGh0zuRYiuxgJNAi39v0Q+g888U666eeUGM/K/vTI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIj3hGXf1fT5MUtuzS6isR9HmZdo3LWsK4x/QtrUxcnlH36uqawyhfmKPYrms47yc
	 0gqmhcnCSnqe6WjrDYG143Vn86hcA11DVIM7jUNIp0Fg9J3p03OqwjVC2GygQSesuP
	 zZPcCQX3NBIkrcTYCZd0MDdukufaxOqhDAFkBQ0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1CDF802BE;
	Wed, 26 May 2021 21:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B8F4F80264; Wed, 26 May 2021 21:30:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03F21F800B1
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 21:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F21F800B1
IronPort-SDR: tHAEL/TSNsEAtfE4ggm1JHKVjYaUnEedC2fci+6TAVYd6fhHjjtT72M/r75sy7SBeHRUeKqXLd
 KgFpwrTlh9sA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="266447561"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="266447561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:30:08 -0700
IronPort-SDR: fy/ecthK3LrWzv4+FMfO1NnpVm/KScDKwmEPyk7BaEYXsywrWh1DOKurVk1is2ccAz3YVL52uv
 1BI6htnDjgrA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="414587779"
Received: from pmundle-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.181.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:30:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: pci: lx6464es: remove useless self-comparison
Date: Wed, 26 May 2021 14:29:57 -0500
Message-Id: <20210526192957.449515-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526192957.449515-1-pierre-louis.bossart@linux.intel.com>
References: <20210526192957.449515-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Sparse throws the following warning:

sound/pci/lx6464es/lx_core.c:677:34: error: self-comparison always
evaluates to false

This comparison and error message make no sense, let's remove them.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/lx6464es/lx_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index f884f5a6a61c..d3f58a3d17fb 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -674,10 +674,6 @@ int lx_stream_set_format(struct lx6464es *chip, struct snd_pcm_runtime *runtime,
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 	u32 channels = runtime->channels;
 
-	if (runtime->channels != channels)
-		dev_err(chip->card->dev, "channel count mismatch: %d vs %d",
-			   runtime->channels, channels);
-
 	mutex_lock(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0C_DEF_STREAM);
 
-- 
2.25.1

