Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1568344BE5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 17:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55EE11681;
	Mon, 22 Mar 2021 17:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55EE11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616431269;
	bh=gRQqELjOMa7q+Re1u0oWUKmzsc+wMKbHVf7dpJQWq4c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1uXkIXbVZwfjh208wYBZEkBq5fsV7bArzT48k/sqQIfue35QC7dWX2no9bxrEM1v
	 k5xOH+MEmb6z+ut9Wt8mMb0ZMbLadaUwqsGkHbEZqvCsEJCG0TVllea1I4Fzx/o5Gs
	 AD/GTxaTIwJ/zqV05S/+ejN58GN0FwczwpTb8GSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D9EF80475;
	Mon, 22 Mar 2021 17:38:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A12EF8025F; Mon, 22 Mar 2021 17:38:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE7F7F8016B
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 17:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE7F7F8016B
IronPort-SDR: gDBAZLgyB+80Dj6f8BG4ZZWzzSq1hVojfeqslASFl9cRpfC3vWu4pCr8cMmcdEA8anzEHdU/NS
 RB2X+FC1HDIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210376635"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210376635"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:46 -0700
IronPort-SDR: Y9wUQDtIn9cYJ6Z6ysYIaaZfO3gelRDTwc+7TRjkrExUcldP3pox8H+p5uRbBFDqeVBF6akhak
 kWQpowv8Elpw==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407899119"
Received: from josemari-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.40.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: SOF: Intel: CNL: set shutdown callback to
 hda_dsp_shutdown
Date: Mon, 22 Mar 2021 11:37:26 -0500
Message-Id: <20210322163728.16616-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Libin Yang <libin.yang@intel.com>

According to hardware spec and PMC FW requirement, the DSP must be
in D3 state before entering S5. Set shutdown call to hda_dsp_shutdown.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e38db519f38d..094cde17a1b7 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -232,9 +232,10 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 
 /* cannonlake ops */
 const struct snd_sof_dsp_ops sof_cnl_ops = {
-	/* probe and remove */
+	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
+	.shutdown	= hda_dsp_shutdown,
 
 	/* Register IO */
 	.write		= sof_io_write,
-- 
2.25.1

