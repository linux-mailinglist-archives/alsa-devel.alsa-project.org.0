Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F34E3287
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 23:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96BB61702;
	Mon, 21 Mar 2022 23:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96BB61702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647900443;
	bh=mIeaODzSwCKNOzPLJa5XnZI07OoJnccKznJ+R07CqMU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uifsqa3uIc/wLyYG76YNVc2kRTQSysHDvIq+12SINSTPDlZWLFzz3nIxW5OOOZsnH
	 1UHtB71uGFg4aXdBHG8JLTuQWSUpGCepRjQz2g3FyWRwJ9LhHIU+3113aGMGosMDCG
	 Q/6nBi5tjMt5b34kSI8L46h3t+tweDAFmlSeI/7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0897CF80238;
	Mon, 21 Mar 2022 23:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A46BF80109; Mon, 21 Mar 2022 23:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F367AF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 23:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F367AF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="J/FROqi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1647900365;
 bh=mIeaODzSwCKNOzPLJa5XnZI07OoJnccKznJ+R07CqMU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=J/FROqi7xIAJCkuHXO6G7j5WbuYAVLzqfAe8q+x3kueSJlolO/uQ3eARLl+lgr4es
 T3Xp/ukqrhzVrVm7dtpeZDue4+XFvRAzE5EbkRHv2kvCqtv6RzrqDYzrZYV6om/MPj
 HkeMp5/uhTXlbP3RxexXaHOThsosNPK3X3DjcC0k=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [216.73.162.172] ([216.73.162.172]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Mon, 21 Mar 2022
 23:06:05 +0100
MIME-Version: 1.0
Message-ID: <trinity-f386fb16-be7e-453c-ab20-f31fa9945c46-1647900365787@3c-app-mailcom-lxa05>
From: fenugrec@mail.com
To: alsa-devel@alsa-project.org
Subject: realtek ALC1220 : recording samplerate 10x too slow
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Mar 2022 23:06:05 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:gBIqy4NYfMwE1YNixprGSliS1beOdgZlMlqgYwcNWE1fn/4sQVFgPh9FjmPJKxlIpbNlN
 uyLHwWAPOP0OUD5J5F8+66uN8iLPOgVLQThu2c4t9fqAy88VlGthA5TM4DGd97gti1pkTiGF+NPp
 5v1hQ8xyOiq5WVaDBDC6OTc28H6i3+S+R6+CMLXKsI26+yQZl1Ew7J+Cok995W3qT0BhFGdcp7Vb
 onZImRInTnyqR4CCfncuAggh+0iFxhY4jQghT764Xve+kZkrxy3P8l96WZpR0H1VpElhgPqxWrPO
 WQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:D95CJAwV8FM=:Lrj+NgDuCKWMyQD7+HMyq7
 UKSmu3rOIWcryACv1yf6vWeO3gbWcftUlWdAQi6sPXBxKQpVlw0lEiAegP+ERbsqcOa4azO94
 BQ5/DXpd6jtmbqtZhIGOi5HMEJVylM4SEkSPJygNjvdlbfHeJMU6KwCD+MBeGB8tolNmYeZ6R
 3H5q3O8Xq53BNv6sIuLucpGg6q6RqjzG4gGfzB7UMbioAJ5pkUufX2gysfQ+I8nkh2IUM7IKv
 mSsWknRkJpx2ZtCRurn6fxNx6k95Ay72m/QVQAwX+EHyRdjsdbcEnSMXHuqTBDDFVcDybXIZU
 laBNV+aByBq/nErSEUg+5w7A3UVRoXo+XnKtG0dilWbaa0Of/4NopBueaeiWb6HOUxHbPYZ1R
 FWQHR2fExOG09Pm6palo7M1UYv2aI1k5ae631yKYQxHSEmS0HpTx2Bn+e/npWhd0bqzP9/o3s
 f1+O+0rFRSyxByd1s9716tq6N+UfpRwmrLWMXuDuj96wRNimbfngI/16MvdzYiBUn0OU3qxDn
 u67MthbkaPMPUeEbKv3LoR3s4S5aUYGXc3O28iQvVTBKyPjX0Rtk44pLmtfDDyreFdDOM2xl5
 VvHS2szi+pR4zyfcAohO3RIcG6blo8D8hs0g+TZe/qzFZ0470uDaRKf9iPR/eaYVeqmQV+cgJ
 5/Lkb2BUS5URq5kZ1mZNb9eBbxASCdslwDbs+uwH73dtq6ASlLxg0jfKG1Ku6Sozc7gwQ6dEi
 OfV92rpbCX9jXEqRS9RtJOi8/Rt7hYktrZ3jpUbdTHD1v7yqfyBKg/7sTIHVE2xAyPAMhO4gV
 TXefGvB
Content-Transfer-Encoding: quoted-printable
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

[resent from the correct email address. Sorry !]

Hi,
I was redirected here by pulseaudio maintainers for an issue I thought was=
 at that layer :
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1344

After a fresh reboot, arecord / parecord work fine, and the level meters i=
n pavucontrol react normally.
If I start audacity, the card gets in a state where the level meters becom=
e sluggish, and recording either drops 90% of samples, or records approxim=
ately 10x too fast.
Playback is always ok, unaffected.

I cannot fix that state other than by a reboot. The obvious "closing audac=
ity", restarting the pulseaudio daemon, have no effect.
Tried kernels 5.15.24 and a recent 5.17; same problem.

I posted some detailed debugging info on that pulseaudio issue tracker, as=
 well as pastebinned alsa-info.sh output here:
http://alsa-project.org/db/?f=3D7ee784003379252acfef25de5fecbdfd559fe342

The problematic hardware is Card 1, Audio device [0403]: Advanced Micro De=
vices, Inc. [AMD] Family 17h (Models 00h-0fh) HD Audio Controller [1022:14=
57].

Test command :
pasuspender -- arecord -D hw:1,0 -f S16_LE -c 2 -r 44100 arec_pasusp.wav

Here's an example recording of me saying 'test' :
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/uploads/5a51081fcd55e=
cd705df258c1a0fd2b6/arec_44k.wav

I have no ~/.asoundrc or related files.

Anything I can try to narrow down the cause of this ?


Thanks!
Chris
