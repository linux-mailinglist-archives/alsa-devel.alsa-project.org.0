Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDE51BC7A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 11:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FBC817EB;
	Thu,  5 May 2022 11:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FBC817EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651744190;
	bh=CApK0fyCUqIK926e5z+MoEzW9c20ZDUmBwy6lson0UI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGY+DFL6P/I1cz5Cn7GUEt5saO4i2tVvVmexZozxb8K4oJ2aeIlNS8UxDkfBMLJ+1
	 UTivcK5Et7ZXvMrsIJK9flmrbNbuc68YJS5mHrsTn+NDZa9/sGPe7BbxVxGsrNBlvg
	 ypQPgxanswq+iPbk3KGlubCTUIuyjfJV1snn2AyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A7AF8049C;
	Thu,  5 May 2022 11:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C4CF80508; Thu,  5 May 2022 11:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1C40F8016A
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 11:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C40F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mTi3mVQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651744088; x=1683280088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CApK0fyCUqIK926e5z+MoEzW9c20ZDUmBwy6lson0UI=;
 b=mTi3mVQAEAsjRFicRAXN96f+R6vJbwBwyYlY1zVQKTAGCDaWPJluWd4W
 boyDPc3WimMFHfFFlbVMMK7sjLCexvxm8DfSYENkZpcM+WF2MeKyEdYaB
 TTcvnqkSpzsEgm5MlSUBWirr+DG1xTs/opLw7N0ghhLNCYNO41cpdrSUB
 Jn9Vqw4EfWNqBoVD8coNfTMGNBDlvpDKMIoTmrOiMvFZdUuJALv1TJDqL
 PxET0rOKVAEIKrS/57ZSilDNwO8bVho/9xN6+jKWril1kAfRdVUoTN7n8
 8qw09ptaFhTMs1ZQ7y9XqWwznpAM6xfSB1u8i63kVfPklu3RCKA59JK1r g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267655060"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="267655060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 02:48:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="708870946"
Received: from oluwakem-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.34.211])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 02:47:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 1/3] ASoC: SOF: Add rx_data pointer to snd_sof_ipc_msg struct
Date: Thu,  5 May 2022 12:48:16 +0300
Message-Id: <20220505094818.10346-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505094818.10346-1-peter.ujfalusi@linux.intel.com>
References: <20220505094818.10346-1-peter.ujfalusi@linux.intel.com>
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

The rx_data pointer can be used by IPC implementations to pass the received
message (or part of the message, like the header) from platform code to
generic, high level IPC code.

IPC4 is going to be the first user of this as its implementation on Intel
platforms detaches the header and payload and the rx cannot be handled in
a similar way as it is implemented for ipc3.

If the rx_data is dynamically allocated, it is up to the platform code to
free it up.
After the message reception handling (rx_msg ops) returned, the pointer via
the msg->rx_data should be considered as invalid.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4801849cb2ab..106ef2f2261f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -350,6 +350,9 @@ struct snd_sof_ipc_msg {
 	size_t reply_size;
 	int reply_error;
 
+	/* notification, firmware initiated messages */
+	void *rx_data;
+
 	wait_queue_head_t waitq;
 	bool ipc_complete;
 };
-- 
2.36.0

