Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD63A397B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 04:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 250CE1801;
	Fri, 11 Jun 2021 03:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 250CE1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623376846;
	bh=5GNVWl74ckYL2wjdAqovSYC0n1fJTwVQSEE5iG9OsVg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VtdBj4uQlKcCSxmgIiMLs91P5Dq/fjVy1RUA5yA2k/TjD7kWlP6DzNRC0ko2OHQNx
	 7nUneGNoMl32FbGJRSap2y2HAmgl+ygkpj7/Yd7BWaeqcDJ982RiGfnWfEqftNgOyA
	 CGFJFBkaPTmpI3Bf088EgvZP33FJw4au+5Y5ggEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 873E6F800FB;
	Fri, 11 Jun 2021 03:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D763F8026C; Fri, 11 Jun 2021 03:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A60EAF80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 03:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60EAF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="HlbEw/Ig"
Received: by mail-io1-xd35.google.com with SMTP id q7so29263188iob.4
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 18:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZJde4o2L2qg8vNw7HtP2CFLX1sOraFXZhqavB6u28E=;
 b=HlbEw/IgXPWlFlo5xmewtDujAgpnKlacrXyXaWF8GPL/1k0dBg8z5PMwMl+NT4bto1
 x6Agoa5Tcwft8dvKREYpTefTCPXRO9p8X4dKZRaocFaenR0PotQHwrcHDrLBHQfXbeXr
 cvb0v86EJCg0u+5jVGidvPMt0Ou3JOl/zSHZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZJde4o2L2qg8vNw7HtP2CFLX1sOraFXZhqavB6u28E=;
 b=dznRYQ4hOcu5uJvdUSHHbPAUXzj0RNT0XkabGToNQNxDymvd0q0MvLqBCPNeEZbeHu
 CxK8Nc9ws5cUm4KTlLfrPM4B2VBie44tNMPY3n2zOkapkRsy8S2dlESZgpcQePeLNhC2
 8WW/QP4wisKWopKUzINXIghWfkpIjBw8zpQs3k1zJEVOdmxSC9RGnur5qY1PB52NsQ57
 bWK1NdFJbK37vnbn4z/EfxM80ePGaNtSgBYLIBZDqg6kYnsMaTObf+tlui+NMnVkxs82
 W5gsC3zYfJnCglDrNXfaqOBX+emQmGXJYZT7JOoXTIg2lBLrJK/wUYsWAHTbFMsSCh+A
 9zgQ==
X-Gm-Message-State: AOAM530SOL8NIpMvy7CTnwltWWl5nE8ImsiZpYUnUgL4okfYEBeXeGx/
 45MsitYDuWfvYFuo4KTovri+Wg==
X-Google-Smtp-Source: ABdhPJy5dyB25zNPV/G1vZwDtG6mro/vxYNPOH0KijCRQMYYArulRACmbS3ga0zv//1UXMp/D0aa4g==
X-Received: by 2002:a05:6638:1682:: with SMTP id
 f2mr1376788jat.139.1623376738776; 
 Thu, 10 Jun 2021 18:58:58 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id n20sm2623663ioo.23.2021.06.10.18.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 18:58:58 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 dan.carpenter@oracle.com, mchehab@kernel.org
Subject: [PATCH] media: Fix Media Controller API config checks
Date: Thu, 10 Jun 2021 19:58:49 -0600
Message-Id: <20210611015849.42589-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
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

Smatch static checker warns that "mdev" can be null:

sound/usb/media.c:287 snd_media_device_create()
    warn: 'mdev' can also be NULL

If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
in the build.

The below conditions in the sound/usb/Makefile are in place to ensure that
media.c isn't included in the build.

sound/usb/Makefile:
snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o

select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
       (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)

The following config check in include/media/media-dev-allocator.h is
in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
CONFIG_USB are enabled.

 #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)

This check doesn't work as intended when CONFIG_USB=m. When CONFIG_USB=m,
CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config check
doesn't catch that CONFIG_USB is defined as a module and disables the API.
This results in sound/usb enabling Media Controller specific ALSA driver
code, while Media disables the Media Controller API.

Fix the problem requires two changes:

1. Change the check to use IS_ENABLED to detect when CONFIG_USB is enabled
   as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, leave
   the check unchanged to be consistent with drivers/media/Makefile.

2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
   in mc-objs when CONFIG_USB is y or m.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/alsa-devel/YLeAvT+R22FQ%2FEyw@mwanda/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/mc/Makefile           | 2 +-
 include/media/media-dev-allocator.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
index 119037f0e686..140f0a78540e 100644
--- a/drivers/media/mc/Makefile
+++ b/drivers/media/mc/Makefile
@@ -3,7 +3,7 @@
 mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
 	   mc-request.o
 
-ifeq ($(CONFIG_USB),y)
+ifeq ($(CONFIG_USB),$(filter $(CONFIG_USB),y m))
 	mc-objs += mc-dev-allocator.o
 endif
 
diff --git a/include/media/media-dev-allocator.h b/include/media/media-dev-allocator.h
index b35ea6062596..2ab54d426c64 100644
--- a/include/media/media-dev-allocator.h
+++ b/include/media/media-dev-allocator.h
@@ -19,7 +19,7 @@
 
 struct usb_device;
 
-#if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
+#if defined(CONFIG_MEDIA_CONTROLLER) && IS_ENABLED(CONFIG_USB)
 /**
  * media_device_usb_allocate() - Allocate and return struct &media device
  *
-- 
2.30.2

