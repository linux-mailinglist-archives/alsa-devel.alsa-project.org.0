Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B141C38D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 13:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA6616A3;
	Wed, 29 Sep 2021 13:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA6616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632915477;
	bh=9nHaDdzjWIQydUpc7SF/WDg3GDN6suAJytrlycN4zxA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nLy9MzXoKtgjNi5SZAKNLoregRBYIWFiRNV0WBUF4A/5p0+6NNnVAXTScuhesk06Y
	 WNVXIUd5aRxfBfzBmV+IVYlZJIdt6zR4viutDdwnPeVtY6AAXePzmVeuqt6Y+QHKSg
	 umW/Z3yfYWE1ap82P8dajO6GlFmv12aMveLEMn5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0831F80105;
	Wed, 29 Sep 2021 13:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ADE9F80227; Wed, 29 Sep 2021 13:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C241F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 13:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C241F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="x5Y2PoyL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=NG/dLqRkfXHdlB4dmK0BgcBIdTMjxPfvn7MfDjTG9OQ=; b=x5
 Y2PoyLwwRVwoZa3v8CwgEkb82mzZvjytFBMCSP08brAFyuNtbc2pdxdKG+Kp8xuFY6BtT1WpMfqD3
 UhJ1x1zfRfYJeGep9A2+apYkxhQIOjrSjZJxzjRxCqqTQDVZ++NN2OC1vzxkkmHwk3ug7h32o/Kc3
 FDFPmfmgaNW0ptDg/rOWUeUU7knZ04JJY9Byl5kfqBDjq68NYZsDmh3/F33ZsTc5eUQQA8HXlakDu
 HfzFTp1bQPrxeuIQKCNqiCgfHbTc1XjXl2PSbi37jIvcWsF0A32Um6Knp/BHclXOgdn7whW8c4pl2
 KpwAyuIbaWnVLf6Rz1ypQrIqdzDyb8qw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mVXsx-00032A-OM; Wed, 29 Sep 2021 12:36:27 +0100
From: John Keeping <john@metanate.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: rawmidi: Fix potential UAF from sequencer destruction
Date: Wed, 29 Sep 2021 12:36:20 +0100
Message-Id: <20210929113620.2194847-1-john@metanate.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Cc: linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>,
 Takashi Iwai <tiwai@suse.com>
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

If the sequencer device outlives the rawmidi device, then
snd_rawmidi_dev_seq_free() will run after release_rawmidi_device() has
freed the snd_rawmidi structure.

This can easily be reproduced with CONFIG_DEBUG_KOBJECT_RELEASE.

Keep a reference to the rawmidi device until the sequencer has been
destroyed in order to avoid this.

Signed-off-by: John Keeping <john@metanate.com>
---
 sound/core/rawmidi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6f30231bdb88..b015f5f69175 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1860,6 +1860,7 @@ static void snd_rawmidi_dev_seq_free(struct snd_seq_device *device)
 	struct snd_rawmidi *rmidi = device->private_data;
 
 	rmidi->seq_dev = NULL;
+	put_device(&rmidi->dev);
 }
 #endif
 
@@ -1936,6 +1937,9 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 	if (!rmidi->ops || !rmidi->ops->dev_register) { /* own registration mechanism */
 		if (snd_seq_device_new(rmidi->card, rmidi->device, SNDRV_SEQ_DEV_ID_MIDISYNTH, 0, &rmidi->seq_dev) >= 0) {
+			/* Ensure we outlive the sequencer (see snd_rawmidi_dev_seq_free). */
+			get_device(&rmidi->dev);
+
 			rmidi->seq_dev->private_data = rmidi;
 			rmidi->seq_dev->private_free = snd_rawmidi_dev_seq_free;
 			sprintf(rmidi->seq_dev->name, "MIDI %d-%d", rmidi->card->number, rmidi->device);
-- 
2.33.0

