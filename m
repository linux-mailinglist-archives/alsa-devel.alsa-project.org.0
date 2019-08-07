Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C084F68
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4781C84A;
	Wed,  7 Aug 2019 17:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4781C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190289;
	bh=Wa6yYNLVoY44mfRkFtiJIZefMqLihARooJ06nAR5AW4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ko0TNBE2QjTwR/fafNfVmg0kYkxYLYIlJ5sRDO77LGM20uH4BaDu+2VGYllZ974To
	 vaSzq4KvtYyIch1YfD5gQ3AgG4Ys1/0zJfG67cTNNNo6jpiGd5gnSVRRu0btggIQHX
	 sCZwKCHLA50+wh2Nrb0x4nUK7DrqOR5Cq7cE+Xs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CD7F805E1;
	Wed,  7 Aug 2019 17:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE1BDF80533; Wed,  7 Aug 2019 17:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB0B2F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0B2F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305851"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:01:58 -0500
Message-Id: <20190807150203.26359-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/6] ASoC: SOF: Remove call to
	snd_sof_dsp_mailbox_init
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This is reserved for some historical reason, we didn't enable memory
windows for byt/bdw at the beginning, to make it compatible, we get
those mailbox offsets from fw_ready struct firstly, and then update them
if they existed in the following memory windows, to make sure the
mailbox still can be used if no memory windows are created.

With this change all platforms have the same implementation for
xxx_fw_ready function so that we can refactor it in a common file.

Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 5 -----
 sound/soc/sof/intel/byt.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 4bb9636da990..94be024a99eb 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -455,11 +455,6 @@ static int bdw_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
 		       sizeof(*fw_ready));
 
-	snd_sof_dsp_mailbox_init(sdev, fw_ready->dspbox_offset,
-				 fw_ready->dspbox_size,
-				 fw_ready->hostbox_offset,
-				 fw_ready->hostbox_size);
-
 	/* make sure ABI version is compatible */
 	ret = snd_sof_ipc_valid(sdev);
 	if (ret < 0)
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 000d576f6a8d..cb8f02ee09f2 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -237,11 +237,6 @@ static int byt_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
 		       sizeof(*fw_ready));
 
-	snd_sof_dsp_mailbox_init(sdev, fw_ready->dspbox_offset,
-				 fw_ready->dspbox_size,
-				 fw_ready->hostbox_offset,
-				 fw_ready->hostbox_size);
-
 	/* make sure ABI version is compatible */
 	ret = snd_sof_ipc_valid(sdev);
 	if (ret < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
