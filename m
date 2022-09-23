Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AC5E7C0B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB9D3E7;
	Fri, 23 Sep 2022 15:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB9D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940327;
	bh=66D35Ue/4cPcp224E03ZAKNGYbtBq6D921MmLBu9344=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7vOUkkEdvx3juPCaG9gdxjPFTTtHLlvGwg61akCTD/HzllY+oJ7orQ3fznDRHIUa
	 cJSR7vVBHKrb4THCIDLFDUkHbC5OmV977GsdMx+n6u/lxjyCfLhvqEieVpUv66LbOU
	 Fy6ufYyakzNAll0K+lkNruGJ3rBNA1n/BQwccu0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D721F80567;
	Fri, 23 Sep 2022 15:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0864F80566; Fri, 23 Sep 2022 15:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A557F80542
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A557F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="USbxS3R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940183; x=1695476183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=66D35Ue/4cPcp224E03ZAKNGYbtBq6D921MmLBu9344=;
 b=USbxS3R42MHr5wS0zn2D5nzBM8xkt4Ldp6FH2sOIN2iAqgVxEabB0Sk2
 sYfARcjK/V9hQNIySKCxNpuw6QnUYmV6t3Yx3Z0+HZGvb0SrUkGFfwlgT
 X4uDU3+kiyvGEe0hfCDCsCkj7yyZDWmsxm+YAsQDcEwTDypyFmCq8Tv4r
 JRpvoO5SMkt/BuhPJI3++UG8nRaJjlRxTwwiQvFfQoQ1/S42Qghsa4pel
 mgo5ETpbwwWMaQQy4LWhz8unwZN/XYu3x93o0mlpBtjg0Tnk1tEIi1FG1
 b1DMyKClmvI25nQe+bF/z2T7QIoEiQIkvKIlMd8dfVxcNhLUKiNU6fK7T A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575655"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375333"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 6/6] ASoC: SOF: ipc4: Call snd_sof_handle_fw_exception() in
 case of timeout
Date: Fri, 23 Sep 2022 16:36:16 +0300
Message-Id: <20220923133616.26267-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
References: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

It can help debugging IPC timeout issues (like we do with IPC3) if we
dump the IPC and DSP information.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/ipc4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 0d830020556d..6eaa18e27e5a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -295,6 +295,7 @@ static int ipc4_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 	if (ret == 0) {
 		dev_err(sdev->dev, "ipc timed out for %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
+		snd_sof_handle_fw_exception(ipc->sdev, "IPC timeout");
 		return -ETIMEDOUT;
 	}
 
-- 
2.37.3

