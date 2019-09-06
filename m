Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F3AB88C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 14:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81497165E;
	Fri,  6 Sep 2019 14:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81497165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567774666;
	bh=cyVdv9Mc0xIVmY09Q9x7qFSmy1roj2ztBMFU/UOny64=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t0W1FGSeolgtnisUJ4KeAwv6VlJ73Rl/DloP2dwV1HLsGzpHxK08kHedDEqfjIs5F
	 32HtXxEnAAhQJ3nHaMrmaMhAVw6iyj900OiphlKVORHJhROPChejx2DxApdoJcOkdL
	 p7lG403yVGcoe0+LxPMpGci0hBtMLFfF0sYW0l+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DA2F803D6;
	Fri,  6 Sep 2019 14:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D116F80394; Fri,  6 Sep 2019 14:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB49DF80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 14:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB49DF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="adctJTbU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kR1VErgT"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9E98050C;
 Fri,  6 Sep 2019 08:55:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 06 Sep 2019 08:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=cPztJ0wl/53GfWjebkNYGN6ZGS
 EbIIO1/lvzwY0yW44=; b=adctJTbUASXM7SYFuqeLBG54t5gb8N5TF+24YMUscW
 gXJInveGCKBVxyy1VuPwGyOe0SlgfaArz4aNkAmUbidd5NKSgssEZuhzKjBXVtZp
 rseN5S/69rOwTQPsk3MJkd6G+PBdXtkaLhkU4i7aalmAsvwq3Wj9Oer0S7yE2nit
 gZZFSEM3CJTOu/hrjPc9tZvrukfi/K+tL3eZL6m1HozlMkovtAKJGnNbAZ+rSBm/
 lr3RkWNC3NiU9Q11UfbCCDUys/P1tFMWd3d4GGXQel9Je6IuQxCdIfJmynggpSPt
 wVASieMZAFQaDFmW/1uF02+hlstQ5HkbE4+eNWUb5PbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cPztJ0wl/53GfWjeb
 kNYGN6ZGSEbIIO1/lvzwY0yW44=; b=kR1VErgTVP8KxCmWl5pMBNWUrPLc2wiY2
 CJufrql5Eyt5fmsp/dw1Jgu8lxnL5P0c5UGEVKOVlgfHJx5FTqGOPVzAbl/pb/J+
 RareFFmiNRF8/+FHCt7qjgiks0/9rhApl3ZE7moL4dCbe4NngZcHSI8TWKHM6q8M
 JCGk1epAzcFUb8AxWdxP6xMCSaLQua44sE1YD6Wa9c+oYMhrWC7I3ZxwmcfG/M49
 uOIEP4l/ayQbzvOsdKPaW1T/Z7nztGxSMvHzdnqa7c2GGcJWFiQ6a0pcAZ2X4bJm
 tNlKtEKElVidVkZlj93+SQCxe2BTggiOhrjhFhV4xDzoa5ppYDM3A==
X-ME-Sender: <xms:VVdyXbNlSxAMm9QNf1C2LmKU5HxgYwjnbxun5hlpZg83zzavtRe2-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejledggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VVdyXSQMKGpVef7XaudaOR6JJEebnDLBR0PKBM1VaJLAh4pPEFblBw>
 <xmx:VVdyXdCMJKaZAOdxsScCS2vAGvc2TNsYgeW8hQGCW3OW5sZvJtnukw>
 <xmx:VVdyXRh0Zpway4oSlywMSCRFSSlkw6jkBmppTnRZw_2Ly89IRvr6iQ>
 <xmx:VldyXV8ekDMJsvswJm8LQLvPvZ5WOAUunq9P4oCXzvZyAcrWr8roxg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id F09E3D6005B;
 Fri,  6 Sep 2019 08:55:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 21:55:44 +0900
Message-Id: <20190906125544.13800-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-tascam: add note for FE-8
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

TASCAM FE-8 is the rest of model in TASCAM FireWire series. This device
has no functionality to process audio signal and MIDI messages. Instead,
it transfers control messages to host system corresponding to operations
for some faders, buttons and knobs on its surface.

Unlike the other devices in this series, the control messages are
transmitted by asynchronous transactions. Some registers of device are
used for registration of destination address for the transaction. The
transaction includes quadlet-aligned data up to 32 quadlets.

Userspace applications can receive the transaction and parse it for
control message via Linux FireWire subsystem, without any support by
ALSA firewire-tascam driver. Therefore the driver gives no support
for it.

This commit removes placeholder for FE-8 and add some comment for its
functionalities as notes.

$ python2 linux-firewire-utils/src/crpp < ~/git/am-config-rom/tascam/tascam-fe8.img
               ROM header and bus information block
               -----------------------------------------------------------------
400  040f4798  bus_info_length 4, crc_length 15, crc 18328 (should be 14256)
404  31333934  bus_name "1394"
408  20ff7002  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  00022eff  company_id 00022e     |
410  a094dcb7  device_id ffa094dcb7  | EUI-64 00022effa094dcb7

               root directory
               -----------------------------------------------------------------
414  0004bccc  directory_length 4, crc 48332
418  0300022e  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  8d000006  --> eui-64 leaf at 438
424  d1000001  --> unit directory at 428

               unit directory at 428
               -----------------------------------------------------------------
428  0003eda4  directory_length 3, crc 60836
42c  1200022e  specifier id
430  13800001  version
434  d4000004  --> dependent info directory at 444

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002461e  leaf_length 2, crc 17950
43c  00022eff  company_id 00022e     |
440  a094dcb7  device_id ffa094dcb7  | EUI-64 00022effa094dcb7

               dependent info directory at 444
               -----------------------------------------------------------------
444  0002ae47  directory_length 2, crc 44615
448  81000002  --> descriptor leaf at 450
44c  82000006  --> bus dependent info leaf at 464

               descriptor leaf at 450
               -----------------------------------------------------------------
450  0004a79e  leaf_length 4, crc 42910
454  00000000  textual descriptor
458  00000000  minimal ASCII
45c  54415343  "TASC"
460  414d0000  "AM"

               bus dependent info leaf at 464
               -----------------------------------------------------------------
464  0004a7d8  leaf_length 4, crc 42968
468  00000000
46c  00000000
470  46452d38
474  00000000

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam.c |  4 +++-
 sound/firewire/tascam/tascam.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 231052db5680..addc464503bc 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -39,6 +39,9 @@ static const struct snd_tscm_spec model_specs[] = {
 		.midi_capture_ports = 2,
 		.midi_playback_ports = 4,
 	},
+	// This kernel module doesn't support FE-8 because the most of features
+	// can be implemented in userspace without any specific support of this
+	// module.
 };
 
 static int identify_model(struct snd_tscm *tscm)
@@ -214,7 +217,6 @@ static const struct ieee1394_device_id snd_tscm_id_table[] = {
 		.vendor_id = 0x00022e,
 		.specifier_id = 0x00022e,
 	},
-	/* FE-08 requires reverse-engineering because it just has faders. */
 	{}
 };
 MODULE_DEVICE_TABLE(ieee1394, snd_tscm_id_table);
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 64a2e4d2bbfe..15bd335fa07f 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -129,6 +129,26 @@ struct snd_tscm {
 
 #define TSCM_OFFSET_MIDI_RX_QUAD	0x4000
 
+// Although FE-8 supports the above registers, it has no I/O interfaces for
+// audio samples and music messages. Otherwise it supports another notification
+// for status and control message as well as LED brightening. The message
+// consists of quadlet-aligned data up to 32 quadlets. The first byte of message
+// is fixed to 0x40. The second byte is between 0x00 to 0x1f and represent each
+// control:
+//   fader:	0x00-0x07
+//   button:	0x0d, 0x0e
+//   knob:	0x14-0x1b
+//   sensing:	0x0b
+//
+// The rest two bytes represent state of the controls; e.g. current value for
+// fader and knob, bitmasks for button and sensing.
+// Just after turning on, 32 quadlets messages with 0x00-0x1f are immediately
+// sent in one transaction. After, several quadlets are sent in one transaction.
+//
+// TSCM_OFFSET_FE8_CTL_TX_ON		0x0310
+// TSCM_OFFSET_FE8_CTL_TX_ADDR_HI	0x0314
+// TSCM_OFFSET_FE8_CTL_TX_ADDR_LO	0x0318
+
 enum snd_tscm_clock {
 	SND_TSCM_CLOCK_INTERNAL = 0,
 	SND_TSCM_CLOCK_WORD	= 1,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
