Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82994138E8D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 11:06:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182F21614;
	Mon, 13 Jan 2020 11:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182F21614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578910004;
	bh=3EcZtyNFBRNJrDqhSmia2/z/BSzBBCIPE8wTYVsUhvM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gOG7hjJBWqIc1z8xCVfp8r5Ak2Dd9V2yXHkyx8YexA7g2v3N8BxmQ/o9w6zHRSEpz
	 X4sWIayOHCw6SVHdSqJp4gEa6NgPxkISA7Uz8dPdRXTA9BX8P9xW1uReHKR1l5df//
	 YmAA80wo+R9IOwjUE99O7++/ZC2CiE2COCMUj/HU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EF6F801EB;
	Mon, 13 Jan 2020 11:05:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E44F80149; Mon, 13 Jan 2020 11:04:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70267F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 11:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70267F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="ENANPwQA"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DA4Y0d020212; Mon, 13 Jan 2020 11:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uAmD+cLKEDeaQ5sIIegoK01hcED8wf+eyuSy31R7770=;
 b=ENANPwQAAJvqiLBkWg+qrgjJhKC2mHUcF5Ukx3zedKUd/OtoDeORtma6EtqoqAIz72AS
 R4tVkLPoyfVvKezPUqXxD1ImPSytdHDBXWXOzr5wEt3rUzgStBJSEOekhHaoJWFgDGWN
 bpniChCPxN9Tkm5+ulZiIGQ7ypTaNKRvmL5oQPtqpVoANXJSkVQPz9DYJLsRu+LHBqF8
 6uMrV6LQNxxRqjY56zyuuFOPZagB13tqiG65LqAVbLsaznFZqRs8a5vGpOHz4UOPfYz1
 /o/LzrJb8Z7naNVVq8P0asDDc9aSKfgXUxBBuj3mHxMXlbLn8anDCES+AO2sxji4jHft 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aqk5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:04:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C000510003B;
 Mon, 13 Jan 2020 11:04:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 943DB2A896E;
 Mon, 13 Jan 2020 11:04:53 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan 2020 11:04:53
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
Date: Mon, 13 Jan 2020 11:04:00 +0100
Message-ID: <20200113100400.30472-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: arnaud.pouliquen@st.com, Olivier Moysan <olivier.moysan@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] asoc: sti: fix possible sleep-in-atomic
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

Change mutex and spinlock management to avoid sleep
in atomic issue.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
V1 to V2 suppress unexpected [INTERNAL REVIEW] tag in subject

 sound/soc/sti/uniperif_player.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 48ea915b24ba..2ed92c990b97 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -226,7 +226,6 @@ static void uni_player_set_channel_status(struct uniperif *player,
 	 * sampling frequency. If no sample rate is already specified, then
 	 * set one.
 	 */
-	mutex_lock(&player->ctrl_lock);
 	if (runtime) {
 		switch (runtime->rate) {
 		case 22050:
@@ -303,7 +302,6 @@ static void uni_player_set_channel_status(struct uniperif *player,
 		player->stream_settings.iec958.status[3 + (n * 4)] << 24;
 		SET_UNIPERIF_CHANNEL_STA_REGN(player, n, status);
 	}
-	mutex_unlock(&player->ctrl_lock);
 
 	/* Update the channel status */
 	if (player->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0)
@@ -365,8 +363,10 @@ static int uni_player_prepare_iec958(struct uniperif *player,
 
 	SET_UNIPERIF_CTRL_ZERO_STUFF_HW(player);
 
+	mutex_lock(&player->ctrl_lock);
 	/* Update the channel status */
 	uni_player_set_channel_status(player, runtime);
+	mutex_unlock(&player->ctrl_lock);
 
 	/* Clear the user validity user bits */
 	SET_UNIPERIF_USER_VALIDITY_VALIDITY_LR(player, 0);
@@ -598,7 +598,6 @@ static int uni_player_ctl_iec958_put(struct snd_kcontrol *kcontrol,
 	iec958->status[1] = ucontrol->value.iec958.status[1];
 	iec958->status[2] = ucontrol->value.iec958.status[2];
 	iec958->status[3] = ucontrol->value.iec958.status[3];
-	mutex_unlock(&player->ctrl_lock);
 
 	spin_lock_irqsave(&player->irq_lock, flags);
 	if (player->substream && player->substream->runtime)
@@ -608,6 +607,8 @@ static int uni_player_ctl_iec958_put(struct snd_kcontrol *kcontrol,
 		uni_player_set_channel_status(player, NULL);
 
 	spin_unlock_irqrestore(&player->irq_lock, flags);
+	mutex_unlock(&player->ctrl_lock);
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
