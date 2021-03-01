Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCB3288E3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:48:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBDF6167F;
	Mon,  1 Mar 2021 18:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBDF6167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614620902;
	bh=/GyyqZuw3pDsYufq3ZcWQKtbpfUfvveJ0wEbldm59+c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKT9oRdMvilyIr+Bl9tPwBhuFT0tCFXBmAcCWAGFPNaK24DeJ1A6JEZqgXbG5eqZl
	 5p6b1zntJLXUPeYBlb1+5UnVLC/+nd1TYXw1iDhWmmye7DHNQDRJZw8e2+Exa6mukL
	 XeViNnj7OBZ06n73O3eKt/2DE6kmJRjy3GkuPZRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44934F8026A;
	Mon,  1 Mar 2021 18:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B040CF8025E; Mon,  1 Mar 2021 18:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E16F8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E16F8010B
IronPort-SDR: 0iKeWsT80PMbDWX7sO6vEGHmeY8NXU8Bhe4EmJQcdHYTTya9yeHfmAKepV11wH2prUIPeOlIhp
 JzSW2bEgegcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="173678122"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="173678122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:46:38 -0800
IronPort-SDR: N6ejMearWiL/BHhjxdKQLy+oPO+3k+0+Hb2cng/RVl6edS8W4KcT0Mn41/U6+BAWGyTpftnnrJ
 SmB5hJUCKkCQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="434363066"
Received: from mhuang8-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.25.220])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:46:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda: fix kernel-doc warnings
Date: Mon,  1 Mar 2021 11:46:17 -0600
Message-Id: <20210301174617.116960-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

v5.12-rc1 flags new warnings with make W=1, fix missing or broken
function descriptors.

sound/pci/hda/hda_codec.c:3492: warning: expecting prototype for
snd_hda_input_mux_info_info(). Prototype was for
snd_hda_input_mux_info() instead

sound/pci/hda/hda_codec.c:3521: warning: expecting prototype for
snd_hda_input_mux_info_put(). Prototype was for
snd_hda_input_mux_put() instead

sound/pci/hda/hda_codec.c:3958: warning: expecting prototype for
_snd_hda_pin_ctl(). Prototype was for _snd_hda_set_pin_ctl() instead

sound/pci/hda/hda_jack.c:223: warning: expecting prototype for
snd_hda_set_dirty_all(). Prototype was for
snd_hda_jack_set_dirty_all() instead

sound/pci/hda/hda_jack.c:309: warning: expecting prototype for
snd_hda_jack_detect_enable_mst(). Prototype was for
snd_hda_jack_detect_enable_callback_mst() instead

sound/pci/hda/hda_generic.c:3933: warning: expecting prototype for
snd_dha_gen_add_mute_led_cdev(). Prototype was for
snd_hda_gen_add_mute_led_cdev() instead

sound/pci/hda/hda_generic.c:4093: warning: expecting prototype for
snd_dha_gen_add_micmute_led_cdev(). Prototype was for
snd_hda_gen_add_micmute_led_cdev() instead

sound/pci/hda/patch_ca0132.c:2357: warning: expecting prototype for
Prepare and send the SCP message to DSP(). Prototype was for
dspio_scp() instead

sound/pci/hda/patch_ca0132.c:2883: warning: expecting prototype for
Allocate router ports(). Prototype was for dsp_allocate_router_ports()
instead

sound/pci/hda/patch_ca0132.c:3202: warning: expecting prototype for
Write a block of data into DSP code or data RAM using pre(). Prototype
was for dspxfr_one_seg() instead

sound/pci/hda/patch_ca0132.c:3397: warning: expecting prototype for
data overlay to DSP memories(). Prototype was for dspxfr_image()
instead

sound/hda/hdac_regmap.c:393: warning: expecting prototype for
snd_hdac_regmap_init(). Prototype was for snd_hdac_regmap_exit()
instead

sound/hda/ext/hdac_ext_controller.c:142: warning: expecting prototype
for snd_hdac_ext_bus_get_link_index(). Prototype was for
snd_hdac_ext_bus_get_link() instead

sound/hda/ext/hdac_ext_stream.c:140: warning: expecting prototype for
snd_hdac_ext_linkstream_start(). Prototype was for
snd_hdac_ext_link_stream_start() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/ext/hdac_ext_controller.c | 2 +-
 sound/hda/ext/hdac_ext_stream.c     | 2 +-
 sound/hda/hdac_regmap.c             | 2 +-
 sound/pci/hda/hda_codec.c           | 6 +++---
 sound/pci/hda/hda_generic.c         | 4 ++--
 sound/pci/hda/hda_jack.c            | 4 ++--
 sound/pci/hda/patch_ca0132.c        | 9 ++++-----
 7 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index a9bd39b93697..b2df7b4f9227 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -133,7 +133,7 @@ void snd_hdac_link_free_all(struct hdac_bus *bus)
 EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
 
 /**
- * snd_hdac_ext_bus_get_link_index - get link based on codec name
+ * snd_hdac_ext_bus_get_link - get link based on codec name
  * @bus: the pointer to HDAC bus object
  * @codec_name: codec name
  */
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index c4d54a838773..0c005d67fa89 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -133,7 +133,7 @@ void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple);
 
 /**
- * snd_hdac_ext_linkstream_start - start a stream
+ * snd_hdac_ext_link_stream_start - start a stream
  * @stream: HD-audio ext core stream to start
  */
 void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *stream)
diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index d75f31eb9d78..fe3587547cfe 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -386,7 +386,7 @@ int snd_hdac_regmap_init(struct hdac_device *codec)
 EXPORT_SYMBOL_GPL(snd_hdac_regmap_init);
 
 /**
- * snd_hdac_regmap_init - Release the regmap from HDA codec
+ * snd_hdac_regmap_exit - Release the regmap from HDA codec
  * @codec: the codec object
  */
 void snd_hdac_regmap_exit(struct hdac_device *codec)
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9b755062d841..2026f1ccaf5a 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3483,7 +3483,7 @@ EXPORT_SYMBOL_GPL(snd_hda_check_amp_list_power);
  */
 
 /**
- * snd_hda_input_mux_info_info - Info callback helper for the input-mux enum
+ * snd_hda_input_mux_info - Info callback helper for the input-mux enum
  * @imux: imux helper object
  * @uinfo: pointer to get/store the data
  */
@@ -3506,7 +3506,7 @@ int snd_hda_input_mux_info(const struct hda_input_mux *imux,
 EXPORT_SYMBOL_GPL(snd_hda_input_mux_info);
 
 /**
- * snd_hda_input_mux_info_put - Put callback helper for the input-mux enum
+ * snd_hda_input_mux_put - Put callback helper for the input-mux enum
  * @codec: the HDA codec
  * @imux: imux helper object
  * @ucontrol: pointer to get/store the data
@@ -3941,7 +3941,7 @@ unsigned int snd_hda_correct_pin_ctl(struct hda_codec *codec,
 EXPORT_SYMBOL_GPL(snd_hda_correct_pin_ctl);
 
 /**
- * _snd_hda_pin_ctl - Helper to set pin ctl value
+ * _snd_hda_set_pin_ctl - Helper to set pin ctl value
  * @codec: the HDA codec
  * @pin: referred pin NID
  * @val: pin control value to set
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 5e40944e7342..8b7c5508f368 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3923,7 +3923,7 @@ static void vmaster_update_mute_led(void *private_data, int enabled)
 }
 
 /**
- * snd_dha_gen_add_mute_led_cdev - Create a LED classdev and enable as vmaster mute LED
+ * snd_hda_gen_add_mute_led_cdev - Create a LED classdev and enable as vmaster mute LED
  * @codec: the HDA codec
  * @callback: the callback for LED classdev brightness_set_blocking
  */
@@ -4074,7 +4074,7 @@ static int add_micmute_led_hook(struct hda_codec *codec)
 }
 
 /**
- * snd_dha_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
+ * snd_hda_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
  * @codec: the HDA codec
  * @callback: the callback for LED classdev brightness_set_blocking
  *
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index b8b568046592..ac00866d8032 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -213,7 +213,7 @@ static void jack_detect_update(struct hda_codec *codec,
 }
 
 /**
- * snd_hda_set_dirty_all - Mark all the cached as dirty
+ * snd_hda_jack_set_dirty_all - Mark all the cached as dirty
  * @codec: the HDA codec
  *
  * This function sets the dirty flag to all entries of jack table.
@@ -293,7 +293,7 @@ find_callback_from_list(struct hda_jack_tbl *jack,
 }
 
 /**
- * snd_hda_jack_detect_enable_mst - enable the jack-detection
+ * snd_hda_jack_detect_enable_callback_mst - enable the jack-detection
  * @codec: the HDA codec
  * @nid: pin NID to enable
  * @func: callback function to register
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 7e62aed172a9..c966f49fa942 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -2338,7 +2338,7 @@ static int dspio_send_scp_message(struct hda_codec *codec,
 }
 
 /**
- * Prepare and send the SCP message to DSP
+ * dspio_scp - Prepare and send the SCP message to DSP
  * @codec: the HDA codec
  * @mod_id: ID of the DSP module to send the command
  * @src_id: ID of the source
@@ -2865,7 +2865,7 @@ static int dsp_dma_stop(struct hda_codec *codec,
 }
 
 /**
- * Allocate router ports
+ * dsp_allocate_router_ports - Allocate router ports
  *
  * @codec: the HDA codec
  * @num_chans: number of channels in the stream
@@ -3178,8 +3178,7 @@ static int dspxfr_hci_write(struct hda_codec *codec,
 }
 
 /**
- * Write a block of data into DSP code or data RAM using pre-allocated
- * DMA engine.
+ * dspxfr_one_seg - Write a block of data into DSP code or data RAM using pre-allocated DMA engine.
  *
  * @codec: the HDA codec
  * @fls: pointer to a fast load image
@@ -3376,7 +3375,7 @@ static int dspxfr_one_seg(struct hda_codec *codec,
 }
 
 /**
- * Write the entire DSP image of a DSP code/data overlay to DSP memories
+ * dspxfr_image - Write the entire DSP image of a DSP code/data overlay to DSP memories
  *
  * @codec: the HDA codec
  * @fls_data: pointer to a fast load image
-- 
2.25.1

