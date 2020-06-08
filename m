Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E191F204B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 21:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8034D1676;
	Mon,  8 Jun 2020 21:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8034D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591645672;
	bh=VvuFlCtbXJKSXA1j58C6hdnSm9JC3GSc6j83K0/aKxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxelWxzVHvtVSMpOd0mAYSSu1xk0A+PcpGwuOQ0yOVz07HG43+qeY2RqjUWLIipT2
	 56Sk1SjAm9SxS7mH7/wSoQIjB7lBbdXkNKfhiH6mi6LPmlMYADksRP9s8NwVvgnjWm
	 L+9TnRd/ve9TkLgxzC7Po/OCWNqJ3nEsBzpULw0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC16F802A2;
	Mon,  8 Jun 2020 21:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF50F802A1; Mon,  8 Jun 2020 21:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE768F8021C
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 21:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE768F8021C
IronPort-SDR: jjZiDjPfTzEHVTgB9FZKmBg6Ejw1opRDxuIuXHpZrZHNs9ZLi421mdabNie5Dv2Is4d0N/CLae
 GfkjiS4mwYtg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 12:44:23 -0700
IronPort-SDR: vI7p21R4Dm2k+xyhkSt0jBg6b3UW9vRSTFKZcwG/vftQQG5j7gwuFSuRiZKRbFuhNAR8eMHTBU
 4UNkyZimGOgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="305939482"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.104.56])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2020 12:44:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: Intel: boards: replace capture_only by dpcm_capture
Date: Mon,  8 Jun 2020 14:44:14 -0500
Message-Id: <20200608194415.4663-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

It's not clear why specific FE dailinks use capture_only flags, likely
blind copy/paste from Chromebook driver to the other.  Replace by
dpcm_capture, this will make future alignment and removal of flags
easier.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/glk_rt5682_max98357a.c       | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 +-
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 48eda1a8aa6c..954ab01f695b 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -407,7 +407,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.capture_only = 1,
+		.dpcm_capture = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index cc9b5eab8b4a..e29c31ffd241 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -692,7 +692,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.capture_only = 1,
+		.dpcm_capture = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -858,7 +858,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.capture_only = 1,
+		.dpcm_capture = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 658a9da3a40f..09ba55fc36d5 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -672,7 +672,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.capture_only = 1,
+		.dpcm_capture = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 1b1f8d7a4ea3..b34cf6cf1139 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -566,7 +566,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.capture_only = 1,
+		.dpcm_capture = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
-- 
2.20.1

