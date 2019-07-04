Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377E5F6CF
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 12:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84D2169A;
	Thu,  4 Jul 2019 12:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84D2169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562237292;
	bh=uJ/OAIxTCHwqt7QJHNBOO2SYGnA59TwhdAT4cym9ZvI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=keZSYbL/1QT3r/avDfY9Lk3YUGRBMUZ7cHYVhEWU54xkmX86gmQ71apu3mK8mDn4u
	 Gb1RF4Z7Q0Zvu+SSiZPD0Psm0Bkd9ahw9ZYBEEAoZaycMc7Sw1E1d+yE3RFH9hgzv8
	 x7OUIZULAwZiAI0xEbteKoDYq5/Z45knOJeDZ2jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D057F80110;
	Thu,  4 Jul 2019 12:46:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673EAF80111; Thu,  4 Jul 2019 12:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_NONE,
 SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bigv.stevens-bradfield.com (bigv.stevens-bradfield.com
 [IPv6:2001:41c9:1:421::187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9822CF800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 12:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9822CF800E8
Received: from home.stevens-bradfield.com ([217.155.37.79])
 by bigv.stevens-bradfield.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <jalsa-devel@jcbradfield.org>)
 id 1hizFt-00021e-Em; Thu, 04 Jul 2019 11:46:21 +0100
Received: by home.stevens-bradfield.com (Postfix, from userid 28283)
 id A98161C03F4; Thu,  4 Jul 2019 11:46:20 +0100 (BST)
MIME-Version: 1.0
Message-ID: <23837.55548.631053.741245@vis.stevens-bradfield.com>
Date: Thu, 4 Jul 2019 11:46:20 +0100
From: Julian Bradfield <jalsa-devel@jcbradfield.org>
To: alsa-devel@alsa-project.org
X-SB-DKIM-Status: none
Subject: [alsa-devel] bug in playing 6-channel sound
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

Some five years ago, the following post

https://mailman.alsa-project.org/pipermail/alsa-devel/2014-February/072265.html

reported a failure to play six-channel sound, that could be worked
around by setting the prealloc value for the device to various values
*other than* the default 64. 

I have just run into this playing a movie from my laptop (Thinkpad
Yoga X1, Intel HDA PCH sound card outputting through HDMI) running
Xubuntu 18.04, up to date as at the time of posting.

I see exactly the same problem as in that post, and the same
workaround works for me - I tried prealloc values 63,65,32,128, and
any of them is ok.

I'm a bit baffled that such a problem has survived for several years.

If any developer would like me to provide debugging information,
please get in touch - I have some time available at present, but not
enough to learn ALSA and debug it myself!

I will remain subscribed to the list for a few weeks to read any
followups.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
