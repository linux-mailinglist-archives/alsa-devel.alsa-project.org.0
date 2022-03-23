Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9714E54F4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 16:13:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD7716D3;
	Wed, 23 Mar 2022 16:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD7716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648048437;
	bh=MBf/nqKlsPzx2Jj0gyWOg8Zgpop045+eOcmz0lQt2Go=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BPDOh8Lv1Mpkw5KbVR6ilp+dyhE77ouSNGJCMqKHZFuTGPArTKEE3PzsRvxyr9ap6
	 qRim4GfQ3HefI6cYmvVPvT2Lseo+qK4BPjAcSDEa06hg3Uq11K+EzxiENCS4LW+FrU
	 p9BGc4C8RflV6LDQIllEZ7VqXhilUaTL0OJviFa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D96F80310;
	Wed, 23 Mar 2022 16:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D96ADF802DB; Wed, 23 Mar 2022 16:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A12E3F800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 16:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A12E3F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="zKeAmsqL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1648048358;
 bh=MBf/nqKlsPzx2Jj0gyWOg8Zgpop045+eOcmz0lQt2Go=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=zKeAmsqLsTJ156idLxF1gVh9fYfeyB6tvs6BKxSQ7+5y7HuUB1AyLSBVs0SnVYoVR
 6N0ZTxMNDaqe90EEkJXCs+9eZXtt2fKNuqyckflZvdqL9K1HCxuo+9qbSXsxlGX3ss
 nw0YoIha239Qsk2aNgG90zFIuvo7UNHb5xPc1+tw=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [216.73.162.201] ([216.73.162.201]) by web-mail.mail.com
 (3c-app-mailcom-lxa04.server.lan [10.76.45.5]) (via HTTP); Wed, 23 Mar 2022
 16:12:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-088ee170-01b7-4c6d-a7be-0d1f27095ef1-1648048358124@3c-app-mailcom-lxa04>
From: fenugrec@mail.com
To: alsa-devel@alsa-project.org
Subject: Re: realtek ALC1220 : recording samplerate 10x too slow
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Mar 2022 16:12:38 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:7x5kwVgoR2OsjasVC4uv2YvWRBGjraWMPag6FyCwd10GZG5mZruiWHtrjbKPDXP5U8bNu
 e9pd3PmsxRXafy86IsTRUJakWOK6WOJJ/h4Crl2As7WApZqGFw+IM9nzIycqU6NWs1cpfdXZHQpP
 eJi0817daBoeO5M+9arP+2IjMfrTLq93G24SdLYXnvKCymTIFGBVrRb1jRy7nRQ5Q1JBaI7FwXLl
 /J7lQbQjTug7uO38P/oBMGFREBEoBIOrQgdgwt9rvN+9g1U4rYf03l6QNCW/KF40VWe+PAK8gntN
 P8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:hVhCPNXNPnM=:Cts71lrSMZ6Zw7EsX20/VY
 uG8/chZm4mhGSH0N1ol3x1qqhGAybX1RMNvodfcB50UmzkDIMpnIOhZetmNia0ym6IUdVfHcq
 2cFGxIYCLgLgoTtNg5C/pNvqMjycPTRUSFukKzqaAFLNEGUD6zwPTLfM20yK6Ssp0qto8GnD/
 EBjyM9mLwH5iGyw3Sp0MLZqaFf7YUuEk0qTVgAZJtyQL3HwEFtibcRaT56zPv1EcEvag0zlyv
 1laHwblZh/83Q4hHsR4kEqXz/EdIGmfkG1BSkD9zqAEhLaYsyhnDQOhDTBjrXnTCtFuy/UvTV
 SOjeqgOJzFZybGi80mJ2gjoMVrE75chf/bpRimI02RzJ/oVZXc3FuTPhuw74UJ/32UYcKrpWo
 G7hW5lGWcEBrw4ZiqRpbBnnZ7jtipopjOYW2MP5qQ792BggHYJT8MO+bdvEL24W5L8/k6laod
 KdLZojykOmMwIcTGygGyNA4ZUr02mDW0lazkH6wNsp6A0zfyzC6gFH9QeqjLOTwC6phSvYZSQ
 TjR/koFGwUqMOq0xWVrlz7eaGi7d+HEmfTaQ/QPBsT5AGC18vepLcCA5EjibLPb7BH23vVWFl
 a1fH6S3P7d3otRvAWG3uon7qhYn0OB7dP4DhsQZfZK5j0SZshoJhu7Jan5fyHLa/vcsosznnH
 GhxpH0HkYCoIsJ+90uzx54y7m0NqGDwGv05mNIOcAkvCuv7Oz0KiQzT3CDstfhR6rxRkYo1X4
 r182ddscRFCvtbJv3woPPmkiDRWCALiMHuiedg+G+m9LC0DUTKnswf5cg3onZxC17TyvXqzk2
 CQ7fYJr
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

Hi,

> Does it communicate with alsa-lib pulse plugin?  Or is it the direct
> ALSA device access?

Ah, good question. I'm not sure how to determine that but looking into it.
Tried strace but I wasn't sure what to look for in the deluge of info.


> Do you mean that the sound from arecord gets garbled?

Correct : playing back the file just produced (arecord -f S16_LE -c 2 -r 44100 arec_44k.wav),
sound is normal until I started audacity, then the rest of the audio is 10x accelerated.

> arecord, is it over pulseaudio (with alsa-lib pulse plugin)?

Probably ? alsa-lib is installed and pulseaudio running normally, and I just gave default options to arecord.


> No, I mean the way to trigger without audacity

I understand. I haven't found a simpler way (yet).


Thanks,
Chris
