Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6AE2FFE15
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:24:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2101ABB;
	Fri, 22 Jan 2021 09:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2101ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611303846;
	bh=/ag9ZDY+7xqTEtwHAqqQe1ApZtXo+2pCVREA5hs+FVM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9aFVFKTqy9KrQbWmlBWfQWIfAE+MAwKxYTtj38H8BS2xJEh42sMX+uony8eNx8/2
	 HA1qDwVHMqHetJxNidQ2cv6Tfxw5zvWD0AgIguhC4drdWK67pGG0duFa1sizWxZvot
	 jyjUK65v62Bc8HRXD1xDi3LF3b1QS77KLniJMEI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6259BF804D2;
	Fri, 22 Jan 2021 09:22:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED3E0F804CC; Fri, 22 Jan 2021 09:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6548F8019B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6548F8019B
Received: from [123.112.70.0] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l2riA-0005bR-Lr; Fri, 22 Jan 2021 08:22:46 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v5 2/2] alsa: jack: add document for sound jack injection.
Date: Fri, 22 Jan 2021 16:21:44 +0800
Message-Id: <20210122082144.16186-3-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122082144.16186-1-hui.wang@canonical.com>
References: <20210122082144.16186-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 Documentation/sound/designs/index.rst         |   1 +
 .../sound/designs/jack-injection.rst          | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/sound/designs/jack-injection.rst

diff --git a/Documentation/sound/designs/index.rst b/Documentation/sound/designs/index.rst
index f0749943ccb2..1eb08e7bae52 100644
--- a/Documentation/sound/designs/index.rst
+++ b/Documentation/sound/designs/index.rst
@@ -14,3 +14,4 @@ Designs and Implementations
    powersave
    oss-emulation
    seq-oss
+   jack-injection
diff --git a/Documentation/sound/designs/jack-injection.rst b/Documentation/sound/designs/jack-injection.rst
new file mode 100644
index 000000000000..0915048a0dbd
--- /dev/null
+++ b/Documentation/sound/designs/jack-injection.rst
@@ -0,0 +1,124 @@
+============================
+ALSA Jack Software Injection
+============================
+
+Simple Introduction On Jack Injection
+=====================================
+
+Here jack injection means users could inject plugin or plugout events
+to the audio jacks through debugfs interface, it is helpful to
+validate ALSA userspace changes. For example, we change the audio
+profile switching code in the pulseaudio, and we want to verify if the
+change works as expected and if the change introduce the regression,
+in this case, we could inject plugin or plugout events to an audio
+jack or to some audio jacks, we don't need to physically access the
+machine and plug/unplug physical devices to the audio jack.
+
+In this design, an audio jack doesn't equal to a physical audio jack.
+Sometimes a physical audio jack contains multi functions, and the
+ALSA driver creates multi ``jack_kctl`` for a ``snd_jack``, here the
+``snd_jack`` represents a physical audio jack and the ``jack_kctl``
+represents a function, for example a physical jack has two functions:
+headphone and mic_in, the ALSA ASoC driver will build 2 ``jack_kctl``
+for this jack. The jack injection is implemented based on the
+``jack_kctl`` instead of ``snd_jack``.
+
+To inject events to audio jacks, we need to enable the jack injection
+via ``sw_inject_enable`` first, once it is enabled, this jack will not
+change the state by hardware events anymore, we could inject plugin or
+plugout events via ``jackin_inject`` and check the jack state via
+``status``, after we finish our test, we need to disable the jack
+injection via ``sw_inject_enable`` too, once it is disabled, the jack
+state will be restored according to the last reported hardware events
+and will change by future hardware events.
+
+The Layout of Jack Injection Interface
+======================================
+
+If users enable the SND_JACK_INJECTION_DEBUG in the kernel, the audio
+jack injection interface will be created as below:
+::
+
+   $debugfs_mount_dir/sound
+   |-- card0
+   |-- |-- HDMI_DP_pcm_10_Jack
+   |-- |-- |-- jackin_inject
+   |-- |-- |-- kctl_id
+   |-- |-- |-- mask_bits
+   |-- |-- |-- status
+   |-- |-- |-- sw_inject_enable
+   |-- |-- |-- type
+   ...
+   |-- |-- HDMI_DP_pcm_9_Jack
+   |--     |-- jackin_inject
+   |--     |-- kctl_id
+   |--     |-- mask_bits
+   |--     |-- status
+   |--     |-- sw_inject_enable
+   |--     |-- type
+   |-- card1
+       |-- HDMI_DP_pcm_5_Jack
+       |-- |-- jackin_inject
+       |-- |-- kctl_id
+       |-- |-- mask_bits
+       |-- |-- status
+       |-- |-- sw_inject_enable
+       |-- |-- type
+       ...
+       |-- Headphone_Jack
+       |-- |-- jackin_inject
+       |-- |-- kctl_id
+       |-- |-- mask_bits
+       |-- |-- status
+       |-- |-- sw_inject_enable
+       |-- |-- type
+       |-- Headset_Mic_Jack
+           |-- jackin_inject
+           |-- kctl_id
+           |-- mask_bits
+           |-- status
+           |-- sw_inject_enable
+           |-- type
+
+
+Explanation for the debugfs nodes:
+::
+
+ - kctl_id, read-only, get jack_kctl->kctl's id
+   sound/card1/Headphone_Jack# cat kctl_id
+   Headphone Jack
+
+ - mask_bits, read-only, get jack_kctl's supported events mask_bits
+   sound/card1/Headphone_Jack# cat mask_bits
+   0x0001 HEADPHONE(0x0001)
+
+ - status, read-only, get jack_kctl's current status
+   headphone unplugged:
+   sound/card1/Headphone_Jack# cat status
+   Unplugged
+   headphone plugged:
+   sound/card1/Headphone_Jack# cat status
+   Plugged
+
+ - type, read-only, get snd_jack's supported events type (all
+   supported events on the physical audio jack)
+   sound/card1/Headphone_Jack# cat type
+   0x7803 HEADPHONE(0x0001) MICROPHONE(0x0002) BTN_3(0x0800) BTN_2(0x1000) BTN_1(0x2000) BTN_0(0x4000)
+
+ - sw_inject_enable, read-write, enable or disable injection
+   injection disabled:
+   sound/card1/Headphone_Jack# cat sw_inject_enable
+   Jack: Headphone Jack		Inject Enabled: 0
+   injection enabled:
+   sound/card1/Headphone_Jack# cat sw_inject_enable
+   Jack: Headphone Jack		Inject Enabled: 1
+   to enable jack injection:
+   sound/card1/Headphone_Jack# echo 1 > sw_inject_enable
+   to disable jack injection:
+   sound/card1/Headphone_Jack# echo 0 > sw_inject_enable
+
+ - jackin_inject, write-only, inject plugin or plugout
+   to inject plugin:
+   sound/card1/Headphone_Jack# echo 1 > jackin_inject
+   to inject plugout:
+   sound/card1/Headphone_Jack# echo 0 > jackin_inject
-- 
2.25.1

