Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CA3210347
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 07:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872B282A;
	Wed,  1 Jul 2020 07:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872B282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593581056;
	bh=wMErSbnRpPq91v5Bz7dDCvRdt5lpVBEav6NqCopw1TA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RlZiogeGEvPB+KCVk75kRRG6WrjbsZ8W/oWDaMkz42URZt+EOnhoXrUb4PNQnds82
	 +779ul2w5bR/amZSsoa6dovx5seimg4A+ZZL/Lh0jbK81M7I5WdYuKG6sXJHHQoUjq
	 mW2nvUmyvq9DVkjBYdWsiZs3UrTWTz06RIbErfwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CFE4F8021D;
	Wed,  1 Jul 2020 07:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334A8F800EA; Wed,  1 Jul 2020 07:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=4.0 required=5.0 tests=AC_FROM_MANY_DOTS, PRX_BODY_30,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63EE1F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 07:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63EE1F800EA
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jqVBw-0001yp-1w; Wed, 01 Jul 2020 05:21:52 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Serialize setting GPIO LED
Date: Wed,  1 Jul 2020 13:21:35 +0800
Message-Id: <20200701052138.6378-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Libin Yang <libin.yang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 anthony.won@canonical.com, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

If a system has two GPIO controlled LED, one for mute and another one
for micmute, and both of them are on before system suspend, sometimes
one of them won't be turned off by system suspend.

The codec doesn't seem to be able to control multiple GPIO LEDs at the
same time, so introduce a new mutex to serialize setting the LED, to
prevent the issue from happening.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 include/sound/hda_codec.h     | 1 +
 sound/pci/hda/hda_codec.c     | 1 +
 sound/pci/hda/patch_realtek.c | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index d16a4229209b..3a1792bbb7ac 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -206,6 +206,7 @@ struct hda_codec {
 
 	struct mutex spdif_mutex;
 	struct mutex control_mutex;
+	struct mutex led_mutex;
 	struct snd_array spdif_out;
 	unsigned int spdif_in_enable;	/* SPDIF input enable? */
 	const hda_nid_t *slave_dig_outs; /* optional digital out slave widgets */
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7e3ae4534df9..ec477cd8afed 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -946,6 +946,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	codec->addr = codec_addr;
 	mutex_init(&codec->spdif_mutex);
 	mutex_init(&codec->control_mutex);
+	mutex_init(&codec->led_mutex);
 	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
 	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
 	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 53e0eef8b042..96dac365fbb8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4101,7 +4101,10 @@ static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
 {
 	if (polarity)
 		enabled = !enabled;
+
+	mutex_lock(&codec->led_mutex);
 	alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
+	mutex_unlock(&codec->led_mutex);
 }
 
 /* turn on/off mute LED via GPIO per vmaster hook */
-- 
2.17.1

