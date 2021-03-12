Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A0339669
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:27:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7F81756;
	Fri, 12 Mar 2021 19:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7F81756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573663;
	bh=qSDOY9a643V0r0yZG4iyWUPUrnGcMD8hfOqsq8IhAhE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrUYQE6lHg1gNo+t0DLTmZjm3Ps+pah/IbpPCzpnrWcosVYDC+JCvSLj2b0n+1emd
	 kSb9CPCXJNQueHm2zw1IDcLK/JGzmozfjqPNBW8KmzDU1jdTDgXKx7lgsCJmgdOUet
	 JwvZJcLWEuHhe9AyabUN8hgon7a0YDw2cmbJOJg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE01F804DA;
	Fri, 12 Mar 2021 19:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7FD0F80430; Fri, 12 Mar 2021 19:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A214F8032D
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A214F8032D
IronPort-SDR: 6GAI0eyIXfZx+BeblJoTQL3fVD+axurAcJFm5nugj5tecP0BKQI95GHPMNdtumzkVJSXF1Wx+S
 6+aTonFUFjaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515191"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515191"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:23 -0800
IronPort-SDR: cUFBrBXzs7Y86AZW8ozYSduHiOlmP+2GC+HHZsmZBGHTQ0UeCY5XmuFZAXhzRETIDJYj/Ewg/5
 20oWa2kADkTg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791948"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/23] ASoC: hdac_hdmi: align function arguments
Date: Fri, 12 Mar 2021 12:22:32 -0600
Message-Id: <20210312182246.5153-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

sound/soc/codecs/hdac_hdmi.c:1882:54: style:inconclusive: Function
'hdac_hdmi_jack_init' argument 2 names different: declaration 'pcm'
definition 'device'. [funcArgNamesDifferent]
int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
                                                     ^
sound/soc/codecs/hdac_hdmi.h:5:54: note: Function
'hdac_hdmi_jack_init' argument 2 names different: declaration 'pcm'
definition 'device'.
int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int pcm,
                                                     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/hdac_hdmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hdmi.h b/sound/soc/codecs/hdac_hdmi.h
index 4fa2fc9ee893..493fa3b4ef75 100644
--- a/sound/soc/codecs/hdac_hdmi.h
+++ b/sound/soc/codecs/hdac_hdmi.h
@@ -2,7 +2,7 @@
 #ifndef __HDAC_HDMI_H__
 #define __HDAC_HDMI_H__
 
-int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int pcm,
+int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
 				struct snd_soc_jack *jack);
 
 int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
-- 
2.25.1

