Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03972165EB0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 14:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8545C16B2;
	Thu, 20 Feb 2020 14:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8545C16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582205180;
	bh=qrgGH+hJBZXJ8H+uLpBkmYKOuGvBuQnpJ+vdljeZgrE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nxvS8DRpO0K7NfFVekOgY8X2EHeZeM0IvT2huvyyLmyoOi2NBBsgs5sf7Iz0FBhXX
	 spIIY9qEyvj33+09LFUD69J6cCcXi0gUWALEeteo7cenIO+9b5uPFGA6aK8Sz5uzWQ
	 pDeQrOR5nUB1hYHfWJTH0WpKPwPwdIBDW01flJ/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A292FF80148;
	Thu, 20 Feb 2020 14:24:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB0BF80148; Thu, 20 Feb 2020 14:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.38])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB21DF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 14:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB21DF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="x7h8Orqv"
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id AF842416F96CF
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 07:21:37 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 4llpj0y1EAGTX4llpjBZSf; Thu, 20 Feb 2020 07:21:37 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBVqKO+u3fecGVX4F0/4pATO5Sy+gKRtKWeV4k7qRzo=; b=x7h8Orqvf8KxMai8yvij1HqxiF
 GxEp7yxJNcdmd0JZlW7bZconjwlIuu657HChS6j8ndOOaAuDbbJJB76LrNag9KyRwjd1BuSeOohB0
 GNRLWnfXVTLFgH+Bqk6TtpyzFVIedbEgchwnMJmtuXdnRM35CCR6yutu994l0ocdjGuM8rB1S0ScT
 NklxiPZea+ehf+TAvoxd9p132/UW/FWDtVko2d72G3idzES/pDk6OtpyNkhjrG8GKfiyhTWoyA/hl
 d5Y7qUrGkJmiBFXbZG8C3CHcC4RKh+nvAT+BqUu8JrHWJyolTDALC2b2IxR02mIbdarlgJZ2+tTXa
 RkHzKCpQ==;
Received: from [201.144.174.47] (port=7747 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j4lln-003avg-Mu; Thu, 20 Feb 2020 07:21:35 -0600
Date: Thu, 20 Feb 2020 07:24:20 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Subject: [PATCH] sound: Replace zero-length array with flexible-array member
Message-ID: <20200220132420.GA29765@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.144.174.47
X-Source-L: No
X-Exim-ID: 1j4lln-003avg-Mu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.144.174.47]:7747
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 24
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 include/sound/control.h                  | 2 +-
 include/sound/intel-nhlt.h               | 6 +++---
 include/sound/soc-dapm.h                 | 2 +-
 include/sound/soc.h                      | 2 +-
 include/uapi/sound/asound.h              | 2 +-
 include/uapi/sound/skl-tplg-interface.h  | 2 +-
 sound/core/oss/pcm_plugin.h              | 2 +-
 sound/firewire/fireworks/fireworks.h     | 2 +-
 sound/soc/intel/atom/sst-atom-controls.h | 2 +-
 sound/soc/intel/skylake/skl-i2s.h        | 2 +-
 sound/soc/intel/skylake/skl-topology.h   | 4 ++--
 sound/soc/intel/skylake/skl.h            | 2 +-
 sound/usb/usx2y/usbusx2y.h               | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 11feeee31e35..aeaed2a05bae 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -75,7 +75,7 @@ struct snd_kcontrol {
 	unsigned long private_value;
 	void *private_data;
 	void (*private_free)(struct snd_kcontrol *kcontrol);
-	struct snd_kcontrol_volatile vd[0];	/* volatile data */
+	struct snd_kcontrol_volatile vd[];	/* volatile data */
 };
 
 #define snd_kcontrol(n) list_entry(n, struct snd_kcontrol, list)
diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index f657fd8fc0ad..743c2f442280 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -50,7 +50,7 @@ enum nhlt_device_type {
 
 struct nhlt_specific_cfg {
 	u32 size;
-	u8 caps[0];
+	u8 caps[];
 } __packed;
 
 struct nhlt_fmt_cfg {
@@ -60,7 +60,7 @@ struct nhlt_fmt_cfg {
 
 struct nhlt_fmt {
 	u8 fmt_count;
-	struct nhlt_fmt_cfg fmt_config[0];
+	struct nhlt_fmt_cfg fmt_config[];
 } __packed;
 
 struct nhlt_endpoint {
@@ -80,7 +80,7 @@ struct nhlt_endpoint {
 struct nhlt_acpi_table {
 	struct acpi_table_header header;
 	u8 endpoint_count;
-	struct nhlt_endpoint desc[0];
+	struct nhlt_endpoint desc[];
 } __packed;
 
 struct nhlt_resource_desc  {
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 1a9c5dd40228..f870f927b70c 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -688,7 +688,7 @@ struct snd_soc_dapm_context {
 /* A list of widgets associated with an object, typically a snd_kcontrol */
 struct snd_soc_dapm_widget_list {
 	int num_widgets;
-	struct snd_soc_dapm_widget *widgets[0];
+	struct snd_soc_dapm_widget *widgets[];
 };
 
 #define for_each_dapm_widgets(list, i, widget)				\
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..9944b978ae70 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1146,7 +1146,7 @@ struct snd_soc_pcm_runtime {
 	unsigned int fe_compr:1; /* for Dynamic PCM */
 
 	int num_components;
-	struct snd_soc_component *components[0]; /* CPU/Codec/Platform */
+	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
 };
 #define for_each_rtd_components(rtd, i, component)			\
 	for ((i) = 0;							\
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..3809993f6cb4 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1071,7 +1071,7 @@ struct snd_ctl_elem_value {
 struct snd_ctl_tlv {
 	unsigned int numid;	/* control element numeric identification */
 	unsigned int length;	/* in bytes aligned to 4 */
-	unsigned int tlv[0];	/* first TLV */
+	unsigned int tlv[];	/* first TLV */
 };
 
 #define SNDRV_CTL_IOCTL_PVERSION	_IOR('U', 0x00, int)
diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
index 9eee32f5e407..62f76f154d19 100644
--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -149,7 +149,7 @@ struct skl_dfw_algo_data {
 	__u32 rsvd:30;
 	__u32 param_id;
 	__u32 max;
-	char params[0];
+	char params[];
 } __packed;
 
 enum skl_tkn_dir {
diff --git a/sound/core/oss/pcm_plugin.h b/sound/core/oss/pcm_plugin.h
index 8d2f7a4e3ab6..46e273bd4a78 100644
--- a/sound/core/oss/pcm_plugin.h
+++ b/sound/core/oss/pcm_plugin.h
@@ -64,7 +64,7 @@ struct snd_pcm_plugin {
 	char *buf;
 	snd_pcm_uframes_t buf_frames;
 	struct snd_pcm_plugin_channel *buf_channels;
-	char extra_data[0];
+	char extra_data[];
 };
 
 int snd_pcm_plugin_build(struct snd_pcm_substream *handle,
diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index dda797209a27..654e28a6669f 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -177,7 +177,7 @@ struct snd_efw_phys_meters {
 	u32 in_meters;
 	u32 reserved4;
 	u32 reserved5;
-	u32 values[0];
+	u32 values[];
 } __packed;
 enum snd_efw_clock_source {
 	SND_EFW_CLOCK_SOURCE_INTERNAL	= 0,
diff --git a/sound/soc/intel/atom/sst-atom-controls.h b/sound/soc/intel/atom/sst-atom-controls.h
index 5356e954a732..620b48d2a064 100644
--- a/sound/soc/intel/atom/sst-atom-controls.h
+++ b/sound/soc/intel/atom/sst-atom-controls.h
@@ -410,7 +410,7 @@ struct sst_cmd_set_gain_dual {
 struct sst_cmd_set_params {
 	struct sst_destination_id dst;
 	u16 command_id;
-	char params[0];
+	char params[];
 } __packed;
 
 
diff --git a/sound/soc/intel/skylake/skl-i2s.h b/sound/soc/intel/skylake/skl-i2s.h
index d7c15873c0d4..dfce91e11be1 100644
--- a/sound/soc/intel/skylake/skl-i2s.h
+++ b/sound/soc/intel/skylake/skl-i2s.h
@@ -46,7 +46,7 @@ struct skl_i2s_config_mclk {
 struct skl_i2s_config_mclk_ext {
 	u32 mdivctrl;
 	u32 mdivr_count;
-	u32 mdivr[0];
+	u32 mdivr[];
 } __packed;
 
 struct skl_i2s_config_blob_signature {
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index e967800dbb62..d2cd8ef8e97f 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -119,7 +119,7 @@ struct skl_cpr_gtw_cfg {
 struct skl_dma_control {
 	u32 node_id;
 	u32 config_length;
-	u32 config_data[0];
+	u32 config_data[];
 } __packed;
 
 struct skl_cpr_cfg {
@@ -152,7 +152,7 @@ struct skl_up_down_mixer_cfg {
 
 struct skl_algo_cfg {
 	struct skl_base_cfg  base_cfg;
-	char params[0];
+	char params[];
 } __packed;
 
 struct skl_base_outfmt_cfg {
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 2bfbf59277c4..26057f38a014 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -49,7 +49,7 @@ struct skl_astate_param {
 
 struct skl_astate_config {
 	u32 count;
-	struct skl_astate_param astate_table[0];
+	struct skl_astate_param astate_table[];
 };
 
 struct skl_fw_config {
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index e0f77172ce8f..144b85f57bd2 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -18,7 +18,7 @@ struct snd_usX2Y_AsyncSeq {
 struct snd_usX2Y_urbSeq {
 	int	submitted;
 	int	len;
-	struct urb	*urb[0];
+	struct urb	*urb[];
 };
 
 #include "usx2yhwdeppcm.h"
-- 
2.25.0

