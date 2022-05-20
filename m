Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FB52F4FF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA83D1745;
	Fri, 20 May 2022 23:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA83D1745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081729;
	bh=CluEd8FqJqXDrfOT6SV2FXPTdaw8R94PdqThOIQiQgY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buHjaPSuM6gT8/b1VZWTX4X7oidAaGPZQqn2weVIt9saYngLcj5ClMMZtNBQq77IV
	 LipJiZU4vzAj+6VzeqlXVN//LQ57PIsy4zTdPb44QydyIp+optyOEc9pjRcKRj/9Vm
	 mjTiUVx6s2haUg33e7XuM7uHF7uIb9BFGaVf1yTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98508F8056F;
	Fri, 20 May 2022 23:18:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599AEF80551; Fri, 20 May 2022 23:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D653F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D653F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fAH4XFoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081466; x=1684617466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CluEd8FqJqXDrfOT6SV2FXPTdaw8R94PdqThOIQiQgY=;
 b=fAH4XFooxSXdtl5D3WuY0+SatvSYOprRlpsqduEM2w10LYmQg0bqatMf
 u47RrpRDEFBWZOspaU9fA5Ld4AOSWOqEJlFAfA6L1kUK2VMYyrq3Cosja
 OUucMAU5B/J4l7pIBU3rSTLOMe+EBnaJytbGc+ND4XHaOhishxluDrhNv
 DHRBaHlA6aC4VdjMOJihNaf4jXqxOzbcjMP1CwnoxzB6veTi/fDWjreOI
 K3wE+RuAyVf7fjczkWHIfdhUl/kYs46kTKr90E9C87VKfrPCaJXRN/AoX
 Dil1m+hQmNkI9Ziz+YTSfQG1n2Jy+OGZH9Gy7ddKCuDW6r5vwqfuE/kRp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324250"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796040"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/16] ASoC: qcom: q6dsp: remove spurious space
Date: Fri, 20 May 2022 16:17:16 -0500
Message-Id: <20220520211719.607543-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

cppcheck warning:

sound/soc/qcom/qdsp6/q6adm.c:183:14: warning:inconclusive: Found
suspicious oper ator '*' [constStatement]
  } __packed * open = data->payload;
             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 22b408c3794e0..01f383888b622 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -180,7 +180,7 @@ static int q6adm_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 			u32 status;
 			u16 copp_id;
 			u16 reserved;
-		} __packed * open = data->payload;
+		} __packed *open = data->payload;
 
 		copp = q6adm_find_copp(adm, port_idx, copp_idx);
 		if (!copp)
-- 
2.30.2

