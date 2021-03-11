Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33E33691A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:45:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0721704;
	Thu, 11 Mar 2021 01:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0721704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423535;
	bh=S5tOAsAfJdTrq6OkiF/5uVEOU08EfWg4vPf074GQVl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jN8xERp+BnS0mA7okgiNSSV1qTPoqSWz6gmbG1u83xkHPylUwU8JrSq7EbhD4mXWz
	 aiIR/vUSHa/3wVO0UvoxsB6/p0WHULzcDyg8eL1lfYCRe8DEwfduWCCs+smcUKqYgN
	 27Z8tivjzd1mY5A1t5ipo+nDowaO3D2Y1JoIyLz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BE5F80423;
	Thu, 11 Mar 2021 01:43:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C77F80423; Thu, 11 Mar 2021 01:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F03F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F03F8010D
IronPort-SDR: q24iRZ6qhQ21Btuky0zV4X1RYqExcy58Hu/Bdd5hubwcqtWD9wsXufHScjGNOnNx7T3KYuqXcd
 vvZeRDIjj3Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185734"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185734"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:41 -0800
IronPort-SDR: HZbMokLYeQJbN4Tn8GqJMXkxkVKDYXDYywGKRatgo+1eYl7sKxrV9zXbklXRGKDhd40gBfumRi
 k2cNqn4alMWA==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385610"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: arizona: fix function argument
Date: Wed, 10 Mar 2021 18:43:23 -0600
Message-Id: <20210311004332.120901-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, patches@opensource.cirrus.com, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

Cppcheck warning:

sound/soc/codecs/arizona.c:2042:53: style:inconclusive: Function
'arizona_init_dai' argument 2 names different: declaration 'dai'
definition 'id'. [funcArgNamesDifferent]
int arizona_init_dai(struct arizona_priv *priv, int id)
                                                    ^
sound/soc/codecs/arizona.h:320:53: note: Function 'arizona_init_dai'
argument 2 names different: declaration 'dai' definition 'id'.
int arizona_init_dai(struct arizona_priv *priv, int dai);
                                                    ^
sound/soc/codecs/arizona.c:2042:53: note: Function 'arizona_init_dai'
argument 2 names different: declaration 'dai' definition 'id'.
int arizona_init_dai(struct arizona_priv *priv, int id)
                                                    ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/arizona.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index b893d3e4c97c..b3abbe80f11d 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -317,7 +317,7 @@ int arizona_init_vol_limit(struct arizona *arizona);
 int arizona_init_spk_irqs(struct arizona *arizona);
 int arizona_free_spk_irqs(struct arizona *arizona);
 
-int arizona_init_dai(struct arizona_priv *priv, int dai);
+int arizona_init_dai(struct arizona_priv *priv, int id);
 
 int arizona_set_output_mode(struct snd_soc_component *component, int output,
 			    bool diff);
-- 
2.25.1

