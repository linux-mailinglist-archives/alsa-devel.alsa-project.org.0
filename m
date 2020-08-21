Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012522516FF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 13:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A447167D;
	Tue, 25 Aug 2020 13:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A447167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598353394;
	bh=ISqN7tZAadw9hm4wMGcxdsLAulmPd7eLzSPyOJdAqAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i7c+x6kNBPuTlqnOLoUB8H17L2crCcWUo99PZZZ4CkyRKKww2TTvkvj6cZv02ipWf
	 WxWxc98loTuqSJKk/1jhg9X339iWctNc9K0sulUj6wy1hBmDH6kiYHGw/90IuIRxeQ
	 cOnps8EBY3EsJxuf88kbfITj5ge72opKP3pJk/2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A35F80260;
	Tue, 25 Aug 2020 13:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C11A2F80218; Fri, 21 Aug 2020 20:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0F83F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F83F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.b="m66ObSzr"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9E67316005C
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1598033906; bh=ISqN7tZAadw9hm4wMGcxdsLAulmPd7eLzSPyOJdAqAc=;
 h=From:To:Cc:Subject:Date:From;
 b=m66ObSzrf74p9BN4PD9kRDlWYH56lF47NUGORSxsmq+1C+cGHwb8rlOhYGD9hXUXe
 5Wx+LPEqHs3kqv/AbX9cAXpgGvhwU5rY1lMvEHqzu2MR6AYgeJ6jW5zpRV8EP84g11
 /ZfoCxXO4xKJSifr+tBexQHKKn1i7SleoN5ECuiPGdBXfW+GIEQL1QK7KRa+Mwu21y
 zaxdDSdQs1XHGamKtu30YT4Qqp9gNT7A8YW8g7LM8o11yfK0QAGjwZUA9MYMCa/rFs
 Db+Zn5oao2lxoZRqrTfNGUWaPESFJ0Y3+UiJfJXsNLW4GtJtGqJLOCm/nUyrtUN4WN
 HC2/5Mk2nahPw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4BY8sG14K0z9rxP;
 Fri, 21 Aug 2020 20:18:26 +0200 (CEST)
From: Joshua Sivec <sivec@posteo.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add implicit feedback quirk for UR22C
Date: Fri, 21 Aug 2020 20:13:10 +0200
Message-Id: <20200821181307.5049-1-sivec@posteo.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Aug 2020 13:01:32 +0200
Cc: Joshua Sivec <sivec@posteo.net>
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

This uses the same quirk as the Motu and SSL2 devices.
Tested on the UR22C.

Fixes bug 208851.

Signed-off-by: Joshua Sivec <sivec@posteo.net>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5600751803cf..10d342270dd9 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -369,6 +369,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
 	case USB_ID(0x31e9, 0x0001): /* Solid State Logic SSL2 */
 	case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
+	case USB_ID(0x0499, 0x172f): /* Steinberg UR22C */
 	case USB_ID(0x0d9a, 0x00df): /* RTX6001 */
 		ep = 0x81;
 		ifnum = 2;
-- 
2.26.2

