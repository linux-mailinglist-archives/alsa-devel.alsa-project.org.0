Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0474642D6F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6228317BD;
	Wed, 12 Jun 2019 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6228317BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360451;
	bh=S1l6zW4p4BcuI4dnGj8z25OGL/Q7hKrYk+9bZCiLTro=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oc8OsirjAwMNQ3jJe3d9tvTVAw6BvzH2se6j4s7Q3TUtnF86gQaNxW/PwVq0AGyde
	 QVaVQj3q/jv3WPwWgEp52vg4Mix+in5tRpRZ4wHYVBL2yTzOAQijYW0Jrqwr4YBmQT
	 MvNwSI6CoxDzpou9p3Xx28mKJjBolUIQiIWg8CP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33AF2F8973C;
	Wed, 12 Jun 2019 19:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C67F89732; Wed, 12 Jun 2019 19:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFD0F896E3
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFD0F896E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:53 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:35 -0500
Message-Id: <20190612172347.22338-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/15] ASoC: SOF: topology: add cpu_dai_name
	for DAIs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the cpu_dai_name member to snd_sof_dai and save the
cpu_dai_name while setting the DAI config.

The internal SOF representation will have to change at a later point
as well when we have multiple CPU dais.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 1 +
 sound/soc/sof/topology.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d2dbca7d57d1..10e061a5c39c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -337,6 +337,7 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_sof_dev *sdev;
 	const char *name;
+	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
 	struct sof_ipc_dai_config *dai_config;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index aaf459af89d0..178256e338b1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2360,6 +2360,9 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			if (!dai->dai_config)
 				return -ENOMEM;
 
+			/* set cpu_dai_name */
+			dai->cpu_dai_name = link->cpus->dai_name;
+
 			found = 1;
 		}
 	}
@@ -2624,6 +2627,8 @@ static int sof_link_hda_process(struct snd_sof_dev *sdev,
 			if (!sof_dai->dai_config)
 				return -ENOMEM;
 
+			sof_dai->cpu_dai_name = link->cpus->dai_name;
+
 			/* send message to DSP */
 			ret = sof_ipc_tx_message(sdev->ipc,
 						 config->hdr.cmd, config, size,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
