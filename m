Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2F655CE4
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 11:59:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5104D535;
	Sun, 25 Dec 2022 11:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5104D535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671965966;
	bh=LmqalmL3HW6Coosmcu+FYoCtXlF8Pix/ucVK0IbL0fc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bRdmC5FPVIfoKTcHCyumVDSJLoWgxdD+DIb9lwwIAfW7efKwWJgklaQAfld2N9uTM
	 Jnd17TwYC9UpB1rct0F23Mv5uLkNk3dTjT9sEYax8zeEow2kODhF+EI97SdzV9tLSR
	 zX34BqJ4amu9+5OQU6t7/iS2zyGARakPktqu/UYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0D4F80245;
	Sun, 25 Dec 2022 11:58:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A14F804B4; Sun, 25 Dec 2022 11:57:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71949F800F0
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 11:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71949F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=T5VfheWl
Received: by mail-lj1-x22d.google.com with SMTP id f20so9293564lja.4
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrQvNWLVZKLOxTKdwry319GqiUl/XFttiLKh2n4bKaI=;
 b=T5VfheWlF3+HdIYPHc29p5aXvej0BFSDS/OTfTVpZxEir3cTGECQbpNOBGSiWOJSXs
 IlOMwWzaUyy2rmAylB24i9CFWbnaRrk2n6xIlJBYmHhN2cbO39m5OybIp0WTuaRFjKIm
 J65YUOz4H7TDos9DrMZ4lCIkvT1q00u+zV6rrq/nTpfVHMp7DDDk3MEu7Iz0PhKC4Bks
 MQlUrWr5nb2GdhEupTVTALFXMXCx80dWr7/LkQSTgv/TnNljfckuZIZYzsOsxG51sEcf
 TA5u65My9OU+RnjRcU/aL31EFO6onOqTDupO83hYt0gL3XjzbzgwS8P6zo3NN1BKmNwX
 7edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrQvNWLVZKLOxTKdwry319GqiUl/XFttiLKh2n4bKaI=;
 b=7ohCpItivd3gmzGpu0XJ5aWmgrBiq+mdgutJISX0SToM0HrE+2ikQUusTgjusgko4o
 uNq4bIqJTE5c+qD12LpY78vqF6YDPX+86PdvgNmaSgGph7bVGLNUwXT3O98a9khMiw93
 LEERbJUwxRX36oJ/JWGdSsY78aVWZnu2Ld+WwMMl9SR37OuWBymSlFU9+4Da4bzbwYDl
 hJh9nqW1MqFcFZNb6BY5lCkIDDW3lEpDSTPXQPmFMCs1SNQkrBYBo15xdqlYvlRLaKaT
 PXZLa+olYtCYTxZAWMELjhzygzBwM0KdaSp2sSWnsMDhDIyyQndxbEyEGSt/LCy4uiU0
 Jrxg==
X-Gm-Message-State: AFqh2krg7mqdZhroe74tk6Qmn3I2+5Rs5EKW00GIUn3ybZEOJ/0N8gNy
 XAFBEoi2LUB+a0TawlGeWaGbqXDCJdc=
X-Google-Smtp-Source: AMrXdXvLFLu87oevv7QrFh3oAS3c7Tfjwp03gZ2zrbPl1wwLBU1kBWHrmm3jejS+a362fuuUjOCaWA==
X-Received: by 2002:a2e:90ce:0:b0:277:13a1:1882 with SMTP id
 o14-20020a2e90ce000000b0027713a11882mr5190460ljg.21.1671965869071; 
 Sun, 25 Dec 2022 02:57:49 -0800 (PST)
Received: from localhost.localdomain
 (dl5zkyyyhqvp---tn498y-3.rev.dnainternet.fi.
 [2001:14ba:4e68:8000:66c:59ff:fe0b:c778])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a2e880a000000b002771057e0e5sm1013550ljh.76.2022.12.25.02.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 02:57:48 -0800 (PST)
From: Artem Egorkine <arteme@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: line6: fix stack overflow in line6_midi_transmit
Date: Sun, 25 Dec 2022 12:57:28 +0200
Message-Id: <20221225105728.1153989-2-arteme@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221225105728.1153989-1-arteme@gmail.com>
References: <20221225105728.1153989-1-arteme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Artem Egorkine <arteme@gmail.com>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Correctly calculate available space including the size of the chunk
buffer. This fixes a buffer overflow when multiple MIDI sysex
messages are sent to a PODxt device.

Signed-off-by: Artem Egorkine <arteme@gmail.com>
---
 sound/usb/line6/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index d52355de2bbc..0838632c788e 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -44,7 +44,8 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
 	int req, done;
 
 	for (;;) {
-		req = min(line6_midibuf_bytes_free(mb), line6->max_packet_size);
+		req = min3(line6_midibuf_bytes_free(mb), line6->max_packet_size,
+			   LINE6_FALLBACK_MAXPACKETSIZE);
 		done = snd_rawmidi_transmit_peek(substream, chunk, req);
 
 		if (done == 0)
-- 
2.38.1

