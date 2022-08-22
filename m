Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0859C6DD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83CEF168B;
	Mon, 22 Aug 2022 20:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83CEF168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193925;
	bh=Ka7WextPfjZOGGLuRueSjo/vpJj3kZ8OnGhm3O3GFNo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXnSkDu8OzDBpelLpfAvis0yEfF9zD2krpEmzddKNvngdwuYqk3sK/svZPx/S0vq+
	 VgNACpo7vpz5C4pfiGcaE9mPd3IsHphYSgsnZZYcNmJZaWVUHZ7M4iA8PfyytRZFq+
	 uZrI/9F12MluOLsc9IFz/zLF9QIO43QLa4uhLoac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4B1F8053D;
	Mon, 22 Aug 2022 20:43:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B40F0F80549; Mon, 22 Aug 2022 20:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B744F80537
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B744F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RAOECdV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193800; x=1692729800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ka7WextPfjZOGGLuRueSjo/vpJj3kZ8OnGhm3O3GFNo=;
 b=RAOECdV7NFHLXWYFvQkSgOABWsYu15jmVqKRWTocGUZXhDY1gSXKfKt/
 4F13dTp9cXC2GEzDX+7KmEYi87yZS0s0MwZTUB/QuO8q298GOx8LYRCNZ
 Cu9PbJvP0Gm9JpQT7B87fciQK0snbjaW4TF1UeaF2jjYjYIyqQ2I9FH52
 KSIkjxMqJDS1ceGlBAa6WsAdBjkck6EBwgq+bD1wI6mZqdBeD0mW9yEY4
 CXDA0meAf/iiR8lhA4V/fVe/cEmOKM5AU/g3SE5gwghhG11W8SFFL5H6T
 7XufdR1lseztCSCB7LmSKyHvlDwZwY31kUP8zKN8BpLBheD4wP7WDNNX0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293489001"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293489001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671108"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: fsl: fsl-utils: remove useless assignment
Date: Mon, 22 Aug 2022 20:42:38 +0200
Message-Id: <20220822184239.169757-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 tiwai@suse.de, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

sound/soc/fsl/fsl_utils.c:127:10: style: Variable 'ret' is assigned a
value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 sound/soc/fsl/fsl_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index d0fc430f7033d..a5ab27c2f711c 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -124,7 +124,7 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
 {
 	struct clk *p, *pll = NULL, *npll = NULL;
 	bool reparent = false;
-	int ret = 0;
+	int ret;
 
 	if (!clk || !pll8k_clk || !pll11k_clk)
 		return;
-- 
2.34.1

