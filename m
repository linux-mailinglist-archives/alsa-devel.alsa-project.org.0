Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7D2112C7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB3F1684;
	Wed,  1 Jul 2020 20:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB3F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593628257;
	bh=nGU6j0BeZmJC7eLssO9ZFMGFk2gbNKr+BS1NY3qKFEs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lmwm16F1heHg8Tf0YLE+8ibjlFqfaSd3RLIdN5he9SFL8XMsFKuPuNPU3rh1YKjNF
	 kLCj6j67hPscNy2NZH7c33tVxkBfXZJZ8oorcBVLxr3MOQh2CwAzC2u2jeIb0PBZbU
	 3b8Zbsq4kZ9UKeDhHkU7hOTBQSOO25APCWZQkg+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81129F80306;
	Wed,  1 Jul 2020 20:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13FBBF802F8; Wed,  1 Jul 2020 20:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8959BF802EB
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8959BF802EB
IronPort-SDR: O2Fmihwt41C088ZtpccgnmmEOqbREaFR6w14pkRJHz4pcv/WtzOa4vejDv64g41s0c+uvHtVju
 14lIRmrvZlHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="144841774"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="144841774"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:53 -0700
IronPort-SDR: o4HMikn9P1O+UJb3VlJJTX8KtDDsJ/26DFieStcDTN+DnubNfjFbl9QJraF2H/29tMM5kduR1e
 5fs88lDiqUZg==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="425679627"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: codecs: jz4770: add _maybe_unused as needed
Date: Wed,  1 Jul 2020 13:24:22 -0500
Message-Id: <20200701182422.81496-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
References: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Paul Cercueil <paul@crapouillou.net>, broonie@kernel.org
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

Fix W=1 warning by adding __maybe_unused. Maintainers for this file
may want to double-check if those definitions are necessary.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/jz4770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 34775aa62402..049a3022b130 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -303,7 +303,7 @@ static int jz4770_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
-static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
+static __maybe_unused const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
 
 /* Unconditional controls. */
-- 
2.25.1

