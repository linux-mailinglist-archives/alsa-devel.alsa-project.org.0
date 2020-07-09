Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D621A4CF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A399915E5;
	Thu,  9 Jul 2020 18:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A399915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312200;
	bh=ldjtiPxD3P6v2puyQqBWhfaGZyql9rEfOzawet/9LtA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsedFUe2BbZZ/BzdE8Y2BPiS1TaVKHScxxmEEg0/iyzsuhxRBw0qd1H7LI6fxSWdJ
	 lkgFY7VrKEANYJmvISPbvQn1oFbK3OZqJCyhJZYVQbFq8J8rWlfsbAz0TqNGC/YMNR
	 BQtsrNr792o/5v6wr+My0PcvR1N4MSzbH39jEmXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 140FDF802FF;
	Thu,  9 Jul 2020 18:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 274BCF802DD; Thu,  9 Jul 2020 18:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB1C3F80274
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1C3F80274
IronPort-SDR: RjWk0gahYwC0ZzJfllv4DxrAAJsGvEJPuz/tJfEeqzs5XfGvr1dRvdpkaD/swNzG8HqaaiKJjh
 acBSv1gRfpOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515647"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:58 -0700
IronPort-SDR: +ONPSDBWlXIhasNBefjVQlbc1v3JNAU2K5IDVYpGRpaq0u4OBDcVrRvmoXCeXRyrAyBqHAOo5O
 NuX8TjiNJTVA==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280353056"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 09/10] ASoC: codecs: tlv320aic26: Demote seemingly
 unintentional kerneldoc header
Date: Thu,  9 Jul 2020 11:23:26 -0500
Message-Id: <20200709162328.259586-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@secretlab.ca>,
 broonie@kernel.org, Lee Jones <lee.jones@linaro.org>
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

From: Lee Jones <lee.jones@linaro.org>

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

sound/soc/codecs/tlv320aic26.c:138: warning: Function parameter or
member 'dai' not described in 'aic26_mute'
sound/soc/codecs/tlv320aic26.c:138: warning: Function parameter or
member 'mute' not described in 'aic26_mute'

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320aic26.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index 032b39735643..4569bbc08acb 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -131,7 +131,7 @@ static int aic26_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/**
+/*
  * aic26_mute - Mute control to reduce noise when changing audio format
  */
 static int aic26_mute(struct snd_soc_dai *dai, int mute)
-- 
2.25.1

