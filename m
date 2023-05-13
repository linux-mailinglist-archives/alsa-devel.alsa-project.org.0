Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FE702CA5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:27:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B3BD839;
	Mon, 15 May 2023 14:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B3BD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153666;
	bh=7T30ksgMN7TtrHdNMdqcNGf4b9CnIptZCewubzbAMro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SsRpPNcGgE1DxHyhw7L4iATnsizw6aMaEmhUR8F+aJK2B1dNzbd59AbTy6qWJ+kVX
	 wpi4SFyWq9Y/uCJ+rmZplbBMGTJPqGWuuBZXJqbMuaiY/78S7GGL9W1bvVg5UGIfuo
	 bvqWoS8huPugkJ00cN5k3BYXFocYPjdj/3L11Z/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D95F80579; Mon, 15 May 2023 14:26:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A7AF80567;
	Mon, 15 May 2023 14:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CCB9F8052E; Sat, 13 May 2023 22:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6921F8032D
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 22:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6921F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=jfdhvxTI
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bfd66ba3eso2596381a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684009279; x=1686601279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phVfYEyjqUA1/8JzWnwWyJem9HZ6085CTPXJTMUib4g=;
        b=jfdhvxTIOPKnh+n2ESRxn+iltKq4nh61eRKsxsBV3oW1Ii/X7aBXAv5Nou7cNo3LDK
         RkQWrcskIMLc2WGI/FXV6llw+fSYLG8RM7SNaurWDObJLBtDDXxaJHfKN/k14P+q0wpT
         r/R1zhu7SRLCOUKIRIxnvf4WSrTNIEwiGlwlpJnN3XTtUBv87y2s3BfYYYOxyjIO9tCs
         MJDYr1yzY6cMjC8UXgHF6eC/UOXpuaiXRsfiKCRbj1/Z3s5TV+vNeMW/u1nrNA9I8zOp
         UrHGgaaaTZOkwa9wtKPliidEM/bI0RQnKBFKIYuLx+/HlLFhzNmVsMa8PGoYxEldKW9c
         GTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684009279; x=1686601279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phVfYEyjqUA1/8JzWnwWyJem9HZ6085CTPXJTMUib4g=;
        b=Idqy/WcNFt4sHEOTiUx3SHeuvA+8vDNuBgOOoGJv+C3ICsjfXfJPEndfoZg6zBS4mu
         2Bqpnrgw1vPlOUvV3LYzJGN9HAkaTM6+SQ0t0X9JfvuC2owxK4DexI7atBcAe+wnJG0n
         v7GSmPNTxggBhNGnd8tlmdQkgxPt4K4GW8SyRo9eqobEl+FLWo61lh6nn1W40WUgUv5x
         1p0N318+HFZOXPdI3qWec/kDHNGYreW1J3IbDN75+LynTmXKSnT7zFgSbtN4DgKzg+91
         OlDkowsuutyl5LqzzJ8SAuyMdehTcDaQ6nIPkQAP701mMSdXAcVZl6Y+3KuATjpWVmKl
         WR8A==
X-Gm-Message-State: AC+VfDxHJAkIQZw2Fl6uMcoXnYLQEt1666eeSqLHSmSqfW2jJDbqDpza
	IGjLUDlUxs8HQUYw/Rne5gE=
X-Google-Smtp-Source: 
 ACHHUZ6D50diLOr1mJEybUqQgqdZ/OhjmdX7JuUmJJIFtY8WY3xSxqG/VvvFG+eERIrAaYaD9xdCPg==
X-Received: by 2002:a05:6402:3482:b0:508:40a5:beb4 with SMTP id
 v2-20020a056402348200b0050840a5beb4mr28652324edc.3.1684009279137;
        Sat, 13 May 2023 13:21:19 -0700 (PDT)
Received: from ivan-B550MH.. ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a50fb0e000000b0050bc6d0e880sm5109637edq.61.2023.05.13.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 13:21:18 -0700 (PDT)
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
Subject: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
Date: Sun, 14 May 2023 00:20:37 +0400
Message-Id: <20230513202037.158777-3-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2VSZS75MZ2AD3UXS7XGFW4XRDJ5JF43M
X-Message-ID-Hash: 2VSZS75MZ2AD3UXS7XGFW4XRDJ5JF43M
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VSZS75MZ2AD3UXS7XGFW4XRDJ5JF43M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This test covers the new Virtual ALSA driver, including the capturing,
playback and ioctl redefinition functionalities. This test is also helpful
as an usage example of the 'valsa' driver.

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
- Generate random or pattern-based capture data
- Check the playback stream for containing the looped pattern
- Inject delays into the playback and capturing processes
- Inject errors during the PCM callbacks

Also, this driver can check the playback stream for containing the
predefined pattern, which is used in the corresponding selftest to check
the PCM middle layer data transferring functionality. Additionally, this
driver redefines the default RESET ioctl, and the selftest covers this PCM
API functionality as well.

After all, I think this driver would be a good start, and I believe in the
future we will see more virtual sound drivers.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 tools/testing/selftests/alsa/valsa-test.sh | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 tools/testing/selftests/alsa/valsa-test.sh

diff --git a/tools/testing/selftests/alsa/valsa-test.sh b/tools/testing/selftests/alsa/valsa-test.sh
new file mode 100755
index 000000000000..872dfac138c2
--- /dev/null
+++ b/tools/testing/selftests/alsa/valsa-test.sh
@@ -0,0 +1,55 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test for the 'valsa' virtual driver. It tests capture and playback functionalities,
+# as well as the 'reset' ioctl redefinition.
+
+uid=$(id -u)
+if [ $uid -ne 0 ]; then
+	echo "$0: Must be run as root"
+	exit 1
+fi
+
+if ! which modprobe > /dev/null 2>&1; then
+	echo "$0: You need modprobe installed"
+        exit 4
+fi
+
+if ! modinfo snd-valsa > /dev/null 2>&1; then
+	echo "$0: You must have the following enabled in your kernel:"
+	echo "CONFIG_SND_ALSAV=m"
+	exit 4
+fi
+
+modprobe snd-valsa
+
+if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
+	mount -t debugfs none /sys/kernel/debug
+
+	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
+		echo "$0: Error mounting debugfs"
+		exit 4
+	fi
+fi
+
+success="1"
+arecord -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 --duration=4 out.wav
+
+if [[ $(< /sys/kernel/debug/valsa/ioctl_test) == "$success" ]]; then
+	echo "$0: ioctl test: success"
+else
+	echo "$0: ioctl test: fail"
+fi
+
+aplay -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 out.wav
+
+if [[ $(< /sys/kernel/debug/valsa/pc_test) == "$success" ]]; then
+	echo "$0: playback test: success"
+else
+	echo "$0: playback test: fail"
+fi
+
+rm -rf out.wav
+if ! rmmod snd-valsa > /dev/null 2>&1; then
+	echo "$0: Can't remove 'valsa' module: disable PulseAudio and unload it manually"
+fi
-- 
2.34.1

