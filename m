Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4433691C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83681702;
	Thu, 11 Mar 2021 01:45:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83681702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423574;
	bh=6ux2X3Y7N5z1T8wfL2xpm02MZxiKVbtp+0NuKLJXE2U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHclrp0FJodbDxkMYfACet25zygoR7Je3fFYgov4XlMmgU0kqYBiMulQsucxAsAnU
	 wzl3JT04VoGEIYyoV87B8cl4TWZgMlhzwUJ7QGsz07jXMMVEP6mK1+vJpi169SwG0x
	 Z5OdE5ald6/rZWHsly1gRCpBO0NQK9BkDe+D2RXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 492A7F802E7;
	Thu, 11 Mar 2021 01:44:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3DFF80425; Thu, 11 Mar 2021 01:43:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A894F8016C
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A894F8016C
IronPort-SDR: ZApM0vQKDv/Nls7ThJpVshq8Y2/qq/pV1Lu6jQAvTCMVaO8qm8Vy5ncjtWBl83FD4tNguiFTzW
 KTbefS7lvcfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185737"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:43 -0800
IronPort-SDR: LOZ5SwOTan/hoxd52WcYZL71+PaaGrIF/sP2EhYFCFBNLCQsnLikzmOJ5F6pFaMsDsPOzBVyKk
 QOs81nonMt1Q==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385616"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: wm2200: remove unused structure
Date: Wed, 10 Mar 2021 18:43:25 -0600
Message-Id: <20210311004332.120901-4-pierre-louis.bossart@linux.intel.com>
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

cppcheck complains about some members not being used, but it's really
the entire structure that is never used anywhere.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm2200.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index c62f7ad0022c..b0a6d31299bb 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -72,13 +72,6 @@ static const char *wm2200_core_supply_names[WM2200_NUM_CORE_SUPPLIES] = {
 	"LDOVDD",
 };
 
-struct wm2200_fll {
-	int fref;
-	int fout;
-	int src;
-	struct completion lock;
-};
-
 /* codec private data */
 struct wm2200_priv {
 	struct wm_adsp dsp[2];
-- 
2.25.1

