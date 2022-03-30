Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B94ECDCA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6581AB8;
	Wed, 30 Mar 2022 22:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6581AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671690;
	bh=v1AKXMhBFfjEwWOxrOxven0a28qinAa9HORzeGn2m/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUPMNGWPhPV3ViZ8L2tIboLcB5lLLuAobs7YQPCRfd7xoL0Jr9ZB1u+WwFZIPkNVm
	 GSjASzrMy9nV9Ahla+qXOux+z0Ao5VrFhFtJGkqEYK3qPRpT6BQncmyiAMky3i2DVM
	 x/olnQkxLUNxZTE7DRfnzPgEEU4cl1FtGQZAV5kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E058CF8051A;
	Wed, 30 Mar 2022 22:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25FC1F8051C; Wed, 30 Mar 2022 22:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE387F80254
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE387F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JffgXHXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671583; x=1680207583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v1AKXMhBFfjEwWOxrOxven0a28qinAa9HORzeGn2m/c=;
 b=JffgXHXqnCdY6KReLyyDra9y5cgsldbKPdT7RA1/pZNQdNGYyqa1VhdD
 AvyBn812nUDsm5b5sbbR7rtHzNbVB+3i/51IOckVCyaEI8hoX43xYMXFO
 iSw/Aw+PtsMs9BJvy1HOS/hzfigmVZlYQfjJi0wxHaK+Ik0kgIJrTyQ9I
 XyAmdVGJuxc0SoZwkfwEAI/9sM4H7xuPjCIHomAlIu+2T+7bK03GgIGkg
 PQGCUHbyfpoJPH5qkDAI8/3NbfwlTdqWyXV4zkoe19+VTMYc5JqsEvbOn
 fI2bMTSue90pbSWap+O/Iq81bxTRX6zsyeYsbZb6t+tklBuK/jiHFhXri w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819828"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045026"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ASoC: SOF: ipc: Use ipc->max_payload_size for
 message/reply size checking
Date: Wed, 30 Mar 2022 13:19:19 -0700
Message-Id: <20220330201926.1330402-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Use the ipc->max_payload_size for validating that the message or reply
size can be supported.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index af2efc1c8436..166d4906698b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -373,8 +373,8 @@ int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 {
 	int ret;
 
-	if (msg_bytes > SOF_IPC_MSG_MAX_SIZE ||
-	    reply_bytes > SOF_IPC_MSG_MAX_SIZE)
+	if (msg_bytes > ipc->max_payload_size ||
+	    reply_bytes > ipc->max_payload_size)
 		return -ENOBUFS;
 
 	/* Serialise IPC TX */
-- 
2.25.1

