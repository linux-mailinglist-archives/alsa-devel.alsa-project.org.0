Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C189A21126B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E463168B;
	Wed,  1 Jul 2020 20:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E463168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627394;
	bh=NAUDRLZnsUWD2a9w9WrjzATT7XDpeL9QnCfv3RSujDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+z5KHz3sSPy2IN7LPvjJ7HjKYvXuS3frVWJAQil58/vppt06HY34VT5BfyY0PRNc
	 vwXPBhUs+sao29JrdudX8OChDTEZUu/gdWsg2g4xyxhH2hWgqYaHzbbSqsyJasBJ6a
	 kcrBG7Vuo4uHr7cHMy4CfSuv4aFBmoNQong7cbSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A4F7F801D8;
	Wed,  1 Jul 2020 20:14:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F20D3F802BE; Wed,  1 Jul 2020 20:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2E5F8020C
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC2E5F8020C
IronPort-SDR: zCIw+8dASqtCOs77y+4jPGMgtj8UiDxF8TvgODvKOtzhapSrlq5RszZVg1uRcqa9qE1T5D3Kv7
 o8y8FW3/CWIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753225"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:53 -0700
IronPort-SDR: +ZuKeBZC65HBAI7yjSDLt0O6jST0KwkXXdIx2pGbQZAc7XaPMxxQCRacnoweeDeDO3vCW/A6Kz
 Q+nWyW31TX6Q==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686333"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: codecs: cs4270: fix kernel-doc
Date: Wed,  1 Jul 2020 13:13:14 -0500
Message-Id: <20200701181320.80848-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Fix W=1 warnings

cs4270.c:508: warning: Function parameter or member 'component' not
described in 'cs4270_probe'
cs4270.c:508: warning: Excess function parameter 'pdev' description in
'cs4270_probe'
cs4270.c:548: warning: Function parameter or member 'component' not
described in 'cs4270_remove'
cs4270.c:548: warning: Excess function parameter 'pdev' description in
'cs4270_remove'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cs4270.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 3e8dabc14f05..bd17c806d543 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -499,7 +499,7 @@ static struct snd_soc_dai_driver cs4270_dai = {
 
 /**
  * cs4270_probe - ASoC probe function
- * @pdev: platform device
+ * @component: ASoC component
  *
  * This function is called when ASoC has all the pieces it needs to
  * instantiate a sound driver.
@@ -540,7 +540,7 @@ static int cs4270_probe(struct snd_soc_component *component)
 
 /**
  * cs4270_remove - ASoC remove function
- * @pdev: platform device
+ * @component: ASoC component
  *
  * This function is the counterpart to cs4270_probe().
  */
-- 
2.25.1

