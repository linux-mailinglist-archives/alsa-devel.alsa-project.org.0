Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BB5F93E3
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32FC616A1;
	Mon, 10 Oct 2022 01:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32FC616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359455;
	bh=DBhVd95XpZutQyzgeXjErPc70e6GrTLKwZc/rk2PCZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6Hn0pvnzTLBHRArAb7HFgmbJMEvGxD3vtyDhwrUWtWodzA0HIwmEW/raXd/XhoYI
	 KhLg2+IRRNaDIuIxm2ky/SzJEwCDI/kyzRIl/LC8Wv/ojJLkalf4CCiftWyS0qBVLZ
	 Bk37ybygq6DDTNPDzZVOr5kWQ6F00xAyXcDR3UvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78496F804FA;
	Mon, 10 Oct 2022 01:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A3CF804CB; Mon, 10 Oct 2022 01:49:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 647E3F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647E3F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTAXnGc3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49DCEB80DE0;
 Sun,  9 Oct 2022 23:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AA6C433D6;
 Sun,  9 Oct 2022 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359389;
 bh=DBhVd95XpZutQyzgeXjErPc70e6GrTLKwZc/rk2PCZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTAXnGc3bBW8hVojdZY7HgrOgp6ZWLd0Gogb5w8MaFzD1hx7mMtEvUHVDqZF7JQDW
 Lz47Fn4jFAY+RJzRWggojc8JAikOE6U0qDuxr/vSs+eIod1lTM/8s4tVTiTygCFGk0
 qWbGDM9NHOkgKhcSDhIOiaHRRYRimGEv4DBe9TpjTGhydv4MC2Qh0ZCz2WtD1GEpuz
 t01N1xfX1tIUZcKSIM1/NR8ywL8VqyMUzZ9oMlCX3sCtoRPVN5hMvZA1dWRDjUa5yb
 B1IcZhaYpghUnaeAY9wX7YjkVZZZShrIcRcavgp/SldjRndGqkFB1BXDPFvCgITaaV
 5V9puwWd8K9hA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 07/44] ALSA: hda: Fix page fault in
 snd_hda_codec_shutdown()
Date: Sun,  9 Oct 2022 19:48:55 -0400
Message-Id: <20221009234932.1230196-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 mkumard@nvidia.com
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 ]

If early probe of HDAudio bus driver fails e.g.: due to missing
firmware file, snd_hda_codec_shutdown() ends in manipulating
uninitialized codec->pcm_list_head causing page fault.

Initialization of HDAudio codec in ASoC is split in two:
- snd_hda_codec_device_init()
- snd_hda_codec_device_new()

snd_hda_codec_device_init() is called during probe_codecs() by HDAudio
bus driver while snd_hda_codec_device_new() is called by
codec-component's ->probe(). The second call will not happen until all
components required by related sound card are present within the ASoC
framework. With firmware failing to load during the PCI's deferred
initialization i.e.: probe_work(), no platform components are ever
registered. HDAudio codec enumeration is done at that point though, so
the codec components became registered to ASoC framework, calling
snd_hda_codec_device_init() in the process.

Now, during platform reboot snd_hda_codec_shutdown() is called for every
codec found on the HDAudio bus causing oops if any of them has not
completed both of their initialization steps. Relocating field
initialization fixes the issue.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20220816111727.3218543-7-cezary.rojewski@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_codec.c | 41 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 384426d7e9dd..4ae8b9574778 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -931,8 +931,28 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 	}
 
 	codec->bus = bus;
+	codec->depop_delay = -1;
+	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
+	codec->core.dev.release = snd_hda_codec_dev_release;
+	codec->core.exec_verb = codec_exec_verb;
 	codec->core.type = HDA_DEV_LEGACY;
 
+	mutex_init(&codec->spdif_mutex);
+	mutex_init(&codec->control_mutex);
+	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
+	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
+	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
+	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
+	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
+	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
+	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
+	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
+	INIT_LIST_HEAD(&codec->conn_list);
+	INIT_LIST_HEAD(&codec->pcm_list_head);
+	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
+	refcount_set(&codec->pcm_ref, 1);
+	init_waitqueue_head(&codec->remove_sleep);
+
 	return codec;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_device_init);
@@ -985,29 +1005,8 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	if (snd_BUG_ON(codec_addr > HDA_MAX_CODEC_ADDRESS))
 		return -EINVAL;
 
-	codec->core.dev.release = snd_hda_codec_dev_release;
-	codec->core.exec_verb = codec_exec_verb;
-
 	codec->card = card;
 	codec->addr = codec_addr;
-	mutex_init(&codec->spdif_mutex);
-	mutex_init(&codec->control_mutex);
-	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
-	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
-	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
-	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
-	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
-	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
-	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
-	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
-	INIT_LIST_HEAD(&codec->conn_list);
-	INIT_LIST_HEAD(&codec->pcm_list_head);
-	refcount_set(&codec->pcm_ref, 1);
-	init_waitqueue_head(&codec->remove_sleep);
-
-	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
-	codec->depop_delay = -1;
-	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
 
 #ifdef CONFIG_PM
 	codec->power_jiffies = jiffies;
-- 
2.35.1

