Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9EA57B1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 15:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EECD316C7;
	Mon,  2 Sep 2019 15:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EECD316C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567431276;
	bh=GKCWWDPt5OOmMmTE9aCeDOkt4vQn6v+kPTAPPWwBxnM=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Awcp14D20ENJ7X0hJ5FqrYqcJfMAisfxrh3dW32zcFysqchverRPLTjR+EilWPfy+
	 0yvZqutLFdpUVFMzuQDAQkp3aEkreaPTaO3E7TfusvKQFi0C0c8iG2qQyCH2n+UbWq
	 Ydl8X6X7iqGJlfrpfdSWo4Fqphw0a7K+OFPxRTmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F110F80394;
	Mon,  2 Sep 2019 15:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFDAF803D0; Mon,  2 Sep 2019 15:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D7BF80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 15:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D7BF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="AcL24pMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1567431161; bh=/eLG1yRjpn+E+xG75VyEiFWN5l2e30j9Ls2Cu3d6BII=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
 b=AcL24pMSKTBXfZllsyrltHuh04m6GfTdgHvB/hWLqi3A4XUX57rsFRfR/ITrnytWqSc2W/p5nFzabtXMMt5qv0HNOw1PH7Jhvq56PweiDuJ1MPdhDoJ5BpTLD1+07HPGj/wJkFUfEvLaSwWxct3xRDRRgsINkZrTAVUbCpxx0B9tm1IgAD2RwdrvgngRW9sLhSeeFhnrOsSDscoOlJAgXiZrR49mHmz2D5JJW7qgeBuDLxLV2X5JVNf6xLqdZ2BtDbldeyWyHNT4SL/5ugdZ3V+NohhX+xa0PJ46E7muhu7XJRV+k86lIOS56rjkz7WrNpPtgKbUaAEUCWhIwS6mOg==
X-YMail-OSG: zH2N8ZcVM1mhAy1FKrs4IikWt7YGZap7a7fMxYdsrxxs_REM85HYr7bNQPwkTAp
 Q3MV.7BBXR4c0j_Oz7kaqm__E1gN4mUISl3mvOeFe1LmTTFVTLzZIagpz_Wk452XZMVyccpRKn5K
 bDFPmBs7yusCagdfon0fn6SlrK6xXJumh9B84qjq3op1KQh9OPxAVg3Q_BhvVrvr5C37MBOejMdR
 tAFQSlgZWhVYym0h3P_FadDZh_nJzFI8iNMrc3bS5rlL32v7Bmw3dahnN1fDpVDI57NR738A0Bds
 jPyl2zHdtNgw2rYqAAeCYd35bMhsKQvM.P8ps6a8Vs.cmQWn5VaT9n9d0XWjCtI8c36QD1YGybi7
 aAdAQeUaLm1Eg56vfPuNgx4p_6lW8CZMw33qUdrPox4t3XQrYjIhbhJO19PLDU7xmWI.Tvg_u0.V
 T.iRQXhYM0hER_Kn2YbWugtq3op1Ga8RkAXyYBoxs85GjFcHBbqgqeqq5nZzrdx6bXt45SnoEp9D
 xFS4q9yg2q19V1CNr_kBFspPyYats7IYXruCdUrIjCjwsqUFip06lO4cK67Sj9EOK9zR2pyC_yFR
 A63XjgDBaKjOrJlPV6wuhhb3zm8hKGjnTlqPlUI9VM9RmMliJAaTLxrfTffW6RHpO3R6_bFgr.j1
 6BSlqY5BwgGLczxjq3sm7GE6QLF6i36XDygA2vkeCa4opDhV64BxsOsy3NADAuqSwTYUClCG0Eyo
 0jx8IO1v6XcG1Ixne6t2m3htiwB.h3kHjJKq77dCL4ztEarjvJZ9Byd4YGtXheL4A8GJqCkJOWJE
 gWqMir7sRqDUbXbVD3PTRM7Y_EdlKPNC4TpCc8EIMAPR7M5AJNEhDj1UNYumfSdhQKjZm8XP7za1
 8bbtz8XBef5EeKl5gzuCK92w3DcH3zMcpAkk.9PuP8ZhCev1ZUiZ3BnM6Uv_LR9qvAANeJt6VlEs
 lJBx1MfoBqch1vi9PN33NHo6jSJmEB1TZagYeMCn0HrV2fKo0I.J5Fm7gmgPuBoEqLZUcRGT_70.
 kzkE9eUv4ArqYLLZwwWfRTUzH5_PdshaFYJjX4vDbtSz2fMuUqZE909w8aU_QfbAt217A8rNWCwC
 M.F6JNuk3tszyPjTzWI1b40E10Xdxay26zi7IQ5Ybl2eh6_wTf4daoFcBGLzNu8igvmkxu4F7Bqr
 Y8NeCBHVXZ81ixftcXTMun3ucNpuaXly7O0W6Fqojhd_Le1W2hRfJ_MNv69KsojyStuL6Gfcz0KJ
 TfKgTSpLiBPIxA_HYQgRrbNa2SmZq9XjLWc63VUyw8kcCQGMuSUEG8l1f5cXuMoAEWRF7TA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Mon, 2 Sep 2019 13:32:41 +0000
Date: Mon, 2 Sep 2019 13:32:36 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <2107056110.1891562.1567431156568@mail.yahoo.com>
In-Reply-To: <mailman.2517.1567429580.5742.alsa-devel@alsa-project.org>
References: <mailman.2517.1567429580.5742.alsa-devel@alsa-project.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] sound/usb kernel modules as a DKMS package. (Re:
 Alsa-devel Digest, Vol 151, Issue 10)
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 > Date: Mon, 2 Sep 2019 22:06:07 +0900
> From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> As a quick glance, the repository is just for deb-based distributions.
> >From my experience, users who eager to use the latest source codes tend
> to use Arch Linux and Gentoo Linux. It's helpful for the users to
> include some instructions just to use the code with DKMS system. Then
> you could get any feedback from them as well.

Yes, that's correct. It appears that the "dkms mkrpm ..." functionality is not on Ubuntu. I am mostly a Fedora person privately (Slackware before Fedora). The Ubuntu thing is a work-requirement. Have never used Arch nor Gentoo.

I'll see if I could get it done on Fedora too.

The dkms packaging is mostly done for junior colleagues - I had removed all of work-related material before posting, so it is a bit bare at the moment.

> For your information, I maintain out-of-tree codes to develop ALSA
> firewire stack for a couple of years, as you start:
> https://github.com/takaswie/snd-firewire-improve

Yes, thanks. I came across that, and a few other repos which try to package up other part of bleeding-edge sound driver code (like HDA), but not sound/usb yet. Hence this posting. 

  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
