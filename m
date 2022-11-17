Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90B62E980
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 00:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D3D163E;
	Fri, 18 Nov 2022 00:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D3D163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668727371;
	bh=6R8tOMoGkJkz15CqL/hdQivBJ1emg39V843lU14YEns=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtaiASvxVCq3sYCpjIXwja3FeQ6lpBkcn4iwvACzyxLQvx0BDlsN/oKBb7A3ryRyr
	 yrtd+LJz8le5LZTK66u2RtrsFdflcYcXkP1bzt+LBHkdxRUuXH02sVtm7GEYFPc8yr
	 wDPKc0GHC1z/tXdLpSNvrKJmTI8eCaqCdfdlBGyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE26CF804BD;
	Fri, 18 Nov 2022 00:21:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F269F8025A; Fri, 18 Nov 2022 00:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B3B6F800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 00:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B3B6F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YLd7gK/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668727309; x=1700263309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6R8tOMoGkJkz15CqL/hdQivBJ1emg39V843lU14YEns=;
 b=YLd7gK/+GTAMQjeCJfrGANEarVg720tF3JR9i+9LGbHl+9r0+FjKATpA
 hgVRTpljx5O9kJWKfR0uIscq+UvV6+RjzoeoGDsPWR9Gk/TZY47cUVW19
 ND/txALnOj2ViPAXcYk4r07TpqsEG6eWDPtSf4HT3Ev9IlhPVNBvt/Cvn
 m8Qaqqd3T/gLac0TOhaN+NoGBaaWPQHj8fgstKMK3DIkURTGwwKngbTJT
 KuFCpx8XEeY6JMxdwtskf3shtpaTyJePSBk+0qVleXKDUmzNs8CROulFT
 /FzEG344jTCx6pP0f6Ai0FuapjIzyJ4s4SSYD0D0UuJYDuo/Ht/S6SlCU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314153292"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="314153292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 15:21:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="969064252"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="969064252"
Received: from ticela-or-133.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.0.242])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 15:21:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: dai: move AMD_HS to end of list to restore
 backwards-compatibility
Date: Thu, 17 Nov 2022 17:21:20 -0600
Message-Id: <20221117232120.112639-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Basavaraj Hiregoudar <basavaraj.hiregoudar@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The addition of AMD_HS breaks Mediatek platforms by using an index
previously allocated to Mediatek. This is a backwards-compatibility
issue and needs to be fixed. All firmware released by AMD needs to be
re-generated and re-distributed.

Fixes: ed2562c64b4f ("ASoC: SOF: Adding amd HS functionality to the sof core")
Link: https://github.com/thesofproject/sof/issues/6615
Link: https://lore.kernel.org/alsa-devel/36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com/
Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Basavaraj Hiregoudar <basavaraj.hiregoudar@amd.com>
Reviewed-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 83fd81c82e4c1..9fbd3832bcdc7 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -84,8 +84,8 @@ enum sof_ipc_dai_type {
 	SOF_DAI_AMD_BT,			/**< AMD ACP BT*/
 	SOF_DAI_AMD_SP,			/**< AMD ACP SP */
 	SOF_DAI_AMD_DMIC,		/**< AMD ACP DMIC */
-	SOF_DAI_AMD_HS,			/**< Amd HS */
 	SOF_DAI_MEDIATEK_AFE,		/**< Mediatek AFE */
+	SOF_DAI_AMD_HS,			/**< Amd HS */
 };
 
 /* general purpose DAI configuration */
-- 
2.34.1

