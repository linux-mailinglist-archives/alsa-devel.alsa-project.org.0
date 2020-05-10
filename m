Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195481CC7BB
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 09:47:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A080386F;
	Sun, 10 May 2020 09:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A080386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589096849;
	bh=3pzQXOtdWXqBFFkDxdJ3PEMMzrJK/cuMn9CYk4Wm7Ig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4wHwM0sSe4clufkXcFQm0Tc1TmHPfE0LGmSFmZZkDO+Sd1ysslit0wZ/7csc/Is5
	 V0yw3HWyPWmW2nykLi06myxnmEpy4DenCXZHSoSwX48TIafwUj8CsQp+cdzPYputnw
	 Fz9ZQrZqg866H3LLzOu76Vv0gT0HEwkJPJcLjRro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D21BF800BF;
	Sun, 10 May 2020 09:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4370F802BE; Sun, 10 May 2020 09:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D68BCF800BF
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 09:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68BCF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dN50nTMe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="3IrN5NmV"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0482E5C00A2;
 Sun, 10 May 2020 03:43:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 03:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ffhxWSdu82d43
 tTKm+119ipAmpALpSgw2r8EgqLECnM=; b=dN50nTMeeb+38nNdcRnLAqVELxJbB
 XwETG/7clSw726BNZ2rTI4zOis0yLCPn5b6QPyBkHiqGFX2Sz8QcxTp08gpKpqpi
 3j/4KMHOp5uSX0b7WcJYfHGlL6aNGaNlxxHbnuwdyJV5tmBV+t/ckI7Caz4Z2GG7
 vRFFixbBrx8ljS1DkKTz57KQqCaU71Qi4kqFuCUgl1lU1iqBAHBwsFxYEDpT6oSC
 fJMR7uZRH6DmKrQgpTO5wRhgbs1n0QP0hgPdyIGW+j/uRphvRVacn+zbWzfug4NU
 Brb4bKdypW9Xg0vumDyi2wwVudZtT2IGH/f863tfGKlyZhLIQap04gcWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ffhxWSdu82d43tTKm+119ipAmpALpSgw2r8EgqLECnM=; b=3IrN5NmV
 or8BJ97ct7FjAvZ56hhEqOQMwN5N+dThjB//AqJ+17ft67xIzIsv/qy0yMHYXssB
 SwqeFTUBkbpjF3adOsoNgqDL6I3g2Yx4vFkWXx9IUy3uBOvwJgzos89XIROypeHP
 9NajNcatP0vgqgXeawYzLz6K1yhWFiznf8iU00XgkIQW2IW/4LRDRmQXUUhravWd
 tk2we8tBKPSBiJN5wHsClMBT3bMkcV6K0yi6AYWRKwMMsZiOevTaVrNoMlyfJyoD
 bGHnmeKJDvWHLBEgRoqmWguWFMx672OdXSKMmK3cZNR2IWzzKqi12r8eb3JAtI3w
 H9UhWcAEN70MEw==
X-ME-Sender: <xms:jrC3XnsLbkjcFHpWFM-yJYDYxG83aiQVuonDUSEtfBtQRgYKdf3cxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jrC3Xl09rVDsyFeEZ5L3wmwBCK-KzoiF10jYGr0dxY-K6OTS89ic0w>
 <xmx:jrC3XiEmow8cqn8IFLUbuK2piHRO8zGh4sS70dwRs8eaIzqOu8Zmrg>
 <xmx:jrC3XgtL5ZSVMnZX2HcjoPIUHktihYVYRPrf1HXibuGQ2T2bIXEzbg>
 <xmx:j7C3XkF5da5ZnA0vBYKxpXaxaKjeIuK1t18WGBV5GEi-nbYaEMnq5A>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id CEAC73066258;
 Sun, 10 May 2020 03:43:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 4/6] ALSA: fireface: code refactoring to decide name of sound
 card
Date: Sun, 10 May 2020 16:42:59 +0900
Message-Id: <20200510074301.116224-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
References: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
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

This commit uses enumeration constants as index of table for the
list of name of sound card.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff.c | 18 ++++++++++++------
 sound/firewire/fireface/ff.h |  3 +--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index b295e40a425d..dd3cd25f2e3b 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -16,12 +16,20 @@ MODULE_LICENSE("GPL v2");
 static void name_card(struct snd_ff *ff)
 {
 	struct fw_device *fw_dev = fw_parent_device(ff->unit);
+	const char *const names[] = {
+		[SND_FF_UNIT_VERSION_FF800]	= "Fireface800",
+		[SND_FF_UNIT_VERSION_FF400]	= "Fireface400",
+		[SND_FF_UNIT_VERSION_UCX]	= "FirefaceUCX",
+	};
+	const char *name;
+
+	name = names[ff->unit_version];
 
 	strcpy(ff->card->driver, "Fireface");
-	strcpy(ff->card->shortname, ff->spec->name);
-	strcpy(ff->card->mixername, ff->spec->name);
+	strcpy(ff->card->shortname, name);
+	strcpy(ff->card->mixername, name);
 	snprintf(ff->card->longname, sizeof(ff->card->longname),
-		 "RME %s, GUID %08x%08x at %s, S%d", ff->spec->name,
+		 "RME %s, GUID %08x%08x at %s, S%d", name,
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
 		 dev_name(&ff->unit->device), 100 << fw_dev->max_speed);
 }
@@ -101,6 +109,7 @@ static int snd_ff_probe(struct fw_unit *unit,
 	spin_lock_init(&ff->lock);
 	init_waitqueue_head(&ff->hwdep_wait);
 
+	ff->unit_version = entry->version;
 	ff->spec = (const struct snd_ff_spec *)entry->driver_data;
 
 	/* Register this sound card later. */
@@ -145,7 +154,6 @@ static void snd_ff_remove(struct fw_unit *unit)
 }
 
 static const struct snd_ff_spec spec_ff800 = {
-	.name = "Fireface800",
 	.pcm_capture_channels = {28, 20, 12},
 	.pcm_playback_channels = {28, 20, 12},
 	.midi_in_ports = 1,
@@ -157,7 +165,6 @@ static const struct snd_ff_spec spec_ff800 = {
 };
 
 static const struct snd_ff_spec spec_ff400 = {
-	.name = "Fireface400",
 	.pcm_capture_channels = {18, 14, 10},
 	.pcm_playback_channels = {18, 14, 10},
 	.midi_in_ports = 2,
@@ -169,7 +176,6 @@ static const struct snd_ff_spec spec_ff400 = {
 };
 
 static const struct snd_ff_spec spec_ucx = {
-	.name = "FirefaceUCX",
 	.pcm_capture_channels = {18, 14, 12},
 	.pcm_playback_channels = {18, 14, 12},
 	.midi_in_ports = 2,
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 62ad921c3706..0c4fe7cff84d 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -49,8 +49,6 @@ enum snd_ff_stream_mode {
 
 struct snd_ff_protocol;
 struct snd_ff_spec {
-	const char *const name;
-
 	const unsigned int pcm_capture_channels[SND_FF_STREAM_MODE_COUNT];
 	const unsigned int pcm_playback_channels[SND_FF_STREAM_MODE_COUNT];
 
@@ -72,6 +70,7 @@ struct snd_ff {
 	bool registered;
 	struct delayed_work dwork;
 
+	enum snd_ff_unit_version unit_version;
 	const struct snd_ff_spec *spec;
 
 	/* To handle MIDI tx. */
-- 
2.25.1

