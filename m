Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F6454551
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 12:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BA7182F;
	Wed, 17 Nov 2021 12:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BA7182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637146954;
	bh=ojydqCk7OYowGSHuFjnYfcfbmqElJwnDXsvUPmsF0gw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ICXhWUvqFqOFS+zNeYuROWAQz2wPBavh9KXLL5DNIVPzaKk7wiQrwtxxUpXoHMCWw
	 1nxmR+gy2bOkgrmj4x5c+EDyxgRELoG6FJVc8CvQLt4W5AWZyDPNOhLF1Sgxx3srXH
	 Li+CZ9hcv57cus8cRr0uHE9Wt+YJV5O7oLhI/0TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED47F80134;
	Wed, 17 Nov 2021 12:01:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8274BF8016C; Wed, 17 Nov 2021 12:01:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4472DF8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 12:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4472DF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="cvoCf88s"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH7M65Y014827;
 Wed, 17 Nov 2021 12:01:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=1/Q21ux/FGI1kNRl1aPygtxOq6sHNR7PApw2cIasDJk=;
 b=cvoCf88sQ1fE7S+lU40DR7GmGIKEecZoHhIn+2hvhGTXeanJQ5K22JP6xVi3F2aWHeZg
 jJG0BQHz6bLC/ElfBdNr2uhAxEgLJrqORtrlPCjClDXDxIzBFpZ0x/ZIY4lRb4BL1AF5
 7ztA2b5qy14O5dpkL2i4tI6rxl6hCLBmieNgudP6+iTbqKqk9+hzR9q8BQtTyFMifTXO
 eq0QXW6e+h/5FqUKyCoOptBuhRoAedJ22bW16RZXQJjuR/8CJLIK7lKKmN5i5DwvZc6C
 kdj9NHMwjgJyCieFlGH3tOSgmaU9anSMQ7se8rg8frUA0gLQiQZIH1YY8D5INcdUMbEP yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ccq6auuhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 12:01:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12A78100038;
 Wed, 17 Nov 2021 12:01:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2063B21B05F;
 Wed, 17 Nov 2021 12:01:04 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 17 Nov 2021 12:01:03
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: stm32: sai: increase channels_max limit
Date: Wed, 17 Nov 2021 12:00:31 +0100
Message-ID: <20211117110031.19345-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_04,2021-11-17_01,2020-04-07_01
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

From: Olivier Moysan <olivier.moysan@st.com>

The SAI peripheral supports up to 16 channels in TDM mode (8L+8R).
The driver currently supports TDM over two channels.
Increase SAI DAI playback/record channels_max,
to also allow up to 16 channels in TDM mode.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 9c3b8e209656..95cd38a502bb 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1294,7 +1294,7 @@ static struct snd_soc_dai_driver stm32_sai_playback_dai = {
 		.id = 1, /* avoid call to fmt_single_name() */
 		.playback = {
 			.channels_min = 1,
-			.channels_max = 2,
+			.channels_max = 16,
 			.rate_min = 8000,
 			.rate_max = 192000,
 			.rates = SNDRV_PCM_RATE_CONTINUOUS,
@@ -1312,7 +1312,7 @@ static struct snd_soc_dai_driver stm32_sai_capture_dai = {
 		.id = 1, /* avoid call to fmt_single_name() */
 		.capture = {
 			.channels_min = 1,
-			.channels_max = 2,
+			.channels_max = 16,
 			.rate_min = 8000,
 			.rate_max = 192000,
 			.rates = SNDRV_PCM_RATE_CONTINUOUS,
-- 
2.17.1

