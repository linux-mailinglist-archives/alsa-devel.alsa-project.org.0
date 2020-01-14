Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7E13AB11
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:29:10 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE182310;
	Mon, 13 Jan 2020 21:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE182310
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED3DF8026A;
	Mon, 13 Jan 2020 21:56:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32510F80228; Mon, 13 Jan 2020 21:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B2EEF801F8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 21:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B2EEF801F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 12:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213110952"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 12:56:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 14:56:38 -0600
Message-Id: <20200113205638.27338-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: Update kernel-doc function
	parameter descriptions
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

From: Keyon Jie <yang.jie@linux.intel.com>

Make W=1 throws a lot of warnings, with multiple misalignments between
function params and their descriptions.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/ext/hdac_ext_bus.c        | 11 ++++++-----
 sound/hda/ext/hdac_ext_controller.c | 14 +++++++-------
 sound/hda/ext/hdac_ext_stream.c     |  1 -
 sound/hda/hdac_bus.c                |  3 +++
 sound/hda/hdac_component.c          |  1 +
 sound/hda/hdac_controller.c         |  2 +-
 sound/hda/hdac_device.c             | 12 ++++++++----
 sound/hda/hdac_stream.c             |  2 ++
 8 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 242306d820ec..73bfa71845f6 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -19,10 +19,10 @@ MODULE_LICENSE("GPL v2");
 
 /**
  * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
- * @ebus: the pointer to extended bus object
+ * @bus: the pointer to HDAC bus object
  * @dev: device pointer
  * @ops: bus verb operators
- * default ops
+ * @ext_ops: operators used for ASoC HDA codec drivers
  *
  * Returns 0 if successful, or a negative error code.
  */
@@ -51,7 +51,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_init);
 
 /**
  * snd_hdac_ext_bus_exit - clean up a HD-audio extended bus
- * @ebus: the pointer to extended bus object
+ * @bus: the pointer to HDAC bus object
  */
 void snd_hdac_ext_bus_exit(struct hdac_bus *bus)
 {
@@ -67,8 +67,9 @@ static void default_release(struct device *dev)
 
 /**
  * snd_hdac_ext_bus_device_init - initialize the HDA extended codec base device
- * @ebus: hdac extended bus to attach to
+ * @bus: hdac bus to attach to
  * @addr: codec address
+ * @hdev: hdac device to init
  *
  * Returns zero for success or a negative error code.
  */
@@ -114,7 +115,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_device_exit);
 /**
  * snd_hdac_ext_bus_device_remove - remove HD-audio extended codec base devices
  *
- * @ebus: HD-audio extended bus
+ * @bus: the pointer to HDAC bus object
  */
 void snd_hdac_ext_bus_device_remove(struct hdac_bus *bus)
 {
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index cfab60d88c92..a684f0520b4b 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -28,7 +28,7 @@
 
 /**
  * snd_hdac_ext_bus_ppcap_enable - enable/disable processing pipe capability
- * @ebus: HD-audio extended core bus
+ * @bus: the pointer to HDAC bus object
  * @enable: flag to turn on/off the capability
  */
 void snd_hdac_ext_bus_ppcap_enable(struct hdac_bus *bus, bool enable)
@@ -50,7 +50,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_ppcap_enable);
 
 /**
  * snd_hdac_ext_bus_ppcap_int_enable - ppcap interrupt enable/disable
- * @ebus: HD-audio extended core bus
+ * @bus: the pointer to HDAC bus object
  * @enable: flag to enable/disable interrupt
  */
 void snd_hdac_ext_bus_ppcap_int_enable(struct hdac_bus *bus, bool enable)
@@ -77,7 +77,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_ppcap_int_enable);
 
 /**
  * snd_hdac_ext_bus_get_ml_capabilities - get multilink capability
- * @ebus: HD-audio extended core bus
+ * @bus: the pointer to HDAC bus object
  *
  * This will parse all links and read the mlink capabilities and add them
  * in hlink_list of extended hdac bus
@@ -117,7 +117,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_ml_capabilities);
 /**
  * snd_hdac_link_free_all- free hdac extended link objects
  *
- * @ebus: HD-audio ext core bus
+ * @bus: the pointer to HDAC bus object
  */
 
 void snd_hdac_link_free_all(struct hdac_bus *bus)
@@ -134,7 +134,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
 
 /**
  * snd_hdac_ext_bus_get_link_index - get link based on codec name
- * @ebus: HD-audio extended core bus
+ * @bus: the pointer to HDAC bus object
  * @codec_name: codec name
  */
 struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
@@ -211,7 +211,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_down);
 
 /**
  * snd_hdac_ext_bus_link_power_up_all -power up all hda link
- * @ebus: HD-audio extended bus
+ * @bus: the pointer to HDAC bus object
  */
 int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus)
 {
@@ -232,7 +232,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_up_all);
 
 /**
  * snd_hdac_ext_bus_link_power_down_all -power down all hda link
- * @ebus: HD-audio extended bus
+ * @bus: the pointer to HDAC bus object
  */
 int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus)
 {
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 6b1b4b834bae..c4d54a838773 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -530,7 +530,6 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_set_dpibr);
 
 /**
  * snd_hdac_ext_stream_set_lpib - sets the lpib value of a stream
- * @bus: HD-audio core bus
  * @stream: hdac_ext_stream
  * @value: lpib value to set
  */
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 48b227fff204..3fe62be1cbcc 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -22,6 +22,7 @@ static const struct hdac_bus_ops default_ops = {
 /**
  * snd_hdac_bus_init - initialize a HD-audio bas bus
  * @bus: the pointer to bus object
+ * @dev: device pointer
  * @ops: bus verb operators
  *
  * Returns 0 if successful, or a negative error code.
@@ -64,6 +65,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_exit);
 /**
  * snd_hdac_bus_exec_verb - execute a HD-audio verb on the given bus
  * @bus: bus object
+ * @addr: the HDAC device address
  * @cmd: HD-audio encoded verb
  * @res: pointer to store the response, NULL if performing asynchronously
  *
@@ -84,6 +86,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_exec_verb);
 /**
  * snd_hdac_bus_exec_verb_unlocked - unlocked version
  * @bus: bus object
+ * @addr: the HDAC device address
  * @cmd: HD-audio encoded verb
  * @res: pointer to store the response, NULL if performing asynchronously
  *
diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index dfe7e755f594..89126c6fd216 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -262,6 +262,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_acomp_register_notifier);
 /**
  * snd_hdac_acomp_init - Initialize audio component
  * @bus: HDA core bus
+ * @aops: audio component ops
  * @match_master: match function for finding components
  * @extra_size: Extra bytes to allocate
  *
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index b856184af37f..bc4a8b606020 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -561,7 +561,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_stop_chip);
  * snd_hdac_bus_handle_stream_irq - interrupt handler for streams
  * @bus: HD-audio core bus
  * @status: INTSTS register value
- * @ask: callback to be called for woken streams
+ * @ack: callback to be called for woken streams
  *
  * Returns the bits of handled streams, or zero if no stream is handled.
  */
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 7bcdb0e454f2..9a526aeef8da 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -135,7 +135,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_exit);
 
 /**
  * snd_hdac_device_register - register the hd-audio codec base device
- * codec: the device to register
+ * @codec: the device to register
  */
 int snd_hdac_device_register(struct hdac_device *codec)
 {
@@ -158,7 +158,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_register);
 
 /**
  * snd_hdac_device_unregister - unregister the hd-audio codec base device
- * codec: the device to unregister
+ * @codec: the device to unregister
  */
 void snd_hdac_device_unregister(struct hdac_device *codec)
 {
@@ -281,6 +281,10 @@ EXPORT_SYMBOL_GPL(snd_hdac_read);
 
 /**
  * _snd_hdac_read_parm - read a parmeter
+ * @codec: the codec object
+ * @nid: NID to read a parameter
+ * @parm: parameter to read
+ * @res: pointer to store the read value
  *
  * This function returns zero or an error unlike snd_hdac_read_parm().
  */
@@ -1062,9 +1066,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_check_power_state);
  * snd_hdac_sync_power_state - wait until actual power state matches
  * with the target state
  *
- * @hdac: the HDAC device
+ * @codec: the HDAC device
  * @nid: NID to send the command
- * @target_state: target state to check for
+ * @power_state: target power state to wait for
  *
  * Return power state or PS_ERROR if codec rejects GET verb.
  */
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 682ed39f79b0..d01e69139164 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -590,7 +590,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_timecounter_init);
 /**
  * snd_hdac_stream_sync_trigger - turn on/off stream sync register
  * @azx_dev: HD-audio core stream (master stream)
+ * @set: true = set, false = clear
  * @streams: bit flags of streams to sync
+ * @reg: the stream sync register address
  */
 void snd_hdac_stream_sync_trigger(struct hdac_stream *azx_dev, bool set,
 				  unsigned int streams, unsigned int reg)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
