Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47F3A9ED6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 17:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD2916E1;
	Wed, 16 Jun 2021 17:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD2916E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623856850;
	bh=alq/pZ1u+oee8A1qqndKTKZC4vzalU/qaolEfzK3oYU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O53B8YMvm+Pk1US7Ntkknyc6EzUetOvJ6ae/pCXDcpsRCiunmbQv+zOwFKXeGAt1Y
	 /BvVUQiEIKJFQWBNQQnmq6Tj66C4KdJly6YID075h2CFZFoL77BIRSnYHZryY0LXwK
	 D2Y4MpOLRSQUGknK+OiCo/2CjNJN1lL84dbBm6m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C33F80148;
	Wed, 16 Jun 2021 17:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7808DF80423; Wed, 16 Jun 2021 17:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45ADAF80148
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 17:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45ADAF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="DZytHaNO"
Received: by mail-oi1-x22d.google.com with SMTP id x196so2876677oif.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZe+2o7dtcE+Iuoj5Vekn/DR/Fb6eQVfuYTEronJ4CM=;
 b=DZytHaNOvmD4SCp49cy0JrrhcJgOcco4Ke2cSFWNEAYDv2Fv3il63d7lvZnEAWWIHg
 OovX2xzohd36HghpohB/c0uX5g/Gau5XdvHE8W/8SlA2kaujIgUi28T42ibJIRZ5f1ch
 BKwE0bc9KhYUPwrn9tjN4CznCQq2IxmPCqlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZe+2o7dtcE+Iuoj5Vekn/DR/Fb6eQVfuYTEronJ4CM=;
 b=NU2QjOv7mle1UoP3gNn7YFy4zgR6V5EFaL5miHmsocPFApOWJMR7V1rfkxTAwIE0ZY
 wjNR0v2Ky0F1pEXy704iIsE3c3FPj3sXROtzvWeHYX4fOWcZ1FEmJZlP6zfjRfr48otq
 aDlgg45Q/WEW54ElqqAF5e2Rn7q8CQMfc119+QOmRcnGW8PEaZCfgiVR9ud771PSH5jG
 bXHYJFW37WRxVQ2D+k75Q7It5DFCpycrbj2Ym6K6sAppmVUQQx/x0JDwZzZUoaof82cQ
 ZVYYaVVXXmHhTpbDlpUaAjLfy+DmqVsbhsBJ/NNOOnzOzcYcmXTiLWFui+HclwE3VJzJ
 nO4A==
X-Gm-Message-State: AOAM531ATYTdziy1jRdTc8gFb1j7i8GLP5XrV3u68lBTbewPWOXvlzOP
 /LxzUHMwg8+iHJxHH4QCaK6+Sg==
X-Google-Smtp-Source: ABdhPJxBHlESlq9QN8I4BsotqKjL3Vd+g7+eat/8fHGeQF66ssWfCNi+iuUzy1auZ7ZcZ87VK/ju2g==
X-Received: by 2002:aca:3e06:: with SMTP id l6mr71186oia.147.1623856748592;
 Wed, 16 Jun 2021 08:19:08 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l7sm588521otp.71.2021.06.16.08.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:19:08 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl
Subject: [PATCH v2] media: Fix Media Controller API config checks
Date: Wed, 16 Jun 2021 09:19:06 -0600
Message-Id: <20210616151906.8912-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Shuah Khan <skhan@linuxfoundation.org>
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
   in mc-objs when CONFIG_USB is enabled.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/alsa-devel/YLeAvT+R22FQ%2FEyw@mwanda/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Changes since v1:
- Fixed the drivers/media/mc/Makefile incorrect logic to check
  CONFIG_USB value. Test with CONFIG_USB_SUPPORT enabled/disabled
  CONFIG_USB y/m and disabled.

 drivers/media/mc/Makefile           | 2 +-
 include/media/media-dev-allocator.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
index 119037f0e686..2b7af42ba59c 100644
--- a/drivers/media/mc/Makefile
+++ b/drivers/media/mc/Makefile
@@ -3,7 +3,7 @@
 mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
 	   mc-request.o
 
-ifeq ($(CONFIG_USB),y)
+ifneq ($(CONFIG_USB),)
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

