Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5223DBFD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 18:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C4282C;
	Thu,  6 Aug 2020 18:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C4282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596732153;
	bh=mr4KYtkXB/7cupz8vVHJRXGV9zXb+caWtI7DYWXEFaE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HP9oJC4mnSvU81MjVnnWaKr8zjBeG8QpJqYCZZwRnwj0nGh1p7jG46Sl985q4YfPj
	 eCkQ6p+arWPqnYFCqFli4SBLbYaOq6y2wPS6jkUYDToZZ7b3FrAdB8YInejCWtuF/P
	 F/bEepkofqYIoklsXRiuE0Hr12Zei0DyH0hWC8wY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 468F4F802F9;
	Thu,  6 Aug 2020 18:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2DF7F80159; Thu,  6 Aug 2020 14:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fillips.l4m1.de (fillips.l4m1.de [185.207.104.9])
 by alsa1.perex.cz (Postfix) with ESMTP id A5169F800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 14:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5169F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=l4m1.de header.i=@l4m1.de
 header.b="tqnFcuBL"
Received: from l4m1.de (x590ebe1d.dyn.telefonica.de [89.14.190.29])
 by fillips.l4m1.de (Postfix) with ESMTPSA id 02F812989EB;
 Thu,  6 Aug 2020 14:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=l4m1.de; s=mail;
 t=1596718138; bh=mr4KYtkXB/7cupz8vVHJRXGV9zXb+caWtI7DYWXEFaE=;
 h=From:To:Cc:Subject:Date;
 b=tqnFcuBLZ8/ec7KrMkdlbUIJsljAZtBkbrbkDIcVsZnQyyPmyvR/YfDeYGYq/B9gQ
 FkmqSa8RCvFWFk270m1gzVIzWjZtOsUCnXNIammEBl5QRxS5CwJ7O/PE9GLGDZCMaT
 aX3v10gGUsgQFMBchT9ZPtbQ6ZYUdYM2MGJ09E5c=
From: buzz@l4m1.de
To: buzz@l4m1.de
Subject: [PATCH] ALSA: usb - Creative USB X-Fi Pro SB1095 volume knob support
Date: Thu,  6 Aug 2020 14:48:50 +0200
Message-Id: <20200806124850.20334-1-buzz@l4m1.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Aug 2020 18:36:48 +0200
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

From: Mirko Dietrich <buzz@l4m1.de>

Adds an entry for Creative USB X-Fi to the rc_config array in
mixer_quirks.c to allow use of volume knob on the device.
Adds support for newer X-Fi Pro card, known as "Model No. SB1095"
with USB ID "041e:3263"

Signed-off-by: Mirko Dietrich <buzz@l4m1.de>
---
 sound/usb/mixer_quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index cec1cfd7edb7..199cdbfdc761 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -185,6 +185,7 @@ static const struct rc_config {
 	{ USB_ID(0x041e, 0x3042), 0, 1, 1, 1,  1,  0x000d }, /* Usb X-Fi S51 */
 	{ USB_ID(0x041e, 0x30df), 0, 1, 1, 1,  1,  0x000d }, /* Usb X-Fi S51 Pro */
 	{ USB_ID(0x041e, 0x3237), 0, 1, 1, 1,  1,  0x000d }, /* Usb X-Fi S51 Pro */
+	{ USB_ID(0x041e, 0x3263), 0, 1, 1, 1,  1,  0x000d }, /* Usb X-Fi S51 Pro */
 	{ USB_ID(0x041e, 0x3048), 2, 2, 6, 6,  2,  0x6e91 }, /* Toshiba SB0500 */
 };
 
-- 
2.28.0

