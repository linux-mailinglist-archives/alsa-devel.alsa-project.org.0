Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E204D5030
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650261948;
	Thu, 10 Mar 2022 18:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650261948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646933123;
	bh=rsrszBNXIHKThz7WnSay2HgMCC7X1jzxQRdCmwjGv3A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nc1US0kAXB3rZ0mhNUvBba8CHoIAcMQkPcPZKjRur0E7bFwBoZ4y6sf0negYoYfE7
	 IQWLq2rcdrBzHXPqQMLG+tBt+7NyS5XV3Xlen2ssrG1+pb9o0b1tamJX67DN9x9A++
	 l48Xc1a83Tos/+unC1cGo0KYXMDjpKKTokj7S7DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C51F80520;
	Thu, 10 Mar 2022 18:23:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D10F7F8051B; Thu, 10 Mar 2022 18:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4007FF80137
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4007FF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AuJ1kfFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932969; x=1678468969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsrszBNXIHKThz7WnSay2HgMCC7X1jzxQRdCmwjGv3A=;
 b=AuJ1kfFY2E4CKbPMguNzgWiMwF1kJUvniFfdaGZJuG9eT7mGKh2z7q1V
 yocwLTJT6UW7bezy9c+9MQThT/4ylM5RkttfU55T38IV5Jx/PiA1GQSST
 Pt26NTAiDOx7axt3Q8JzxTm0qqUi635kAXpDcCQkuzENnXteBlHPE56td
 g9VmMKEt6M3OZOGJNSBL9g66YBQs7+JixVjLxvCf33RDaxXo8euulDR1Y
 X1FkV8a3dIKHSD5JUdkeq3Niay4ivAT/XJfQ7UQcLa3UqXhIJm4WAUwwU
 DKrhOJMjZOuC+kJCghEsUFSPKI/kJmUkPsEpS1sZN2DvQAt3fMGLtzbE5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235918914"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="235918914"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="554738628"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.77.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: compress: fix null check after dereference
Date: Thu, 10 Mar 2022 11:16:48 -0600
Message-Id: <20220310171651.249385-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
References: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Weiguo Li <liwg06@foxmail.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Weiguo Li <liwg06@foxmail.com>

"cstream" is dereferenced but null checked later. Swap their
positions to avoid potential null dereference.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Weiguo Li <liwg06@foxmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/compress.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 2af8d75204e9..a8e908e50101 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -46,8 +46,8 @@ void snd_sof_compr_init_elapsed_work(struct work_struct *work)
  */
 void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
 {
-	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_compr_runtime *crtd = cstream->runtime;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_compr_runtime *crtd;
 	struct snd_soc_component *component;
 	struct snd_compr_tstamp *tstamp;
 	struct snd_sof_pcm *spcm;
@@ -55,6 +55,8 @@ void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
 	if (!cstream)
 		return;
 
+	rtd = cstream->private_data;
+	crtd = cstream->runtime;
 	tstamp = crtd->private_data;
 	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 
-- 
2.30.2

