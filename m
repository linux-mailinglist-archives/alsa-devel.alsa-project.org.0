Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15C32857C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 17:56:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00C01687;
	Mon,  1 Mar 2021 17:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00C01687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614617759;
	bh=0OfRl03HKZA5ID9TSwcTqf52jj4bc5i38OmFiDpyg9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRTmxMF86Dufuhr97iWY7AWwwQXNQK1EEqe62stwRXf1zlNANymN6cn/LBEVCk0+S
	 HNF+g9xD/sNB43an6pkOnJ/C96i7nJDdB8Xw3mXO4sDLu8P4bfSv3H3ilka7sPUzyq
	 Nf6rkda7/adLIP0zfcS6pDknWOoBkrxov83uGvZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB53F802E2;
	Mon,  1 Mar 2021 17:54:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05439F802E2; Mon,  1 Mar 2021 17:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB4CF8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 17:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB4CF8010B
IronPort-SDR: SSfmSFXV31AlcvlGJgRjuasmW9oes7UvP8QSCw/OFCjwcXIhPjNHrDtjgPoaKFan3aK1iXRuIb
 iMi85aJfrOhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186580165"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="186580165"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:01 -0800
IronPort-SDR: xceTXNsatojtI+s437Evkof7HQPbTwRFDpIv0g4otuLCcBgvMIjBeNF8DwNWMQnR412HeHqIx0
 ByCSYeyNluyQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="505330627"
Received: from mhuang8-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.25.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: nau8825: fix kernel-doc
Date: Mon,  1 Mar 2021 10:53:46 -0600
Message-Id: <20210301165349.114952-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
References: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

v5.12-rc1 flags new warnings with make W=1, fix missing or broken
function descriptors.

sound/soc/codecs/nau8825.c:298: warning: wrong kernel-doc identifier
on line:
 * Ramp up the headphone volume change gradually to target level.

sound/soc/codecs/nau8825.c:358: warning: expecting prototype for This
func(). Prototype was for nau8825_intlog10_dec3() instead

sound/soc/codecs/nau8825.c:411: warning: wrong kernel-doc identifier
on line:
 * computes cross talk suppression sidetone gain.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/nau8825.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index f0cba7b5758b..e19db30c457b 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -295,7 +295,7 @@ static inline void nau8825_sema_reset(struct nau8825 *nau8825)
 }
 
 /**
- * Ramp up the headphone volume change gradually to target level.
+ * nau8825_hpvol_ramp - Ramp up the headphone volume change gradually to target level.
  *
  * @nau8825:  component to register the codec private data with
  * @vol_from: the volume to start up
@@ -347,8 +347,9 @@ static void nau8825_hpvol_ramp(struct nau8825 *nau8825,
 }
 
 /**
- * Computes log10 of a value; the result is round off to 3 decimal. This func-
- * tion takes reference to dvb-math. The source code locates as the following.
+ * nau8825_intlog10_dec3 - Computes log10 of a value
+ * the result is round off to 3 decimal. This function takes reference to
+ * dvb-math. The source code locates as the following.
  * Linux/drivers/media/dvb-core/dvb_math.c
  * @value:  input for log10
  *
@@ -408,7 +409,7 @@ static u32 nau8825_intlog10_dec3(u32 value)
 }
 
 /**
- * computes cross talk suppression sidetone gain.
+ * nau8825_xtalk_sidetone - computes cross talk suppression sidetone gain.
  *
  * @sig_org: orignal signal level
  * @sig_cros: cross talk signal level
-- 
2.25.1

