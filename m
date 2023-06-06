Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987C724593
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977D7829;
	Tue,  6 Jun 2023 16:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977D7829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686061112;
	bh=+d2w4NiXYBH0QcGmRyoMEooA0WvYZIIUuLlPdhVfJak=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hrtZaMnTXpqtW0MvOUP6UflqAo61NAifiEW59RmfSIR0v88Me8zVfHRn1FqVQzew/
	 6/EynyQQfIpZOJ+dji5Ez3enwGQFucmBKdtOjV5FyTxxDvQYcTwbHU83gBROCs5ROI
	 V4Qm9X+OojO7NP+pHGbFIlz1yq990tovFHomX9og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 179FDF805E9; Tue,  6 Jun 2023 16:15:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2E7F805E9;
	Tue,  6 Jun 2023 16:15:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F39AF80290; Tue,  6 Jun 2023 15:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46BD6F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BD6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=OlPD8dk9
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso126680466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686058706; x=1688650706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xdfK41i9ogLoXuG8nVzwi1HHjDuvaM8RBF4uVZdQ5zA=;
        b=OlPD8dk9OEttqxELJsG49IBnkoTCNh1dHC47S0ZDvxh9e4LslctJojKXJUo2f6gmfC
         cnphpW6rIEEohgVN0mVADJRBCtGmTIRmRPJTI7+CT+Z/KGDnsB+SYz4NUJ4w78QdXNFk
         tYE/q60GU2shTjlubbovKZy6l7yly8S6azBaaIN1IvPUsDzq50ZSS54hqvsgID9Dj2Al
         KcXM3/JGEP3NkRWctQ/deI0ez6pRhByvGh5lHTFBFxh6JjnqcnwyGw5oyuaBJ+DlIely
         nsBAJYi/9u5Pek5BWdciSipWARH8dEtHB1v/hPI77podyYKPYhTIziVgYFS5zE2lU+OU
         KqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686058706; x=1688650706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdfK41i9ogLoXuG8nVzwi1HHjDuvaM8RBF4uVZdQ5zA=;
        b=HA4wwgDN8YGZeEFQjrCW4bBwmIZO20Ui+UYY4/z3NR3gTtjnQuErsLp6+HBVE8nrwn
         Q4vn2fQmY2PwVbZBbVRf1A84chCD5QVHo198KxdW6GKVPTroomMJvp3ixYqgbRkM8P1u
         AxTABIXMmxXDG8+4EcE2ySSCjNS44AkIoqvrmUQqPgMgKn+d5KAPsxM2mvDdRA6T0+oC
         5YRrCgnF0+rdbsdXkq8RdOqW3VxaWWUr3wrlwxwKeOdcM3hK/xnN5loujUbpBEVqCUgh
         dKKqrDkAOQiMHmvsAp5pV/AoXxRUf8LSy6/D17jcclj6Jm8f3nr5gg3NcY3dkFyIBdNf
         syaw==
X-Gm-Message-State: AC+VfDx/1G5Qj9u0XCRaje/CCkLjtJOfJAylWqRe3voAlNhrVSfVFDgt
	x6UUPWBmy8vQLs6GQkAnMxw=
X-Google-Smtp-Source: 
 ACHHUZ41ZZ2VXhAaUdYwSB5wGyF7c81EUR7ZLJfUyTPiowT7O8K6TKnNodrKJG7p9iRsM6qwCSpRug==
X-Received: by 2002:a17:906:748d:b0:977:c853:fba6 with SMTP id
 e13-20020a170906748d00b00977c853fba6mr2109890ejl.2.1686058705522;
        Tue, 06 Jun 2023 06:38:25 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a1709066d0800b00977d7ccd9fdsm2837775ejr.95.2023.06.06.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:38:25 -0700 (PDT)
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
Subject: [PATCH v3 1/3] docs: sound: add 'pcmtest' driver documentation
Date: Tue,  6 Jun 2023 17:38:05 +0400
Message-Id: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DJA7XEHCXCNJ2JMIZA4LNYCALVQOZLH3
X-Message-ID-Hash: DJA7XEHCXCNJ2JMIZA4LNYCALVQOZLH3
X-Mailman-Approved-At: Tue, 06 Jun 2023 14:15:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJA7XEHCXCNJ2JMIZA4LNYCALVQOZLH3/>
List-Archive: <>
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

The driver supports both interleaved and non-interleaved access modes, and
have separate pattern buffers for each channel. The driver supports up to
4 channels and up to 8 substreams.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:

- Rename the driver from from 'valsa' to 'pcmtest'.
- Implement support for interleaved and non-interleaved access modes
- Add support for 8 substreams and 4 channels
- Extend supported formats
- Extend and rewrite in C the selftest for the driver

V2 -> V3:

- Add separate pattern buffers for each channel
- Speed up the capture data generation when using interleaved access mode
- Extend the corresponding selftest to cover the multiple channels
capturing and playback functionalities when using interleaved access mode.
- Fix documentation issues

 Documentation/sound/cards/index.rst   |   1 +
 Documentation/sound/cards/pcmtest.rst | 120 ++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)
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
index 000000000000..e163522f3205
--- /dev/null
+++ b/Documentation/sound/cards/pcmtest.rst
@@ -0,0 +1,120 @@
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
+which is used in the corresponding selftest (alsa/pcmtest-test.sh) to check the PCM middle
+layer data transferring functionality. Additionally, this driver redefines the default
+RESET ioctl, and the selftest covers this PCM API functionality as well.
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
+by writing the pattern to the debugfs file. There are pattern buffer debugfs entries
+for each channel, as well as entries which contain the pattern buffer length.
+
+	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]
+	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]_len
+
+To set the pattern for the channel 0 you can execute the following command:
+
+.. code-block:: bash
+
+	echo -n mycoolpattern > /sys/kernel/debug/pcmtest/fill_pattern0
+
+Then, after every capture action performed on the 'pcmtest' device the buffer for the
+channel 0 will contain 'mycoolpatternmycoolpatternmycoolpatternmy...'.
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
+audiorecording application (like Audacity) and selecting the 'pcmtest' device as a
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
+Playback test
+-------------
+
+This driver can be also used for the playback functionality testing - every time you
+write the playback data to the 'pcmtest' PCM device and close it, the driver checks the
+buffer for containing the looped pattern (which is specified in the fill_pattern
+debugfs file for each channel). If the playback buffer content represents the looped
+pattern, 'pc_test' debugfs entry is set into '1'. Otherwise, the driver sets it to '0'.
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

