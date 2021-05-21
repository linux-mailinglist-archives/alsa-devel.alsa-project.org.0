Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FE38C34C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 11:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722AB16B8;
	Fri, 21 May 2021 11:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722AB16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621589806;
	bh=xIglhPS5CK+lWv05HqV5DWH3GrqA6QCsuGJ0OPJ9lx0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akAyCGP+5vNaVd4ejROVfqWi6vgf8JAaZz79g4VY2UoCI2N7wBiojebVHIGW570f6
	 UTEVgyLcjUROmk6fUfdWMhYt3PyTty3fGx0Kgdv9mKMWe9wf9QUzNarf9ghSj0jMo+
	 b+zt3iluexI8Ff9sZIK27P2+kKAswJ4QqP18nGTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8336F804CF;
	Fri, 21 May 2021 11:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6353F80475; Fri, 21 May 2021 11:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFA1F80258
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFA1F80258
IronPort-SDR: tFhxKjUlaOJh6jlRHXWAY7BiWqCXgwQdBzhs7Y9+3OuiHS5/r8ZS6BG2mIKx3feuFtajjvi1K1
 Og+UA8WaK7KA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="262664200"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262664200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 02:33:22 -0700
IronPort-SDR: QIC41XbNBK9KOP0gFCUQ5jUZYy9EU1hDz5R3tcmjo/NChFezjoFr5tkWfJR1W8+ZSHPHL1fcaI
 XWGLhPmjfOCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475640885"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 02:33:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/7] ASoC: SOF: topology: fix assignment to use le32_to_cpu
Date: Fri, 21 May 2021 12:28:02 +0300
Message-Id: <20210521092804.3721324-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
References: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Fix sparse warning by using le32_to_cpu.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 92d346bbd357..cc9585bfa4e9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3338,7 +3338,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	/* Copy common data to all config ipc structs */
 	for (i = 0; i < num_conf; i++) {
 		config[i].hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-		config[i].format = hw_config[i].fmt;
+		config[i].format = le32_to_cpu(hw_config[i].fmt);
 		config[i].type = common_config.type;
 		config[i].dai_index = common_config.dai_index;
 	}
-- 
2.31.0

