Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7404FDD96
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 13:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6765194A;
	Tue, 12 Apr 2022 13:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6765194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649762329;
	bh=AJw4Kr6M6W+kl6GiejSecd0j5INGSnFmc7IhsTQHvf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PPi/TiuBc0MVJUSo84kWZngQqMD+QJHny6wGqqFkR9zLF4Tf6xCc66/p7usg4dlG1
	 S7pc2/qGGrSGa1ff68U8ptMhpw0Nly84K0o2X3D08yreEBVjjwCyBIBhbHC5Vi+rBp
	 2E2zcxf4K2sf3pGKAgINMgo1FZ1KIN4572kAUQRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2868DF80245;
	Tue, 12 Apr 2022 13:17:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B956F80095; Tue, 12 Apr 2022 13:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4F3F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 13:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4F3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="6FN2LhEw"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23C7YTD1013409;
 Tue, 12 Apr 2022 13:17:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=dSIQyPfmboxOcHNgx6j2T/JIKfq8ga3OyOJlZJqwlsM=;
 b=6FN2LhEwrivHRHyOAOAgOIDHXlSf6VSQUrRJvEPmZpQ+FuZkn0x/p/S0bSIdvIo15ftc
 eEjb83Nd1wbdajhLYTZrcJN0JL/SDYoUBOAuHPz9qj+xkGebUcTr+sCFYaUfyrEKCj9G
 oRjUq87q4YvCqOzkd5Y+QcACc4aMN+rjLPvuS6JxggPmRVLM4BfV5dozAMc9+vYM3k/Z
 17E6VuqhxnKJ/Mob28ipdhox6lye9fczaRghVLHk32AHVyF2dGA4z/LX9MAU2eaBdr/d
 1E28mLFFX6XVVhR78W+ZDK2Ei98S1t62BFU5ObVDA6XBnVciNQ2/yp7djJnZo5uMVuS2 qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74q7107-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 13:17:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53ADA10002A;
 Tue, 12 Apr 2022 13:17:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C76221A21B;
 Tue, 12 Apr 2022 13:17:37 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 12 Apr 2022 13:17:36
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jaroslav Kysela <perex@perex.cz>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Hancock <robert.hancock@calian.com>,
 Sameer Pujar <spujar@nvidia.com>, Samuel Holland <samuel@sholland.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: simple-card-utils: fix sysclk shutdown
Date: Tue, 12 Apr 2022 13:16:58 +0200
Message-ID: <20220412111658.11015-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_03,2022-04-12_02,2022-02-23_01
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Olivier Moysan <olivier.moysan@foss.st.com>
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

In asoc_simple_shutdown() the snd_soc_dai_set_sysclk() function
is called twice with input direction SND_SOC_CLOCK_IN.
Restore one call with output direction SND_SOC_CLOCK_OUT.

Fixes: 5ca2ab459817 ("ASoC: simple-card-utils: Add new system-clock-fixed flag")

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/generic/simple-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index f2157944247f..da0c27828ce6 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -322,7 +322,7 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
 			snd_soc_dai_set_sysclk(cpu_dai,
-					       0, 0, SND_SOC_CLOCK_IN);
+					       0, 0, SND_SOC_CLOCK_OUT);
 
 		asoc_simple_clk_disable(dai);
 	}
-- 
2.17.1

