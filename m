Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAB4CE3AC
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 09:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5ACF1B4E;
	Sat,  5 Mar 2022 09:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5ACF1B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646469661;
	bh=epQid9m1Ycz8kVaamlcTuOL+4/cm2nsEBRXCk0XBNXQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OsE/35YU5472yOTSNx2EH6EogTh/hRHthgaf4NRPY2a8aupf23rjYVx+l36mq3O1k
	 NIzEDtWQnBvNjy3WGPQrr/I8ZEYv2LVk7VA/A74PX/o4c9uxyEheCduFJCXaNOUwSw
	 xD9a0JbLbHocH2mXo4KWtglSOTptriZ3R8m38jz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D0C7F80543;
	Sat,  5 Mar 2022 09:36:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDBBDF801EC; Fri,  4 Mar 2022 22:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7415F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 22:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7415F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fMaD3ywH"
Received: by mail-ej1-x62a.google.com with SMTP id qx21so19935045ejb.13
 for <alsa-devel@alsa-project.org>; Fri, 04 Mar 2022 13:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oig8fhLNyVNunrNPMCm55EjpGrpFgGoOxxBNe6hX29Q=;
 b=fMaD3ywH8iy0Z2twtGF0BWxNTmtA6vvgiUdlUCWiZFnv0u1vqqQHU7G/S8GF8aTtdO
 r4rjCbFzNXHYjkw+nYPoY126hOKWZXwU/QIdQBB1IpPnRxrrmxgmzSec9n9HDr3X9V/u
 3Kp0VrWTis8L6MGfAc+BnD60vksV8m+m05LwkISoW0wIOwEX3Xjz2cc3d0B7ez4e/q99
 rDG0EFdraH20cLIj0cittLQ4fjiLPfgN0Ebelf4qhQf/phvShysDxILdNs0BFDBt5NlU
 qEEo/PZVeYzWroMJVnPm5aDeCcTm85g2AdNNEAxOV3QLpGEoGc9wbvPVcOY3KDWYLX8w
 zGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oig8fhLNyVNunrNPMCm55EjpGrpFgGoOxxBNe6hX29Q=;
 b=VUCmcZehBaBIAUrky9vvKFD7MVcvkRjdf2GV3c284m5NIH9mxbCnx6LGr+UqXeuHH5
 td8ttizq6dZokmyEtlQ0M5Un03JkmKt46JNBMWyc+hsM9CrP7jnC2k9uULoATQMXiY5S
 Qpf2dv5O5GTXtpkTEAVgGff5jZkU67CwpQWDJ3yCQEqf7GFMizqntYsq+YU9WgVMO3cc
 sfxYjFKsyNo1BD/Zm64g2/HyJs4yAyxdOL0z5O8GnmrpYPVA3RN+Xx+Es1/1vPtSXUBn
 AYOzxQZGhgMfQw6Mbx/clkHy0CZ60KJjP+t498zZbmIBQw/3caLf1J1BHeFnMPROf7fJ
 WMkg==
X-Gm-Message-State: AOAM532G28TFOT7McD/v02Ulrt/5DfFfJXDF9dKEV7t6c+cOvS/d1RuX
 QIG541T4n8A7cdvAeIRJ6AYyUqLuPGs=
X-Google-Smtp-Source: ABdhPJx1mj58ZJXedZ+imCgau9OHpp1s8A2U+fVVz7OtXF2X982LGH/8Dj+YK6jyDK2a15GCao6q/g==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr529524ejj.767.1646429015877; 
 Fri, 04 Mar 2022 13:23:35 -0800 (PST)
Received: from reza-pc.. (73-241-201-31.ftth.glasoperator.nl. [31.201.241.73])
 by smtp.googlemail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm2147396ejt.108.2022.03.04.13.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 13:23:35 -0800 (PST)
From: Reza Jahanbakhshi <reza.jahanbakhshi@gmail.com>
To: 
Subject: [PATCH] ALSA: usb-audio: add mapping for new Corsair Virtuoso SE
Date: Fri,  4 Mar 2022 22:23:02 +0100
Message-Id: <20220304212303.195949-1-reza.jahanbakhshi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Mar 2022 09:36:45 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 reza.jahanbakhshi@gmail.com, Takashi Iwai <tiwai@suse.com>,
 Johannes Schickel <lordhoto@gmail.com>, Timo Gurr <timo.gurr@gmail.com>
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

New device id for Corsair Virtuoso SE RGB Wireless that currently is not
in the mixer_map. This entry in the mixer_map is necessary in order to
label its mixer appropriately and allow userspace to pick the correct
volume controls. For instance, my own Corsair Virtuoso SE RGB Wireless
headset has this new ID and consequently, the sidetone and volume are not
 working correctly without this change.
> sudo lsusb -v | grep -i corsair
Bus 007 Device 011: ID 1b1c:0a40 Corsair CORSAIR VIRTUOSO SE Wireless Gam
  idVendor           0x1b1c Corsair
  iManufacturer           1 Corsair
  iProduct                2 CORSAIR VIRTUOSO SE Wireless Gaming Headset

Signed-off-by: Reza Jahanbakhshi <reza.jahanbakhshi@gmail.com>
---
 sound/usb/mixer_maps.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 96991ddf5055..64f5544d0a0a 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -542,6 +542,16 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x05a7, 0x40fa),
 		.map = bose_soundlink_map,
 	},
+	{
+		/* Corsair Virtuoso SE Latest (wired mode) */
+		.id = USB_ID(0x1b1c, 0x0a3f),
+		.map = corsair_virtuoso_map,
+	},
+	{
+		/* Corsair Virtuoso SE Latest (wireless mode) */
+		.id = USB_ID(0x1b1c, 0x0a40),
+		.map = corsair_virtuoso_map,
+	},
 	{
 		/* Corsair Virtuoso SE (wired mode) */
 		.id = USB_ID(0x1b1c, 0x0a3d),
-- 
2.35.1

