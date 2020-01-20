Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CC142EA4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 16:19:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38D71672;
	Mon, 20 Jan 2020 16:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38D71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579533565;
	bh=ho7ibkZAEMym0YBohVeFfgR4FjPF5fXZBDXNas5qce4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnoelNFOcdci8ApCegIwLom94qWCVHZrE4k63M+IEYEPK6yyqGHh8iBKJocICxxEp
	 Yao56sUXjXPHpSa8ROtGudUhpOHUFsusGoLx7s7Jxblk5kM5g18HODn8c/hLzyyQ9Z
	 pn/6Nv7hXwUD1fz5Xqutqf0EDPQKApdbMuCz7r9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BFA2F8022D;
	Mon, 20 Jan 2020 16:17:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A89F8020C; Mon, 20 Jan 2020 16:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDE81F800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 16:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE81F800C6
Received: from [192.168.178.21] ([77.1.123.245]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MX00X-1j8g3X2yRF-00XHlE for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020
 16:17:30 +0100
To: alsa-devel@alsa-project.org
References: <CAHXb3beWDCNvpRPTt7xahBvhRDaZ2bYL3dBH0QSXjgxXXs=VWw@mail.gmail.com>
From: Jens Verwiebe <info@jensverwiebe.de>
Message-ID: <a3588f5f-b9b2-b622-7f9e-b9d472d88907@jensverwiebe.de>
Date: Mon, 20 Jan 2020 16:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHXb3beWDCNvpRPTt7xahBvhRDaZ2bYL3dBH0QSXjgxXXs=VWw@mail.gmail.com>
Content-Language: de-DE
X-Provags-ID: V03:K1:29QLiehuJYXA2L4MdxeSV2o/tgeQ93/VfEdoUPQbwo46BQU/s7x
 l6/Po2vStrzLCRorVkTKK0oU6lJNyNSCpJ2gzzFNlwhjqLmZ+ommoCBWCan29ILuJipYXH9
 85f7dqVe/1Eehp16UGN0LAXe9VaagFgcWW4rRxUQGdJVL/eKaC7VkAoO/sVjKZW3tNNEdR0
 KLDLjn86eUfcts/bo8g4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uT+Xf7ct58U=:Os/+OxB7JrwRibmLKHMx4S
 dbRxVTRaUl/65KNsqwq+cCRROe+xR+SVoKcRpzX/jYMdkGLvaR9chH9oqUG2ZKuSlGhFS3SeX
 PnzN0QFd3sr3VkHAFzUPlB9FdPnn4F3YHefb9uPU4m+XHCS/I0MSD3o5VwH8tMsfTnc0S0BVJ
 2BBEHW5n+BB/e/pNwiiVJjn71Rb3RO3BMC02r1tPmYyQLlpskkGOfYfKGEjCaugTKCISQhBFO
 AQGQFQWNliUrtZYS5ekQuwourgidJuRKVaWUfLuuxORoLyUe3phCxuwXGWOrYCLd2YitJhdHs
 daEe5Pxvh3DfHTzkon9KZWGKSzHDNjPUAdyA8694Gq87VPJxHiA4WVn9BwHQEBiqgc3LML2e7
 xu6tcXw/d7S0f0VsNMANd/4SPJwWI3gZpKjKtZxgQlFys+2UWTXebNivuSE3Kifaw92hspu4J
 DyarMa9Iw57w87e4qsDcXB3Ewl1+orXF2JOrhT4nSTPxVqtuYWNT1KNxpLa1iDE/pJRF0DyEu
 1yt5vUc1IiCKz6Kde+bHlb7jIAB80IM6ka1KKczEGdTR4kZUm9wRw3h2EyLE8lbZEsy+1WiR6
 +weyGu+pbpPI1wIydDfcIPzZIdc9l8LPJGPpO4eCCwRKyV0AfGgvKhe8rRfvWMemP7fmtVzCr
 saDK7Bms1n9NiSstEgFBeVwjQ4kCmVqnbarT8w1QKB0ZKA0+XXUPGfIecYogaBFtOdqDoP0ow
 BXboYacYYm+eXMeC1XyfVrn9pB9OcZw3XUljsePPd7bZMA5fJgBAu1RAfjn+rSUklW7Yc5VLq
 z6LEE6gAPnOd2rbEgDty9zXi4yHpY72LGSDFcUf4999wXIxHtry/DnNFcRknMuYHTAFHe6xTb
 xInI5ubqy0Q8kUqKOFlvtVNkW8pAoLosmAhkpv6Zc=
Subject: Re: [alsa-devel] BOSS GT-1 USB audio and implicit feedback
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi man

I feel i#am in the same boat as you with the helix.

Just its other way round: it works generally wih rare sync glizches 
depending on buffer.

Or if i force an implicit feedback endpoint it fails, but the created 
endpoints re correct.

Example:

[ 6449.240683] usb 9-1.3: setting usb interface 3:1
[ 6449.240685] usb 9-1.3: Creating new capture data endpoint #83
[ 6449.240811] usb 9-1.3: Setting params for ep #83 (type 0, 12 urbs), ret=0
[ 6449.241262] usb 9-1.3: setting usb interface 2:1
[ 6449.241263] usb 9-1.3: Creating new playback data endpoint #3
[ 6449.241480] usb 9-1.3: Setting params for ep #3 (type 0, 3 urbs), ret=0
[ 6449.241481] usb 9-1.3: Starting data EP @000000003cb8615a
[ 6449.241980] usb 9-1.3: Starting data EP @000000001cd170f7

works, but glitches every 20 minutes with a 256 buffer and 3 periods aka 
there is NO sync active.

.. while

[ 6063.161280] usb 9-1.3: Setting params for ep #83 (type 0, 12 urbs), ret=0
[ 6063.161734] usb 9-1.3: setting usb interface 2:1
[ 6063.161735] usb 9-1.3: Creating new playback data endpoint #3
[ 6063.161737] usb 9-1.3: Re-using EP 83 in iface 3,1 @000000008c3855fb
[ 6063.162033] usb 9-1.3: Setting params for ep #3 (type 0, 12 urbs), ret=0
[ 6063.162035] usb 9-1.3: match_endpoint_audioformats: (fmt 
@000000006290dadc) score 2
[ 6063.162040] usb 9-1.3: Setting params for ep #83 (type 0, 12 urbs), ret=0
[ 6063.162040] usb 9-1.3: Starting data EP @000000001d36b573
[ 6063.162466] usb 9-1.3: Starting sync EP @000000008c3855fb
[ 6063.162977] usb 9-1.3: Starting data EP @000000008c3855fb

is with a forced sync endpoint, but it will not finally setup.

Its the same as with your device that implicit feedback with "shared" 
endpoints for in data seems to be a problem.

Unfortunately i alsked around here since 2 years but never got a result.

Sidenote: i have the chance to compare to the nac side if this helps ( 
helix works driverless with initial 48kHz there too )

Perhaps more heads some day gets their brains wrapped around this.


Cheers ... Jens

-- 

Jens Verwiebe
Allerskehre 44 - 22309 Hamburg

Tel.: +49 40 68 78 50
mailto: info@jensverwiebe.de
web: https://www.jensverwiebe.de

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
