Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04632AC39
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37D91947;
	Tue,  2 Mar 2021 22:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37D91947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720584;
	bh=8y9TbB5S7lBcDvLmdhevaBaZxiaH3qOUdTKtk0cx9es=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XifJ9IOBqA0lRqmAAx1imPesZ6kgS65hsPjG90k3sGNd/UFVSPW5dIXx4Vgh8wvpW
	 MPnkaly3++M2brmwMFIKMD6M3SoEFSFqBVlHgVqJ9DcKbgutUBNwGoZXJ3MR6PCHZz
	 T2pfKmw44aA8NXmnrEMTu186nFjk8o/8HO+ekpNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11303F804EB;
	Tue,  2 Mar 2021 22:26:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A1DF804B4; Tue,  2 Mar 2021 22:26:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94ADF8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94ADF8025B
IronPort-SDR: P8HuowfAWEmtGQ0N+umBOogMdj2+Acf6NlojJWeq4a+9vDV37x+KgQbA3l8it8lb2vMfoqHLIG
 Jre520qongRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631373"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:05 -0800
IronPort-SDR: HT56RU/9fyo6qiEi9RTazb6nf6c9AhUhhR/NCZ1VcD0q/Li4yFvq2WTHy4b7aXNSbfiGhWipbH
 FlPUotZksRIA==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223451"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/24] ASoC: rt5660: clarify expression
Date: Tue,  2 Mar 2021 15:25:17 -0600
Message-Id: <20210302212527.55158-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

sound/soc/codecs/rt5660.c:1060:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT5660_PLL_M_SFT |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5660.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 0edf09d3a499..33ff9156358b 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1057,8 +1057,8 @@ static int rt5660_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	snd_soc_component_write(component, RT5660_PLL_CTRL1,
 		pll_code.n_code << RT5660_PLL_N_SFT | pll_code.k_code);
 	snd_soc_component_write(component, RT5660_PLL_CTRL2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5660_PLL_M_SFT |
-		pll_code.m_bp << RT5660_PLL_M_BP_SFT);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT5660_PLL_M_SFT) |
+		(pll_code.m_bp << RT5660_PLL_M_BP_SFT));
 
 	rt5660->pll_in = freq_in;
 	rt5660->pll_out = freq_out;
-- 
2.25.1

