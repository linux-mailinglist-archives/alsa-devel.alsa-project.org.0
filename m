Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53734B1BD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1CAD1689;
	Fri, 26 Mar 2021 23:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1CAD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796142;
	bh=ENc4DqidhSW/biGdpTED4NEQbAWKASEsWcyJQK5wKMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iztjwqk0Xs2s3IvSR4Q+nHFLYRAcc5MvfE/+TeQ0EhfgqRAAVAXfJVAD0llMGwPGy
	 rion1qeHDAU1Blra96iYFStuPyDPCOZlxR+s8KvVEeBAQqdpEiPYANLR/H7hVTXzzr
	 1iue1lMBYiAkqRL4BVpg4Ci+O5a5hbMAuF+IF9kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A2FF8042F;
	Fri, 26 Mar 2021 23:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D76CF8032C; Fri, 26 Mar 2021 23:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A2CF80156
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 22:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A2CF80156
IronPort-SDR: tSWpPQ60lyC8AoSDb09C1TZgfaic2eqWyIl4gdcZFR+k8W/79lXbFKDpsKb9/sBDD/WW1PkH0p
 9Lq8yJeVMmSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396687"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:55 -0700
IronPort-SDR: E1QfgjgQw2m1lH8XameoimNYsq2MdB6pLPQThMcCx6idS3GSO/WYdM8tG1Onua6FDLsW3mfSVo
 +zMipEVbq3OA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706677"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/17] ASoC: atmel: fix shadowed variable
Date: Fri, 26 Mar 2021 16:59:12 -0500
Message-Id: <20210326215927.936377-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 "moderated list:ARM/Microchip AT91 SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
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

Fix cppcheck warning:

sound/soc/atmel/atmel-classd.c:51:14: style: Local variable 'pwm_type'
shadows outer variable [shadowVariable]
 const char *pwm_type;
             ^
sound/soc/atmel/atmel-classd.c:226:27: note: Shadowed declaration
static const char * const pwm_type[] = {
                          ^
sound/soc/atmel/atmel-classd.c:51:14: note: Shadow variable
 const char *pwm_type;
             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/atmel/atmel-classd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index b1a28a9382fb..6023369e0f1a 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -48,7 +48,7 @@ static struct atmel_classd_pdata *atmel_classd_dt_init(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct atmel_classd_pdata *pdata;
-	const char *pwm_type;
+	const char *pwm_type_s;
 	int ret;
 
 	if (!np) {
@@ -60,8 +60,8 @@ static struct atmel_classd_pdata *atmel_classd_dt_init(struct device *dev)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	ret = of_property_read_string(np, "atmel,pwm-type", &pwm_type);
-	if ((ret == 0) && (strcmp(pwm_type, "diff") == 0))
+	ret = of_property_read_string(np, "atmel,pwm-type", &pwm_type_s);
+	if ((ret == 0) && (strcmp(pwm_type_s, "diff") == 0))
 		pdata->pwm_type = CLASSD_MR_PWMTYP_DIFF;
 	else
 		pdata->pwm_type = CLASSD_MR_PWMTYP_SINGLE;
-- 
2.25.1

