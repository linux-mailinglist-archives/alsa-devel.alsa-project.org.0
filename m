Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7212C213860
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E062616E1;
	Fri,  3 Jul 2020 12:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E062616E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593770790;
	bh=3Zj+461kYsV2GOWGf4DK2E3Z1z9i3v/JHAiDO+TQiVw=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+sJInTPl8ZThOYQqMrhzhYoFPuro+lYapJ3eJ352RBFOjT5X8v7yjeV82uJ61qcd
	 N99GaQaSHSoaJZs6zqWNEsVXNMdB7r2nGyA11I4NP2hjmK/15TRcKzXks3NO88QT3m
	 TGN5Dm7tKuaOz7TaBYc6Z/VAaD/DMJXKYGQKwh0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3697F8021D;
	Fri,  3 Jul 2020 12:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAA8F80217; Fri,  3 Jul 2020 12:04:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37B67F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B67F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Av79pApz"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="ZYSC+YnX"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id B988DA1F47DC6
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1593770679; bh=3Zj+461kYsV2GOWGf4DK2E3Z1z9i3v/JHAiDO+TQiVw=;
 h=From:Subject:To:Date:From;
 b=Av79pApzmTJWpVRr0UhPrDlHxOBC/TXM8ACGK3tyIqScvWFVi1mJl6rIs9GSCarqo
 EG8q2FJ1OclvZyjrxiee/NDzyzIGds9aPTXUH/6zmnQDdShPkIWEiL6OTjBfpJasr3
 z34Zc0WA+q+Td67qeLKqJLODnlgNXjnDrPkWSBqI=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwXqMp58xNUV for <alsa-devel@alsa-project.org>;
 Fri,  3 Jul 2020 12:04:34 +0200 (CEST)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 71DD4A1F3A7AE
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1593770674; bh=3Zj+461kYsV2GOWGf4DK2E3Z1z9i3v/JHAiDO+TQiVw=;
 h=From:Subject:To:Date:From;
 b=ZYSC+YnXhF5ti0hZHCQMm0MHLnbFFJ7VIfnefZh4eM7cnczDI1PM9TJpTijud9x++
 Ak1rbRyTu/8XaH2fA4sewtgenSulmJnveOmLy8p1XpZ5DLA1bLhwmot+4Kjo120GPN
 /c/59vYbriaR4UNXnnL9GcFShYFtuH8RAX+gofqw=
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH] Add implicit feedback quirk for RTX6001
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <822f0f20-1886-6884-a6b2-d11c685cbafa@ivitera.com>
Date: Fri, 3 Jul 2020 12:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

USB Audio analyzer RTX6001 uses the same implicit feedback quirk
as other XMOS-based devices.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Tested-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a777d36c4f5a..40b7cd13fed9 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -368,6 +368,7 @@ static int set_sync_ep_implicit_fb_quirk(struct
snd_usb_substream *subs,
 		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
 	case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
+	case USB_ID(0x0d9a, 0x00df): /* RTX6001 */
 		ep = 0x81;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
-- 
2.25.1
