Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7075656ADE1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 23:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10376E0F;
	Thu,  7 Jul 2022 23:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10376E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657230455;
	bh=j8qMC8xruCyrmclsns4m8pBUYvbbd7Sl23P4PtaZauU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Su2DtnybSaMTXNCtCMvsyqHzFQur0XhuCnI9uQWvoVWvZApNrIlZZN3Jp/ctJ3M0X
	 8NEKRjU01k4xKwn1tIcO33lkVBxcIlS+rSrsid6RzmC8r1cNDgZ0On30Pgxk9EtisW
	 mXNyZ3fCkM69mzqA97nwObGmYYJjAWjI3e/jFbAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B319F800C5;
	Thu,  7 Jul 2022 23:46:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C51BF8028D; Thu,  7 Jul 2022 23:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEAC2F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 23:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEAC2F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W0e9Xz5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657230388; x=1688766388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j8qMC8xruCyrmclsns4m8pBUYvbbd7Sl23P4PtaZauU=;
 b=W0e9Xz5TfFJEol0lhwy1pQDm/yaWjLJq/cQ2MgaWKrABk9xteOdDMs2Y
 p9lKok2a7gJy7reCCa6nOuT7rhex+7L2kJMiQ+zInVvjtbEKIsw8O+Kbq
 RgWB1I98ChqKmr5JPPZ3pPw//My5Bu0OfSrjNgIrGmbvZne3vfX82ZnL7
 FHHI1amoK8ZePgPC3v/KFBgY8u5VZuW9Wgf0fV5jkhwee8x3brS2hp6ER
 lhHsTEqPDpkShlPVrdeaGXWcg1AVvsI/kho+SRnmMxGFSkdcIMGlU+Fyb
 2epq5yHHFWIzrvP2HaINJv23RM9nirddBIlqMiHpycdKdLnHrz9gJp5xg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284869895"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="284869895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:46:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="920753350"
Received: from yunsumwo-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.184.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:46:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: acp-es8336: use static variables
Date: Thu,  7 Jul 2022 16:46:14 -0500
Message-Id: <20220707214614.61081-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Sparse warnings:

sound/soc/amd/acp-es8336.c:36:15: error: symbol 'codec_dev' was not
declared. Should it be static?

sound/soc/amd/acp-es8336.c:37:18: error: symbol 'gpio_pa' was not
declared. Should it be static?

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp-es8336.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index eec3d57092fa..4f3992532332 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -33,8 +33,8 @@
 
 static unsigned long acp2x_machine_id;
 static struct snd_soc_jack st_jack;
-struct device *codec_dev;
-struct gpio_desc *gpio_pa;
+static struct device *codec_dev;
+static struct gpio_desc *gpio_pa;
 
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 					  struct snd_kcontrol *kcontrol, int event)
-- 
2.34.1

