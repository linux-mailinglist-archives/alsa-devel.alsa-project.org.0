Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E147E273
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:40:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C3218B2;
	Thu, 23 Dec 2021 12:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C3218B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259650;
	bh=7Gf4sc38cn6yV4jXfZsPGUGU3zEcr477GBwH24Slao8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCTbzGJu1h4PVm2J7vsyCSmBaGlD37qNcgr4EzWHxGozM6tiK6fPZRbvgwZFbDUeZ
	 GijhDTkS61Vvus7KU+hPi1+6i4y9dAd7O0m/4HtA49wo50ONZR5U8Ca0sJgnGjsw8D
	 Nc0dNYZavxJSmCGFXTOETgMVQ7OM4Nymn/HQ/KMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BEFF80542;
	Thu, 23 Dec 2021 12:36:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C81F80544; Thu, 23 Dec 2021 12:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C804BF8051C
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C804BF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dgH3Xqqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259398; x=1671795398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Gf4sc38cn6yV4jXfZsPGUGU3zEcr477GBwH24Slao8=;
 b=dgH3XqqaOHFrAq9IlPOAlCH6jfhinuy50Z6tnIu3qJqSfuUfzsBgz1fl
 /TFK2G+e784FSo7lnAv89n67L2tapY8yQ9+z+otKhAvk6WWVOQWtOpzW6
 7NW1PITn1VqqNrXlxV2eLEoHvIV37bSYjGByH5ouWjGaCnJnThssN3I29
 BGu/I/uwFdgHdJc8yISFMGc+HnlBIazWIS2CUmiYJuoeqBW4+WOFPQyKM
 C0Ww9cRzq19cBdHkg48yzYRrA1R0Wtpgat0FQfUSvN8KdLBY+JykhCE6x
 gNE+UsH4tCe/uAk47dFg8zcfZDlPQvSqECDf+hqno52JwJRk/SNZHmbJR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180835"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180835"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065158"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/20] ASoC: SOF: ipc: Only allow sending of an IPC in
 SOF_FW_BOOT_COMPLETE state
Date: Thu, 23 Dec 2021 13:36:19 +0200
Message-Id: <20211223113628.18582-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

If the state of the firmware is not BOOT_COMPLETE, it means that the
firmware is not functioning, thus it is not capable of handling IPC
messages.
Do not try to send IPC if the state is not BOOT_COMPLETE

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index bbd539071ac5..5bcf906d90af 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -302,7 +302,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	struct snd_sof_ipc_msg *msg;
 	int ret;
 
-	if (ipc->disable_ipc_tx || sdev->fw_state == SOF_FW_CRASHED)
+	if (ipc->disable_ipc_tx || sdev->fw_state != SOF_FW_BOOT_COMPLETE)
 		return -ENODEV;
 
 	/*
-- 
2.34.1

