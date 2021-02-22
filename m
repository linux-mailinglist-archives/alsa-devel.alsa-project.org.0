Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C14322177
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 22:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 415901662;
	Mon, 22 Feb 2021 22:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 415901662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614029706;
	bh=KPw1p2Df5ULTir8YpcDNyO2I6BZIlzSxIXh3Hnuyu1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TUHtttV9RSlXIOLmYODLP7C36nt8Crktq/TUeAzt78FBg0pL51GE3Q6iMVbyoKgUX
	 +P2+FVV6oUjShWBVkTEZbfvey1hEVBKNs0qmnVAnq8feDlp4iNB0KsUuI+53qi1y3S
	 QKlf2LG903nvWxk4Rv4HQ3psLY5yJWhPfJ9JObrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF340F8026F;
	Mon, 22 Feb 2021 22:33:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 428A0F8026F; Mon, 22 Feb 2021 22:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E713FF80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E713FF80154
IronPort-SDR: vFrMrDcR8r8ELN/SBDk7QP4J6XNe075DzEOKeFEzuXH4dyfx6wwZGYs+3Mk3jU92alJVdaYss7
 iH1c9S9TnSLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="172256614"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="172256614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:22 -0800
IronPort-SDR: UFEy7pKuZZ/kjU+JvFkd6oQC9cCvSzUyVog3KC+NJ0uebBqK44hHPoowIvgXOpsEpICXL8pTQ5
 ZrNOlFurdPoQ==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="423270729"
Received: from sspurohi-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.136])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ASoC: samsung: tm2_wm5510: remove shadowed variable
Date: Mon, 22 Feb 2021 15:33:06 -0600
Message-Id: <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

cppcheck warning:

sound/soc/samsung/tm2_wm5110.c:552:26: style: Local variable 'args'
shadows outer variable [shadowVariable]
  struct of_phandle_args args;
                         ^
sound/soc/samsung/tm2_wm5110.c:504:25: note: Shadowed declaration
 struct of_phandle_args args;
                        ^
sound/soc/samsung/tm2_wm5110.c:552:26: note: Shadow variable
  struct of_phandle_args args;
                         ^
Move the top-level variable to the lower scope where it's needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/tm2_wm5110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 125e07f65d2b..84c2c63d5a87 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -501,7 +501,6 @@ static int tm2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card = &tm2_card;
 	struct tm2_machine_priv *priv;
-	struct of_phandle_args args;
 	struct snd_soc_dai_link *dai_link;
 	int num_codecs, ret, i;
 
@@ -585,6 +584,8 @@ static int tm2_probe(struct platform_device *pdev)
 	}
 
 	if (num_codecs > 1) {
+		struct of_phandle_args args;
+
 		/* HDMI DAI link (I2S1) */
 		i = card->num_links - 1;
 
-- 
2.25.1

