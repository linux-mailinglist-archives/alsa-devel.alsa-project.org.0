Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AB1F6910
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 15:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2381689;
	Thu, 11 Jun 2020 15:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2381689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591882271;
	bh=I4o+0l4oJ5JHZfFJX+mlz0nQDyWjKtHkGdwy2+Se04c=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ss41AyzCs3pyS2Li6Mvts6vdPO6DOAagck8jWAj1Ic5m7wseJ9VM0VyjuOJtGm8C9
	 RtlvESll36/H3ROoc3cjkumbs0dZ6UVyzWrypE/s3HBNpZFOMUxuGNqqXnsAMLZxVG
	 15AhKlwJnvon6LPwgS/rYAjZBtTenGaa/Q+W8JDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE814F80058;
	Thu, 11 Jun 2020 15:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9519F8028C; Thu, 11 Jun 2020 15:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from echo.tratt.net (echo.default.edsfctgx.uk0.bigv.io
 [IPv6:2001:41c9:1:420::208])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3113BF80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 15:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3113BF80058
Received: by echo.tratt.net (Postfix, from userid 1000)
 id 5F30E65F0; Thu, 11 Jun 2020 14:29:17 +0100 (BST)
Date: Thu, 11 Jun 2020 14:29:17 +0100
From: Laurence Tratt <laurie@tratt.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add implicit feedback quirk for SSL2+.
Message-ID: <20200611132917.g3w2e5opwquacvzq@overdrive.tratt.net>
User-Agent: mutt
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Signed-off-by: Laurence Tratt <laurie@tratt.net>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git sound/usb/pcm.c sound/usb/pcm.c
index 8a05dcb13..84c0ae431 100644
--- sound/usb/pcm.c
+++ sound/usb/pcm.c
@@ -367,6 +367,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ifnum = 0;
 		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+	case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
 		ep = 0x81;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
-- 
2.27.0

