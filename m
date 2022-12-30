Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF14659629
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 09:15:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8948417D3;
	Fri, 30 Dec 2022 09:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8948417D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672388126;
	bh=SHci6LJvc3e4hjipxRMERBOhbfsjwvyVndcCIGQgHNw=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bfpujzrJlhic+MtxyWtwKyJ3kFouIfHFy7OsXc3w+5h/T3ShrsMoeTlHuOH0r8I0A
	 1ZeoO0giTHw4i1vYKcF1ZX1IFZ/XG1urwnF4TRwgcDlX9Hjuc3TFZg5AMr575IZ0Lm
	 oPsjNCrbE5/sYs9tCeu2yJTvdojOLp1QBXBO2AzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6CCAF80310;
	Fri, 30 Dec 2022 09:14:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 180CBF80424; Fri, 30 Dec 2022 09:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 49A69F80424
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 09:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A69F80424
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2BU8DMaP4006297,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2BU8DMaP4006297
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Fri, 30 Dec 2022 16:13:22 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Fri, 30 Dec 2022 16:14:16 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 16:14:16 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Fri, 30 Dec 2022 16:14:16 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: Turn on power early to avoid something
Thread-Topic: Turn on power early to avoid something
Thread-Index: AdkcI3Ma5yaXX0FTSK+6gZEsLjDbL///fb2A//94BFA=
Date: Fri, 30 Dec 2022 08:14:16 +0000
Message-ID: <af64a2d5e55448dbadef4d0efd96bea5@realtek.com>
References: <3dcfbaf4ccb34be7a9c4af0202cdcdd4@realtek.com>
 <87fscxxqp0.wl-tiwai@suse.de>
In-Reply-To: <87fscxxqp0.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/12/30_=3F=3F_06:30:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, December 30, 2022 4:05 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Turn on power early to avoid something
>=20
> On Fri, 30 Dec 2022 08:54:01 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > It maybe can avoid something for early power up.
> >
> > Many Thanks.
> > Kailang.
>=20
> Hmm, what is "something"?  The description is way too ambiguous to judge
> whether the change is OK or not, unfortunately.
> Could you elaborate what exactly the change will fix?
>=20
> Also, when you submit a patch from another person, please put your own
> Signed-off-by line.  It's a legal requirement.
yangyuchi66@gmail.com was my personal account.
Could I use this account?
Or I need use this account to mail patch to you.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.
