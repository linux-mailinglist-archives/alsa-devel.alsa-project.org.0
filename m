Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D060F72F2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 12:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866F7836;
	Mon, 11 Nov 2019 12:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866F7836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573471200;
	bh=2Td3AK1/OQSZCGENmhmOodyH+LnwUPHxFVSXlRTFBwU=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/X9RDURCT1pCsgkVAxKgSe9vKgVkZyb5GzNpIXlJRpvFsmFRaX/doG05nO3mjQeu
	 o3vg3g8exJtAsJu6XT3vxDDs1ItFEMft4c/YqJ32vH4MmtK0OUj8my78PghAAY9N25
	 QTlZVskUtLv3G8Jafg0h52+utrH2Xi8tlHsbTKJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E87F2F80518;
	Mon, 11 Nov 2019 12:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0F5F804FF; Mon, 11 Nov 2019 12:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE08F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 12:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE08F802E0
IronPort-SDR: Jz2UUiRgnoUXS9c7BklLo9vxnvDrbAsP0cMCM3sEnMSGFhFm52BRkJAqARb+bcjurH2d+Iz5qm
 AxpqlxsR1tJfArl+xsc/iS38qKRjny3QmRXZObTVnU6cCo1c5ZkkisRhpmxSMqRDaidYUkGRkr
 ygmV/rge0dNLlO4DHvFWZB0cmEf0qI5mUcVvc9WlzYQf2Z0pJJv7mOXg0hjaWfVFhd7tfflrrm
 hYX6gxDnNnzR4Qy9Rp5J05ZO3TCXy32jZH8waw2imLzvpLEmF8OTVhk4w5Mj3RGeQwuTJYkJ7P
 FJA=
X-IronPort-AV: E=Sophos;i="5.68,292,1569312000"; d="scan'208";a="42981443"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 11 Nov 2019 03:18:05 -0800
IronPort-SDR: 6KRljqEPFy4kP0bWVsq1qphgjWHTuQ8NIN4S7farfvusPhHEuQyUWPOhLwjIFs03EOw/h1P0hz
 WFGidB+fDtPeMYLr7LGNVA8OpFGNtMQP8zwwgFBeBUKAvA6XQGOOBF9P0VLreiOf43Ai6r1rna
 J5TePq5zg0/INcedVPVbbvTWiCwAwAJdphsUUfEVF5jvL9wbmt5lVyjcr3J78tTVBUjPtw1TZ1
 V2cw/m0xddSEVoyT4NhiCv62dPNm0mT5uywNzZV5Pslcmm2lolHklqjUaGo6uGL4mRnWWWgWZm
 M54=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>	<20191105143218.5948-2-andrew_gabbasov@mentor.com>	<20191105143218.5948-3-andrew_gabbasov@mentor.com>	<20191105143218.5948-4-andrew_gabbasov@mentor.com>	<20191105143218.5948-5-andrew_gabbasov@mentor.com>	<20191105143218.5948-6-andrew_gabbasov@mentor.com>	<20191105143218.5948-7-andrew_gabbasov@mentor.com>	<20191105143218.5948-8-andrew_gabbasov@mentor.com>
 <s5hlfss862t.wl-tiwai@suse.de> 
In-Reply-To: 
Date: Mon, 11 Nov 2019 14:17:03 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d59881$96979fa0$c3c6dee0$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVk+YmK3KlOO6PeUGxcY472O0ao6d/XF4AgAB4QPCABgZDwA==
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: 'Timo Wischer' <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 'Takashi Iwai' <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 7/8] ALSA: aloop: Support selection of
	snd_timer instead of jiffies
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

The update (v3) of this patch set is sent to the mailing list:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158312.h
tml

Thanks.

Best regards,
Andrew

> -----Original Message-----
> From: Andrew Gabbasov [mailto:andrew_gabbasov@mentor.com]
> Sent: Friday, November 08, 2019 9:09 PM
> To: 'Takashi Iwai'
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Jaroslav
> Kysela; Takashi Iwai; Timo Wischer
> Subject: RE: [PATCH v2 7/8] ALSA: aloop: Support selection of snd_timer
> instead of jiffies
> 
> Hello Takashi,
> 
> Thank you very much for your feedback.
> 

[ skipped ]

> I'm preparing the next version of this patch set with the changes,
> described above, and some more code cleanup. It will be submitted soon.
> 
> Thanks!
> 
> Best regards,
> Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
