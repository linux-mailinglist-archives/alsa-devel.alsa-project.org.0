Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C427312E6F6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 14:55:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E0316A0;
	Thu,  2 Jan 2020 14:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E0316A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577973331;
	bh=5HoUBDrzIr/2DgJiZoN6hOXlAw/D2naoE7cXLiXpNNA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lKvmR7q1SmPw1y2QG9svifkD7HkToNN1YbtpPNYJA6qmFrg7dmsA2htaeJsH52ZJ5
	 16dSwSDD9mOVkrV7LgQust9hmdnO0pswRN4TXZM7MR1KVY4tXrLeckl4GnN12zOkC8
	 kp5rNmyUurYGK+e8tLwgrdrLjZJJVu68cJZVT1Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B27F8014F;
	Thu,  2 Jan 2020 14:53:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD64F80157; Thu,  2 Jan 2020 14:53:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 577F9F8011F
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 14:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 577F9F8011F
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mz9pT-1jiGIP0xBz-00wBuB; Thu, 02 Jan 2020 14:53:26 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Date: Thu,  2 Jan 2020 14:52:55 +0100
Message-Id: <20200102135322.1841053-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zxRcnJYM3Qwzugm8PjSAcZhaHwSkpBGtFfHipa588cNnptL2qON
 NSD9i7Qg/kZPN617VR9sOzheMm2RYqcM3nybT8U9auEe4SXnAWg2PIDbYTRvXuNVgL8MM/h
 hOHQdhTLQB3rxThMssg/aqy5TMs4OFxtvMeIzodOFBTnozUp48zN5rn5PiMNUrrgV1K1SKG
 prSoLK4CbtvFyqyFpX03A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bEdlaOzjlc4=:Rlb5ilrlSlSqshcCQuCuTW
 BzyisJQmkkEAA9eevZIA8cW7rwyN1A/6V3ZJjvyWSKSomEVuzw27CS+piy7o+v8J1BVD4uH4C
 i9okx2bEx6iOmdvPiktk9ek1RwJF+3TC5uJnsMzXBD1r4L+Y4x/zdi5cYapmXBfKZcrz7Nswo
 67qs1iFcCijMdTRFK3S1X0tp1iGOdt3kQMA995Mnwzz7xgos+DFpxvVtV/YMm/ZOGUEcJeDct
 X6FC0QqxUDmqOgaaI+bJJbaFdG7001rMc/IXxYVgwMuUMRUWoheozga9LBpa8RIoFks6Cji3q
 /VyPve6BUbSneIjhjFZO2hIlpbAhQIeL6pJbBJGBDJyuA7h/iaZag8EoQXvC6HHSWemxwl/2V
 dc4Vo2VlgCxrIuFEnwcGn3a9FfDKuw+Z+HqE4tcEZPkstnIIVd3pmWS27ESezqHGGSEyOWOHY
 IEMuKQmaFSDsCxNuQqTZUDFbsezR2+P02U8sC3RM4H2SMl7t/jZ2Wgvkc302gpYLMJK+eae2N
 0CmuYuD6XOszSyfA/VdkRCStuqSiZTou8yg7G4iQMqPxyrBtBnFRaKkLA8Q9qTKVunPHXSG1j
 EWvIvhuiYgYSGjaeplMv5glG0Ku+1HW523OhJGxTm6bHlY5cs2Yia20P3Vj/h7S0MlvIPOAkE
 NQZ7Mx1pZcpgsY/dz+UavTiY+C8IcnLvpiB4OU2BNuFFmI01YFzHXQ57+DuJp9lluUCn57L9K
 2Vb47OXSeMWL+wrPNZkLjjMs8JOl8eufizUqum7QqVGFt2llvXGZFzUpFcajXXu3olLXfm34S
 ZMRN6P8NC4G1syIun+MiDSFO0AzqetX8GR0GhSC1ZJ21WT1JFh2Wox7hgTfh01/GmO9LbGVvg
 rhW/LNNkbQApzDsZfFkw==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Naveen Manohar <naveen.m@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: boards: Fix compile-testing
	RT1011/RT5682
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

On non-x86, the new driver results in a build failure:

sound/soc/intel/boards/cml_rt1011_rt5682.c:14:10: fatal error: asm/cpu_device_id.h: No such file or directory

The asm/cpu_device_id.h header is not actually needed here,
so don't include it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I found this last week, but the patch still seems to be needed
as I could not find a fix in mainline or -next.

Please ignore if there is already a fix in some other tree.


 sound/soc/intel/boards/cml_rt1011_rt5682.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index a22f97234201..5f1bf6d3800c 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -11,7 +11,6 @@
 #include <linux/clk.h>
 #include <linux/dmi.h>
 #include <linux/slab.h>
-#include <asm/cpu_device_id.h>
 #include <linux/acpi.h>
 #include <sound/core.h>
 #include <sound/jack.h>
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
