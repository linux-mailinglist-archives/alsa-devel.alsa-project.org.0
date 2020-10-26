Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 092232987B5
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 09:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC3916BF;
	Mon, 26 Oct 2020 09:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC3916BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603699415;
	bh=SwhLJlPERI2K8R70/RXBxn6se2e+5GaUai0W8TCz0RM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J28M2VqIYhbS9wfjw0DK+445psN3Uf2DhRzwzNXnMq4m8+DQKFiJnbAxoYp6UhCG0
	 KFhk716SCgsORaR/4t6/14LOLzjNSuPwcl6+tQX42XBaQuzEDVxXji8I2oTQr54/ar
	 sgJJywbcNXr0XLW6kN79a9Qw42MnJ3p3ITbMF/uM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A2BF801D8;
	Mon, 26 Oct 2020 09:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB40F80212; Mon, 26 Oct 2020 09:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp3.cs.Stanford.EDU (smtp3.cs.stanford.edu [171.64.64.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4030F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 09:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4030F800CC
Received: from dn200on4g.stanford.edu ([128.12.92.144]:35838
 helo=trolley.csail.mit.edu) by smtp3.cs.Stanford.EDU with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <keithw@cs.stanford.edu>) id 1kWxRt-0002nA-BR
 for alsa-devel@alsa-project.org; Mon, 26 Oct 2020 01:01:49 -0700
Date: Mon, 26 Oct 2020 01:01:43 -0700
From: Keith Winstein <keithw@cs.stanford.edu>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom
 UAC-2
Message-ID: <20201026080143.GA145492@trolley.csail.mit.edu>
References: <CAMzhQmP+Y_=XpCueCxPdjG6rtYn+YhtRSeRkXkv5mJ3NWtxA9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMzhQmP+Y_=XpCueCxPdjG6rtYn+YhtRSeRkXkv5mJ3NWtxA9Q@mail.gmail.com>
X-Scan-Signature: 8e086a056c9d4443aaf3b84243aabc30
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

Here is the patch again without line-wrapping.

From 2c8d691d39ab2824c344ac2562a1e8605b3384ba Mon Sep 17 00:00:00 2001
From: Keith Winstein <keithw@cs.stanford.edu>
Date: Sun, 25 Oct 2020 22:05:47 -0700
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom UAC-2

Signed-off-by: Keith Winstein <keithw@cs.stanford.edu>
Tested-by: Keith Winstein <keithw@cs.stanford.edu>
---
 sound/usb/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b401ee894e1b..5723e8e69cf1 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -352,6 +352,10 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ep = 0x81;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
+	case USB_ID(0x1686, 0xf029): /* ZOOM UAC-2 */
+		ep = 0x82;
+		ifnum = 2;
+		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x1397, 0x0001): /* Behringer UFX1604 */
 	case USB_ID(0x1397, 0x0002): /* Behringer UFX1204 */
 		ep = 0x81;
-- 
2.25.1


