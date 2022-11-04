Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768E6192AA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F6E16A6;
	Fri,  4 Nov 2022 09:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F6E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667550046;
	bh=2Dgfm1r+t2ipdpy3BhF7pkkY+aU4FpWYQ4cE7/tE5h8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sqgNyKVVmyatxYLYE7JiOi9MJWA9e8piFZXEEtz8MVY+KjZCuehkkJyBQ18l21uyN
	 aqa1hwvSwRB+g9GXR/R5PnDHVbiOPrZ9qO2O5ChtdEOwzlBpkm2zPx/ZNT2BDl4LuA
	 3ti2VeRdBdRGA8wqBXQTDRFlx40dZc8JfeKwqQoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D90F805C0;
	Fri,  4 Nov 2022 09:16:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04298F80448; Fri,  4 Nov 2022 08:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C30EF80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 08:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C30EF80155
X-UUID: 1f4c790098d84c258246e053a3af6d50-20221104
X-CPASD-INFO: ae1fd406ff49445a8bea0bddb1cba13d@qrVrhpFmXmaShnaFg3eAm1iTlZFgjoS
 zpGuDko9hX4SVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3sKdrhpRiYA==
X-CLOUD-ID: ae1fd406ff49445a8bea0bddb1cba13d
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:161.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:99.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5.
 0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-5
 , AUF:1, DUF:7502, ACD:131, DCD:131, SL:0, EISP:0, AG:0, CFC:0.278, CFSR:0.087,
 UAT:0, R
 AF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 1f4c790098d84c258246e053a3af6d50-20221104
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 1f4c790098d84c258246e053a3af6d50-20221104
X-User: aichao@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
 (envelope-from <aichao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1062749013; Fri, 04 Nov 2022 15:35:29 +0800
From: aichao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: fix Hamedal C20 usb camero disconnect issue
Date: Fri,  4 Nov 2022 15:35:18 +0800
Message-Id: <20221104073518.120807-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:02 +0100
Cc: aichao <aichao@kylinos.cn>, linux-kernel@vger.kernel.org
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

For Hamedal C20, the current rate is different from the runtime rate,
snd_usb_endpoint stop and close endpoint to resetting rate.
if snd_usb_endpoint close the endpoint, sometimes usb will
 disconnect the device.

Signed-off-by: aichao <aichao@kylinos.cn>
---
 sound/usb/endpoint.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 533919a28856..c19e420b1780 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -825,7 +825,9 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
 		      ep->ep_num, ep->opened);
 
-	if (!--ep->iface_ref->opened)
+	if (!--ep->iface_ref->opened
+		&& (le16_to_cpu(chip->dev->descriptor.idVendor) != 0x0525)
+		&& (le16_to_cpu(chip->dev->descriptor.idProduct) != 0xa4ad))
 		endpoint_set_interface(chip, ep, false);
 
 	if (!--ep->opened) {
-- 
2.25.1

