Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5854ED23
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F951B0F;
	Fri, 17 Jun 2022 00:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F951B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417389;
	bh=jnBbercIlwnq9YFtM0tV9OBB3mAu0NrAG4fW7kX7Ihs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fq7hsMVC7jpmS7umrH0wCsHQsaX1adcidK2ZoUYlWm4rSYbO2gH2qkXEBrKx+UYQ+
	 Im20X7iUPKk2bRlkPsn8TgO3dRInF87AD60VB2J0h2vXtx6ZbAN5RVJV3n18cHbme3
	 /rVCNYyF4KAgTfhmjHCmonf46pnaJVB7Fv4jJ54A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3510EF801D8;
	Fri, 17 Jun 2022 00:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E774DF80528; Fri, 17 Jun 2022 00:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2851CF8051F
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2851CF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ElK64clc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417292; x=1686953292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnBbercIlwnq9YFtM0tV9OBB3mAu0NrAG4fW7kX7Ihs=;
 b=ElK64clckmSAD7f/dSzOZITl5+Dmbfp25Ydx160YH05ot/qyMGFSKlbm
 9c/GONzDAgT2Dtyv/zltgs7N83xwPvm02wcOZL2QTQ2F3eTLAh2jybBzP
 v3pl7YZHrxoUSI5keHC6IIsjN1m0PnpeU0yQHP3U8ShjHKCE+b4Jqtb6G
 D+Zld0iC1gi53aOfUA6CTgb6+t+kUe33kRqIqjAIKO8UW6MEI5ONSbra1
 1hdm8seUKk25CS/g6LSnWeQyQSniSCATIH4IMc/htOIAYHvmfxeyCniv4
 HdzPFvMpwWQf9FTcGN8NrcyuwYisrm1OmZ4qvoOyUKusNcdEr3w7doEL3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259214923"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259214923"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583803285"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: cs4270: update kernel-doc
Date: Thu, 16 Jun 2022 17:08:01 -0500
Message-Id: <20220616220802.136282-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Remove warning

sound/soc/codecs/cs4270.c:672: warning: Excess function parameter 'id'
description in 'cs4270_i2c_probe'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/cs4270.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 531f63b015547..97d26b9e8f7fe 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -663,7 +663,6 @@ static int cs4270_i2c_remove(struct i2c_client *i2c_client)
 /**
  * cs4270_i2c_probe - initialize the I2C interface of the CS4270
  * @i2c_client: the I2C client object
- * @id: the I2C device ID (ignored)
  *
  * This function is called whenever the I2C subsystem finds a device that
  * matches the device ID given via a prior call to i2c_add_driver().
-- 
2.34.1

