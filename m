Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A42158BA1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 10:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1711664;
	Tue, 11 Feb 2020 10:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1711664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581412366;
	bh=RQIqDgJdA84qwELZfXFYmnqUg9Bos2Sy485dgcnluWM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxHETYINCihvI6gvyLF4uB/CwawzitLq4Ll0oYBLii0qfyNSKZgGLmoyLCyYXaxp+
	 pl1BISqJEIRbSgsU+fVjka5D9u7+XwS7b1UyvdzK3gd10NVJ3cs9DAM9yqoBGmV6pd
	 DrqL+vXu1njmLWIGrSRKpXqnrlB+Gi7skRt8o/hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD27DF8013D;
	Tue, 11 Feb 2020 10:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A93F80145; Tue, 11 Feb 2020 10:11:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9198EF8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 10:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9198EF8013D
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01B9AopS011566,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01B9AopS011566
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 17:10:50 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 11 Feb 2020 17:10:50 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 11 Feb 2020 17:10:50 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Tue, 11 Feb 2020 17:10:50 +0800
From: Kailang <kailang@realtek.com>
To: Benjamin Poirier <benjamin.poirier@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>
Thread-Topic: [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo Thinkpad X1 Carbon
 7th quirk value
Thread-Index: AQHV4KAyVK0d0c4RkUCatRD1s4Jmc6gVFbAAgAAJ9ACAAJRvkA==
Date: Tue, 11 Feb 2020 09:10:50 +0000
Message-ID: <ab7a0abd24df485d8f8cc3723403a44f@realtek.com>
References: <20200211055651.4405-1-benjamin.poirier@gmail.com>
 <20200211055651.4405-2-benjamin.poirier@gmail.com>
 <b23abac0-401c-9472-320c-4e9d7eab26de@perex.cz> <20200211081604.GA8286@f3>
In-Reply-To: <20200211081604.GA8286@f3>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo
	Thinkpad X1 Carbon 7th quirk value
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

Hi,

Speaker 2 connect to DAC 0x2 was Lenovo requested.
This was tune for EQ setting.
I didn't know more for this.

BR,
Kailang

> -----Original Message-----
> From: Benjamin Poirier <benjamin.poirier@gmail.com>
> Sent: Tuesday, February 11, 2020 4:16 PM
> To: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo Thinkpad X1 Carbon
> 7th quirk value
> 
> On 2020/02/11 08:40 +0100, Jaroslav Kysela wrote:
> [...]
> > >
> > > In summary, Node 0x17 DAC connection 0x3 offers the loudest max
> > > volume and the most detailed mixer controls. That connection is
> > > obtained with quirk ALC295_FIXUP_DISABLE_DAC3. Therefore, change the
> > > ThinkPad X1 Carbon 7th to use ALC295_FIXUP_DISABLE_DAC3.
> >
> > The volume split (individual volume control) will cause trouble for
> > the UCM volume control at the moment which is the target for this
> > device to get the digital microphone working. If there is no
> > possibility to share DAC, it would be probably more nice to join the volume
> control in the driver.
> >
> > Have you tried to use 0x03 as source for all four speakers?
> 
> Front speakers are fixed to 0x02. Node 0x14
>   Connection: 1
>      0x02
> 
> >
> > Why PA handles the rear volume control with the current driver code in
> > the legacy ALSA driver? It should be handled like standard stereo
> > device. I'll check.
> 
> The device comes up with "Analog Stereo Output" profile by default. I changed
> it to "Analog Surround 4.0 Output" to test controlling each channel individually:
> 
> > > pavucontrol controls are reported with the device configured with
> > > the "Analog Surround 4.0 Output" profile.
> 
> >
> > You should also test PA with UCM.
> 
> Please let me know what do I need to test exactly? I'm not familiar with UCM.
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
