Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681E324F2C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD0E167C;
	Thu, 25 Feb 2021 12:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD0E167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252533;
	bh=mGyE8B2CkqjwJ2aP7vUa7cWiacbv7k+j1XGMo92L/DQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ABbJJQeuKWvhqYEtPM6+vozeqVxs8o79OOLuNxFzffmD+vbIIlX4v+M2LKbUhSBId
	 ZGdG3ULz8DUDBdgcBveKzf+o6x4QLRWajUDziSTUUdU4rAb9mO16Zkaz2vLsoEylGW
	 ffq/aq5rDlEtkE2tBn3aT1F2ckSvREFqi8C8s2ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA7CF80424;
	Thu, 25 Feb 2021 12:25:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE873F8025E; Mon, 22 Feb 2021 16:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7933EF80082
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 16:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7933EF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FXji/u2i"
Received: by mail-wm1-x332.google.com with SMTP id i9so3926067wml.5
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
 b=FXji/u2iaXY+XOLURddZgd2B9Komiw4Zs+cHylXgLODWE9GujYAMZXOAJt49ncgKkj
 KXasUXoXmvp4d8wnMqKd80kcI7te+i8Ssj5jDkgEWFuHlI+B6a2sASXp0MxfAR6JnXe8
 PMBmzH05uvtN8ixL0Xf+EQKCWEzHPeryma2B8WEKKwAVtI0pXqr1NlCyNenHmBJpSL8S
 /+oAK7AHbhG8Bp1qrmvN2UnpdRZab4b+NfCGuGFlZhbfGdnHHN2BEQP/z7fvhdeo8a9n
 SKJFfnaPm0+G5TFN4ZPUDwZLEAxSLZT3kXUZZdZbgYAQSBq86aQw+eD/RGBp29tx1xWa
 GH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
 b=BWxpRqeNzZhq1KyOPfvyVfkgFbKfiqlo/W+D2bMn1Cp8eN2O/D5ALtVQQRbSNEHwej
 4DmaIWngDg0FMLkDSpdXWmyzFesPbmAbd+ny0qraeGXDVVr92wVQhmGzONJIMiFYLKZz
 fjriRCrUxOEQBhiBzojqQ0SKpdKlHgs7Oolx7PP4wcp03jIQ41oSljJv52dJOzhvXmcR
 RDAyVOPKrdo3zy8ZWkihgyl/Yr8n8LV+4CstpoupgkevMCuY6/Qad9IeW8f3zeyZ9EIp
 8UxwusK04fC+BXLFPP/j+6OMTXONQ9ilxiY6c7AoRbR6TGFDgumQfyhHKhB8BAjEp30b
 vHvA==
X-Gm-Message-State: AOAM532T6KxYQYH+l4NvhF/Z7/LLkvDLQSRd4Wu/raF8Cd6ENDtWS7fg
 qcnLBryAa6rbI0ukB0BxrLw=
X-Google-Smtp-Source: ABdhPJwJjaqNTMZMEqWfwHu3GKPnp7PUpKeoIN2SSKme4SlDCBTSRJD1aRWbEX4S9qfmjT5mjltYPQ==
X-Received: by 2002:a05:600c:26c4:: with SMTP id
 4mr9157865wmv.126.1614006761746; 
 Mon, 22 Feb 2021 07:12:41 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
 by smtp.gmail.com with ESMTPSA id q25sm20952001wmq.15.2021.02.22.07.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 07:12:41 -0800 (PST)
From: Romain Perier <romain.perier@gmail.com>
To: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jessica Yu <jeyu@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Steffen Maier <maier@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 00/20] Manual replacement of all strlcpy in favor of strscpy
Date: Mon, 22 Feb 2021 16:12:11 +0100
Message-Id: <20210222151231.22572-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:31 +0100
Cc: linux-hwmon@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-scsi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-m68k@lists.linux-m68k.org,
 target-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 cgroups@vger.kernel.org, linux-integrity@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linux-media@vger.kernel.org
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

strlcpy() copy a C-String into a sized buffer, the result is always a
valid NULL-terminated that fits in the buffer, howerver it has severals
issues. It reads the source buffer first, which is dangerous if it is non
NULL-terminated or if the corresponding buffer is unbounded. Its safe
replacement is strscpy(), as suggested in the deprecated interface [1].

We plan to make this contribution in two steps:
- Firsly all cases of strlcpy's return value are manually replaced by the
  corresponding calls of strscpy() with the new handling of the return
  value (as the return code is different in case of error).
- Then all other cases are automatically replaced by using coccinelle.

This series covers manual replacements.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Romain Perier (20):
  cgroup: Manual replacement of the deprecated strlcpy() with return
    values
  crypto: Manual replacement of the deprecated strlcpy() with return
    values
  devlink: Manual replacement of the deprecated strlcpy() with return
    values
  dma-buf: Manual replacement of the deprecated strlcpy() with return
    values
  kobject: Manual replacement of the deprecated strlcpy() with return
    values
  ima: Manual replacement of the deprecated strlcpy() with return values
  SUNRPC: Manual replacement of the deprecated strlcpy() with return
    values
  kernfs: Manual replacement of the deprecated strlcpy() with return
    values
  m68k/atari: Manual replacement of the deprecated strlcpy() with return
    values
  module: Manual replacement of the deprecated strlcpy() with return
    values
  hwmon: Manual replacement of the deprecated strlcpy() with return
    values
  s390/hmcdrv: Manual replacement of the deprecated strlcpy() with
    return values
  scsi: zfcp: Manual replacement of the deprecated strlcpy() with return
    values
  target: Manual replacement of the deprecated strlcpy() with return
    values
  ALSA: usb-audio: Manual replacement of the deprecated strlcpy() with
    return values
  tracing/probe: Manual replacement of the deprecated strlcpy() with
    return values
  vt: Manual replacement of the deprecated strlcpy() with return values
  usb: gadget: f_midi: Manual replacement of the deprecated strlcpy()
    with return values
  usbip: usbip_host: Manual replacement of the deprecated strlcpy() with
    return values
  s390/watchdog: Manual replacement of the deprecated strlcpy() with
    return values

 arch/m68k/emu/natfeat.c                 |  6 +--
 crypto/lrw.c                            |  6 +--
 crypto/xts.c                            |  6 +--
 drivers/dma-buf/dma-buf.c               |  4 +-
 drivers/hwmon/pmbus/max20730.c          | 66 +++++++++++++------------
 drivers/s390/char/diag_ftp.c            |  4 +-
 drivers/s390/char/sclp_ftp.c            |  6 +--
 drivers/s390/scsi/zfcp_fc.c             |  8 +--
 drivers/target/target_core_configfs.c   | 33 ++++---------
 drivers/tty/vt/keyboard.c               |  5 +-
 drivers/usb/gadget/function/f_midi.c    |  4 +-
 drivers/usb/gadget/function/f_printer.c |  8 +--
 drivers/usb/usbip/stub_main.c           |  6 +--
 drivers/watchdog/diag288_wdt.c          | 12 +++--
 fs/kernfs/dir.c                         | 27 +++++-----
 kernel/cgroup/cgroup.c                  |  2 +-
 kernel/module.c                         |  4 +-
 kernel/trace/trace_uprobe.c             | 11 ++---
 lib/kobject_uevent.c                    |  6 +--
 net/core/devlink.c                      |  6 +--
 net/sunrpc/clnt.c                       |  6 ++-
 security/integrity/ima/ima_policy.c     |  8 ++-
 sound/usb/card.c                        |  4 +-
 23 files changed, 129 insertions(+), 119 deletions(-)

-- 
2.20.1

