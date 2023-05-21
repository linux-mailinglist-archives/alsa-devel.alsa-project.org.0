Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3070B4D5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5A71EC;
	Mon, 22 May 2023 08:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5A71EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684735619;
	bh=ij7Gdra9AEYefEesAk1rqpdQQWkBuV9QEQS0G5qHBwY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T6iUKwZ4NL5Qe5EYkJGFTbu/2DzMScDU7lAchG0MUAmDH6AFiPni8idyu3bk8JNi8
	 kXSfuak88l5zrvLa7gVT7/ep1fsXjcP68xvHB6DeVBvacVM4G/2A9i90LLuWlHqixj
	 2UgUUpHEfkyA+PXisECVvRpA2KlXiwe4I8l0kVX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9771CF80588; Mon, 22 May 2023 08:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 966E3F8053D;
	Mon, 22 May 2023 08:04:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7823CF80425; Sun, 21 May 2023 20:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62535F8016A
	for <alsa-devel@alsa-project.org>; Sun, 21 May 2023 20:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62535F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=EWwrSP4y
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96f44435d92so43976666b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 21 May 2023 11:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684693955; x=1687285955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS5dP4/0kxSXRrTOxgf6uiSb5APBJTI1WcIJY11cvhE=;
        b=EWwrSP4yoKWj11w5mAd/U713VrzEWZrEm6KKG7VWu4iOAU99aGKyEH1sp4sP7YUgbZ
         AWazM/jChgRvmIHpvWGU/TY0yeXzJ3dCOZ5MQnDK3DJ+gJx5Ks54vccZ/tfdFeLlK6sW
         E75/wcdCsiyjNHN9TaAom6qVysZajnMZJ3KR7enqwnbwhlsXyLHmKHcRuV2o0Pvxu0j9
         q8aStAINClJbbGXsFBpNEwOodkRbXSSSwt1EE98Rf651kkk4Kit/RM005ldvnGkGbjz+
         IYhY1JS+QgCZiFVxhJOO9eN7B+44EnrHhEI1LPbi+Nkra1V/Llw7jlyAznweM72cPQX8
         braA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684693955; x=1687285955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS5dP4/0kxSXRrTOxgf6uiSb5APBJTI1WcIJY11cvhE=;
        b=Pbu9TxRGfQaoZxg2sa13Pbpvy8W6ScLZGN8lg+G7ugolZw9P71l5cB4Udw9sJgOhgo
         9HiImCTBAX12QQXdaD/s7MLPxmDfng7U3+AQOnJrJOmlOBXM998TekkOZvwQoVpxdeMW
         C9VVGyDZpqAuiMI1wCHhGg8tOCJwSe1XRJNOg8htjNiItF9KWA6zLsFoaFn5oyaqeNQ7
         B8c4d79z7asgpXvl3a9pGy6XXiziJqlqQ+DmSZJm22C6pzqG8o7bUOzYM8viJia1yisA
         FXYlcJmPClCnnFmGhRye0StN3eCzQyppZojHSwbpLXxR1/TmVjie8uyF9eYoSHQ3oa4x
         94yw==
X-Gm-Message-State: AC+VfDzkLAQofI5K1Ghd7l1TIMSK09I2BDH8RsC0ZTMkZsNrQynL1nj9
	J28upxN57RIZhDpY8BnFwpQ=
X-Google-Smtp-Source: 
 ACHHUZ68z3QpD3OkCVzKvW+WTgMqfEOM6PCjkujbswhOwYZhDtYiHuMNHq2r08OOQlYi70QH+4SmiQ==
X-Received: by 2002:a17:906:729e:b0:96f:6590:cbdb with SMTP id
 b30-20020a170906729e00b0096f6590cbdbmr7686148ejl.6.1684693955078;
        Sun, 21 May 2023 11:32:35 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.87])
        by smtp.gmail.com with ESMTPSA id
 mc20-20020a170906eb5400b0096f803afbe3sm2194252ejb.66.2023.05.21.11.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 11:32:34 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	broonie@kernel.org,
	skhan@linuxfoundation.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 1/3] docs: sound: add 'pcmtest' driver documentation
Date: Sun, 21 May 2023 22:32:16 +0400
Message-Id: <20230521183218.9641-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PUP7BQFWZ75QW5ZQNVSOGFCJAS3V7KNS
X-Message-ID-Hash: PUP7BQFWZ75QW5ZQNVSOGFCJAS3V7KNS
X-Mailman-Approved-At: Mon, 22 May 2023 06:03:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation for the new Virtual PCM Test Driver. It covers all
possible usage cases: errors and delay injections, random and
pattern-based data generation, playback and ioctl redefinition
functionalities testing.

We have a lot of different virtual media drivers, which can be used for
testing of the userspace applications and media subsystem middle layer.
However, all of them are aimed at testing the video functionality and
simulating the video devices. For audio devices we have only snd-dummy
module, which is good in simulating the correct behavior of an ALSA device.
I decided to write a tool, which would help to test the userspace ALSA
programs (and the PCM middle layer as well) under unusual circumstances
to figure out how they would behave. So I came up with this Virtual PCM
Test Driver.

This new Virtual PCM Test Driver has several features which can be useful
during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
of the PCM middle layer. Not all of them can be implemented using the
existing virtual drivers (like dummy or loopback). Here is what can this
driver do:

- Simulate both capture and playback processes
- Check the playback stream for containing the looped pattern
- Generate random or pattern-based capture data
- Inject delays into the playback and capturing processes
- Inject errors during the PCM callbacks

Also, this driver can check the playback stream for containing the
predefined pattern, which is used in the corresponding selftest to check
the PCM middle layer data transferring functionality. Additionally, this
driver redefines the default RESET ioctl, and the selftest covers this PCM
API functionality as well.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:

- Rename the driver from from 'valsa' to 'pcmtest'.
- Implement support for interleaved and non-interleaved access modes
- Add support for 8 substreams and 4 channels
- Extend supported formats
- Extend and rewrite in C the selftest for the driver

 Documentation/sound/cards/index.rst   |   1 +
 Documentation/sound/cards/pcmtest.rst | 119 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 Documentation/sound/cards/pcmtest.rst

diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index c016f8c3b88b..49c1f2f688f8 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -17,3 +17,4 @@ Card-Specific Information
    hdspm
    serial-u16550
    img-spdif-in
+   pcmtest
diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/cards/pcmtest.rst
new file mode 100644
index 000000000000..ea8070eaa44e
--- /dev/null
+++ b/Documentation/sound/cards/pcmtest.rst
@@ -0,0 +1,119 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Virtual PCM Test Driver
+===========================
+
+The Virtual PCM Test Driver emulates a generic PCM device, and can be used for
+testing/fuzzing of the userspace ALSA applications, as well as for testing/fuzzing of
+the PCM middle layer. Additionally, it can be used for simulating hard to reproduce
+problems with PCM devices.
+
+What can this driver do?
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+At this moment the driver can do the following things:
+	* Simulate both capture and playback processes
+	* Generate random or pattern-based capturing data
+	* Inject delays into the playback and capturing processes
+	* Inject errors during the PCM callbacks
+
+It supports up to 8 substreams and 4 channels. Also it supports both interleaved and
+non-interleaved access modes.
+
+Also, this driver can check the playback stream for containing the predefined pattern,
+which is used in the corresponding selftest (alsa/test-pcmtest-driver.c). To check the
+PCM middle layer data transferring functionality. Additionally, this driver redefines
+the default RESET ioctl, and the selftest covers this PCM API functionality as well.
+
+Configuration
+-------------
+
+The driver has several parameters besides the common ALSA module parameters:
+
+	* fill_mode (bool) - Buffer fill mode (see below)
+	* inject_delay (int)
+	* inject_hwpars_err (bool)
+	* inject_prepare_err (bool)
+	* inject_trigger_err (bool)
+
+
+Capture Data Generation
+-----------------------
+
+The driver has two modes of data generation: the first (0 in the fill_mode parameter)
+means random data generation, the second (1 in the fill_mode) - pattern-based
+data generation. Let's look at the second mode.
+
+First of all, you may want to specify the pattern for data generation. You can do it
+by writing the pattern to the debugfs file (/sys/kernel/debug/pcmtest/fill_pattern).
+Like that:
+
+.. code-block:: bash
+
+	echo -n mycoolpattern > /sys/kernel/debug/pcmtest/fill_pattern
+
+After this, every capture action performed on the 'pcmtest' device will return
+'mycoolpatternmycoolpatternmycoolpatternmy...' for every channel buffer.
+
+In case of interleaved access, the capture buffer will contain the repeated pattern
+for every channel. Otherwise, every channel buffer will contain the repeated pattern.
+
+The pattern itself can be up to 4096 bytes long.
+
+Delay injection
+---------------
+
+The driver has 'inject_delay' parameter, which has very self-descriptive name and
+can be used for time delay/speedup simulations. The parameter has integer type, and
+it means the delay added between module's internal timer ticks.
+
+If the 'inject_delay' value is positive, the buffer will be filled slower, if it is
+negative - faster. You can try it yourself by starting a recording in any
+audio recording application (like Audacity) and selecting the 'pcmtest' device as a
+source.
+
+This parameter can be also used for generating a huge amount of sound data in a very
+short period of time (with the negative 'inject_delay' value).
+
+Errors injection
+----------------
+
+This module can be used for injecting errors into the PCM communication process. This
+action can help you to figure out how the userspace ALSA program behaves under unusual
+circumstances.
+
+For example, you can make all 'hw_params' PCM callback calls return EBUSY error by
+writing '1' to the 'inject_hwpars_err' module parameter:
+
+.. code-block:: bash
+
+	echo 1 > /sys/module/snd_pcmtest/parameters/inject_hwpars_err
+
+Errors can be injected into the following PCM callbacks:
+
+	* hw_params (EBUSY)
+	* prepare (EINVAL)
+	* trigger (EINVAL)
+
+
+Playback test
+-------------
+
+This driver can be also used for the playback functionality testing - every time you
+write the playback data to the 'pcmtest' PCM device and close it, the driver checks the
+buffer of each channel for containing the looped pattern (which is specified in the
+fill_pattern debugfs file). If the playback buffer content represents the looped pattern,
+'pc_test' debugfs entry is set into '1'. Otherwise, the driver sets it to '0'.
+
+ioctl redefinition test
+-----------------------
+
+The driver redefines the 'reset' ioctl, which is default for all PCM devices. To test
+this functionality, we can trigger the reset ioctl and check the 'ioctl_test' debugfs
+entry:
+
+.. code-block:: bash
+
+	cat /sys/kernel/debug/pcmtest/ioctl_test
+
+If the ioctl is triggered successfully, this file will contain '1', and '0' otherwise.
-- 
2.34.1

