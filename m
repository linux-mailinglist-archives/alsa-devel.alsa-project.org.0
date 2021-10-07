Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B615424D26
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 08:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBAE6166F;
	Thu,  7 Oct 2021 08:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBAE6166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633587452;
	bh=V/C6mY5P++gto6Dl+U22pPsUotzC6jyAw9d0htd997Y=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEqwjSdElAdYRgEBin9Wb7am+T372wZWVzBWYzZk9c/iokXmZF9iWhJHGfxxfSu5R
	 iBYNklMuJLng+TOc6f9yqXmMqURX8QeHg5JLVS1PiCVS/Vs8BjS+x8uS9N1wkM+4pl
	 0uNXq65v3UDU14kMeG4aIZYVSx5GOgCqma9CoPOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF0AF8028B;
	Thu,  7 Oct 2021 08:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694B0F8027D; Thu,  7 Oct 2021 08:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA572F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 08:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA572F80130
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1976FmXY2029516,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1976FmXY2029516
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 7 Oct 2021 14:15:48 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 7 Oct 2021 14:15:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 7 Oct 2021 14:15:47 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Thu, 7 Oct 2021 14:15:47 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: ALC236 recording issue
Thread-Topic: ALC236 recording issue
Thread-Index: Ade5tYSZhOipxzjxS1u2xzQL3Lg4bf//kBKA//3W73CAA+YdAP/+MrBw
Date: Thu, 7 Oct 2021 06:15:47 +0000
Message-ID: <294ba24e55ba40bc83a00a4f24e8c779@realtek.com>
References: <ccb0cdd5bbd7486eabbd8d987d384cb0@realtek.com>
 <s5h1r4zgabu.wl-tiwai@suse.de>	<f2a9615a855b49029678f9d54b3ee13c@realtek.com>
 <s5h8rz6cu0l.wl-tiwai@suse.de>
In-Reply-To: <s5h8rz6cu0l.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.97]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/10/7_=3F=3F_04:19:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/07/2021 05:59:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166567 [Oct 07 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: kailang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2021 06:04:00
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

Many Thanks. ^^

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, October 6, 2021 6:44 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: ALC236 recording issue
>=20
> On Wed, 06 Oct 2021 11:14:40 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > I couldn't find this apply record on git.kernel.org.
> > HP guy want me to provide the patch URL.
>=20
> It wasn't pushed out properly, sorry.  Now it's public, found in the comm=
it
> 5aec98913095ed3b4424ed6c5fdeb6964e9734da.
>=20
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Tuesday, October 5, 2021 4:12 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: ALC236 recording issue
> > >
> > > On Tue, 05 Oct 2021 08:55:14 +0200,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Attach patch will solve alc236 recording issue for HP platform.
> > > >
> > > > Many Thanks.
> > > >
> > > > BR,
> > > > Kailang
> > >
> > > Applied now.  Thanks.
> > >
> > >
> > > Takashi
> > > ------Please consider the environment before printing this e-mail.
> >
