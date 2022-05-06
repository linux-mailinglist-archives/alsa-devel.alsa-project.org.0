Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43951D872
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE8D817B6;
	Fri,  6 May 2022 15:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE8D817B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651842224;
	bh=ua5WUAk4SvN6NFdP2dXgBvX6rexyiQmiwxILcwTbKRs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zx4aTul21cHW8wJ/6sJ5GfjpgjONG9heWkMPMUlL6IN4iCx1euIhlAvuklm6D6Sr8
	 gN7egrMJYs+MossfAKnh8Rcs5P98LFZMK4GQhFZ1K0gxRpo3vdV2PTUP9VIPlMN9B8
	 2pu2glIfpwdkUDlR1uSwQiOqxigo3QsraJWPuJ24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35FAEF800E3;
	Fri,  6 May 2022 15:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA906F8014B; Fri,  6 May 2022 15:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E87F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E87F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hKEUUDB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651842148; x=1683378148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ua5WUAk4SvN6NFdP2dXgBvX6rexyiQmiwxILcwTbKRs=;
 b=hKEUUDB+nbfwe3SVhen/0bk7aUQIimNCp/GeO7XO662AOvAJ6oLBLRzu
 iV0pJLEJa3ruafpSlJT8IeWfdtXg1FoZ7D8yM+WvKIdwp4TkDOzTmGkWl
 TSvFp9ADNJjUgwxiRUzjTnJfLJebV5jFZZO13v2/F9AjkkKA/NBpBU7/s
 0/2LpJT6SqUOa6z/NBCJ1+szVJdwjFenlstoq5HKmGpr38WxQrT6R5V8k
 LZHCibZUlyAZi4XleGYLDBae965BdaRyJEVc3tzrc3oywcgFwV9VQJsvV
 FZwsSJyd71NTX+PPoseXQ/Jw+w4oZJ2u8Cnd2FEo5fzamyCMWecwbYfiy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268604170"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268604170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:02:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585963836"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:02:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: trace: The dtrace is only available with SOF_IPC
Date: Fri,  6 May 2022 16:02:29 +0300
Message-Id: <20220506130229.23354-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Currently the dtrace only supported with SOF_IPC.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
Hi,

I have pending series to rework the whole tracing support to allow different
tracing solutions to be plugged in for different IPC versions.

It is going to be sent at later time, until then we need to make sure that the
current dtrace is not used with IPC4.

Regards,
Peter

 sound/soc/sof/trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index ba6361b5d64b..5d171bf8a5ea 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -457,6 +457,10 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
+	/* dtrace is only supported with SOF_IPC */
+	if (sdev->pdata->ipc_type != SOF_IPC)
+		sdev->dtrace_is_supported = false;
+
 	if (!sdev->dtrace_is_supported)
 		return 0;
 
-- 
2.36.0

