Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10B440B94
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Oct 2021 22:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE4E169C;
	Sat, 30 Oct 2021 22:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE4E169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635624389;
	bh=JZ4Zn2rKSZe+abponAe98LEaIcf6WARH4Y/bpm0JSoo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aRPBkMI5+673BZOYbJfB5WF0JaAyc8aAMTx4wpRfGH4ye5f6QTaWj+FzJ7eYPi9wW
	 GCqZ9JgUHsCfKdu/2kC6kwRP0V4Gg3yYJ1/RoIs+ORYXRcJyuG1u1Owl0/OHjVMBPz
	 FFjVIYhalD2TyvB17l/o/2A1BlSJbemvuM89fo/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2344F8010A;
	Sat, 30 Oct 2021 22:05:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B34A8F8026C; Sat, 30 Oct 2021 22:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85ACBF8010A
 for <alsa-devel@alsa-project.org>; Sat, 30 Oct 2021 22:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85ACBF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kpfzjafx"
Received: by mail-qt1-x82d.google.com with SMTP id t40so12380350qtc.6
 for <alsa-devel@alsa-project.org>; Sat, 30 Oct 2021 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziER4mJhPpn7VsY4HkJpvmopVug69X/TB9FNclIIezo=;
 b=Kpfzjafx6xxDH1kqDmS07GKvHPerLkHgoyGIlSO3ErtZiZskHNeXg81VQXhoyid9SF
 dleK8uwuIM2rUIMGTJ5iu91EO9ppoxPXauPrzkZUL7jAKH0POVQAYjzWsBpvNio+H9tC
 cvTk8DFtjOYHA4Tnm+c0eqnKt3JvvTM3H8AOwPXuy+0ooE5bBsZ5GZgKgFBnn43AZ6Q5
 MNwn0YB6DS/vHh9xB0ZO1OrbaU2elOWHenQeMMelS/6PMX6mPtdCge6/mYCUnSXqo6FB
 zZrAlOAlQGDaCMzZtzPO/6G3rQOde2pR7l5xTQK8ImhF3hmMLYnyJAA1ayTlLrZIFrpS
 aN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziER4mJhPpn7VsY4HkJpvmopVug69X/TB9FNclIIezo=;
 b=RwhRs5B1374ggVB1MnQJ9Rk2G5MaSI3sk0utdCHfdns+Tj+vLaOa2tSrB8Q+lnLgOh
 az8gGZ6ZJpDm734hWh2xT/TY0w/GRVf+ut//4OVyIzxIrzbJdlhTxbW9EUfWkAkmIrf4
 OeNZNeuh8mn2OgWPej4LAmgeTUIMg1fDPcWFROjDiN1Tpcv6L+g9S0OT0HYkcILTdy5g
 2zGrVUPPolNWlvm+Ks6PPVYy/mHnOt/SU4ZWg+v0ezoATxiyKgzYOvL3VBPJ7VhAV00j
 etSLj3VYE9t1y06Zbh0IY0y++V0GvxSkd2Lpl+yAQ/IRqof2UsatnlRMnsiRJygH3Ubq
 3uTQ==
X-Gm-Message-State: AOAM5310WqPzSuNsTMhawtqp9S9KTrO/ONNDcrr9Fi0GatAXqGWifjAA
 4FwcZSc3Lzdoj/MafvIm6BY=
X-Google-Smtp-Source: ABdhPJyhSigorgjaEmYHx4OM+InkAhowxd62j+owgNdCgkWgYbWDq9+cFuiDdFEqOwHqZQkmKNQnaQ==
X-Received: by 2002:ac8:5a01:: with SMTP id n1mr19838857qta.77.1635624298468; 
 Sat, 30 Oct 2021 13:04:58 -0700 (PDT)
Received: from jason-mate (c-73-208-52-59.hsd1.il.comcast.net. [73.208.52.59])
 by smtp.gmail.com with ESMTPSA id
 v20sm6802442qtp.44.2021.10.30.13.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 13:04:58 -0700 (PDT)
From: Jason Ormes <skryking@gmail.com>
To: tiwai@suse.de
Subject: [PATCH] ALSA: usb-audio: Line6 HX-Stomp XL USB_ID
Date: Sat, 30 Oct 2021 15:04:05 -0500
Message-Id: <20211030200405.1358678-1-skryking@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jason Ormes <skryking@gmail.com>, alsa-devel@alsa-project.org
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

Adding the Line6 HX-Stomp XL USB_ID as it needs this fixed frequency quirk as well.

The device is basically just the HX-Stomp with some more buttons on the face.  I've
Done some recording with it after adding it, and it seems to function properly with
this fix.  The Midi features appear to be working as well.

Signed-off-by: Jason Ormes <skryking@gmail.com>
---
 sound/usb/format.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 50efccbffb8a..e8fc2c350a9f 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -414,6 +414,7 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0e41, 0x4242): /* Line6 Helix Rack */
 	case USB_ID(0x0e41, 0x4244): /* Line6 Helix LT */
 	case USB_ID(0x0e41, 0x4246): /* Line6 HX-Stomp */
+        case USB_ID(0x0e41, 0x4253): /* Line6 HX-Stomp XL*/
 	case USB_ID(0x0e41, 0x4247): /* Line6 Pod Go */
 	case USB_ID(0x0e41, 0x4248): /* Line6 Helix >= fw 2.82 */
 	case USB_ID(0x0e41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
-- 
2.25.1

