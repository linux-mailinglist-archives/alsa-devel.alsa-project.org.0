Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAE232F01
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 10:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752F61772;
	Thu, 30 Jul 2020 10:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752F61772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596099333;
	bh=cppix1O2T9sbgZqY9FxxreC7gOCGq1IvEDTCFknU584=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWnrECC2hKgznZ4yr5+63cmtg5E3osCTTOpAzos7sgy9nSuSeh3SXpuQ7kPFizNLk
	 WuMsONlZyT6tQy7B5rMaCbcgp5FmW73slP+UF5WRoIo8qEWGtoZGdzoa79+S/GTAWw
	 1fV9oF61F73AGgyu2pHdAyInx3oac7eT0sEYlxfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8939F80111;
	Thu, 30 Jul 2020 10:53:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261CCF8021E; Thu, 30 Jul 2020 10:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D664F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 10:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D664F80111
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06U8rZGq9020300,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06U8rZGq9020300
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jul 2020 16:53:36 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jul 2020 16:53:35 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Thu, 30 Jul 2020 16:53:35 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: HP NB right speaker no sound
Thread-Topic: HP NB right speaker no sound
Thread-Index: AdZmNYjtwJeLXA6YQTiGlZ0FEYdto///onEA//94S7A=
Date: Thu, 30 Jul 2020 08:53:35 +0000
Message-ID: <022139c65ccc443bb94df7f11118a709@realtek.com>
References: <01285f623ac7447187482fb4a8ecaa7c@realtek.com>
 <s5h4kppe7st.wl-tiwai@suse.de>
In-Reply-To: <s5h4kppe7st.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, July 30, 2020 4:17 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: HP NB right speaker no sound
>=20
> On Thu, 30 Jul 2020 07:53:57 +0200,
> Kailang wrote:
> On Thu, 30 Jul 2020 07:53:57 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > HP NB platform right side speaker no sound.
> > Attach patch was help EC to initial I2S Amp normally.
> > Thanks.
> >
> > BR,
> > Kailang
> > [2 0000-alc285-hp-amp-init.patch <application/octet-stream (base64)>]
> >
> >
> > Hi Takashi,
> >
> > HP NB platform right side speaker no sound.
> > Attach patch was help EC to initial I2S Amp normally.
> > Thanks.
> >
> > BR,
> > Kailang
>=20
> Thanks, applied now.
>=20
> If I understand correctly from your patch description, it implies the
> GPIO1 high, and that's already done in the chained quirk?
No.
BIOS verb table had fill GPIO1 to high already.
BIOS verb table had fill PD pin to test mode.
It will cause GPIO1 to low.
This case just need to disable PD pin test mode. GPIO1 will return to high.

>=20
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.
