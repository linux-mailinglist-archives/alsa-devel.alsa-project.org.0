Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27359DB20
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5683A1635;
	Tue, 23 Aug 2022 14:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5683A1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661257078;
	bh=Kk3wloK5sKYsQhdkC/qEBSlZxZYh7VtgkmeI9WD9NC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQr/cKcnFo4nlDpn2iU0pcOsOe757VPpa6/k77UA8yOKiNJZ7b0HkUwgiIxLgauL1
	 mWJz45/SSgG2unBpBj6kMmq6YcebCcKk9xq7NLG5XwXtAMF+FpqkjiRTC5kNlqKGPG
	 kJvCVkv6gso0Wum3t7EHqPoAhQld1Ksgrzihs4sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C95F80525;
	Tue, 23 Aug 2022 14:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D413F80525; Tue, 23 Aug 2022 14:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8958F80152
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8958F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YTbRoQIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661256971; x=1692792971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kk3wloK5sKYsQhdkC/qEBSlZxZYh7VtgkmeI9WD9NC8=;
 b=YTbRoQIoInNUZh0vo/a3RytD2Ik2sKRxAs2bqG5MaOIW9FdBKuuWBrPe
 rINZKXwWrL4UFNSWYiKnVM2n7J5D0cCfnlRg0PprsR5AatHlruLoaml5J
 PmhG+Vds9ojEMhp6fFXQgUu5wV3KyF3scdjnynRnCHNT8BUZ67f1+w6Xa
 i/B2nRP9Hq3+TB16hT5+fksxDbk6v2FSYbHw82hZALJt0S760gxs3IYQk
 7OXIaGUBHIuGQXwwSmLR1WCLbUszFs+mW5LKdlCf8CDJVjohAnIHgy12B
 pHA8sbPtpWftaEUtMea6o6rrD+zxuevH4H3eNFPJGxcQiQc+9d5r2n89M w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355401068"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="355401068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:16:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="735464371"
Received: from mjglynn-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.28.206])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:16:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Kconfig: Make IPC_MESSAGE_INJECTOR depend on
 SND_SOC_SOF
Date: Tue, 23 Aug 2022 15:15:54 +0300
Message-Id: <20220823121554.4255-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823121554.4255-1-peter.ujfalusi@linux.intel.com>
References: <20220823121554.4255-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Make sure that the IPC_MESSAGE_INJECTOR client can not be built in when
SND_SOC_SOF is built as module.

Fixes: cac0b0887e530 ("ASoC: SOF: Convert the generic IPC message injector into SOF client")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index cfb244e4e142..37f7df5fde17 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -215,6 +215,7 @@ config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
 
 config SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR
 	tristate "SOF enable IPC message injector"
+	depends on SND_SOC_SOF
 	select SND_SOC_SOF_CLIENT
 	help
 	  This option enables the IPC message injector which can be used to send
-- 
2.37.2

