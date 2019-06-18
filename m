Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEFF4A231
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7501670;
	Tue, 18 Jun 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7501670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864700;
	bh=eIf/Fg7sCNh6a+EDmqSRObxMIF75qZj6X0oXb3rz0Oo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YxkH7cPW2Sg5VFuwlYtLLDwUtuA2CMmOKEIGJfsIQvjndHDx2RZyIkKp2p3yl/R4W
	 nqrY/lUSpju8tF5aNgHNYpFtZSi1N22nYkFaTI3Fy73YXUidPQMMhKSGr4kKFmgKWh
	 3iP6Xd/HQvWQr8WLA73gVU7nO7j5JAzj+OEhHCxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88328F8973F;
	Tue, 18 Jun 2019 15:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57185F89730; Tue, 18 Jun 2019 15:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D6CF89724
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D6CF89724
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HkCm0hHu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="W1WPSIqE"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A2B0721FE2;
 Tue, 18 Jun 2019 09:26:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XYuflg2hhb+E7
 JF2UenhcCvwqwGvcxXnRtvjt2muL4k=; b=HkCm0hHuOnjwN86wlYEGC9a72XcXV
 AsEjQ2he4uWPHHSUl2DYSfSA6IzLke1RcaYQH0E04RdgCnYihWX8ET1AbM6SUNx+
 kNy2XwPYxUAk+xynFOk3usNAxYz6zlz/98kSTydnFlbVNcpFMkkyh/uqQIucAeRO
 iW/HoVR4sTtfPL9LqFAJvs3myxkd+8qUFr+6GucTW9JpjnNA1twtc0p7cf33FXlR
 cjWeq6w8XaygamkB0CwIyLx18tjugbtIL9Od3whPhucwmbq5EnG1Gndcou8IZ+u0
 tqiADMc1yYFO/DWx8K66WVfREcbRac0JrJkIa3r2vw9pYT7AxEkfe8W3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XYuflg2hhb+E7JF2UenhcCvwqwGvcxXnRtvjt2muL4k=; b=W1WPSIqE
 q6vJe+gVGyJf8CXt2ZHgnbYErAxpyTzJ+YBvVQZ0OZkHNQMcq1Dvr87Mv58VNfXS
 PdA0aqLFDU0nxDva+fcKr3n+3LGU7ZG/hwHNqFxdMDmzEOEmPGW5xnVga2k/9Eow
 ZbOu9dI3MbRITHCPGECcjYbrfs3Y1sdr6bGzUIEPMMTGraRogxcwFsBkNOW31YXY
 bemuIsDHOSA+K3kZzclHjSepYoe2H4iZw7i0TGCzGJp4soZyheoTsEtVCceKbq3c
 F/b4yOZPcxzDiEDymPETnEO01BektaWXLFLMIOtrcBfrvHhtAn3aITh5vKy12q6U
 wKvnUckDDNZC1Q==
X-ME-Sender: <xms:i-YIXQiDzmpAR6Q9p-RMm1AzEmz4GOQpYfheLI6tKYDGZXcTmjpxCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:i-YIXdnbO8yjUwRLIwPoZiADeJXukiX8ai29IMle41lDh-VT5pSF2w>
 <xmx:i-YIXT-C9A2l2Fht9_OAyXndKxfNdrMYNS1pEwtrt7IMX7VFO13azQ>
 <xmx:i-YIXd8-qClHptBGde37zCIa7PxsfPjG5lDaTVYM6is4TUjzntGuvw>
 <xmx:i-YIXRkfvAtLMU2ly-Tb8hnEFelTHrN2zGZqyaukjW15eqAxxSSB9Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A522380083;
 Tue, 18 Jun 2019 09:26:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:19 +0900
Message-Id: <20190618132622.32659-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/8] ALSA: dice: unify stop and release method
	for duplex streams
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

From callbacks for pcm and rawmidi interfaces, the functions to stop
and release duplex streams are called at the same time. This commit
merges the two functions.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-midi.c   | 1 -
 sound/firewire/dice/dice-pcm.c    | 1 -
 sound/firewire/dice/dice-stream.c | 8 ++------
 sound/firewire/dice/dice.h        | 1 -
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 6172dad87c4e..436f0c3c0fbb 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -40,7 +40,6 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 
 	--dice->substreams_counter;
 	snd_dice_stream_stop_duplex(dice);
-	snd_dice_stream_release_duplex(dice);
 
 	mutex_unlock(&dice->mutex);
 
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 00b55dfc3b2c..8368073f7fa0 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -265,7 +265,6 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 		--dice->substreams_counter;
 
 	snd_dice_stream_stop_duplex(dice);
-	snd_dice_stream_release_duplex(dice);
 
 	mutex_unlock(&dice->mutex);
 
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index e9e5c5fffb70..433714a117a0 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -336,12 +336,6 @@ int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate)
 	return err;
 }
 
-void snd_dice_stream_release_duplex(struct snd_dice *dice)
-{
-	if (dice->substreams_counter == 0)
-		release_resources(dice);
-}
-
 static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 			 unsigned int rate, struct reg_params *params)
 {
@@ -494,6 +488,8 @@ void snd_dice_stream_stop_duplex(struct snd_dice *dice)
 	if (dice->substreams_counter == 0) {
 		if (get_register_params(dice, &tx_params, &rx_params) >= 0)
 			finish_session(dice, &tx_params, &rx_params);
+
+		release_resources(dice);
 	}
 }
 
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index f95073b85010..fd3f483283d5 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -210,7 +210,6 @@ void snd_dice_stream_stop_duplex(struct snd_dice *dice);
 int snd_dice_stream_init_duplex(struct snd_dice *dice);
 void snd_dice_stream_destroy_duplex(struct snd_dice *dice);
 int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate);
-void snd_dice_stream_release_duplex(struct snd_dice *dice);
 void snd_dice_stream_update_duplex(struct snd_dice *dice);
 int snd_dice_stream_detect_current_formats(struct snd_dice *dice);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
