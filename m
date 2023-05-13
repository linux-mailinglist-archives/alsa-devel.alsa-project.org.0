Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D68702CA1
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6E51DD;
	Mon, 15 May 2023 14:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6E51DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153613;
	bh=bPKHJLxt6Wpo1+Kxpf04rXqb1UT97XW7pOUFS/DkcJI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IuykH8h+lxmCbwEbOZyAsNblrym6GnkRf3sZTGB0dbaaT1QwnROIZ7orrnF3APxUa
	 Mg8N+txnb6Db32dh7L41VctErUX7rHy76Iyn50VaNJlSmof0xXHtBz7vm4W/NPNQRM
	 oWoflsTC0ey087c9+9CvOf1brnnZbpAXt8CKyOX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9972EF80544; Mon, 15 May 2023 14:26:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BA8F8025A;
	Mon, 15 May 2023 14:26:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBB6AF8053B; Sat, 13 May 2023 22:21:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0749F8014C
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 22:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0749F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SZ4hSMKs
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso2583025a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684009269; x=1686601269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI0vsmpY7mdUr70LiqqOXYMCiqJ/xh4FarR28VDA3tQ=;
        b=SZ4hSMKsHGaXlLqSku8AD4/x/CeRqwaHcZPywriobqnvKyvivb450tjcJFRpNAplQx
         ZKkGZ6Lqjt/vAKFOsFwm9bznpX59kYJB6YzxqyLmF5awylrSTXjZzSNgfXJjPvc7nS9/
         Kt8p97wvKXfucnIIbQdPjEIUb6iV22hbEdFAOT28HuG72UtKb6En97RAbmd5O3EukoaG
         7dkx5q5T+1oOG8ScWGsZWtox3HC/dF2y7dRLPHjx1zqEy2pNE8tzJLlzGXQYeazEgq1e
         9WHh9jcz4vQj0NmgmyF2cUfhfD758KbgJ/Tguy+OXnpKQiDz3MxnRz6AmAuSvO833RON
         I3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684009269; x=1686601269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI0vsmpY7mdUr70LiqqOXYMCiqJ/xh4FarR28VDA3tQ=;
        b=FyaFGTkPPWY1ZCo8cqYUzjYo0e7bW6AGGpl4MZBwcAuJzatWhlgLfwtF8EeawQRvy4
         Pnex1VdOTC08jXxHwYkii396ayS1WWSp0LRfPPWsPcdDUBggRg+/hsuRJz+FqTj2CIkE
         EAqYup7eIW62zsiEaFWiWCBKUexKKmuWvKc+1Ouiv3Y5QeU9kN+xkwvVDTR6fbjP2vXn
         EGIrRuz8yD2EpZLd2DuFgc+5cfGGdOhTGKpjYsquuv8M1H2RtstRcF/ajv2wL6ro8Dyz
         92NTlgEAmGVy6XV1sA8AD0E911xbt33gJqQZkLT0470gXF54i95tF0Ci4oFyFb3DcV0e
         M7jg==
X-Gm-Message-State: AC+VfDwTW3cfrLOv0uFN0z4sInl8e/ecbASvD0eTlU3zefL+0ipf/5ve
	oXr6rhnW8MPmhyDCaH91eWU=
X-Google-Smtp-Source: 
 ACHHUZ625/aVC/WnxBwyH6Dh1+EYRSKpvxQlGTanFoaRhbxtj1LMDThxQmKD1kACZ7pmrqVwVNpu8g==
X-Received: by 2002:a05:6402:27cd:b0:50c:79f:c693 with SMTP id
 c13-20020a05640227cd00b0050c079fc693mr26358719ede.1.1684009269048;
        Sat, 13 May 2023 13:21:09 -0700 (PDT)
Received: from ivan-B550MH.. ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a50fb0e000000b0050bc6d0e880sm5109637edq.61.2023.05.13.13.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 13:21:08 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	skhan@linuxfoundation.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 1/3] docs: admin-guide: add valsa driver documentation
Date: Sun, 14 May 2023 00:20:35 +0400
Message-Id: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZMAACJ3YWAFZUMIWD3KCXKJHN3WQT4FW
X-Message-ID-Hash: ZMAACJ3YWAFZUMIWD3KCXKJHN3WQT4FW
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMAACJ3YWAFZUMIWD3KCXKJHN3WQT4FW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation for the new Virtual ALSA driver. It covers all possible
usage cases: errors and delay injections, random and pattern-based data
generation, playback and ioctl redefinition functionalities testing.

We have a lot of different virtual media drivers, which can be used for
testing of the userspace applications and media subsystem middle layer.
However, all of them are aimed at testing the video functionality and
simulating the video devices. For audio devices we have only snd-dummy
module, which is good in simulating the correct behavior of an ALSA device.
I decided to write a tool, which would help to test the userspace ALSA
programs (and the PCM middle layer as well) under unusual circumstances
to figure out how they would behave. So I came up with this Virtual ALSA
Driver.

This new Virtual ALSA Driver has several features which can be useful
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
 Documentation/admin-guide/index.rst |   1 +
 Documentation/admin-guide/valsa.rst | 114 ++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/admin-guide/valsa.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 43ea35613dfc..328cc59275a1 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -131,6 +131,7 @@ configure specific aspects of kernel behavior to your liking.
    thunderbolt
    ufs
    unicode
+   valsa
    vga-softcursor
    video-output
    xfs
diff --git a/Documentation/admin-guide/valsa.rst b/Documentation/admin-guide/valsa.rst
new file mode 100644
index 000000000000..64ffc130fb4c
--- /dev/null
+++ b/Documentation/admin-guide/valsa.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Virtual ALSA Driver
+=======================
+
+The Virtual ALSA Driver emulates a generic ALSA device, and can be used for
+testing/fuzzing of the userspace ALSA applications, as well as for testing/fuzzing of
+the ALSA middle layer. Additionally, it can be used for simulating hard to reproduce
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
+Also, this driver can check the playback stream for containing the
+predefined pattern, which is used in the corresponding selftest (alsa/valsa-test.sh)
+to check the PCM middle layer data transferring functionality. Additionally, this
+driver redefines the default RESET ioctl, and the selftest covers this PCM
+API functionality as well.
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
+by writing the pattern to the debugfs file (/sys/kernel/debug/valsa/fill_pattern).
+Like that:
+
+.. code-block:: bash
+
+	echo -n mycoolpattern > /sys/kernel/debug/valsa/fill_pattern
+
+After this, every capture action performed on the 'valsa' device will return
+'mycoolpatternmycoolpatternmycoolpatternmy...' in the capturing buffer.
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
+audiorecording application (like Audacity) and selecting the 'valsa' device as a
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
+	echo 1 > /sys/module/snd_valsa/parameters/inject_hwpars_err
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
+write the playback data to the 'valsa' PCM device and close it, the driver checks the
+buffer for containing the looped pattern (which is specified in the fill_pattern
+debugfs file). If the playback buffer content represents the looped pattern, 'pc_test'
+debugfs entry is set into '1'. Otherwise, the driver sets it to '0'.
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
+	cat /sys/kernel/debug/valsa/ioctl_test
+
+If the ioctl is triggered successfully, this file will contain '1', and '0' otherwise.
-- 
2.34.1

