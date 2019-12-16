Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4F120653
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CF9A1666;
	Mon, 16 Dec 2019 13:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CF9A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576500832;
	bh=zW/fPWfjNAYYOKuNA3CU8AaOYT0tTWPvTSLGkRilge8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tAIfTzGYYn5mDvxoNLEfMmAJ11ySWSCb7kZRBG1dCawxSRpErnZcerpxi/bWg6z7Q
	 6nzIEcjvvOF232rtTekV/lizDrRVkbkMNOSggdu+0YObhz2UQeteMscizS/vbBFe9t
	 LGoM7cZafFJuN0lTNOGZW6jR6LXODM+/u66e1stU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 440CDF80257;
	Mon, 16 Dec 2019 13:52:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46031F80255; Mon, 16 Dec 2019 13:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A46F7F8014F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A46F7F8014F
Received: from [111.194.120.142] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1igpqy-0008E8-O1; Mon, 16 Dec 2019 12:52:01 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz
Date: Mon, 16 Dec 2019 20:51:36 +0800
Message-Id: <20191216125136.6709-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [alsa-lib][PATCH] conf: SOF-Intel: map pcm device for
	sof driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On the machines with HDA codec, the sof driver will use the legacy hda
codec driver, as a result, most mixer controls are same as before.

There are only 2 difference:
 - HDMI pcm index is 3, 4 and 5 instead of 3, 7, 8...
 - dmic is on device 6, 7 instead of 0

After applying this patch, we will get (aplay -L):
hdmi:CARD=sofsklhdacard,DEV=0
    sof-skl_hda_card,
    HDMI Audio Output
hdmi:CARD=sofsklhdacard,DEV=1
    sof-skl_hda_card,
    HDMI Audio Output
hdmi:CARD=sofsklhdacard,DEV=2
    sof-skl_hda_card,
    HDMI Audio Output

and (arecord -L):
dmic:CARD=sofsklhdacard,DEV=0
    sof-skl_hda_card,
    Digital Mic connected to the PCH directly
dmic:CARD=sofsklhdacard,DEV=1
    sof-skl_hda_card,
    Digital Mic connected to the PCH directly

Then we could add minor changes in the pulseaudio configuration, after
that, all output and input devices will work under pulseaudio.

This is a supplement for ucm, the ucm for sof driver has higher
priority than this conf, if there is no ucm for sof driver, this conf
will take effect.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 src/conf/alsa.conf            |   4 +
 src/conf/cards/Makefile.am    |   3 +-
 src/conf/cards/SOF-Intel.conf | 345 ++++++++++++++++++++++++++++++++++
 src/conf/cards/aliases.conf   |   1 +
 src/conf/pcm/Makefile.am      |   2 +-
 src/conf/pcm/dmic.conf        |  54 ++++++
 6 files changed, 407 insertions(+), 2 deletions(-)
 create mode 100644 src/conf/cards/SOF-Intel.conf
 create mode 100644 src/conf/pcm/dmic.conf

diff --git a/src/conf/alsa.conf b/src/conf/alsa.conf
index 09980586..28c11c81 100644
--- a/src/conf/alsa.conf
+++ b/src/conf/alsa.conf
@@ -101,6 +101,9 @@ defaults.pcm.iec958.card defaults.pcm.card
 defaults.pcm.iec958.device defaults.pcm.device
 defaults.pcm.modem.card defaults.pcm.card
 defaults.pcm.modem.device defaults.pcm.device
+defaults.pcm.dmic.card defaults.pcm.card
+defaults.pcm.dmic.device 6
+
 # truncate files via file or tee PCM
 defaults.pcm.file_format	"raw"
 defaults.pcm.file_truncate	true
@@ -141,6 +144,7 @@ pcm.dmix cards.pcm.dmix
 pcm.dsnoop cards.pcm.dsnoop
 pcm.modem cards.pcm.modem
 pcm.phoneline cards.pcm.phoneline
+pcm.dmic cards.pcm.dmic
 
 pcm.hw {
 	@args [ CARD DEV SUBDEV ]
diff --git a/src/conf/cards/Makefile.am b/src/conf/cards/Makefile.am
index 00999f01..b22386a0 100644
--- a/src/conf/cards/Makefile.am
+++ b/src/conf/cards/Makefile.am
@@ -58,7 +58,8 @@ cfg_files = aliases.conf \
 	VIA8237.conf \
 	VX222.conf \
 	VXPocket.conf \
-	VXPocket440.conf
+	VXPocket440.conf \
+	SOF-Intel.conf
 
 if BUILD_ALISP
 cfg_files += aliases.alisp
diff --git a/src/conf/cards/SOF-Intel.conf b/src/conf/cards/SOF-Intel.conf
new file mode 100644
index 00000000..fe280d72
--- /dev/null
+++ b/src/conf/cards/SOF-Intel.conf
@@ -0,0 +1,345 @@
+#
+# Configuration for the Intel HD audio (with sof driver)
+#
+
+<confdir:pcm/front.conf>
+
+SOF-Intel.pcm.front.0 {
+	@args [ CARD ]
+	@args.CARD {
+		type string
+	}
+	type asym
+	playback.pcm {
+		type softvol
+		slave.pcm {
+			type hw
+			card $CARD
+			subdevice 0
+		}
+		control {
+			name "PCM Playback Volume"
+			card $CARD
+		}
+	}
+	capture.pcm {
+		type hw
+		card $CARD
+	}
+}
+
+# default with dmix+softvol & dsnoop
+SOF-Intel.pcm.default {
+	@args [ CARD ]
+	@args.CARD {
+		type string
+	}
+	type asym
+	playback.pcm {
+		type plug
+		slave.pcm {
+			type softvol
+			slave.pcm {
+				@func concat
+				strings [ "dmix:" $CARD ]
+			}
+			control {
+				name "PCM Playback Volume"
+				card $CARD
+			}
+		}
+	}
+	capture.pcm {
+		type plug
+		slave.pcm {
+			type softvol
+			slave.pcm {
+				@func concat
+				strings [ "dsnoop:" $CARD ]
+			}
+			control {
+				name "Digital Capture Volume"
+				card $CARD
+			}
+			min_dB -30.0
+			max_dB 30.0
+			resolution 121
+		}
+		# to avoid possible phase inversions with digital mics
+		route_policy copy
+	}
+	hint.device 0
+}
+
+<confdir:pcm/surround21.conf>
+<confdir:pcm/surround40.conf>
+<confdir:pcm/surround41.conf>
+<confdir:pcm/surround50.conf>
+<confdir:pcm/surround51.conf>
+<confdir:pcm/surround71.conf>
+
+SOF-Intel.pcm.surround40.0 cards.SOF-Intel.pcm.front.0
+SOF-Intel.pcm.surround51.0 cards.SOF-Intel.pcm.front.0
+SOF-Intel.pcm.surround71.0 cards.SOF-Intel.pcm.front.0
+
+<confdir:pcm/iec958.conf>
+
+SOF-Intel.pcm.iec958.0 {
+	@args [ CARD AES0 AES1 AES2 AES3 ]
+	@args.CARD {
+		type string
+	}
+	@args.AES0 {
+		type integer
+	}
+	@args.AES1 {
+		type integer
+	}
+	@args.AES2 {
+		type integer
+	}
+	@args.AES3 {
+		type integer
+	}
+	type asym
+	playback.pcm {
+		type hooks
+		slave.pcm {
+			type hw
+			card $CARD
+			device 1
+		}
+		hooks.0 {
+			type ctl_elems
+			hook_args [
+			{
+				name "IEC958 Playback Default"
+				index 16
+				optional true
+				lock true
+				preserve true
+				value [ $AES0 $AES1 $AES2 $AES3 ]
+			}
+			{
+				name "IEC958 Playback Switch"
+				index 16
+				optional true
+				value true
+				# if this element is present, skip the rest
+				skip_rest true
+			}
+			{
+				name "IEC958 Playback Default"
+				lock true
+				preserve true
+				value [ $AES0 $AES1 $AES2 $AES3 ]
+			}
+			{
+				name "IEC958 Playback Switch"
+				value true
+			}
+			]
+		}
+	}
+	capture.pcm {
+		type hooks
+		slave.pcm {
+			type hw
+			card $CARD
+			device 1
+		}
+		hooks.0 {
+			type ctl_elems
+			hook_args [
+			{
+				name "IEC958 Capture Switch"
+				lock true
+				preserve true
+				value true
+			}
+			]
+		}
+	}
+	hint.device 1
+}
+
+<confdir:pcm/hdmi.conf>
+
+SOF-Intel.pcm.hdmi.common {
+	@args [ CARD DEVICE CTLINDEX AES0 AES1 AES2 AES3 ]
+	@args.CARD {
+		type string
+	}
+	@args.DEVICE {
+		type integer
+	}
+	@args.CTLINDEX {
+		type integer
+	}
+	@args.AES0 {
+		type integer
+	}
+	@args.AES1 {
+		type integer
+	}
+	@args.AES2 {
+		type integer
+	}
+	@args.AES3 {
+		type integer
+	}
+	type hooks
+	slave.pcm {
+		type hw
+		card $CARD
+		device $DEVICE
+	}
+	hooks.0 {
+		type ctl_elems
+		hook_args [
+		{
+			name "IEC958 Playback Default"
+			index $CTLINDEX
+			lock true
+			preserve true
+			value [ $AES0 $AES1 $AES2 $AES3 ]
+		}
+		{
+			name "IEC958 Playback Switch"
+			index $CTLINDEX
+			value true
+		}
+		]
+	}
+	hint.device $DEVICE
+}
+
+SOF-Intel.pcm.hdmi.0 {
+	@args [ CARD AES0 AES1 AES2 AES3 ]
+	@args.CARD { type string }
+	@args.AES0 { type integer }
+	@args.AES1 { type integer }
+	@args.AES2 { type integer }
+	@args.AES3 { type integer }
+	@func refer
+	name {
+		@func concat
+		strings [
+			"cards.SOF-Intel.pcm.hdmi.common:"
+			"CARD=" $CARD ","
+			"DEVICE=3,"
+			"CTLINDEX=0,"
+			"AES0=" $AES0 ","
+			"AES1=" $AES1 ","
+			"AES2=" $AES2 ","
+			"AES3=" $AES3
+		]
+	}
+}
+
+SOF-Intel.pcm.hdmi.1 {
+	@args [ CARD AES0 AES1 AES2 AES3 ]
+	@args.CARD { type string }
+	@args.AES0 { type integer }
+	@args.AES1 { type integer }
+	@args.AES2 { type integer }
+	@args.AES3 { type integer }
+	@func refer
+	name {
+		@func concat
+		strings [
+			"cards.SOF-Intel.pcm.hdmi.common:"
+			"CARD=" $CARD ","
+			"DEVICE=4,"
+			"CTLINDEX=1,"
+			"AES0=" $AES0 ","
+			"AES1=" $AES1 ","
+			"AES2=" $AES2 ","
+			"AES3=" $AES3
+		]
+	}
+}
+
+SOF-Intel.pcm.hdmi.2 {
+	@args [ CARD AES0 AES1 AES2 AES3 ]
+	@args.CARD { type string }
+	@args.AES0 { type integer }
+	@args.AES1 { type integer }
+	@args.AES2 { type integer }
+	@args.AES3 { type integer }
+	@func refer
+	name {
+		@func concat
+		strings [
+			"cards.SOF-Intel.pcm.hdmi.common:"
+			"CARD=" $CARD ","
+			"DEVICE=5,"
+			"CTLINDEX=2,"
+			"AES0=" $AES0 ","
+			"AES1=" $AES1 ","
+			"AES2=" $AES2 ","
+			"AES3=" $AES3
+		]
+	}
+}
+
+<confdir:pcm/dmic.conf>
+
+SOF-Intel.pcm.dmic.common {
+	@args [ CARD DEVICE ]
+	@args.CARD {
+		type string
+	}
+	@args.DEVICE {
+		type integer
+	}
+	type plug
+	slave.pcm {
+		type hw
+		card $CARD
+		device $DEVICE
+	}
+
+	hint.device $DEVICE
+}
+
+SOF-Intel.pcm.dmic.0 {
+	@args [ CARD ]
+	@args.CARD { type string }
+	@func refer
+	name {
+		@func concat
+		strings [
+			"cards.SOF-Intel.pcm.dmic.common:"
+			"CARD=" $CARD ","
+			"DEVICE=6"
+		]
+	}
+}
+
+SOF-Intel.pcm.dmic.1 {
+	@args [ CARD ]
+	@args.CARD { type string }
+	@func refer
+	name {
+		@func concat
+		strings [
+			"cards.SOF-Intel.pcm.dmic.common:"
+			"CARD=" $CARD ","
+			"DEVICE=7"
+		]
+	}
+}
+
+<confdir:pcm/modem.conf>
+
+SOF-Intel.pcm.modem.0 {
+	@args [ CARD ]
+	@args.CARD {
+		type string
+	}
+	type hw
+	card $CARD
+	device 6
+	hint.show off
+}
diff --git a/src/conf/cards/aliases.conf b/src/conf/cards/aliases.conf
index 18a920f4..0c44c1aa 100644
--- a/src/conf/cards/aliases.conf
+++ b/src/conf/cards/aliases.conf
@@ -57,6 +57,7 @@ CMI8786 cards.CMI8788
 CMI8787 cards.CMI8788
 pistachio cards.pistachio-card
 VC4-HDMI cards.vc4-hdmi
+sof-skl_hda_car cards.SOF-Intel
 
 <confdir:pcm/default.conf>
 <confdir:pcm/dmix.conf>
diff --git a/src/conf/pcm/Makefile.am b/src/conf/pcm/Makefile.am
index c548660d..20da0448 100644
--- a/src/conf/pcm/Makefile.am
+++ b/src/conf/pcm/Makefile.am
@@ -3,7 +3,7 @@ cfg_files = default.conf front.conf rear.conf center_lfe.conf side.conf\
 	    surround50.conf surround51.conf \
 	    surround71.conf iec958.conf hdmi.conf modem.conf \
 	    dmix.conf dsnoop.conf \
-	    dpl.conf
+	    dpl.conf dmic.conf
 
 EXTRA_DIST = $(cfg_files)
 
diff --git a/src/conf/pcm/dmic.conf b/src/conf/pcm/dmic.conf
new file mode 100644
index 00000000..1dce37c9
--- /dev/null
+++ b/src/conf/pcm/dmic.conf
@@ -0,0 +1,54 @@
+#
+#  input from digital mic
+#
+
+pcm.!dmic {
+	@args [ CARD DEV ]
+	@args.CARD {
+		type string
+		default {
+			@func getenv
+			vars [
+				ALSA_PCM_CARD
+				ALSA_CARD
+			]
+			default {
+				@func refer
+				name defaults.pcm.dmic.card
+			}
+		}
+	}
+	@args.DEV {
+		type integer
+		default {
+			default {
+				@func refer
+				name defaults.pcm.dmic.device
+			}
+		}
+	}
+	type empty
+	slave.pcm {
+		@func refer
+		name {
+			@func concat
+			strings [
+				"cards."
+				{
+					@func card_driver
+					card $CARD
+				}
+				".pcm.dmic." $DEV ":"
+				"CARD=" $CARD
+			]
+		}
+	}
+	hint {
+		show {
+			@func refer
+			name defaults.namehint.basic
+		}
+		description "Digital Mic connected to the PCH directly"
+		device $DEV
+	}
+}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
