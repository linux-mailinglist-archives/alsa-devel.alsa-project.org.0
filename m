Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874269237C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E93B84C;
	Fri, 10 Feb 2023 17:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E93B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676047160;
	bh=YQ1TM8Q+n2Itf6Y1mJyTLtaa+tGtYTXDs77/B/m2b7o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jLXYWOFMTcxfphwroRn2jjpnTQbEQ6z1eH22VFMev0rGSvQc1M+z+tDjceB49+mDc
	 yXOFAEonrdMsXy2m3bdLaBizAZ+nZbuizTSvR3w6D88p0R7L237HJxmHh1+s4pSk48
	 63e7BmqClV+VQzwx1n32q/kg2OdER1yOGAU/NyIs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62376F800B8;
	Fri, 10 Feb 2023 17:38:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41359F8018A; Fri, 10 Feb 2023 17:38:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62AA7F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 17:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AA7F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RX1cVAJQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676047101; x=1707583101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YQ1TM8Q+n2Itf6Y1mJyTLtaa+tGtYTXDs77/B/m2b7o=;
  b=RX1cVAJQ2Ktu9DmnU615fdE4TTfYjUp54R919WWtQ1gZ63v/XiYvT1UE
   FnFTJ/59MQR0QQR+w57MUTH0dyz7XCN+UMVsm7EZg1AWURQSQaaMW0JmM
   AHjSPr9wJzlNFwe5cc6Snqh4QiaW4YaODlx3YzLw6pn6zM02eeWck4rxX
   QAFz2Ur4ZKCsI3rDfnEBdnICwJOjGDN6J8bhQX9P2TB5ycnLDUZPJ7bLS
   aHr5P4hmefaWLUE4IUVEUU6bAijKB9I5J7boNuOCHHciV1XNt1jLj4jdh
   i0Y9QG6v17qhE9gBPzjjloaCFauo2ZXqVfSHe7QGuGv/v15O8tfTsjVXq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="314105202"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000";
   d="scan'208";a="314105202"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 08:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756836986"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000";
   d="scan'208";a="756836986"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 08:38:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda: Fix codec device field initializan
Date: Fri, 10 Feb 2023 17:55:41 +0100
Message-Id: <20230210165541.3543604-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7CXR7I7NG4BU6KXSCGFPAAEWJLRHBAO4
X-Message-ID-Hash: 7CXR7I7NG4BU6KXSCGFPAAEWJLRHBAO4
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 jmontleo@redhat.com, casaxa@gmail.com, lma@semihalf.com,
 Cezary Rojewski <cezary.rojewski@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CXR7I7NG4BU6KXSCGFPAAEWJLRHBAO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit f2bd1c5ae2cb ("ALSA: hda: Fix page fault in
snd_hda_codec_shutdown()") relocated initialization of several codec
device fields. Due to differences between codec_exec_verb() and
snd_hdac_bus_exec_bus() in how they handle VERB execution - the latter
does not touch PM - assigning ->exec_verb to codec_exec_verb() causes PM
to be engaged before it is configured for the device. Configuration of
PM for the ASoC HDAudio sound card is done with snd_hda_set_power_save()
during skl_hda_audio_probe() whereas the assignment happens early, in
snd_hda_codec_device_init().

Revert to previous behavior to avoid problems caused by too early PM
manipulation.

Suggested-by: Jason Montleon <jmontleo@redhat.com>
Link: https://lore.kernel.org/regressions/CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com
Fixes: f2bd1c5ae2cb ("ALSA: hda: Fix page fault in snd_hda_codec_shutdown()")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

A result of recent discussion [1] regarding sound regression in v6.1 and
onward. Fix made possible by outstanding input from Jason and Sasa
(Cced) - Thank you!

Note: I did not receive results from our CI yet, should happen on Monday
but posting early so the review can be conducted.

[1]: https://lore.kernel.org/regressions/CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com/

 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index ac1cc7c5290e..2e728aad6771 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -927,7 +927,6 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 	codec->depop_delay = -1;
 	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
 	codec->core.dev.release = snd_hda_codec_dev_release;
-	codec->core.exec_verb = codec_exec_verb;
 	codec->core.type = HDA_DEV_LEGACY;
 
 	mutex_init(&codec->spdif_mutex);
@@ -998,6 +997,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	if (snd_BUG_ON(codec_addr > HDA_MAX_CODEC_ADDRESS))
 		return -EINVAL;
 
+	codec->core.exec_verb = codec_exec_verb;
 	codec->card = card;
 	codec->addr = codec_addr;
 
-- 
2.25.1

