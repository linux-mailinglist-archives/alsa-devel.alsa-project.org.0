Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C138517F2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 16:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C3D86E;
	Mon, 12 Feb 2024 16:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C3D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707751792;
	bh=spy70HfjoheqAjWploJYPJrRSAN4AXykUGUgKoklCc8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ROe6cjxifOSCXo7IECKNb3MhMQ0WVEtJmq5vbVugyhQnXGboK/hwZD09xm10C4oVm
	 fZrjHST5NoHd5xZ8IYESJoFP4NUO9+LY4uPPl2k40P0JjLn/7NodBHv5J6B1lc8fM9
	 uQCkThtMjb6PUJI54IR3NfHMeSPhM4Jja0wFaXMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBF1F80587; Mon, 12 Feb 2024 16:29:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FFBF8015B;
	Mon, 12 Feb 2024 16:29:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2097CF8016E; Mon, 12 Feb 2024 16:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB215F8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 16:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB215F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=Pxkb/jWE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yUpIoVx1qo/FtfUPPy1ERNngaKI9xiKtsIUKmgw0teU=; b=Pxkb/jWERnVbCQtZNIMSGMidTq
	mbmODKjEWysQcHkMkFbStR0cSVg8djSN6A0Ao9wG9XDXJ7Y+gTFrWGm02NFSF7jMQ8pMl0wNcICUB
	Ov0ZQSwAv3b4tbna+y43S1xZsw9ms5D8FDCDxstcwx/bbo926fRBDcwWQ2aOvU9aUhiY=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZYEt-00000001IST-0T4L;
	Mon, 12 Feb 2024 18:28:59 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-usb@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH] USB: Always select config with the highest supported UAC
 version
Date: Mon, 12 Feb 2024 18:28:48 +0300
Message-ID: <20240212152848.44782-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru
Message-ID-Hash: JL6UJ3U6PHSWD6WA7ZXGOFSUAAAFBK4T
X-Message-ID-Hash: JL6UJ3U6PHSWD6WA7ZXGOFSUAAAFBK4T
X-MailFrom: puleglot@puleglot.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JL6UJ3U6PHSWD6WA7ZXGOFSUAAAFBK4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Config with the highest supported UAC version is always preferable because
it usually provides more features.

Main motivation for this change is to improve support for several UAC2
devices which have UAC1 config as the first one for compatibility reasons.
UAC2 mode provides a wider range of supported sampling rates on these
devices. Also when UAC4 support is implemented, it will need just one
additional case line without changing the logic.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index b134bff5c3fe..8aeb180e1cf9 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -48,9 +48,16 @@ static bool is_audio(struct usb_interface_descriptor *desc)
 	return desc->bInterfaceClass == USB_CLASS_AUDIO;
 }
 
-static bool is_uac3_config(struct usb_interface_descriptor *desc)
+static bool is_supported_uac(struct usb_interface_descriptor *desc)
 {
-	return desc->bInterfaceProtocol == UAC_VERSION_3;
+	switch(desc->bInterfaceProtocol) {
+	case UAC_VERSION_1:
+	case UAC_VERSION_2:
+	case UAC_VERSION_3:
+		return true;
+	default:
+		return false;
+	}
 }
 
 int usb_choose_configuration(struct usb_device *udev)
@@ -135,22 +142,28 @@ int usb_choose_configuration(struct usb_device *udev)
 		}
 
 		/*
-		 * Select first configuration as default for audio so that
-		 * devices that don't comply with UAC3 protocol are supported.
-		 * But, still iterate through other configurations and
-		 * select UAC3 compliant config if present.
+		 * Iterate through audio configurations and select the first of
+		 * the highest supported UAC versions. Select the first config
+		 * if no supported UAC configs are found.
 		 */
 		if (desc && is_audio(desc)) {
-			/* Always prefer the first found UAC3 config */
-			if (is_uac3_config(desc)) {
-				best = c;
-				break;
-			}
+			struct usb_interface_descriptor	*best_desc = NULL;
+
+			if (best)
+				best_desc = &best->intf_cache[0]->altsetting->desc;
 
-			/* If there is no UAC3 config, prefer the first config */
-			else if (i == 0)
+			if (i == 0)
 				best = c;
 
+			/* Assume that bInterfaceProtocol value is always
+			 * growing when UAC versions are incremented, so that
+			 * the direct comparison is possible. */
+			else if (is_supported_uac(desc) && best_desc &&
+				 (!is_supported_uac(best_desc) ||
+				  (desc->bInterfaceProtocol >
+				   best_desc->bInterfaceProtocol)))
+					best = c;
+
 			/* Unconditional continue, because the rest of the code
 			 * in the loop is irrelevant for audio devices, and
 			 * because it can reassign best, which for audio devices
-- 
2.43.0

