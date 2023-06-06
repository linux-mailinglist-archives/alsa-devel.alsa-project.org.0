Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FA7259F4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094DE820;
	Wed,  7 Jun 2023 11:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094DE820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129569;
	bh=bGeds45bFwJ0F+y2m+U0QeFDun8UxZvM9W/iIjCHF/s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Oar3M1XLoAysN0bLfbQGDhJQXtYhVCUb9CpCbxHCR4Ci+VThnWWp999Q3B6u4Ba+Z
	 gUURbXUOgyJXD5t75JTnPx+uLLXxwfJnysiDUPXMfffTpy0hzpXFVaItSaPZIAsr57
	 uQ4Pzm2w25iGrTCebBQM4ANiOtK2v0QEnewH5VKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78790F80544; Wed,  7 Jun 2023 11:18:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E34D9F800C8;
	Wed,  7 Jun 2023 11:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00305F80290; Tue,  6 Jun 2023 21:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DF9FF800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 21:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF9FF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=pAQMVEAO
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-977fae250easo47344866b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686079978; x=1688671978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Llw+p2vlgg/1Qp0Ib93C9pJ3yXrnXuMUpa4JHx8IQg=;
        b=pAQMVEAOsjJvF1UrbMN7QGjH5oJEX2lJg0qTdAhENKryd5cWAfcIaEAUXFbmtkCAMg
         ZncrXjPN8rVAhk6Goc+jImvQxrPVFsFP71Qer3iWGcBUKCGRT3MscXAM2lTMJbJPqAql
         IWYi30n3wcIUY7iPHFYSpLvys2yPSKvofvCgOZe3tjFdCWavUfxkgaMHZd9d6n38MwwV
         JHa61tXJw6nOHcxwq2/1tq4Ny3GUO6QGMAq5bjn0UitXIdqFBSVoH2Nc72y3DINps30H
         h6oXxgaekyUlIMp4Qg7sM683BAe/UEFvTy8zfPprbwVzxmLzJ3Coik00mJdP0U4awLMb
         z/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686079978; x=1688671978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Llw+p2vlgg/1Qp0Ib93C9pJ3yXrnXuMUpa4JHx8IQg=;
        b=DVUpNpVJlYogp9dtH/neTes9iOBRaROeBa8VA9D2VSpUAYwuNhDt+pnwusULyCeWCt
         i98tA6M/COLjk9r7rQrw0q7KRIIa5MriUfFaN+HL7nzAWBQHVRE+SOrr+kNrmrNFFVyM
         tt6NILCL2WE7kuf6SRKTxbRnfX0ecJHWigpbXGemc0ZrP96MwkGDCq++rq/mAp2pG+v9
         kWOg7vbMu1San4z1WaJrsFXvtDx1NzCQ+VLiCfT5HHEGWZFCpnAhg4s3Q3y3UYKsWiEw
         tUYr55baCKUsCWpSVROyNkwR6ZHg8yH5ouylLniTFD/12pwUDjb7a9Uo6EcbjSB8oJPE
         AgrA==
X-Gm-Message-State: AC+VfDwjIanHge6Qnyr48C/6trXbl5kiKGnGhKS7/ZGQFjFssvauMv6G
	n2edO3bFP6Zng+9HKNBIHSc=
X-Google-Smtp-Source: 
 ACHHUZ5jFCfr/1Qc1DnxmK7q8vJcve4bklFBOmr5gPeVPwgeqKKtld3+i0oDgTfF/JpXiwyINc/yQA==
X-Received: by 2002:a17:906:7288:b0:974:5ec0:5246 with SMTP id
 b8-20020a170906728800b009745ec05246mr3147086ejl.7.1686079977850;
        Tue, 06 Jun 2023 12:32:57 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.85.182])
        by smtp.gmail.com with ESMTPSA id
 lu5-20020a170906fac500b0096f89fd4bf8sm5904401ejb.122.2023.06.06.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:32:57 -0700 (PDT)
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
Subject: [PATCH v4 1/3] docs: sound: add 'pcmtest' driver documentation
Date: Tue,  6 Jun 2023 23:32:52 +0400
Message-Id: <20230606193254.20791-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E4KKU35S6KFJBKWD46GQRLUIYYKKCY4D
X-Message-ID-Hash: E4KKU35S6KFJBKWD46GQRLUIYYKKCY4D
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4KKU35S6KFJBKWD46GQRLUIYYKKCY4D/>
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

V3 -> V4:

- Fix issue in the selftest: there was a typo in the fscanf argument.

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

