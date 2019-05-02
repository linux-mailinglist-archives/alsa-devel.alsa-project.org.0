Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6312104
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 19:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA43173A;
	Thu,  2 May 2019 19:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA43173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556818163;
	bh=LjucOOWNyXHRy4zi7U9VsgPYFblJfP5UeG+pk3I/Hqo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sjDxHPAfR9ujV8r6PzTpUfzItClBiPEEHzLJle2T4NIpuniAkdsQgCnCmwxMA0cyF
	 Atc26txjZUKoodyMwT2e9O0IsHwCMDDIRvI5ZxPzG2KGF0jNiq9Ps7gDUI/uN2OVRl
	 6febYfOLU601bYL/okbyOaRmR5zvTWDVlLusKhLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED12F896EA;
	Thu,  2 May 2019 19:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F3C9F89721; Thu,  2 May 2019 19:27:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F60F896C7
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 19:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F60F896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="H6QCS63+"
Received: by mail-io1-xd41.google.com with SMTP id v9so2866972iol.10
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSV3za5h6TmBn30fKr9DcVJtEpE2QIEo0gVfRz6Uuuk=;
 b=H6QCS63+H4ulewvjtJZ8/K4jbaKx4q0voM+BcLBzjr+tM1MNXqKjejQCw/TgvsayL+
 fz3wYlr9IPyR46iOl1vMq+xkHfmkAfDCkymf8Xv9D1HFZPku1N0NreMIkZ6Z4i1HIGdm
 7t1HvtCNornGg5c30FvEx4lWyjl9MSwTFsybo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSV3za5h6TmBn30fKr9DcVJtEpE2QIEo0gVfRz6Uuuk=;
 b=R8zvkrbOKeGubf/S5s1lH8x8ZjC6GzabCqSAsBU9ZI9ij199MZiPULIV9m4vgjCGA5
 GmAY3FoWCMDLMpBLJAJDeD+xr6eEp/+9U9/NWasg1ov1FZ4KRh+ljwcfyeXbCCuS0ROH
 YsgC6a5Yj+Tnpbe6Do2wLC1b5wmDdcq4XF/3r3Q/dPzMWDnl+BTSc6LXaoBsj4iBv+PI
 ITx/Ieh6BfakZT9odkP93YuGaMpYGCqDJoIUDY2CPArJj8NG0olptTepdp+Rcmum6k4F
 YPNkCqlAXxjHaX+rh0kq6q7JMzC1QqpSdyqaRsgCOV3UOuiazrr2P8SbAxQFMjGRPdis
 +UDg==
X-Gm-Message-State: APjAAAViXw0me4DMrizJ3MXPJ4eo1U31446ATrQeGURR9qV6408vkdzX
 qb72AEyCSut006R5piTExwmOXQ==
X-Google-Smtp-Source: APXvYqxf9/LTf8Om4JbEc+c1oOqa3tbBbDX8hfcc/WF7j7McISDSQTro/vzmlVOXO8ATigMRH0U3Og==
X-Received: by 2002:a6b:3b11:: with SMTP id i17mr3543172ioa.105.1556818027933; 
 Thu, 02 May 2019 10:27:07 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id 125sm5019437itx.21.2019.05.02.10.27.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 10:27:07 -0700 (PDT)
From: Ross Zwisler <zwisler@chromium.org>
X-Google-Original-From: Ross Zwisler <zwisler@google.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  2 May 2019 11:27:00 -0600
Message-Id: <20190502172700.215737-1-zwisler@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] MAINTAINERS: update git tree for sound entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Several sound related entries in MAINTAINERS refer to the old git tree
at "git://git.alsa-project.org/alsa-kernel.git".  This is no longer used
for development, and Takashi Iwai's kernel.org tree is used instead.

Signed-off-by: Ross Zwisler <zwisler@google.com>
---
 MAINTAINERS | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b5480..d373d976a9317 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3351,7 +3351,7 @@ F:	include/uapi/linux/bsg.h
 BT87X AUDIO DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	Documentation/sound/cards/bt87x.rst
 F:	sound/pci/bt87x.c
@@ -3404,7 +3404,7 @@ F:	drivers/scsi/FlashPoint.*
 C-MEDIA CMI8788 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/pci/oxygen/
 
@@ -5696,7 +5696,7 @@ F:	drivers/edac/qcom_edac.c
 EDIROL UA-101/UA-1000 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/usb/misc/ua101.c
 
@@ -6036,7 +6036,7 @@ F:	include/linux/f75375s.h
 FIREWIRE AUDIO DRIVERS
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/firewire/
 
@@ -11593,7 +11593,7 @@ F:	Documentation/devicetree/bindings/opp/
 OPL4 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/drivers/opl4/
 
@@ -14490,7 +14490,6 @@ M:	Takashi Iwai <tiwai@suse.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 W:	http://www.alsa-project.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-T:	git git://git.alsa-project.org/alsa-kernel.git
 Q:	http://patchwork.kernel.org/project/alsa-devel/list/
 S:	Maintained
 F:	Documentation/sound/
@@ -16100,7 +16099,7 @@ F:	drivers/usb/storage/
 USB MIDI DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-T:	git git://git.alsa-project.org/alsa-kernel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/usb/midi.*
 
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
