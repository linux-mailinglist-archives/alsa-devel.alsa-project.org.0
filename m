Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACE59C6DE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85B31638;
	Mon, 22 Aug 2022 20:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85B31638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193937;
	bh=ysLY52QIaymnVb5gk/TwZwHIvVe0JIPygRIZPu439/o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mj1EQeafsUYlKEjzzpW/r6gNDHNx3F5njl59BPMJBZdc3PQtgcdK8EzeoxW8j4Abj
	 VQhQBUk6EgL5DNgkfUS0MBisNQQEqP45mi/moRJPFNzq/g5nWtldHEG2W3wDSsabem
	 8z2KLKVtSGsSgcbmNjCZCiXeequIfxrLqigb+Q8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198FCF80553;
	Mon, 22 Aug 2022 20:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EE0F8054A; Mon, 22 Aug 2022 20:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 072DEF80542
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 072DEF80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M7plYHlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193804; x=1692729804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysLY52QIaymnVb5gk/TwZwHIvVe0JIPygRIZPu439/o=;
 b=M7plYHlP6qe13+zGrQL6g92iFepQZuhI5ujRHqKF5GoNP4jNNQTiNyzL
 pym6EnBHMQVYuoax3OeSLWmkHAN2O6CdoDVddmXYJp+6rTLD4VJ68VLHZ
 hT8XEs32Fy4caLQl8l9TL59VS3UPrCz/eOZRpGnvejUzLPUQdiNSFJ8ww
 n1hi4vXO1YC1fbEaNWamwL8Q8M5d0GYgWNTQq+dslwIWSkCVMjWAPJ9ZQ
 ikhhayUpqz+vvOzVC7fLAtP4Fu4kSMzkZEBqXHXSC09oiUp7ePbz6Mb9c
 p11OfoIoWARN78AhWSyHefhKy4GHLptSIB+wNfZCk566nRBPLdmKpGAWE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293489010"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293489010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671123"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: ti: omap-mcbsp: remove useless assignment
Date: Mon, 22 Aug 2022 20:42:39 +0200
Message-Id: <20220822184239.169757-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "open list:OMAP AUDIO SUPPORT" <linux-omap@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

sound/soc/ti/omap-mcbsp.c:617:10: style: Variable 'ret' is assigned a
value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 sound/soc/ti/omap-mcbsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 0b377bb7737fd..7c539a41a6a34 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -614,7 +614,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 {
 	struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
 	struct resource *res;
-	int ret = 0;
+	int ret;
 
 	spin_lock_init(&mcbsp->lock);
 	mcbsp->free = true;
-- 
2.34.1

