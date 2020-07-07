Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD22179D6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7240168D;
	Tue,  7 Jul 2020 22:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7240168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155630;
	bh=uyrj2ObbpEw857HZeCu9vyVb07Yax1MaYjqFY/0TUfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K8Ojsp+mq0XAYVNTuWpDJevZ7aNQN276s+KB367/UOjuUUF5uvPix2hmnynHQX6rT
	 Cl5cK+ep8oPtEhgaWdDbdO7S+qWsI8jyZ3iCGZGyAky+J2GHf51rLvSyfyKsZa+vts
	 o0ko1/yrKkDvbSRXu/Es/c+MIGrWTUhFKLcjkbsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BB8F80257;
	Tue,  7 Jul 2020 22:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D29F8F802BD; Tue,  7 Jul 2020 22:58:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16604F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16604F800D0
IronPort-SDR: L5YeSkGD7PKyXJfN5ENl8/3Hqz9+hTtX2WjWXQJv41WR+vjXlQUta+79k3SAgZ8rYigDxQ2yLT
 if6prwIEmquQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762914"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:52 -0700
IronPort-SDR: sVi1Cv4yBw+UC7YDQOaNyuL9iz2J7cMiaeUzVq3wTXCBABb2A4S/vLn3k/qB43iiUgtTNC88EF
 iqpg5Evp+Xgw==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796645"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/6] ASoC: codecs: max98373: Removed superfluous volume
 control from chip default
Date: Tue,  7 Jul 2020 15:57:36 -0500
Message-Id: <20200707205740.114927-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Ryan Lee <ryans.lee@maximintegrated.com>

Volume control in probe function is not necessary.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/max98373.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index a8ed9f12682b..c3202c1dc517 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -331,13 +331,6 @@ static int max98373_probe(struct snd_soc_component *component)
 	regmap_write(max98373->regmap,
 		MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
 		0x1);
-	/* Set inital volume (0dB) */
-	regmap_write(max98373->regmap,
-		MAX98373_R203D_AMP_DIG_VOL_CTRL,
-		0x00);
-	regmap_write(max98373->regmap,
-		MAX98373_R203E_AMP_PATH_GAIN,
-		0x00);
 	/* Enable DC blocker */
 	regmap_write(max98373->regmap,
 		MAX98373_R203F_AMP_DSP_CFG,
-- 
2.25.1

