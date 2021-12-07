Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E046C691
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 22:18:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DFBA256C;
	Tue,  7 Dec 2021 22:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DFBA256C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638911923;
	bh=+SC5R0faPlKrtWRBrZfk4UP13Ru+Xvfxu6iZdikXG/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwKDB64FiJDFx9a677ymrn/1+Gu+Mtq4yTJMLYdH3C0Kp0rEDvcmEVO+hwqX5IitQ
	 XSdE19bUkKkZ4dT1oflT8oFqNDD4yT4IabBTrfp/4Y1UkQ9Q9z4nE1VnmB4+JJu3iE
	 cvNl7yquRX4/HCtCfFTKQBiCumlcGvWCburRrYIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C90C7F8032B;
	Tue,  7 Dec 2021 22:17:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5D8DF8028D; Tue,  7 Dec 2021 22:17:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B39FEF80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 22:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39FEF80253
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237918079"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237918079"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 13:17:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="679610396"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 13:17:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: boards: add 'static' qualifiers for max98390
 routes
Date: Tue,  7 Dec 2021 15:17:00 -0600
Message-Id: <20211207211700.115319-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Sparse warnings:

sound/soc/intel/boards/sof_maxim_common.c:140:33: error: symbol
'max_98390_dapm_routes' was not declared. Should it be static?

sound/soc/intel/boards/sof_maxim_common.c:156:33: error: symbol
'max_98390_tt_dapm_routes' was not declared. Should it be static?

Fixes: f316c9d9ba8ea ('ASoC: Intel: boards: add max98390 2/4 speakers support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 9171d9cd179e..112e89951da0 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -137,7 +137,7 @@ EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 /*
  * Maxim MAX98390
  */
-const struct snd_soc_dapm_route max_98390_dapm_routes[] = {
+static const struct snd_soc_dapm_route max_98390_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
@@ -153,7 +153,7 @@ static const struct snd_soc_dapm_widget max_98390_tt_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("TR Spk", NULL),
 };
 
-const struct snd_soc_dapm_route max_98390_tt_dapm_routes[] = {
+static const struct snd_soc_dapm_route max_98390_tt_dapm_routes[] = {
 	/* Tweeter speaker */
 	{ "TL Spk", NULL, "Tweeter Left BE_OUT" },
 	{ "TR Spk", NULL, "Tweeter Right BE_OUT" },
-- 
2.25.1

