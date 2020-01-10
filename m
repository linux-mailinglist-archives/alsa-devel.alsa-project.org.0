Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E9137A6C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:02:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2689916C6;
	Sat, 11 Jan 2020 01:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2689916C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578700955;
	bh=gIyw6PtE0Ioy+h/wW3Rzd2EeA9OAHvfHbR+w+UJFSLs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbfom1ikDq9TFph3qFBnLYjYzCfMa44SlBK4Hjdu9xNxIE1EZV6OPhwydu8dIo/Eo
	 sYbtkoimFLYqvN2cZZ+wymFmWGldFdpduFm/93LQk8bBtpQg/iZ6udygdazg0x4w41
	 HVJL+mnUwlR1xE3kR0nJhDkxBneOp+K54Zl1wtNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D934FF8028D;
	Sat, 11 Jan 2020 00:58:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7888FF8024A; Sat, 11 Jan 2020 00:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA227F80161
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA227F80161
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345297"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:47 -0600
Message-Id: <20200110235751.3404-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
References: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/8] ASoC: Intel: bdw-rt5650: change cpu_dai
	and platform components for SOF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The legacy driver uses dummy cpu_dai and platform, SOF requires actual
values to bind.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index ba3fc1ef900a..1a302436d450 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -223,6 +223,14 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(be,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+SND_SOC_DAILINK_DEF(ssp0_port,
+	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+#else
+SND_SOC_DAILINK_DEF(ssp0_port,
+	    DAILINK_COMP_ARRAY(COMP_DUMMY()));
+#endif
+
 static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 	/* Front End DAI links */
 	{
@@ -256,7 +264,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
-		SND_SOC_DAILINK_REG(dummy, be, dummy),
+		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
