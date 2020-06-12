Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055701F7736
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 13:20:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE47167D;
	Fri, 12 Jun 2020 13:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE47167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591960800;
	bh=BzIsKWxCrWi3C8ILcDGQjORvGXyRtog1riCL0CPgeIk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BdoWi6NF28Vhwy/f3yR4WlJT0syEv1h4DDUXKXDGMshk55Nk7RuyF+7RhyAZG5q8E
	 MijOrjoHZ0fXWq5Sd02NkIXM6xTObKjdpjuCRgZc2WMuu8VG4ZkpqFHgKwpTIv7SxC
	 RQNGRI8hvMbcKA5nzaMVtjhJpgdp1pTFuFCYwpJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB100F8021E;
	Fri, 12 Jun 2020 13:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E84F800CC; Fri, 12 Jun 2020 13:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from echo.tratt.net (echo.default.edsfctgx.uk0.bigv.io [46.43.3.208])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A223F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 13:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A223F800CC
Received: by echo.tratt.net (Postfix, from userid 1000)
 id 27B0A65EC; Fri, 12 Jun 2020 12:18:09 +0100 (BST)
Date: Fri, 12 Jun 2020 12:18:07 +0100
From: Laurence Tratt <laurie@tratt.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add implicit feedback quirk for SSL2+.
Message-ID: <20200612111807.dgnig6rwhmsl2bod@overdrive.tratt.net>
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

This uses the same quirk as the Motu M2 and M4 to ensure the driver uses the
audio interface's clock. Tested on an SSL2+.

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

