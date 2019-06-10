Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FF93C843
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:11:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E108A16EE;
	Tue, 11 Jun 2019 12:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E108A16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560247914;
	bh=ialmlRZTFKM1v//Lg2IxcyTwBsw1osdw017ElaqcaxU=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bK7tasZ3CIjC60lZJKstPJ4h9DezIGsyqB03hmL+WMCTsrIwFgEZ/cVzRJXrZLWmo
	 R8jB6JlqLDmtJZpRvwRn/d0rksYxou+0wgSbx6+pUHtMA8u8jQzZKjpJOhlO99eQ95
	 rdJSA+iO2LfN9yvVlyPUizyQsKq6Gh5K01XDjLIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B10AAF8972F;
	Tue, 11 Jun 2019 12:09:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A3BF896CE; Mon, 10 Jun 2019 11:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp.hora-obscura.de (hora-obscura.de [213.133.109.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24793F896C7;
 Mon, 10 Jun 2019 11:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24793F896C7
Received: from smtp.hora-obscura.de (localhost [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPS id 38306AF824B;
 Mon, 10 Jun 2019 11:51:47 +0200 (CEST)
Received: from ada.local (ipbcc14466.dynamic.kabel-deutschland.de
 [188.193.68.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPSA id DFBA0AF801E;
 Mon, 10 Jun 2019 11:51:46 +0200 (CEST)
To: patch@alsa-project.org
From: Stefan Sauer <ensonic@hora-obscura.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ensonic@hora-obscura.de; prefer-encrypt=mutual; keydata=
 mQGiBDiW1zARBADnMiXRu0ZRcbWAw4NefyeZej5pRX/mzBAvplIhAeJ5vA0zfzd3aIyAxYv1
 iA+/p7QwGVAMZ9Gio8ZLvgfDYjrHbez7Bc4TWuTck6hmQAIBI7ptyWhOrePMiQ8b4yN8KP7I
 PoJHBpC0jLbuwmwC+/2yQPT4V9AQ+Unqe8xvuBJczwCgnAo6JpYIZDpy/vt4soFG3o38OrME
 AOPzt7SdyuzVp9w3mO/2XCzyJcn1fpUGlChbljayKvrDvPJEZtm5d65zBV6iYSSpF8GtdX1q
 znSF5siMSvF7DljZT4oIDqYTJAEZXDYYM7aYyTXeZ1hk9YoiRaMiT84AvQRvQVwYUqlygNMO
 q14zkcdhSpk5i1HDum+i1/T/RSFDBACcpdlqjvg4AoMbyf9UNr/tmfcITEKkLkYtPzmF4DIK
 Tqbq+FgqB5ltPPgTffJ6yWfTQAt1dr+XZeivdgyCX3bo6784rtOc7/ICjBdOktKj6zb88tPp
 kYw16Fr5OcNollJxm+/pY+JXwAl5IsbN3ysoBuBOBbu+pAC1Py39D/+af7QvU3RlZmFuIEtv
 c3QgKGVuc29uaWMpIDxlbnNvbmljQGhvcmEtb2JzY3VyYS5kZT6IXwQTEQIAHwIbAwQLBwMC
 AxUCAwMWAgECHgECF4ACGQEFAkKMY0QACgkQITDA+qr9gcydpwCfbGuNpfw+hge7Xcp9FerJ
 35fMMY0An0vvOJG3ORIUHE1VvfoC0ITb6heFuQENBDiW11IQBACUp8q45lLmzHujYh7w8fd4
 cjkb57oScfcD+lliCOmKHZOxRa8Ew3ULtgSze1JPnDT6a5jgnxMKPIHjqlTCpEyTxcMHOi3L
 8BBft2YzdB3cLnrMXx1mPU//vkT93VOnXTFjxKbMEK8OHSh+JpzgySjmXfwVfn/EiyXkroEV
 Lip92wADBQP/ej1uwM//zfKumDRJskyMCOfSAUfwRZhHkLWPvBQfPgUqdU7NcYACItAFVbIK
 tSES1Vd3L0kbBtnygCf4SwGMRARUALipof4DxVMxaK46igLGC+UkiTz8swUV/81+EUfKEqdd
 QjRv6Gp7VZSDkv4sBcjIMydr8o2Mc8P/ByKvUPWIRgQYEQIABgUCOJbXUgAKCRAhMMD6qv2B
 zLilAJ4jS2hqfeEbZxvmr1+0FxBx2/x9CQCaA5vugvJQg8PXRT7ScAnoGgCf994=
Message-ID: <9f5efc6f-5256-6a2d-d095-fcb4b6eabd46@hora-obscura.de>
Date: Mon, 10 Jun 2019 11:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 11 Jun 2019 12:09:18 +0200
Cc: outreachy-kernel@googlegroups.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Enable .product_name override
 for Emagic, Unitor 8.
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

From a41303935608e9a98653d4dff1e10baf1ce07e05 Mon Sep 17 00:00:00 2001
From: Stefan Sauer <ensonic@google.com>
Date: Mon, 10 Jun 2019 11:26:53 +0200
Subject: [PATCH] ALSA: usb-audio: Enable .product_name override for Emagic
 Unitor 8.

The Emagic Unitor 8 does not provide iManufacturer and iProduct fields
in its device descriptor. These fields are used by alsa to make build the
device name. Thus uncomment the .product-name in the quirks-table.

Without this change the device shows up as 'USB Device 0x86a:0x01'.

Output of lsusb and amidi:
https://gist.github.com/ensonic/7820a102e91f31575be355da2b6b33bc

Signed-off-by: Stefan Sauer <ensonic@google.com>
---
 sound/usb/quirks-table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 9e049f60e80e..e918ce346027 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2408,7 +2408,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	USB_DEVICE(0x086a, 0x0001),
 	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
 		.vendor_name = "Emagic",
-		/* .product_name = "Unitor8", */
+		.product_name = "Unitor8",
 		.ifnum = 2,
 		.type = QUIRK_MIDI_EMAGIC,
 		.data = & (const struct snd_usb_midi_endpoint_info) {
-- 
2.21.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
