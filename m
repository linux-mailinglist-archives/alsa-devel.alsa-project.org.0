Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A7198FC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 09:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D22F1AAE;
	Fri, 10 May 2019 09:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D22F1AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557473161;
	bh=Qb62OSq1dnzczJgf5eviiL+gckSQuS25hBTzMZjSRfA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9i0WSvwJToIy8DxKGXSiBazyhu+LBD01LUluCqXjzgq0jmU5ZK+l/BKfxz6hgJ2a
	 9X8jkZ/be7lqpj6vkDe0wOX1PG2Zuv62pTiV0ZT/LeIkkoyHtDB1DWZfJ503fpyQiZ
	 0837O5SdAyajdOa+Xgs3WJud9x3sDlLqR8fCq3M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA4AF89705;
	Fri, 10 May 2019 09:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0281F896FD; Fri, 10 May 2019 09:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB3AF89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB3AF89673
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4A7O5Wf004191,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4A7O5Wf004191
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 15:24:05 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Fri, 10 May
 2019 15:24:05 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: FW: move eapd coef function before ACT_PRE_PROBE state
Thread-Index: AdT/J/zgDi+/s6pzRJ+XG6C5XTeJJQErwFhQADei07D//3ubgP/+D9jwgANikQD//1vMgIAAw38A//x160A=
Date: Fri, 10 May 2019 07:24:04 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765FAE@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A9D@RTITMBSVM07.realtek.com.tw>
 <s5hmujy39go.wl-tiwai@suse.de>
 <6FAB7C47BCF00940BB0999A99BE3547A1D765C5E@RTITMBSVM07.realtek.com.tw>
 <s5hv9ylo167.wl-tiwai@suse.de>
 <6FAB7C47BCF00940BB0999A99BE3547A1D765CA5@RTITMBSVM07.realtek.com.tw>
 <s5h36lpnvzj.wl-tiwai@suse.de>
In-Reply-To: <s5h36lpnvzj.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] FW: move eapd coef function before ACT_PRE_PROBE
	state
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

Hi Takashi,

The patch was work for me.
Thanks.

BR,
Kailang

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, May 8, 2019 5:20 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: FW: move eapd coef function before ACT_PRE_PROBE state
> 
> On Wed, 08 May 2019 11:17:30 +0200,
> Kailang wrote:
> >
> > Sorry!! I didn't get the mail.
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, May 8, 2019 3:28 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: FW: move eapd coef function before ACT_PRE_PROBE state
> > >
> > > On Wed, 08 May 2019 08:59:02 +0200,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > I recreate patch as attach.
> > >
> > > No, no, it's not what I meant.  I already *reviewed* and replied your
> patch.
> > >
> > > I copy my previous reply once again.  Please read and test it.
> >
> > Patch fail.
> >
> > patch: **** malformed patch at line 10: @@ -796,10 +795,22 @@ static int
> alc_build_controls(struct hda_codec *codec)
> 
> Some mailer problem...  Use the attachment below.
> 
> 
> Takashi
> 
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
