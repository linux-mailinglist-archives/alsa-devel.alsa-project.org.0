Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03812495BE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 01:16:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D241702;
	Tue, 18 Jun 2019 01:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D241702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560813417;
	bh=xixgKp7KEjyvrXYkpDvfXYHie08yUbg1Cv1siA5WMrg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4UnqjnR7j7cUB3JkoHNPzoOrzR1XJrDxF6W7cSZYQEzQdYO8a9WArmeH77VFMVxc
	 jvAEpJQHIPWTX4nuUUAMj7tBNgi9dyiz8FG5RPy3SjE7WpiXCVjvPNVF42D+r3DcJ/
	 N9dGXrUBF5IbzWLbU0Wl87nL83qwlsbe6Cw/jf2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B11DF89732;
	Tue, 18 Jun 2019 01:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 843F1F89731; Tue, 18 Jun 2019 01:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC22F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 01:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC22F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="X0HDp3uU"
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 45SRrc2nkpz4f3kZJ;
 Tue, 18 Jun 2019 01:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1560813312;
 bh=PxITNI5ZeKWCDRRrV4+/WeimjXDNiFHQjmV6fM5oHAA=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=X0HDp3uUimbJ8XKBJSpgVW6+qfKDoD5J64RxIZTZKE4UsHwmkGd4KOY7BPxy5GTo3
 u1E3m9+MiWP9reozL+/w84+vgvyjZAg8YIfrhz85rDXpKXtmtfwDA1cP+PL0UDjAcT
 qHsA5iw1ewTe3kAgj8M+tfmPnEe040JvNrX7kQzA=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 45SRrc2256z1Jp;
 Tue, 18 Jun 2019 01:15:12 +0200 (CEST)
X-AuditID: 0a3aad17-5bfff70000001fa9-6c-5d081eff99f6
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id C0.81.08105.FFE180D5;
 Tue, 18 Jun 2019 01:15:12 +0200 (CEST)
Received: from FE-MBX2017.de.bosch.com (fe-mbx2017.de.bosch.com [10.3.231.23])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 45SRrb6c34z5gT;
 Tue, 18 Jun 2019 01:15:11 +0200 (CEST)
Received: from SGPMBX2001.APAC.bosch.com (10.187.56.75) by
 FE-MBX2017.de.bosch.com (10.3.231.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 18 Jun 2019 01:15:11 +0200
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 SGPMBX2001.APAC.bosch.com (10.187.56.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 18 Jun 2019 07:15:08 +0800
Received: from SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836]) by
 SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836%3]) with mapi id
 15.01.1713.007; Tue, 18 Jun 2019 07:15:08 +0800
From: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with
 needed_slave_avail_min, after reading unaligned frames
Thread-Index: AQHVCum4RZQeB41dkEiqj4EvwO9Q5KZryu6AgAI230D//33EAIAyacmA
Date: Mon, 17 Jun 2019 23:15:08 +0000
Message-ID: <d7190437121644a78802ea69893e2b3a@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
 <1557901597-19215-7-git-send-email-vanitha.channaiah@in.bosch.com>
 <s5hk1erhgx2.wl-tiwai@suse.de>
 <293476c61233469cbffdd5a7688a8879@in.bosch.com>
 <e959837a-bdf3-75cd-11bc-41cda842fb50@perex.cz>
In-Reply-To: <e959837a-bdf3-75cd-11bc-41cda842fb50@perex.cz>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.207]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21Ta0xTZxjm6zmU08Ihp4dL3xXrSp1m6lSELWOTEOMPZDPbjD+WTcGtXQ+0
 obSkB1BYsjDUhcscoJWb0DkE2biMOTWgIM7KZTgyOscIOLYMrESu0nWkuGx1pz1c+mN/vjzv
 877P+77f8+UjMNpOyAidIZMxGVR6pVCMi19tle/we5ZIjvp5HsUO/2QVxBbeKPGPnb4yJ9iL
 JX7jzBcmds9fEiZe+eHDg9hhcZyG0euyGdOu+PfF2s6Sdizj4WvH82rbhHnot/1FSEQA9SIM
 V5ixIiQmaKpSABMlXyM+6ERg+8yC88EigqERWwAfOBF0zjr8+cCK4HbHdwJPMyGVAI+L7gk9
 OJTaB1U3v/JijDoGT06OCTyCEOpjBK7eRu/EUCqf69v/yYoiARYetHkxTm2Gecu0F5PUHrC6
 zuNrK55vuYZ7EiIqDoouPvFiRMmhbuwMzo+Twn375wL+fhTUdw1hPA6D6Qdufx5HwshMI8bX
 q+GvhS9WhklgoMqOlyJptU+rap+yap+yakRw/FZou7GLL4kEc/FEAI+fh1M1tQG+/AUU0ITC
 WF1Udnp0VGzMTpOaYXOjdu/8wJj+LeKfV9qBGkdSrIgikDKIbIogkml/VTabk25FLxECZRip
 PhKQTAerjZocrYrVvmfK0jOsUkZusL2eRIes0WyWOl3HsjqjgXsfAlOGkpZ4PJkmNaqcXMZk
 5GVWFEHgSimZSryVRFOpqkwmjWEyGNNqdg9BKIGMlnM7SExMKnM8RafPXE0r5STy8/Ojw30z
 vmMFhMiKYoggbnbaRq4FyWao0lld6or8GV5Or7Lr0rvoCFE6XVuHEbd7LdzpaKrnTpf37Klt
 qMNo3GA0MDIp+aZnNcrTQZtlWNtMtoFs1nMmhfkk1rvPoDHEeRtClnqWCuJ+1/pOQEZ4bJSs
 kOui6AZOQ5kD4aq7HsHScjeCyb45BOOuv4Vgtp0jwDJVJgJL+R0RPPp9SASFw3YRFOTPcpy9
 UgxdzcuBcOv0UhAsTi6R0HO9LxguXzgtgbbyARpmnvbKoaWmeCP0lN1UwJcD/yhg+Q+3AmYn
 rkbCqPtOJNxqtSmh58zkJng4eGIzOM+Ob4Hvq37ZBqNVk9vhWr97O1y+1PzCDGe4gDN8skHo
 MTxTlfk/hq+w67eT5aF9PR0hNWZn76aWwU8LXn6lvWKrbOpoWUXsv49n+ssd4UNn31Y4fo0v
 23tsKSK4K2RwYW4+XFIw7th/MmHHnydi3lHkXj/0Rtz97spT8jjZRwuJBe32g0bN3aMTKUwO
 c/hea93Uc49mndEXf7QvtgUeSCnENWl9W1xYUvG7oweop7kxh5Q4q1Xt3oaZWNV/2b6bZfcE
 AAA=
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
From: Jaroslav Kysela <perex@perex.cz>
Sent: Thursday, May 16, 2019 11:05 PM
To: Channaiah Vanitha (RBEI/ECF3) <Vanitha.Channaiah@in.bosch.com>; Takashi Iwai <tiwai@suse.de>
Cc: Wischer Timo (ADITG/ESS) <twischer@de.adit-jv.com>; alsa-devel@alsa-project.org
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
Jaroslav Kysela <perex@perex.cz<mailto:perex@perex.cz>>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
