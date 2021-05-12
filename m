Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47937BD53
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 14:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AFD717F5;
	Wed, 12 May 2021 14:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AFD717F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620824011;
	bh=quPDuLwuTjMKAxU2iBA+KcqqLtGxdtxsXliEqC7E+rU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kD+aV65cqx0LERTCPRVrHqvERhBBT2QnTsSeWkyutVpO38o1btE3Rud0YQ3+qxVKO
	 9jnoWmSG8hyiEsdJ2KKjLIavfrf/EWvFO/YxRvi6rqNcxB5chA98P3D+XoO6glbEde
	 naScvgQ18GDo+oBpGKlulowewohyQMXxkSnBeMMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A0F2F8026B;
	Wed, 12 May 2021 14:52:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20ADBF8020C; Wed, 12 May 2021 14:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91F5AF8020C
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 14:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F5AF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jUT/aXza"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF9E461177;
 Wed, 12 May 2021 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620823907;
 bh=quPDuLwuTjMKAxU2iBA+KcqqLtGxdtxsXliEqC7E+rU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jUT/aXzaU+tAkKV5Ftuj+D4LVaEBFzff0xOUfUazEkmGfu6xeWbK+LVUTuszvfvqo
 evmTQP6mKgEudTcxrfjX/GJTiVVN6tor967GSbJIdAZilkn+7oV82y4JNULyhWl9OC
 ZNLx0VOYwSk4EWRpN3VfAmN1berYLlmcjoRLrwpnXh3Lx+zC2hR+xIi2fpwOwAXidB
 KaiVuR1Qn8NPDMik8eSS2EXoDP8M5JpqGWMuObffeIX4oOZ6yol3LjRpKYN3uBwdkp
 RCSCbr2vXJrb5yxIdLh1OQvneT9w07KX3mV9kMPiNCawtrQv1FVrWYrzFQzRmLEDuL
 8bVStmTnDToPQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1lgoL3-0018nW-Kg; Wed, 12 May 2021 14:51:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 33/40] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 Use ASCII subset instead of UTF-8 alternate symbols
Date: Wed, 12 May 2021 14:50:37 +0200
Message-Id: <352290976d83c61fdbbe38eb7c92913f830558b9.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@protonmail.com>
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

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+00a0 (' '): NO-BREAK SPACE
	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 68 +++++++++----------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index e6365836fa8b..201ced3bba6e 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -533,7 +533,7 @@ Management of Cards and Components
 Card Instance
 -------------
 
-For each soundcard, a “card” record must be allocated.
+For each soundcard, a "card" record must be allocated.
 
 A card record is the headquarters of the soundcard. It manages the whole
 list of devices (components) on the soundcard, such as PCM, mixers,
@@ -980,7 +980,7 @@ The role of destructor is simple: disable the hardware (if already
 activated) and release the resources. So far, we have no hardware part,
 so the disabling code is not written here.
 
-To release the resources, the “check-and-release” method is a safer way.
+To release the resources, the "check-and-release" method is a safer way.
 For the interrupt, do like this:
 
 ::
@@ -1133,7 +1133,7 @@ record:
 
 The ``probe`` and ``remove`` functions have already been defined in
 the previous sections. The ``name`` field is the name string of this
-device. Note that you must not use a slash “/” in this string.
+device. Note that you must not use a slash "/" in this string.
 
 And at last, the module entries:
 
@@ -1692,8 +1692,8 @@ Typically, you'll have a hardware descriptor as below:
 
    The other possible flags are ``SNDRV_PCM_INFO_PAUSE`` and
    ``SNDRV_PCM_INFO_RESUME``. The ``PAUSE`` bit means that the pcm
-   supports the “pause” operation, while the ``RESUME`` bit means that
-   the pcm supports the full “suspend/resume” operation. If the
+   supports the "pause" operation, while the ``RESUME`` bit means that
+   the pcm supports the full "suspend/resume" operation. If the
    ``PAUSE`` flag is set, the ``trigger`` callback below must handle
    the corresponding (pause push/release) commands. The suspend/resume
    trigger commands can be defined even without the ``RESUME``
@@ -1731,7 +1731,7 @@ Typically, you'll have a hardware descriptor as below:
    ``periods_min`` define the maximum and minimum number of periods in
    the buffer.
 
-   The “period” is a term that corresponds to a fragment in the OSS
+   The "period" is a term that corresponds to a fragment in the OSS
    world. The period defines the size at which a PCM interrupt is
    generated. This size strongly depends on the hardware. Generally,
    the smaller period size will give you more interrupts, that is,
@@ -1756,7 +1756,7 @@ application. This field contains the enum value
 ``SNDRV_PCM_FORMAT_XXX``.
 
 One thing to be noted is that the configured buffer and period sizes
-are stored in “frames” in the runtime. In the ALSA world, ``1 frame =
+are stored in "frames" in the runtime. In the ALSA world, ``1 frame =
 channels \* samples-size``. For conversion between frames and bytes,
 you can use the :c:func:`frames_to_bytes()` and
 :c:func:`bytes_to_frames()` helper functions.
@@ -1999,7 +1999,7 @@ prepare callback
 
   static int snd_xxx_prepare(struct snd_pcm_substream *substream);
 
-This callback is called when the pcm is “prepared”. You can set the
+This callback is called when the pcm is "prepared". You can set the
 format type, sample rate, etc. here. The difference from ``hw_params``
 is that the ``prepare`` callback will be called each time
 :c:func:`snd_pcm_prepare()` is called, i.e. when recovering after
@@ -2436,8 +2436,8 @@ size is aligned with the period size.
 
 The hw constraint is a very much powerful mechanism to define the
 preferred PCM configuration, and there are relevant helpers.
-I won't give more details here, rather I would like to say, “Luke, use
-the source.”
+I won't give more details here, rather I would like to say, "Luke, use
+the source."
 
 Control Interface
 =================
@@ -2518,50 +2518,50 @@ Control Names
 -------------
 
 There are some standards to define the control names. A control is
-usually defined from the three parts as “SOURCE DIRECTION FUNCTION”.
+usually defined from the three parts as "SOURCE DIRECTION FUNCTION".
 
 The first, ``SOURCE``, specifies the source of the control, and is a
-string such as “Master”, “PCM”, “CD” and “Line”. There are many
+string such as "Master", "PCM", "CD" and "Line". There are many
 pre-defined sources.
 
 The second, ``DIRECTION``, is one of the following strings according to
-the direction of the control: “Playback”, “Capture”, “Bypass Playback”
-and “Bypass Capture”. Or, it can be omitted, meaning both playback and
+the direction of the control: "Playback", "Capture", "Bypass Playback"
+and "Bypass Capture". Or, it can be omitted, meaning both playback and
 capture directions.
 
 The third, ``FUNCTION``, is one of the following strings according to
-the function of the control: “Switch”, “Volume” and “Route”.
+the function of the control: "Switch", "Volume" and "Route".
 
-The example of control names are, thus, “Master Capture Switch” or “PCM
-Playback Volume”.
+The example of control names are, thus, "Master Capture Switch" or "PCM
+Playback Volume".
 
 There are some exceptions:
 
 Global capture and playback
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-“Capture Source”, “Capture Switch” and “Capture Volume” are used for the
-global capture (input) source, switch and volume. Similarly, “Playback
-Switch” and “Playback Volume” are used for the global output gain switch
+"Capture Source", "Capture Switch" and "Capture Volume" are used for the
+global capture (input) source, switch and volume. Similarly, "Playback
+Switch" and "Playback Volume" are used for the global output gain switch
 and volume.
 
 Tone-controls
 ~~~~~~~~~~~~~
 
-tone-control switch and volumes are specified like “Tone Control - XXX”,
-e.g. “Tone Control - Switch”, “Tone Control - Bass”, “Tone Control -
-Center”.
+tone-control switch and volumes are specified like "Tone Control - XXX",
+e.g. "Tone Control - Switch", "Tone Control - Bass", "Tone Control -
+Center".
 
 3D controls
 ~~~~~~~~~~~
 
-3D-control switches and volumes are specified like “3D Control - XXX”,
-e.g. “3D Control - Switch”, “3D Control - Center”, “3D Control - Space”.
+3D-control switches and volumes are specified like "3D Control - XXX",
+e.g. "3D Control - Switch", "3D Control - Center", "3D Control - Space".
 
 Mic boost
 ~~~~~~~~~
 
-Mic-boost switch is set as “Mic Boost” or “Mic Boost (6dB)”.
+Mic-boost switch is set as "Mic Boost" or "Mic Boost (6dB)".
 
 More precise information can be found in
 ``Documentation/sound/designs/control-names.rst``.
@@ -3368,7 +3368,7 @@ This ensures that the device can be closed and the driver unloaded
 without losing data.
 
 This callback is optional. If you do not set ``drain`` in the struct
-snd_rawmidi_ops structure, ALSA will simply wait for 50 milliseconds
+snd_rawmidi_ops structure, ALSA will simply wait for 50 milliseconds
 instead.
 
 Miscellaneous Devices
@@ -3506,20 +3506,20 @@ fixed as 4 bytes array (value.iec958.status[x]). For the ``info``
 callback, you don't specify the value field for this type (the count
 field must be set, though).
 
-“IEC958 Playback Con Mask” is used to return the bit-mask for the IEC958
-status bits of consumer mode. Similarly, “IEC958 Playback Pro Mask”
+"IEC958 Playback Con Mask" is used to return the bit-mask for the IEC958
+status bits of consumer mode. Similarly, "IEC958 Playback Pro Mask"
 returns the bitmask for professional mode. They are read-only controls,
 and are defined as MIXER controls (iface =
 ``SNDRV_CTL_ELEM_IFACE_MIXER``).
 
-Meanwhile, “IEC958 Playback Default” control is defined for getting and
+Meanwhile, "IEC958 Playback Default" control is defined for getting and
 setting the current default IEC958 bits. Note that this one is usually
 defined as a PCM control (iface = ``SNDRV_CTL_ELEM_IFACE_PCM``),
 although in some places it's defined as a MIXER control.
 
 In addition, you can define the control switches to enable/disable or to
 set the raw bit mode. The implementation will depend on the chip, but
-the control should be named as “IEC958 xxx”, preferably using the
+the control should be named as "IEC958 xxx", preferably using the
 :c:func:`SNDRV_CTL_NAME_IEC958()` macro.
 
 You can find several cases, for example, ``pci/emu10k1``,
@@ -3547,7 +3547,7 @@ function.
 
 Usually, ALSA drivers try to allocate and reserve a large contiguous
 physical space at the time the module is loaded for the later use. This
-is called “pre-allocation”. As already written, you can call the
+is called "pre-allocation". As already written, you can call the
 following function at pcm instance construction time (in the case of PCI
 bus).
 
@@ -4163,7 +4163,7 @@ The typical coding would be like below:
 
 Also, don't forget to define the module description and the license.
 Especially, the recent modprobe requires to define the
-module license as GPL, etc., otherwise the system is shown as “tainted”.
+module license as GPL, etc., otherwise the system is shown as "tainted".
 
 ::
 
@@ -4181,7 +4181,7 @@ So far, you've learned how to write the driver codes. And you might have
 a question now: how to put my own driver into the ALSA driver tree? Here
 (finally :) the standard procedure is described briefly.
 
-Suppose that you create a new PCI driver for the card “xyz”. The card
+Suppose that you create a new PCI driver for the card "xyz". The card
 module name would be snd-xyz. The new driver is usually put into the
 alsa-driver tree, ``sound/pci`` directory in the case of PCI
 cards.
-- 
2.30.2

