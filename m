Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F71975C1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C992F166E;
	Mon, 30 Mar 2020 09:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C992F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553582;
	bh=FZgXbnzGzu7M64gE3e10HN4/mmsOY6MFdg+s/AZGbjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/UGqef0imaHxcycAP1UK8OsbCi4xWDAFB6Dj+eOOnu81G+wo8SBJWLh9o3guEsgf
	 afLq/RNWuiDZFh73tuD2bHE8OFJGc0sfTnf/37kplP3QVvpSbthqICG3xY0leqy0wZ
	 rpI/oMRjGeRJkAcLFUC+s9SKO20ROcdhPesZCwTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C6A6F8029A;
	Mon, 30 Mar 2020 09:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE92EF8029A; Mon, 30 Mar 2020 09:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 909B0F8028D
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 909B0F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hvzKxesc"
Received: by mail-qk1-x743.google.com with SMTP id x3so17952128qki.4
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0mF9YuJjdBJn2ibrPXteakvuUEew7gBpgHO80gKios=;
 b=hvzKxesc6T9Xr7/+N5hnlAWriKe2jdgQEGrG6lKHD2Ur5i9WbpwXQKJBUxlzWk4Gfo
 5XsHcMb1vv4xi3J7BY5dC9SRJV+1VPMW5HkUaJU5LbVzhVYtUQIw2eAUEZHTPxr0fFW6
 FGcKTuHqs8z9C7e1YVZLUGDCt4JzmoVXvLnTjd+YYIQcq7x1v2JWIoce2YdK7bnh/kk+
 pRDCGTMW3AAjDXQDFRoNVEqA8+pu1mFKgZP6Pa7TydTYlvbsIuCs09MsI+m+WHV0z66L
 oYF7MJ3IwkD/hhRzl7IXv9ueclrrM2pwLoUFKsd7d4vXgutuqTM+IAj+Cr3+6KhWWRl4
 WP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0mF9YuJjdBJn2ibrPXteakvuUEew7gBpgHO80gKios=;
 b=JGpsAdwRRZi7Qn3mQdyyx6DmUZZNS6/PYhs3ky2XqJgK1EyOgj7DLk1cEFicWTfUxb
 nZ6ntR5hKK1cVaJ9TScqYr57/LnS/SsK/gA5W64+EGfvmbG+TcIfjdxMd8rYr1DLBPx5
 Z3J0ex4TRz2FnOmLcUICCq7Qgoi0ZgQV7lmCng3stSAVZ951n0jPVEEAxdq/Z7f9KzQw
 HUt/h4cRxuK5RyHApKlNTH5UxiSJmUlLRQYGbQTiodpv8TEkjlHfpuk34yW3cAzPZsv+
 EpIkbeXLXGgFtiPGREIYymhuQDji7beQVQiEvjr7Fxzd9hRUflBqiI4Ygzb7AsgRr1Yl
 egyA==
X-Gm-Message-State: ANhLgQ2vLbrZx7DRw0K1x8bFJ1MEurkvl2JUemLgJ//jinZK431LS4pu
 aFbFmXKrHjwEeTjI3LgUCc0UwgJWW880BQ==
X-Google-Smtp-Source: ADFU+vs6NUiM8C4jsWZ+vAHnLW2Y842aF6c7pNjPZoSWGT35QxH1qwA4b2SFMyyNZ1+dOPROnLh+SQ==
X-Received: by 2002:ae9:ed56:: with SMTP id c83mr3965463qkg.200.1585553439424; 
 Mon, 30 Mar 2020 00:30:39 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id n63sm10078499qka.80.2020.03.30.00.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 00:30:39 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.or
Subject: [PATCH 1/3] ALSA: doc: Document PC Beep Hidden Register on Realtek
 ALC256
Date: Mon, 30 Mar 2020 03:30:30 -0400
Message-Id: <bd69dfdeaf40ff31c4b7b797c829bb320031739c.1585553414.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1585553414.git.tommyhebb@gmail.com>
References: <cover.1585553414.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thomas Hebb <tommyhebb@gmail.com>
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

This codec (among others) has a hidden set of audio routes, apparently
designed to allow PC Beep output without a mixer widget on the output
path, which are controlled by an undocumented Realtek vendor register.
The default configuration of these routes means that certain inputs
aren't accessible, necessitating driver control of the register.
However, Realtek has provided no documentation of the register, instead
opting to fix issues by providing magic numbers, most of which have been
at least somewhat erroneous. These magic numbers then get copied by
others into model-specific fixups, leading to a fragmented and buggy set
of configurations.

To get out of this situation, I've reverse engineered the register by
flipping bits and observing how the codec's behavior changes. This
commit documents my findings. It does not change any code.

Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 Documentation/sound/hd-audio/index.rst        |   1 +
 .../sound/hd-audio/realtek-pc-beep.rst        | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/sound/hd-audio/realtek-pc-beep.rst

diff --git a/Documentation/sound/hd-audio/index.rst b/Documentation/sound/hd-audio/index.rst
index f8a72ffffe66..6e12de9fc34e 100644
--- a/Documentation/sound/hd-audio/index.rst
+++ b/Documentation/sound/hd-audio/index.rst
@@ -8,3 +8,4 @@ HD-Audio
    models
    controls
    dp-mst
+   realtek-pc-beep
diff --git a/Documentation/sound/hd-audio/realtek-pc-beep.rst b/Documentation/sound/hd-audio/realtek-pc-beep.rst
new file mode 100644
index 000000000000..be47c6f76a6e
--- /dev/null
+++ b/Documentation/sound/hd-audio/realtek-pc-beep.rst
@@ -0,0 +1,129 @@
+===============================
+Realtek PC Beep Hidden Register
+===============================
+
+This file documents the "PC Beep Hidden Register", which is present in certain
+Realtek HDA codecs and controls a muxer and pair of passthrough mixers that can
+route audio between pins but aren't themselves exposed as HDA widgets. As far
+as I can tell, these hidden routes are designed to allow flexible PC Beep output
+for codecs that don't have mixer widgets in their output paths. Why it's easier
+to hide a mixer behind an undocumented vendor register than to just expose it
+as a widget, I have no idea.
+
+Register Description
+====================
+
+The register is accessed via processing coefficient 0x36 on NID 20h. Bits not
+identified below have no discernible effect on my machine, a Dell XPS 13 9350::
+
+  MSB                           LSB
+  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  | |h|S|L|         | B |R|       | Known bits
+  +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
+  |0|0|1|1|  0x7  |0|0x0|1|  0x7  | Reset value
+  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+
+1Ah input select (B): 2 bits
+  When zero, expose the PC Beep line (from the internal beep generator, when
+  enabled with the Set Beep Generation verb on NID 01h, or else from the
+  external PCBEEP pin) on the 1Ah pin node. When nonzero, expose the headphone
+  jack (or possibly Line In on some machines) input instead. If PC Beep is
+  selected, the 1Ah boost control has no effect.
+
+Amplify 1Ah loopback, left (L): 1 bit
+  Amplify the left channel of 1Ah before mixing it into outputs as specified
+  by h and S bits. Does not affect the level of 1Ah exposed to other widgets.
+
+Amplify 1Ah loopback, right (R): 1 bit
+  Amplify the right channel of 1Ah before mixing it into outputs as specified
+  by h and S bits. Does not affect the level of 1Ah exposed to other widgets.
+
+Loopback 1Ah to 21h [active low] (h): 1 bit
+  When zero, mix 1Ah (possibly with amplification, depending on L and R bits)
+  into 21h (headphone jack on my machine). Mixed signal respects the mute
+  setting on 21h.
+
+Loopback 1Ah to 14h (S): 1 bit
+  When one, mix 1Ah (possibly with amplification, depending on L and R bits)
+  into 14h (internal speaker on my machine). Mixed signal **ignores** the mute
+  setting on 14h and is present whenever 14h is configured as an output.
+
+Path diagrams
+=============
+
+1Ah input selection (DIV is the PC Beep divider set on NID 01h)::
+
+  <Beep generator>   <PCBEEP pin>    <Headphone jack>
+          |                |                |
+          +--DIV--+--!DIV--+       {1Ah boost control}
+                  |                         |
+                  +--(b == 0)--+--(b != 0)--+
+                               |
+               >1Ah (Beep/Headphone Mic/Line In)<
+
+Loopback of 1Ah to 21h/14h::
+
+               <1Ah (Beep/Headphone Mic/Line In)>
+                               |
+                        {amplify if L/R}
+                               |
+                  +-----!h-----+-----S-----+
+                  |                        |
+          {21h mute control}               |
+                  |                        |
+          >21h (Headphone)<     >14h (Internal Speaker)<
+
+Background
+==========
+
+All Realtek HDA codecs have a vendor-defined widget with node ID 20h which
+provides access to a bank of registers that control various codec functions.
+Registers are read and written via the standard HDA processing coefficient
+verbs (Set/Get Coefficient Index, Set/Get Processing Coefficient). The node is
+named "Realtek Vendor Registers" in public datasheets' verb listings and,
+apart from that, is entirely undocumented.
+
+This particular register, exposed at coefficient 0x36 and named in commits from
+Realtek, is of note: unlike most registers, which seem to control detailed
+amplifier parameters not in scope of the HDA specification, it controls audio
+routing which could just as easily have been defined using standard HDA mixer
+and selector widgets.
+
+Specifically, it selects between two sources for the input pin widget with Node
+ID (NID) 1Ah: the widget's signal can come either from an audio jack (on my
+laptop, a Dell XPS 13 9350, it's the headphone jack, but comments in Realtek
+commits indicate that it might be a Line In on some machines) or from the PC
+Beep line (which is itself multiplexed between the codec's internal beep
+generator and external PCBEEP pin, depending on if the beep generator is
+enabled via verbs on NID 01h). Additionally, it can mix (with optional
+amplification) that signal onto the 21h and/or 14h output pins.
+
+The register's reset value is 0x3717, corresponding to PC Beep on 1Ah that is
+then amplified and mixed into both the headphones and the speakers. Not only
+does this violate the HDA specification, which says that "[a vendor defined
+beep input pin] connection may be maintained *only* while the Link reset
+(**RST#**) is asserted", it means that we cannot ignore the register if we care
+about the input that 1Ah would otherwise expose or if the PCBEEP trace is
+poorly shielded and picks up chassis noise (both of which are the case on my
+machine).
+
+Unfortunately, there are lots of ways to get this register configuration wrong.
+Linux, it seems, has gone through most of them. For one, the register resets
+after S3 suspend: judging by existing code, this isn't the case for all vendor
+registers, and it's led to some fixes that improve behavior on cold boot but
+don't last after suspend. Other fixes have successfully switched the 1Ah input
+away from PC Beep but have failed to disable both loopback paths. On my
+machine, this means that the headphone input is amplified and looped back to
+the headphone output, which uses the exact same pins! As you might expect, this
+causes terrible headphone noise, the character of which is controlled by the
+1Ah boost control. (If you've seen instructions online to fix XPS 13 headphone
+noise by changing "Headphone Mic Boost" in ALSA, now you know why.)
+
+The information here has been obtained through black-box reverse engineering of
+the ALC256 codec's behavior and is not guaranteed to be correct. It likely
+also applies for the ALC255, ALC257, ALC235, and ALC236, since those codecs
+seem to be close relatives of the ALC256. (They all share one initialization
+function.) Additionally, other codecs like the ALC225 and ALC285 also have this
+register, judging by existing fixups in ``patch_realtek.c``, but specific
+data (e.g. node IDs, bit positions, pin mappings) for those codecs may differ
+from what I've described here.
-- 
2.25.2

