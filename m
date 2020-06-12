Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E91F7E27
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 22:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3254166E;
	Fri, 12 Jun 2020 22:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3254166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591994638;
	bh=BYPfl7NdqaYyAfFxZGaF491RYz3JbDqsEHgSM4nBs0E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8W1yqqEAcVAC9wEqG7p/EqMkSMp+4QWaMMrokVt3hTmgcS3uChVevvNAAPEIZIWv
	 7qMY0veuX/22MT9fweDv4zBX/Tl8jLAY+V6qCreoqLisKESTOF4koonrY+ud41UE8+
	 nJcZcrt1w28FDHFQtAh5Q+KuM2xmePvUZvgfSEWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5CAF802A1;
	Fri, 12 Jun 2020 22:41:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 051F8F80228; Fri, 12 Jun 2020 22:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90EFEF80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EFEF80058
IronPort-SDR: K5eeH3QsrgcaZ9NMI103iLEVA6KNMa6gZWRvrIXSMdZ98+OQFnr43ZBmDzGj4JzbCtGXdZzUHl
 M1gNCUv6mNrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:41:08 -0700
IronPort-SDR: 66kb3WPlCZ91rmYgRuUulhz6Ug32MA9VZFxEx1GlH//yHnCOSLnjeb+VLfHsu+CLjdCe1i1O4R
 Fct4ziduvQdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272022966"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:41:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: soc-pcm: improve error messages in soc_pcm_new()
Date: Fri, 12 Jun 2020 15:40:49 -0500
Message-Id: <20200612204050.25901-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
References: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Provide an explicit dmesg trace with the PCM 'new_name', dailink name
and error code to help with debug.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-pcm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c114b4542ce..08e3daf16384 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2891,8 +2891,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			capture, &pcm);
 	}
 	if (ret < 0) {
-		dev_err(rtd->card->dev, "ASoC: can't create pcm for %s\n",
-			rtd->dai_link->name);
+		dev_err(rtd->card->dev, "ASoC: can't create pcm %s for dailink %s: %d\n",
+			new_name, rtd->dai_link->name, ret);
 		return ret;
 	}
 	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n",num, new_name);
@@ -2957,7 +2957,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 	ret = snd_soc_pcm_component_new(rtd);
 	if (ret < 0) {
-		dev_err(rtd->dev, "ASoC: pcm constructor failed: %d\n", ret);
+		dev_err(rtd->dev, "ASoC: pcm %s constructor failed for dailink %s: %d\n",
+			new_name, rtd->dai_link->name, ret);
 		return ret;
 	}
 
-- 
2.20.1

