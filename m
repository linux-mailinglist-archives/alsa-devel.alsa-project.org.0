Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFB39B588
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 11:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5156F16C9;
	Fri,  4 Jun 2021 11:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5156F16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622797811;
	bh=uFLqGcYY3KFAecAYH+5v6ksdjpaW1mPjiMR1zj+gbpY=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gav1FhO78fKfrxnFCT/gKpBnW3dYMYaTPvo7bDGc77ChdtVEbfD5EhZOSiIXab5D3
	 GSKmpKJb4IZ0evluZFXcx2WjOs6N2YXq+jGrmc4loH4jPebnCyLr3z+1wRV/q8EyQe
	 0IiMWlT2Rh0ulHkIn2vwQK8z0QUJ39QrHMCjS54g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B95D0F802A9;
	Fri,  4 Jun 2021 11:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A2AF80103; Wed,  2 Jun 2021 17:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PDS_BAD_THREAD_QP_64,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C7AF802A9
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 17:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C7AF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.b="QosKHHvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1622646370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaLt12CrUw5bOwSnMbZpH07wE3fTdborpYBSng9NgUw=;
 b=QosKHHvjKn2o3g95UCGD5a0Nx2c4HLAlM/Ch485SiDTM2h5FrE/+vW3rWSvYxiG5L0rTX3
 biJS1AlgFk6ZZ7QzLiHL3mbbvnfzuqofEyIWSF3WFU2sxRR1FqznE1YRNfqkHJno02jlsq
 PQNVQ5kDlB4C07COaN3tbprGu8DQwMI=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-JRKEyuSTNEqtMuCvLNMWzA-1; Wed, 02 Jun 2021 17:06:08 +0200
X-MC-Unique: JRKEyuSTNEqtMuCvLNMWzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuD/ZMYfzLAGuIP93J5kl3OoBSK8/bFKtCQ2IauE+ci56VObpvsLqTRybGUsGhZiGrF79ngq/s3dDcSCYNEQHu351f8GXDxcADrwDa+1FAYGYcm9e7OGvpouJh64yLWvE0jm5DXvKM8OfPZza/MSfk6opR7ANhwlVRk+MQrbPSvFQIGNjZVt9VsKMt1OpDe7JbDvEtESJXxyFcHj32HkKJkWbvyMxGCaKZjSYUz7bZLeZAowliVz0ijJW7NLJYm6R6Xsq4eS+s6t/IRLmyA4Ar3PZrs9uV1iQC3UZAPSfDKXpYq4egmwBrs9v/Fcb1i2dS1ymDmsBwnLuPz4EOw33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaLt12CrUw5bOwSnMbZpH07wE3fTdborpYBSng9NgUw=;
 b=ErcALscQzU+HIks/MSFwiPsj6k7Pu5rzE6bzGuw5msJNmFqk155+xfi5/fWYAsaNSOryEPmu1z6LreLeUVMR6aH5FqS2o6RIBU64JzdX9nmkSTJXIAk47conACI73GPZBI6NnrLqSk1hsy9SJkpe35gVMfqNrJFiNdmDI3uZ8pzAQES5MftjNoEWAyx64mOuNQsN6+974D5bOYh/8lsiWv5GIbWB8HDPmvXU5gJNGKfk1rJzWElphjpBdvBuhqie+U8QipRscNSWZaAWaT5h3v61Eu9v69J2oyLCOI1JEQusa/tWbVn9uDq7tSM+gegzJSmgsJvLt4x+v4tuDGdhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM0PR04MB5748.eurprd04.prod.outlook.com (2603:10a6:208:123::30)
 by AM9PR04MB7635.eurprd04.prod.outlook.com (2603:10a6:20b:285::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 15:06:07 +0000
Received: from AM0PR04MB5748.eurprd04.prod.outlook.com
 ([fe80::85ca:879a:554c:f263]) by AM0PR04MB5748.eurprd04.prod.outlook.com
 ([fe80::85ca:879a:554c:f263%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 15:06:07 +0000
From: Takashi Iwai <tiwai@suse.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>, "allen.lkml@gmail.com"
 <allen.lkml@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Joe Perches <joe@perches.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "romain.perier@gmail.com"
 <romain.perier@gmail.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] UBSAN: shift-out-of-bounds in snd_timer_user_ccallback
Thread-Topic: [syzbot] UBSAN: shift-out-of-bounds in snd_timer_user_ccallback
Thread-Index: AQHXV7HPtbxEio2fnE+zTpoAvjijK6sA0Vlh
Date: Wed, 2 Jun 2021 15:06:07 +0000
Message-ID: <AM0PR04MB5748B0958FF29E04E74866F4C73D9@AM0PR04MB5748.eurprd04.prod.outlook.com>
References: <CAD-N9QUDYbzkZXnDzf2P4b4Qk_kBQ_9ZVL3B4jhe9Xf2rgtpGA@mail.gmail.com>
In-Reply-To: <CAD-N9QUDYbzkZXnDzf2P4b4Qk_kBQ_9ZVL3B4jhe9Xf2rgtpGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [188.174.155.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 903ad240-a729-4721-2430-08d925d7f309
x-ms-traffictypediagnostic: AM9PR04MB7635:
x-microsoft-antispam-prvs: <AM9PR04MB763521E7065CCD5ED9E63A44C73D9@AM9PR04MB7635.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DRMSaZj7rf11OFxP7uKJ5NmSbjp9y7KljryC0Y/OIfhtMHmivg+LgjzffExbwPiMEAgFtGFt3BiUEGLClj7h1YZkDLwJh6nAH8wZvv0Mx9MsWQikh18bQjwpUw29kaijdeBsF9yyDIhwfljrfBTcvgNqEvidtTfeN31Od78UZREsiVwLP0AhpAr9wS6zrYEiElydSN0J7p1qHH3ffjwMmFWeE2aH+RkHyGs999RXTFNwqrmJkqRUoJ8aptQL7hm4B2eoUkYdiliV9KpZ6B8V0DciYkv0o3cC3bmEQERoCXacr/Y4cWIaSezWoWz1yjuoRi97yDR20CDXK7Pa2OvBK7m//gZP5XtwpBiczVh3mI5VGydyBimztissP049/2+3OxqlGTxpPwtPEn2hz6Ymuf/34uqWVce+jz62oFEIOpvBohBAWFSJmfXNw1reGTeD7yUqcRz1YyKbxLRFuuqhRCOU69N+VwUi1uD4sVgJFtuZIMefjE08LimlWdKy/Sk9FiH9yOUUXSunTRV61QMJAYNMjP/RXfqc+rTVFcdP5kh99SG5cJL1gYiF5DEPsLXbpMXOBwubc2Xr25/ThHwscioO5I8P0ME0WN5rzZxx+wOX9ZmQkLnTk8H2KlWy75puFNxWmt+NmiLZt0ipNNhCk85fPhaX9yxHWtCr6JuNVBmSzp7JFOsA3ig31/7pfRgGhPGqtNRdgOZmy332Bu2NHW+8SXvru56Zn23MMkGfmnlz8YGhRNKGcfezdRH+dlDyqJd27/udvWwSI4BHBD2ePb31IqW8ZPfQkvHhIkO44Uo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5748.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(346002)(39860400002)(86362001)(38100700002)(33656002)(122000001)(7696005)(8676002)(19627405001)(2906002)(8936002)(52536014)(110136005)(478600001)(166002)(5660300002)(966005)(316002)(55016002)(186003)(26005)(6506007)(66556008)(71200400001)(66446008)(76116006)(66946007)(64756008)(66476007)(9686003)(53546011)(99710200001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gN87hks2Pl6eSE3S5DB0BPNcThr3aenNFrjnslPlGwftlOG8MuFJLegtrEYs?=
 =?us-ascii?Q?BR9RYqlEcoxZNQaw+Pa7LFcOz9H5dvrLNtn54AvK2bQy2Fq1VEbQaf3W53DE?=
 =?us-ascii?Q?1Lx6QBBCbPa7yHXJXVI04ip2O1mgFJv5bCwUNx6rTfankNxzBegSk8va1OI9?=
 =?us-ascii?Q?0wRNlNCfwAo0uNfVums4i3/t/lLTTTUao0Ynicuej/HZQWEEK5Ms0vxw8LD1?=
 =?us-ascii?Q?wShinukcaxouTx2pinx7SNbje8bjQcDGKwI4CGwQOMeE0W8N+tNLxpoIa0IB?=
 =?us-ascii?Q?T3t5dW543VepTbt9NHSVcKEcdXHJNygVH6Jtci21N1pC5FJy51fNxwDANPM7?=
 =?us-ascii?Q?7UFiaUJUtCpytx9E8WuY3dEa6Sf0oTvIEt2VJQdjc+lZcjNp2OzGcK9vjgjX?=
 =?us-ascii?Q?8ODU75P1TIfLSPsHfY2Y306D1iQdEM3ZE/JbsQT5y+nkgzCKz14zQZfJ6Fau?=
 =?us-ascii?Q?MQkwk6heD7V2fan0J+1RAlv9s3fMGAGL2mO3kp9vuSBNxH8YCTD2whIXZhD3?=
 =?us-ascii?Q?1xsKdJ2TrFRH/8RKD41J6XYhn35J7ZPtT45dcw9etVPZT6VKcS0Tgz1N/LNK?=
 =?us-ascii?Q?H6vLPmId5DE1vjwBr9wlbYFe5om4hEDH77OL7zE8u+3G6aIOHKQOKfkEJFBI?=
 =?us-ascii?Q?Y3sNL0xyBSP6TGDBsSoWea9P6cTIPOSp+LKj07gzi8GX2EYYoF6nm+4212DF?=
 =?us-ascii?Q?svrpXmcPiwXNj21rntd5bKvZPYC29Naat2G+t7o4eHOEvTWTJC9X8oQU6/Uy?=
 =?us-ascii?Q?hgXwjUvvRQIaJkAFYD9Y/ZqUZH5Og0iIwQoCCZ9/LinlrgfMbfcrrlIGYwM+?=
 =?us-ascii?Q?4+xwicmr06muV0s2g7OhjENqr7zidadBxeGs3MhEEjP6yl2lZD5XeXCL6IZn?=
 =?us-ascii?Q?+fglw+Sq7flpJvsGr4BlVXdcgpFCh258+r5QL4cPU2hqrvjX1yAR5fVi3lfJ?=
 =?us-ascii?Q?Q5QrnyYVOz/78nUwlCo7MAYRLfDc00Fa81zw60Hdb+uDVwimBVrdLPDgak5e?=
 =?us-ascii?Q?A5lPdJ6F20VYxhNYww8WSwjzmoIzjdRUCp5Y8hWFv43LB5erm1JHvgHfNO5u?=
 =?us-ascii?Q?F+jkSNY4MHy39o3WmUI3jQ+nCB369u/Z7kMInA41Kl4vYRLPJ5xGaTPuVHHF?=
 =?us-ascii?Q?OSjXjy714Hmgs072RtUNP5PJXfnQSFJcAC9Yp5AuuPSrq0hMyTiHe91psWzs?=
 =?us-ascii?Q?fEtz4CgWwFUBig2lt9jOj0vGp0urptyRWS48+xhhEdKnFpgVDy3Lp9fU5P9q?=
 =?us-ascii?Q?B9WcAKfCLUC+qOgNkCNoUeDbZut3VQlvlGZtbYvyHnn/SomwgP8C3pqQJPNl?=
 =?us-ascii?Q?lso=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5748.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903ad240-a729-4721-2430-08d925d7f309
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 15:06:07.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDUBKQlLcC9NbnwMdJXw9QN9aP327HZz5jS4UXalBcyAFR+ywZLZl7gXAU2yYYyo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7635
X-Mailman-Approved-At: Fri, 04 Jun 2021 11:08:40 +0200
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

The bug has been already fixed, but unfortunately my submission didn't go o=
ut to ML due to some SMPT server problem.
(So now I'm using a different system, hopefully it goes out somehow, sorry =
for the top-post due to that...)

I'll resend the patch later, but the fix is found in for-linus branch commi=
t ae352822321d2e8eb17347ab4eb64e461bea6971.
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=
=3Dfor-linus&id=3Dae352822321d2e8eb17347ab4eb64e461bea6971

Takashi

________________________________
From: Dongliang Mu <mudongliangabcd@gmail.com>
Sent: Wednesday, June 2, 2021 3:18 PM
To: allen.lkml@gmail.com <allen.lkml@gmail.com>; alsa-devel@alsa-project.or=
g <alsa-devel@alsa-project.org>; Joe Perches <joe@perches.com>; linux-kerne=
l <linux-kernel@vger.kernel.org>; perex@perex.cz <perex@perex.cz>; pierre-l=
ouis.bossart@linux.intel.com <pierre-louis.bossart@linux.intel.com>; romain=
.perier@gmail.com <romain.perier@gmail.com>; syzkaller-bugs <syzkaller-bugs=
@googlegroups.com>; Takashi Iwai <tiwai@suse.com>
Subject: [syzbot] UBSAN: shift-out-of-bounds in snd_timer_user_ccallback

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit: 5ff2756a Merge tag 'nfs-for-5.13-2' of git://git.linux-nfs..
> git tree: upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17872d5bd0000=
0
> kernel config: https://syzkaller.appspot.com/x/.config?x=3D770708ea7cfd49=
16
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd102fa5b35335a7=
e544e
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+d102fa...@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> UBSAN: shift-out-of-bounds in sound/core/timer.c:1376:23
> shift exponent 105 is too large for 32-bit type 'int'
> CPU: 1 PID: 10368 Comm: syz-executor.1 Not tainted 5.13.0-rc3-syzkaller #=
0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 01/01/2011
> Call Trace:
> __dump_stack lib/dump_stack.c:79 [inline]
> dump_stack+0x141/0x1d7 lib/dump_stack.c:120
> ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
> __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:327
> snd_timer_user_ccallback.cold+0x19/0x1e sound/core/timer.c:1376
>
> snd_timer_notify1+0x243/0x3b0 sound/core/timer.c:525

The root cause of this bug is in the snd_timer_notify1 [1]. At the end
of this function, it calls "ts->ccallback(ts, event + 100, &tstamp,
resolution)".

Here the variable event is 5. It adds 100 and is passed as 2nd
argument of snd_timer_user_ccallback.

From the variable naming, the 2nd argument should an event, and in the
range of event enumeration. In fact, 105 (event + 100) is out of this
range. I don't quite understand the meaning of adding 100. Any thought
here?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/sound/core/timer.c?id=3D5ff2756afde08b266fbb673849899fec694f39f1#n497

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu

