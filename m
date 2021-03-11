Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A633692F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:48:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1101716;
	Thu, 11 Mar 2021 01:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1101716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423720;
	bh=zlSKXhsMsi6uxkwNPPGhy+nCaq/yTA/tSqQr/NsyO6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T6f3M6KBIDW9XnLKrY4sTWomzTfU3CG58ob3XH9wYb+H9k4sM4TZst8+13WtrHRBD
	 rTjrtRdYHfJKR6Z4rI3MB15WA7InNGBgOztZ/okJ6xK2nxnxuyiFrBi8a/TZvdj8hb
	 5gdON2fK4DKtV0JnsLoNMDasC3OLH9r2UWfObJV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB2D7F8010D;
	Thu, 11 Mar 2021 01:44:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D54EBF8049C; Thu, 11 Mar 2021 01:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE691F801ED
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE691F801ED
IronPort-SDR: XN3jdWQoKHZgBjtseag0B7F2nNjPCpc8apxE0K+oGx3gV9HnqMHTotmIDBDJTkLEuht3q7c6w9
 4AVAfeUG0TeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185752"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:49 -0800
IronPort-SDR: qgNT9pgGATdXJAECzcgl+GajoriNWAFQKudEhCeA6qdOU/4QET8iSWQ+Jg2f+P3P9uxRzVHzjI
 226JHJA8zJ/g==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385628"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: wm_adsp: simplify return value
Date: Wed, 10 Mar 2021 18:43:31 -0600
Message-Id: <20210311004332.120901-10-pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/wm_adsp.c:2092:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/codecs/wm_adsp.c:2070:6: note: If condition 'ret' is true,
the function will return/exit
 if (ret)
     ^
sound/soc/codecs/wm_adsp.c:2092:9: note: Returning identical
expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 070ca7d8c661..3dc119daf2f6 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2079,7 +2079,7 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	snd_ctl_notify(dsp->component->card->snd_card,
 		       SNDRV_CTL_EVENT_MASK_VALUE, &kcontrol->id);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 
-- 
2.25.1

