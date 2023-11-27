Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29E7FA044
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4271D7F8;
	Mon, 27 Nov 2023 14:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4271D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701090226;
	bh=MKeHYQIcm37ccjV6yff59a6zCUoujh/0QydqqvKlRA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qs4BqbM45kGyQz1wbRSmMcg5NVk0r1gqCsHU6xMM9t23BtVFCyjUwc0J7ko5P242o
	 IWid3GcYAVBHGAHpWmfY4OhvPSZ8z3YuqPc7AzA0IgQrpuk57ZyMTNquXbgM5Bxb1N
	 1uHpehpGrLQDMO7oCXtzo5zRj8a2VUDP/AHZzIlw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E314F805C8; Mon, 27 Nov 2023 14:02:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D754F805BD;
	Mon, 27 Nov 2023 14:02:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E77ADF8016E; Mon, 27 Nov 2023 14:02:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B1BCF8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1BCF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U/8kFjXB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090166; x=1732626166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MKeHYQIcm37ccjV6yff59a6zCUoujh/0QydqqvKlRA8=;
  b=U/8kFjXBvayL1XMuAsHrH+tA00d/z4EUTRjvqPP2H6rbu3darLv4ENTu
   Et/X7EVirfQg6xhNQs3yohgqUrBYRKk5Nz9rH+Mh5NVWlMEuLtp5zlPWQ
   RJCWNnaT1LmaPeJLMhk18th2ER2gp9cpVZWTd7w2Pvdj6T4bR8h2nIo0R
   ZctKIJ+jyGmCKcFC9hVPpyKK7e1usXgiwv/h67BDj96H/ggXFcpHGk3r9
   VK514e8EJe3LM2UZXESHVnvsbfbD89oQOlM4df2F6iRniaP1cQQHws+Xv
   zey3kWxXuecQABdUTmhAHeWuU68/i8yxyYg2dpMMzjBKE6Heyl5xZHm+W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568035"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="391568035"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228703"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="797228703"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a device
 is HDMI codec
Date: Mon, 27 Nov 2023 15:02:44 +0200
Message-ID: <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CQK2FVN6E47RCVEG7BKDQLMBKQBMAMOD
X-Message-ID-Hash: CQK2FVN6E47RCVEG7BKDQLMBKQBMAMOD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQK2FVN6E47RCVEG7BKDQLMBKQBMAMOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The snd_hda_device_is_hdmi() can be used in drivers to check if the hdev
belongs to a display audio device.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h    | 10 ++++++++++
 sound/pci/hda/patch_hdmi.c | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index dd7c87bbc613..cf5483d6b5b7 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -158,6 +158,16 @@ bool snd_hdac_check_power_state(struct hdac_device *hdac,
 		hda_nid_t nid, unsigned int target_state);
 unsigned int snd_hdac_sync_power_state(struct hdac_device *hdac,
 		      hda_nid_t nid, unsigned int target_state);
+
+#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
+bool snd_hda_device_is_hdmi(struct hdac_device *hdev);
+#else
+static inline bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
+{
+	return false;
+}
+#endif
+
 /**
  * snd_hdac_read_parm - read a codec parameter
  * @codec: the codec object
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1cde2a69bdb4..d6943575c8c7 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4645,6 +4645,19 @@ HDA_CODEC_ENTRY(HDA_CODEC_ID_GENERIC_HDMI, "Generic HDMI", patch_generic_hdmi),
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_hdmi);
 
+bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
+		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HDMI HD-audio codec");
 MODULE_ALIAS("snd-hda-codec-intelhdmi");
-- 
2.43.0

