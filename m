Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4B66A118
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 06:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9613168D;
	Tue, 16 Jul 2019 05:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9613168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563249637;
	bh=nDNgpCZwSxksgJBXwt/QFfdYiEB1ZYUpD3wo3u7T4vU=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=noncdf0EIDJEK5JA5WsTOXgqEJN6rq0WBPQtmvjR8zoD5wii1KRzuc9Rw1X+Jut3C
	 S7qQJL6uGjOMEBSKvqd+gS1XD4UW6sWAJbw32Nt1WHHZYmFcvovX99DtWDPxhOXW3t
	 PyPCvKi4kaKwu10w+H7y6euSLqeUJFA1b5r9/Qzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC94F803A6;
	Tue, 16 Jul 2019 05:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992E7F803D5; Tue, 16 Jul 2019 05:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E20F802BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 05:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E20F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="nsn0GCW8"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 45nmpM2P9Nz1XLFjX;
 Tue, 16 Jul 2019 05:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1563249499;
 bh=x8wo1lfoCC9Z1cs/uJkF3BikIHtuS4sF3yjH8X609cU=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=nsn0GCW8o91JlFrqWUyWytmxYJQ79zpnZjDO0SU0d9x1Dl7i+UU0SfGBwUyK6+iKK
 +WwqyTly1ah9ypMsK5D+9RJ7/YN+ocmbyZMCg0Zfn6YKzdnIuy/3I0dvzL3+iYj9yG
 SY1/UqcmYGww9ZwkMgGz2WJBHHuqBEGrdmvNJawY=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 45nmpM20Shz6CjQST;
 Tue, 16 Jul 2019 05:58:19 +0200 (CEST)
X-AuditID: 0a3aad12-705ff70000007574-7d-5d2d4b5bbbcb
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id DD.1D.30068.B5B4D2D5;
 Tue, 16 Jul 2019 05:58:19 +0200 (CEST)
Received: from FE-MBX2040.de.bosch.com (fe-mbx2040.de.bosch.com [10.3.231.50])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 45nmpM0MCzz6Cjg8W; 
 Tue, 16 Jul 2019 05:58:19 +0200 (CEST)
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 FE-MBX2040.de.bosch.com (10.3.231.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 16 Jul 2019 05:58:18 +0200
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 SGPMBX2003.APAC.bosch.com (10.187.56.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 16 Jul 2019 11:58:16 +0800
Received: from SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836]) by
 SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836%3]) with mapi id
 15.01.1713.007; Tue, 16 Jul 2019 11:58:16 +0800
From: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with
 needed_slave_avail_min, after reading unaligned frames
Thread-Index: AQHVCum4RZQeB41dkEiqj4EvwO9Q5KZryu6AgAI230D//33EAIAyacmAgC0WIBA=
Date: Tue, 16 Jul 2019 03:58:15 +0000
Message-ID: <98faed1cc1904dd5b393b06a6fce243c@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
 <1557901597-19215-7-git-send-email-vanitha.channaiah@in.bosch.com>
 <s5hk1erhgx2.wl-tiwai@suse.de>
 <293476c61233469cbffdd5a7688a8879@in.bosch.com>
 <e959837a-bdf3-75cd-11bc-41cda842fb50@perex.cz> 
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.205]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf0wTZxjHee+Oci0cOQ5Yn5XfZyRBU0VhhsxtQbMYZBma/bEtTrKVcdJG
 2pK74lSSRdh0ghpBEW2jHTCBoXOAMrMpgtQCY2wCigiEGMDOreiEwFC2bHTXXrH9Y/9cnuf7
 vJ/n+z7P3ZE4U0eqSJ3BxPEGTT4rUxCKVy/FqD94S52dfPAmmTY0aMPSSq8dD0xzXnmCpeMZ
 zfMlsoz2P+plGVf6irbjOxSv5XL5uj0cv/aNjxTaiuoGouBQ3N52x8mgA6g6tgzJSaBTYeJm
 MVaGFCRDn8Fgbm48SEraEbhqZnApmUXwxXGnN5lHYD865z1mQ3C1p5dwN5PRW2Cm7I7MHUfQ
 m8F8o9ET4/Qn8Nfnox6TcLoYwfOuBk+rCLoEQX/PIS+RBdOWStwdE/RK6HOe9ugUvREmD44j
 yc6Mwb1vqzx2iI6B2tEThGShhDHHl5g0Ew3n2/pxKY4E58OlQClOgKPmU6JOiueToOnaWglN
 gMojk0GSVxj0mh1EOVJa/LpafITFj7D4EdWIuIAiBV3yHn3qhtT1a/gcTtifvG7Nx0b9ZSS9
 OeZ71DK8y4YwEtnQKyTGRlIDSepsJjTHmLtPqxG0H/KF+ZzAqqjogcydTPgLWSjM0esEQWc0
 iMsmcTaCen1hdTZD5Wr27ed4o4TZUBRJsEoqj9y2k6HzNCZuN8cVcPxydSNJskBd3ioahvFc
 Hrd3ly7ftFxmYygUEBDAvORf8bfFSLkNpZAhoneouwUlFGj0gi7Pi78s4cyy6kN/QtvIcue5
 Wpzs7LKKT/u5ulqcIQxGA6dSUs3uXrSb0hYaXtxGFU09pcQBI/0Kvo7TaBSRiA2nkjJFOET8
 PXz3ACrKvbowr+iD1teJDD0TDK1L5xEsLIof91T3EwRP/70dCOPP/5ZB5cApEqyPKuRgrbol
 h98f9MuhdMghh8Mlj0XNcUYBbRcXg6Hj2EIIzE4tUGD/oTsUWqqPhcFQzXUGmqp6GZh2dcXA
 N2ePxIK94kY8fN37TzwsTizFw+PJ1gQYWbqVAB2XBliwn5haAb/+/NlKeDDSmgjzJ8cTYcQ8
 tXpaXDImLjnuzVXuJZs0pv9Zslf1Tac6gNjherR58F7N7obS4qFNRf3BFcPKZ+kXn5VnWjI3
 ZDiqshpNf3Y066M7q8Z+7IozjtVe73a18daUxqLilnrmnYktKWcj5qz3Y38rt7x9eMfdrbMF
 X6nZHvV8ySP+/nZX+C/pd3MHN31a9u6dh+jqhfeiVgQ2jdWFfNeZ05f1/u3E9AkXSwhazbpV
 OC9o/gPEtbM1uAQAAA==
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with
 needed_slave_avail_min, after reading unaligned frames
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

Hello Jaroslav-san, Takashi-san,

Can you please reply your feedback for below mail chain.

Best regards,
Vanitha Channaiah 
RBEI/ECF3

_____________________________________________
From: Channaiah Vanitha (RBEI/ECF3) 
Sent: Tuesday, June 18, 2019 4:45 AM
To: 'Jaroslav Kysela' <perex@perex.cz>; Takashi Iwai <tiwai@suse.de>
Cc: Wischer Timo (ADITG/ESS) <twischer@de.adit-jv.com>; alsa-devel@alsa-project.org
Subject: RE: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with needed_slave_avail_min, after reading unaligned frames


Hello Jaroslav-san, Takashi-san,

> Which hardware exactly? The hw_ptr should be reset when the streaming starts.
> It appears that the problem is specific to the direct plugins only when the period wakeups are a bit different than for the direct hardware access.

Firstly, sorry for late reply.

Issue is seen in RCar Kingfischer H3 es2.0 target.	

The issue was seen during the below commit :
commit 07b7acb51d283d8469696c906b91f1882696a4d4
("ASoC: rsnd: update pointer more accurate")
https://patchwork.kernel.org/patch/9772671/


There could be a non-uniform jitter exists between when interrupt raised [rcar_dmac_isr_channel(), rcar_dmac_isr_channel_thread()]
and the interrupt is processed to read/calculate the DMA position [dma_set_residue()]
This could result in unaligned hw_ptr reported at user-space alsa lib.


Best regards,
Vanitha Channaiah
RBEI/ECF3  

Tel. +91 80 6136-4436 


-----Original Message-----
From: Jaroslav Kysela <mailto:perex@perex.cz> 
Sent: Thursday, May 16, 2019 11:05 PM
To: Channaiah Vanitha (RBEI/ECF3) <mailto:Vanitha.Channaiah@in.bosch.com>; Takashi Iwai <mailto:tiwai@suse.de>
Cc: Wischer Timo (ADITG/ESS) <mailto:twischer@de.adit-jv.com>; mailto:alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with needed_slave_avail_min, after reading unaligned frames

Dne 16. 05. 19 v 19:26 Channaiah Vanitha (RBEI/ECF3) napsal(a):
> Hello  Takashi-san,
> 
>>  Can we avoid adding such a hack in the core code?
>>  Basically the issue is very specific to direct-plugins, so this sort of workaround should be implemented locally there instead.  I guess we can do similar tricks by overriding the calls in the callbacks.
> 
> Issue can be seen without direct plugins too with involvement of only hw which reports unaligned hw ptr. As I have explained in below  detailed description:
> "Also, this issue can be seen without dsnoop plugin, when HW reports unaligned hw_ptr For e.g. "

Which hardware exactly? The hw_ptr should be reset when the streaming starts.
It appears that the problem is specific to the direct plugins only when the period wakeups are a bit different than for the direct hardware access.

						Jaroslav


--
Jaroslav Kysela <mailto:perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
