Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99E339686
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB3E41731;
	Fri, 12 Mar 2021 19:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB3E41731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573842;
	bh=7jLmgCnzAfUA5WQ8CXqyhOLGunFpsiwvNA4EVlkEvCk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8BE41lUuOhKfOaxU0uPyCL1hzkDMDoz0iGsdrOJGvI+OehNIxDa5meN4A9SFu7DY
	 KQ5P0WppHkXBtk+/ivPTpe1KrIXRzginVsGpk7JBheY1HCvZrTgpJD5lcj6TWJNErd
	 wsbrh2KmZQhTqCaWQ7dGUyGmO2wnDFVMC/IvK5n4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F44CF804E3;
	Fri, 12 Mar 2021 19:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D16F80524; Fri, 12 Mar 2021 19:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23364F804FC
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23364F804FC
IronPort-SDR: nH6Vhgk7v4HXx7kdvWBniLC86a/iY21S1GG2ZZnmzLNNAr4D4IQ+WVn/b4DROfhR8iIvaS6srv
 Cnr4UWyqtImA==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236499"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:50 -0800
IronPort-SDR: 54u62mvE4uW4wS6G4ftoPq0ntq/SJ548ytmfzyLNWx9vvVPDlgz+rU4A3yT1CKwqUK2lUUXzUl
 iKHNULZDCLYg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792057"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/23] ASoC: tas2562: remove useless assignment
Date: Fri, 12 Mar 2021 12:22:42 -0600
Message-Id: <20210312182246.5153-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonghwan Choi <charlie.jh@kakaocorp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 broonie@kernel.org, Dan Murphy <dmurphy@ti.com>
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

cppcheck throws a warning:

sound/soc/codecs/tas2562.c:203:4: style: Assignment of function
parameter has no effect outside the function. [uselessAssignmentArg]
   tx_mask &= ~(1 << right_slot);
   ^

This assignment seems to come from a copy/paste but the value is
indeed not used. Let's remove it.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tas2562.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 19965fabe949..ba23f9f07f04 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -200,7 +200,6 @@ static int tas2562_set_dai_tdm_slot(struct snd_soc_dai *dai,
 			right_slot = left_slot;
 		} else {
 			right_slot = __ffs(tx_mask);
-			tx_mask &= ~(1 << right_slot);
 		}
 	}
 
-- 
2.25.1

