Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57319275ECE
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 19:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3FF41780;
	Wed, 23 Sep 2020 19:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3FF41780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600882800;
	bh=GU9Lb/LbbBYtmtefwnV6PFjvKULxF/WtEVyQHgqtsrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7L+1ioJan9TDJmh4DASP3taKxYshEsqbugx3LdvgJkyNOS7eKVpSuRs/fIGxmjLu
	 HecOVFaSAWM/1CvQGeEah8Q5QrqF48wvSAcLB1YPPE01t6Q2iz6eH7qeKOLw/0xolx
	 Cf97gkWlE+qns7OHfWIUgsaF6O705ucOMHl1erJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1F4F802EB;
	Wed, 23 Sep 2020 19:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83468F801EC; Wed, 23 Sep 2020 19:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D53F801EC
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 19:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D53F801EC
IronPort-SDR: 8yhXJ5SNg/e4fUkB26ge3SeELp/CbpfS1drz1VWODvHNgn8/eIU9MvqXLauuTe35w8G9rQ14Rv
 TaaMsyoGIbeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148628883"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148628883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 10:35:44 -0700
IronPort-SDR: 0d+hgktfVYMlm/Ok6EDb2fu/2eVKrfWQSKCImUmIidiP9yYbgsvIk87XLMoDUIrYxAzb9RS9ec
 bUXJRN4C+tSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335562403"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 10:35:42 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 5/6] ASoC: Intel: sof_sdw_rt700: add codec prefix
Date: Wed, 23 Sep 2020 20:33:57 +0300
Message-Id: <20200923173358.3247215-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
References: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Somehow for this codec we never used any prefix for the controls,
likely because the test platform has a single SoundWire device.

Follow the convention and use the codec prefix across the board to
avoid possible conflicts.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt700.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index bff69cfe27f4..21e7e4a81779 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -23,9 +23,9 @@ static const struct snd_soc_dapm_widget rt700_widgets[] = {
 
 static const struct snd_soc_dapm_route rt700_map[] = {
 	/* Headphones */
-	{ "Headphones", NULL, "HP" },
-	{ "Speaker", NULL, "SPK" },
-	{ "MIC2", NULL, "AMIC" },
+	{ "Headphones", NULL, "rt700 HP" },
+	{ "Speaker", NULL, "rt700 SPK" },
+	{ "rt700 MIC2", NULL, "AMIC" },
 };
 
 static const struct snd_kcontrol_new rt700_controls[] = {
-- 
2.27.0

