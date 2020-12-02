Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFC2CB261
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 02:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DEBE168B;
	Wed,  2 Dec 2020 02:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DEBE168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606872972;
	bh=m4RFUsaJDz8VKLryEF1YN3KFMUhIZq2WKtzMIZKIdRY=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F4Srv3CurNgECnqU0cZK+rRh3aCUeY4H7I97DJ68bRoQ0wwbcixNoTWQHsxan6wIs
	 wa7FNG1FaZUY62SSGwx5zwSqQ/bhR3yqJaaepfcwoo6uzOTj4V2QbM+uTFKJ3CNLqb
	 rqcIjS/VEf/ToKhU2INnBSAVNRz5BgRHjPYTAiL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EB5F80139;
	Wed,  2 Dec 2020 02:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF061F8016D; Wed,  2 Dec 2020 02:34:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from trustserv.de (server.trustserv.de [85.209.48.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF95F80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 02:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF95F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=trustserv.de header.i=@trustserv.de
 header.b="q7cmQuEx"; 
 dkim=pass (2048-bit key) header.d=trustserv.de header.i=@trustserv.de
 header.b="bu6VDEi3"
Received: from localhost (localhost [127.0.0.1])
 by trustserv.de (Postfix) with ESMTP id 3045F5F9DF
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 02:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trustserv.de; s=mail;
 t=1606872867; bh=m4RFUsaJDz8VKLryEF1YN3KFMUhIZq2WKtzMIZKIdRY=;
 h=To:From:Subject:Date:From;
 b=q7cmQuExaPMCeFsnBRLQjdhg2vL/hqTMJqb8pL+aVMgtWtvcKsmbgdh+5ELrGnHSl
 SNbbtzLRGWkZvzkKDDGuQTH2g3zOQGpd0ZUyBNaXk3llsBDnoQiFAz+2GHpirmoREB
 pUDRPmqIxoDmgWPKAXE1u3pSSRGZvlyFoRWGqNPaI01aDqIoTB+1EbhiOTgeDxl8ZE
 qsAbjgrO3LJLE8ZEpPW9f4OrsYmnKqMSDOwY3/WGMg4JuuulliS7ISDLcJm+6vXGfk
 Qpe2rD/Yt0PgpQRtm8Y4yvA7KLt/uKoRN3lU05++TmBD4Epmhix9f+GyN1tLJueudv
 /wO4NyAy60TVw==
X-Virus-Scanned: Debian amavisd-new at trustserv.de
Received: from trustserv.de ([127.0.0.1])
 by localhost (server.trustserv.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8IwJLclqz00 for <alsa-devel@alsa-project.org>;
 Wed,  2 Dec 2020 02:34:27 +0100 (CET)
Received: from localhost.localdomain (85-195-252-28.fiber7.init7.net
 [85.195.252.28]) by trustserv.de (Postfix) with ESMTPSA id D6FD35F815
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 02:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trustserv.de; s=mail;
 t=1606872866; bh=m4RFUsaJDz8VKLryEF1YN3KFMUhIZq2WKtzMIZKIdRY=;
 h=To:From:Subject:Date:From;
 b=bu6VDEi3OCwI1Ox+ks8jjUbHbD+rU3A30AlVM94of3kNjYtqmulOY+aG8OMpFXuv9
 j9wfjBcC1DtKfJ8aZiO6FGZRSGpHzvyvQAjeNQ5ww1wYH+XElsnHu3tNJMwD6xZwnJ
 3xmp/hUA855XjEdYTIMjfijc0jP0ONwKTNpqBpaA29mAAipRwLYJF4wvhCVk8ftanB
 S2pRKpmwqk9j1Ltezbl2BUKSbU/EeWyKxSwWD1Rd+gnJ2DTZiTUbsvNjd9Aee0Zgf0
 ymmJIyivkEtmvIGW0YiYqJHTQ9h/nJ6DGEzFK2hs1rGvtKoxfXp+nSmkwd1Z+X2jHF
 WOPeAKGLApcZg==
To: alsa-devel@alsa-project.org
From: "Oliver Z." <olze@trustserv.de>
Subject: Sound BlasterX AE-5 not working
Message-ID: <b61562be-cd10-acf7-b9d5-f9ff51d2d10f@trustserv.de>
Date: Wed, 2 Dec 2020 02:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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

Since a couple of month i am trying to get that sound card working.
First it seemed to be a pulseaudio problem but now it looks like its an 
alsa/kernel issue.

with some help from #alsa we figured out its the same problem as 
mentioned here: 
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/935

with everything connected:
 > jacks_do
card=0
card=1
numid=51,iface=CARD,name='Line Out CLFE Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=49,iface=CARD,name='Line Out Front Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=50,iface=CARD,name='Line Out Surround Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=48,iface=CARD,name='Line Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=46,iface=CARD,name='Mic Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=47,iface=CARD,name='Mic Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=54,iface=CARD,name='SPDIF In Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=52,iface=CARD,name='SPDIF Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=53,iface=CARD,name='SPDIF Phantom Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
card=2
numid=25,iface=CARD,name='HDMI/DP,pcm=10 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=31,iface=CARD,name='HDMI/DP,pcm=11 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=37,iface=CARD,name='HDMI/DP,pcm=12 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=1,iface=CARD,name='HDMI/DP,pcm=3 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off

line out jack removed
 > jacks_do
card=0
card=1
numid=51,iface=CARD,name='Line Out CLFE Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=49,iface=CARD,name='Line Out Front Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=50,iface=CARD,name='Line Out Surround Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=48,iface=CARD,name='Line Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=46,iface=CARD,name='Mic Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=47,iface=CARD,name='Mic Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=54,iface=CARD,name='SPDIF In Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=52,iface=CARD,name='SPDIF Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=53,iface=CARD,name='SPDIF Phantom Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
card=2
numid=25,iface=CARD,name='HDMI/DP,pcm=10 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=31,iface=CARD,name='HDMI/DP,pcm=11 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=37,iface=CARD,name='HDMI/DP,pcm=12 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=1,iface=CARD,name='HDMI/DP,pcm=3 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off

and line out plugged in again
 > jacks_do
card=0
card=1
numid=51,iface=CARD,name='Line Out CLFE Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=49,iface=CARD,name='Line Out Front Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=50,iface=CARD,name='Line Out Surround Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=48,iface=CARD,name='Line Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=46,iface=CARD,name='Mic Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=47,iface=CARD,name='Mic Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=54,iface=CARD,name='SPDIF In Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=52,iface=CARD,name='SPDIF Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=53,iface=CARD,name='SPDIF Phantom Jack',index=1
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
card=2
numid=25,iface=CARD,name='HDMI/DP,pcm=10 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=31,iface=CARD,name='HDMI/DP,pcm=11 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=37,iface=CARD,name='HDMI/DP,pcm=12 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=1,iface=CARD,name='HDMI/DP,pcm=3 Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off

i would love to have this soundcard working.
i had to buy a cheap usb soundcard now to get my headset working on 
linux (fedora 33).
on windows it works as expected
