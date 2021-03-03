Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09D32BA5F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 21:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A89A1A9A;
	Wed,  3 Mar 2021 21:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A89A1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614803540;
	bh=Aqsr3qFYNu0mSqcIHFkLVpbbAFePY6VFK4r2NSXrNFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MAm8WFZdiRijmc1suKAW9jJKB86bD+Mf/UUpXdZkkHJ9CUp7/jkHHDyIOsP/1eOB0
	 9/nslHPRMZNhNRq/Ijo1REr1UkYmOngKUQJvf0I+HrEc0ojZlpIUBIOVqvp/MDH2u0
	 MPXlHS20mBs6rqbILjSQLjeddATEGABfJagXCUl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF98F8026A;
	Wed,  3 Mar 2021 21:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6696DF8025E; Wed,  3 Mar 2021 19:14:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.actia.se (mail.actia.se [195.67.112.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A671F800B2
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A671F800B2
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 3 Mar 2021 19:14:39 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2176.004; Wed, 3 Mar 2021 19:14:39 +0100
From: John Ernberg <john.ernberg@actia.se>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb: Add Plantronics C320-M USB ctrl msg delay quirk
Thread-Topic: [PATCH] ALSA: usb: Add Plantronics C320-M USB ctrl msg delay
 quirk
Thread-Index: AQHXEFkTCsQRnWxDKk2OSuE4/Zlp2w==
Date: Wed, 3 Mar 2021 18:14:39 +0000
Message-ID: <20210303181405.39835-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.0
x-originating-ip: [10.11.250.6]
x-esetresult: clean, is OK
x-esetid: 37303A2905BC1358637367
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 21:30:46 +0100
Cc: "kempe@lysator.liu.se" <kempe@lysator.liu.se>,
 John Ernberg <john.ernberg@actia.se>
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

The microphone in the Plantronics C320-M headset will randomly
fail to initialize properly, at least when using Microsoft Teams.
Introducing a 20ms delay on the control messages appears to
resolve the issue.

Link: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1065
Tested-by: Andreas Kempe <kempe@lysator.liu.se>
Signed-off-by: John Ernberg <john.ernberg@actia.se>
---

Note: Microsoft Teams is the only application tests have been performed wit=
h
and no other kinds of investigations have been performed, like USB packet l=
ogging.
Originally reported as a possible PulseAudio issue, where it was suggested =
to
try a delay quirk in the kernel.
If other tests should be performed, please let me know which tests and I wi=
ll try to do them.

All testing was done on 5.10, patch was then applied on sound.git master fo=
r submission

I did not register to the mailing lists, please keep me CC on any comments.=
 Thanks!

 sound/usb/quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d02dac5fcd40..a31b7db92b1e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1673,6 +1673,14 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, u=
nsigned int pipe,
 	    && (requesttype & USB_TYPE_MASK) =3D=3D USB_TYPE_CLASS)
 		msleep(20);
=20
+	/*
+	 * Plantronics C320-M needs a delay to avoid random
+	 * microhpone failures.
+	 */
+	if (chip->usb_id =3D=3D USB_ID(0x047f, 0xc025)  &&
+	    (requesttype & USB_TYPE_MASK) =3D=3D USB_TYPE_CLASS)
+		msleep(20);
+
 	/* Zoom R16/24, many Logitech(at least H650e/H570e/BCC950),
 	 * Jabra 550a, Kingston HyperX needs a tiny delay here,
 	 * otherwise requests like get/set frequency return
--=20
2.30.0
