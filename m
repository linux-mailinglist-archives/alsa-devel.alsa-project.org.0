Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E830FE86
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:38:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A071666;
	Thu,  4 Feb 2021 21:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A071666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471082;
	bh=wIOXeH1sfPSl4mI1RiB/FlcyJC6Nslyn3MFxYHBVKqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDtWvgcOYwBugmkigEQ1GbgW9+Mp4OLYOdjFi1IyQd8whgiLZwkk6zR9LXCrqnHhe
	 sHekwSCnZeKSYBDxWCGCfgeepENKPCUS8lwfnKoklwmK1WsJicXZzpWd7IpaHF7GJL
	 k+vNCB5IFbkOuDrZ68OdN1XTsXS+sC2Nq+jaY9bU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B333F8042F;
	Thu,  4 Feb 2021 21:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA6E6F8021C; Thu,  4 Feb 2021 21:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026C2F80254
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026C2F80254
IronPort-SDR: k0uD5wM+cI0mIFfkAiHqGamUm2ykEFKkPVgp4hosj26nLqqtUfApoPls6PRi/u5etEDYTca/ZD
 T3rIesLchANA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472502"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472502"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:48 -0800
IronPort-SDR: T6FrsfcR68f6BODtn6CHU0uZt/aEK/sjBZPkbKgKGgLm9vIplG4+CrJbwYut+WPzt9KQc9loOq
 hZISpw3+icMQ==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700326"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/14] ASoC: Intel: sof_sdw: add mic:dmic and cfg-mics
 component strings
Date: Thu,  4 Feb 2021 14:33:05 -0600
Message-Id: <20210204203312.27112-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

UCM needs to know which microphone is used (dmic or RT715-based),
let's add the information in the component string.

Note the slight change from HDAudio platforms where 'cfg-dmics' was
used. 'cfg-mics' is used here with the intent that this component
string describes either the number of PCH-attached microphones or the
number of RT715-attached ones (the assumption is that the two
configurations are mutually exclusive).

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0e83db947a57..d1251a6ac3af 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1222,6 +1222,15 @@ static int mc_probe(struct platform_device *pdev)
 	if (!card->components)
 		return -ENOMEM;
 
+	if (mach->mach_params.dmic_num) {
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s mic:dmic cfg-mics:%d",
+						  card->components,
+						  mach->mach_params.dmic_num);
+		if (!card->components)
+			return -ENOMEM;
+	}
+
 	card->long_name = sdw_card_long_name;
 
 	/* Register the card */
-- 
2.25.1

