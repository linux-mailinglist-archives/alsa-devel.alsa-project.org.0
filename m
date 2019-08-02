Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B17F63E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 13:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4171735;
	Fri,  2 Aug 2019 13:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4171735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564746915;
	bh=9nLQ+PJ/u27qaUwVcMt7qH/sMnPQa+M6uiPbZVRBcgo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNQ25RBmFU/BY6kmhoaKwrKmM3442KDWvHgg/O2QTy/1mwj1gkyabGAJdCafNZlbT
	 GjHvtdYlOcxQW83xXzWZ0WfJt9+E2QVN16KRIGH+bdYeZyQz8XOoKToj8pDXu3Dqgw
	 DU6tOxOyFdkUoDxW7XqBRsFXbU88Ahm713reuOjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61872F804FD;
	Fri,  2 Aug 2019 13:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8930F804CC; Fri,  2 Aug 2019 13:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kwaak.net (gw-fsck-sorbs.kwaak.net [82.197.218.155])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A29F804CA
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A29F804CA
Received: from [192.168.0.171] (port=59312 helo=lenny.kwaak.net)
 by mail.kwaak.net with esmtp (Exim 4.50)
 id 1htW6v-0006ye-JQ; Fri, 02 Aug 2019 13:52:38 +0200
From: Ard van Breemen <ard@kwaak.net>
To: alsa-devel@alsa-project.org
Date: Fri,  2 Aug 2019 13:52:14 +0200
Message-Id: <20190802115215.311-2-ard@kwaak.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802115215.311-1-ard@kwaak.net>
References: <20190802115215.311-1-ard@kwaak.net>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.168.0.171 (failed)
X-Kwaak-Spam-Score: -2.4
X-kwaak-MailScanner: Found to be clean
X-kwaak-MailScanner-SpamCheck: not spam, SpamAssassin (score=-2.116,
 required 5, autolearn=not spam, AWL 0.19, BAYES_00 -2.60,
 DNS_FROM_AHBL_RHSBL 0.29)
X-MailScanner-From: ard@kwaak.net
Cc: Ard van Breemen <ard@kwaak.net>
Subject: [alsa-devel] [PATCH 1/2] ALSA snd-usb-audio: Skip bSynchAddress
	endpoint check if it is invalid.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Linux kernel assumes that get_endpoint(alts,0) and
get_endpoint(alts,1) are eachothers feedback endpoints.
To reassure that validity it will test bsynchaddress to comply with that
assumption. But if the bsyncaddress is 0 (invalid), it will flag that as
a wrong assumption and return an error.
Fix: Skip the test if bSynchAddress is 0.
Note: those with a valid bSynchAddress should have a code quirck added.

Signed-off-by: Ard van Breemen <ard@kwaak.net>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 75b96929f76c..51a8faf25ed8 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -456,6 +456,7 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 	}
 	ep = get_endpoint(alts, 1)->bEndpointAddress;
 	if (get_endpoint(alts, 0)->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
+	    get_endpoint(alts, 0)->bSynchAddress != 0 &&
 	    ((is_playback && ep != (unsigned int)(get_endpoint(alts, 0)->bSynchAddress | USB_DIR_IN)) ||
 	     (!is_playback && ep != (unsigned int)(get_endpoint(alts, 0)->bSynchAddress & ~USB_DIR_IN)))) {
 		dev_err(&dev->dev,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
