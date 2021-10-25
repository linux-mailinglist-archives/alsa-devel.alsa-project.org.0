Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9C439EEB
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4885716D7;
	Mon, 25 Oct 2021 21:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4885716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188588;
	bh=WqgNvtnjSl5F53LkjNXI29zBMI16zVCJJwsOKs2CJHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPgJAVUbnumYW82UWMcj9QwXGX2aiHJg5DDGOcqiRwiiVmm90/cJtwYvoOFArLy+z
	 JxcLk/SWv+jGjwntLo5LyVv4uzFHr3HQKQrMyrGkUGMEcZr9WyHGrBmBf0QhcWqO3w
	 q1akotYyBgiA6uSVHkdTSAShpYL72Pd9t1Ur/EBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F0EF804FD;
	Mon, 25 Oct 2021 21:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4283BF80431; Mon, 25 Oct 2021 21:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A0CEF80431
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A0CEF80431
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908178"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318488"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: mediatek: mt8195: fix return value
Date: Mon, 25 Oct 2021 13:59:32 -0500
Message-Id: <20211025185933.144327-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

cppcheck reports the following warning:

sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:1299:10: style: Variable
'ret' is assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

The suggested change aligns the implementation of
mt8195_afe_disable_etdm() with mt8195_afe_enable_etdm() - same
negative return value upon error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index ac591d453e1e..c02c10da3600 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1316,7 +1316,7 @@ static int mt8195_afe_disable_etdm(struct mtk_base_afe *afe, int dai_id)
 	}
 out:
 	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-	return 0;
+	return ret;
 }
 
 static int etdm_cowork_slv_sel(int id, int slave_mode)
-- 
2.25.1

