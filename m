Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B1661F47
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 08:34:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAABA23B;
	Mon,  9 Jan 2023 08:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAABA23B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673249677;
	bh=YEDsWx/flkLwyJiau0K7FJ1cNAG/v7IYVv4rkbV/Eas=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gRk4a7MK1aFOLcrSO/Tudgz0qr2oGlmn+s6d2upAYxFt0GDzcYnSSYAkNAYlOdqVp
	 ZqXsoEMnQ/YzfJTXlOTvtg36xyDIIpoLtMbYZ6QZd+kZ0ge8r633iEhhe79RA9wzEQ
	 vs7e6TXgjMqgvaRkg++l88OOUnyYly0L8DqeGuPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46249F802BE;
	Mon,  9 Jan 2023 08:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A32F8026A; Mon,  9 Jan 2023 08:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2053.outbound.protection.outlook.com [40.107.129.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75045F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 08:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75045F8026A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXMz3dsyGgup0yzYnpjsP9RfUYR6TFG6jK1bgyxs8f90dO57TL6nmfV5Vb+5EBcT2qfKMElZkWBw3nqu/JMD+sITl8XQPdaT6aCaRL0ch6Fy+Pr5mTMj7QXdLDvtXo/06e7/JdDhqjq16riorzchujNyjgCQpmuSd2612KYskdDZY81bnHcxBQX09hokCYjm+6VshX3LnfeMdUdmD/rcFNTtd/fYfusyXitQro2PCGrAlJcCudkJJx9cE5VbqnVw4/rNDcYbWoQp7aP+uIs1ya2WKHxFnbVBOqQ+Y5w47XW3m61C2c32N+oJB0+mzuwso4eJVHqdEgVX9PLRXTa9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwDi+Zxz3l3yGNdf1twK8NodF0D9qF7TO647PSST03k=;
 b=eBqAWtoEE/1NPwHCedcuxsb8BIU2tLhrnmA1KT2bsxr7gsOMo5oxU5RVNefK6c7eFfZvCnFx1ZCcmPBzLgHynviHKiwBhUc5aIOGqaUP6uiXod4MEik9UKGvftuNjpSD0TYgMp3RgrO2dXtuweUcerg9P5Un2e7ZhDjy8jVsUZUYUE6eKCwvp8eo9BcPROxjWJw58wFLtsjwcw9tH7QmQd51SxbPars7gJsjQ6sObe7gMu/T5wTJieyf/FZqqV+Ve7rcQ3aPZgy+m3jVAXKxvhu+fQxqkAdGoxz3GN4pJH1jblRKqniVH0IXqECmHuvbWbBUDY0r2i8jHnkeXzJA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB1196.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 07:33:19 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:33:19 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Topic: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Index: AQHZIa9/JWAeJIF1MUqWJln1Q6zi8a6RHuqAgAAAWKCAAcbqgIACyCvg
Date: Mon, 9 Jan 2023 07:33:19 +0000
Message-ID: <SLXP216MB00778F6F7D99B56DDFBF603C8CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com> <Y7fplQ18qyhKDC44@kadam>
 <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y7lne4CN9tESjAbA@kadam>
In-Reply-To: <Y7lne4CN9tESjAbA@kadam>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SLXP216MB1196:EE_
x-ms-office365-filtering-correlation-id: fc4f4d1b-181b-41a1-7f99-08daf213c7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M7ZS617qpqmBymEkr7/9vndGtuNm2nVsKmPZlYXzZbYuJQaSXUXKn6lJTFJTY4/3Qj3U8/wD9W55ZTDHwPzY2YqBKaRm05I+4tqx4k/iQQ4y+YRG2X2iT3MuybpJxLgWf9i13MKVmxtGNZviz0YDUhl2C4LFOd9NA3RZthF5fzh4d31lrAVifO3KS9WTuCFhiwjByPbMyWpwV9j/NVfqNjl1gKkMUPlaJnuriR9KJ90DL+I7/pxb8X4E7+MH/IPG1T6QENZTXLsIvONlZzdSRp1kNZis3nIgTylri1HLCzeuzJWseN9uGr/Xu+Jq7vr2YX2IaKNVlcGglRu2pK2xiR1MF1/PuKvrikDulxBqwq10c3NgLZiyx17by0B7IfQSlDTboxvKuo/EqYxy4hGAdtZAt2HM5idYDwD3GS8C5IlL6yI7IFdoEGyeCB1bSFbaBg3+vKQr/vW4FJQkhrhSvlEghlKW2t9dUqcQ37/q0miHUyT1YREYBexg9hw3oECfepTkXS0c4Ds3hQ+Yb8TvdCxJAtnGJGEk5h/TxqLXpYY+uk+NJFe58Y49fz7QN/PAqM8AHFqn3AFMW2+CtBZCV9PPkzuNdZUq9zxYDIIlE6LKdrvAZO2dxm4YEA5dXGXJZU4YfPHZuee5QeUqqYNjdoq8D3E1BY1hFGSc8AD83zpqcx46d6FOWdff8LRxLm/jGJiq+yrrLpJjykgn/F2XzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39830400003)(366004)(376002)(136003)(451199015)(6506007)(38100700002)(122000001)(2906002)(478600001)(966005)(33656002)(7696005)(26005)(9686003)(186003)(5660300002)(316002)(71200400001)(83380400001)(8936002)(52536014)(55016003)(38070700005)(86362001)(41300700001)(110136005)(76116006)(66476007)(8676002)(66946007)(64756008)(4326008)(66556008)(54906003)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7GlbqBoETRqc41bFkcG4DRYuM1z1YZBXEfUpU9x2pXv5puTSm4Flc4ym7yum?=
 =?us-ascii?Q?HJ85zE+9tarvThT1RoVNJvv0SoscbcgwSa6VzPsQA5eC8DMecWp67X87d32y?=
 =?us-ascii?Q?Hv4j1KU/a0wLYfBbagw6CFutrtwLOA1EPnXn4f5IUqienHamJbfad5pdlSrV?=
 =?us-ascii?Q?bulw68+yx3OJzGT/Oy304ioYHsMLb4+GftovdPqbzuwY4WYlCy5K+kv8je13?=
 =?us-ascii?Q?ADI8JXaoOriZNnHDwbOEaGh7gaUkDrgf57qQ0ZaSijHXpSxmY5B5ERw9WqrX?=
 =?us-ascii?Q?+HJgOFTrIreyYXE2h+72SQsC27TF8CZVlX9aU59dktM3dQEDErhPTP++cn6l?=
 =?us-ascii?Q?SHAA7rH6mkiuVLVZzrFdHQD7yQ/nNlYmZD2Sx+F2owkEd6kBlpH3tZ8btJUk?=
 =?us-ascii?Q?0wfmphsoSABi6JGm6DDBEJLCafSZPXQ4jkLPXytlPobFXaRW51gAxoBCB779?=
 =?us-ascii?Q?Y46UX1QPbsl7KVeMOuj50J8eCn9JGac7l06w7U4oSZllLJ4CihhPPpCgIJUj?=
 =?us-ascii?Q?vawb8HyzbWuBGL33JWEF0Lkm1hSIohNpxz713qqgopZ9FURxqeLVQ6MEKU2i?=
 =?us-ascii?Q?8hiu8JBSa87ERHdjadQ0Hj2X4hgWnVobDMW2gj1FlJ8MU+1KndEqn5bk7Sg4?=
 =?us-ascii?Q?RJl5Z2SSsEKx4tXNX4bCkjaPhdWdNDJdG6cRnIV7iX2iX1YjtsxqAYgqd4SH?=
 =?us-ascii?Q?3/urGLiDFYBkGls2Cz+Ig0B4RPE7j4AwQ4U6sk66goXcznzJmZjuAp5SfHF+?=
 =?us-ascii?Q?TESzgfGCcV6m2zzSAm+B7mBo2l/8UU1zw/WZLbV/sKXZ+CbqkLtqC3rrdCwL?=
 =?us-ascii?Q?5Tk/ACLDdOU94FoXlGQ3TyIjfC7OQqb0rraXpQNdqVue+WW7Estnj4Xn8bxf?=
 =?us-ascii?Q?6PjQSSAt9VY3OzFDh0WqAy2FxHjpl0N7SQ0ApWEJMpuUbBdKePOjUmDjJJa5?=
 =?us-ascii?Q?FC/7oA8K2MlCgTpf4qFZGB4NiUlpBSI9ai9F0Uz+rN1+IXMxm2IzWhmMZPKC?=
 =?us-ascii?Q?AooMnlC9VMX55n/M7ohDzRbGTXGoYctiym9I08GPBdXmVDmn5scfwxtFQ0Io?=
 =?us-ascii?Q?YvazCIoSTOFQ9q8Hk+1qn7wfDS1Ez3dQzoxaMamlvZ+GE7SjSnxx25WonWdc?=
 =?us-ascii?Q?/I76EAjNeZWCWobx1ZdKaqXgng3p6zNIW+lHvu6T0zAkbICtcBYoTlBFMipZ?=
 =?us-ascii?Q?olfdiMODsL/iGIckKr97vW5dK5jCP2+ivCeCC0xjIiFl3fO6HcWp8oqYRqka?=
 =?us-ascii?Q?femhq6DS8LUFIHJWMgy4GvM7SJ5uGTK+kzaT18CW0aRV4piq45NBznSHSmgs?=
 =?us-ascii?Q?yZmASNH+Ef2xMSnpTqCB9wwV+UuHrjYfC2lU1keEE0FPeHx6PUxmwzX9P6hu?=
 =?us-ascii?Q?1rGgBSlNBJfeRFs9ToruC9brEooaHEPS5Y6Ge9L3RcCfB1CLVBcXGO06jLZe?=
 =?us-ascii?Q?2oMxaMDlfjIh+tmvqUdo8xjsT0upLsfQaglFidZDC0+1tpWZuRwlKeEPCNZ6?=
 =?us-ascii?Q?bNy7Svf8z/HQi6JZRCP+KKzlkuSyrMg/3pBQJKgCxMUu1P9yzvMfQgK2sC1c?=
 =?us-ascii?Q?IcBhwTRJeCrX4CfJ8Ciy2VST3BPqCj8ZjMK5S+M4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4f4d1b-181b-41a1-7f99-08daf213c7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 07:33:19.5641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRJbiVRkKg01rrq4G08p2cd/VsxrTUXSFi77h2vq7tP5wWjcyHQXJneoeUeZxajm8qMOp3AYJTJT/nOnLaCSmmftmH+9M2LeEWdIqfhrsqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB1196
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>, kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>On Fri, Jan 06, 2023 at 09:55:43AM +0000, Ki-Seok Jo wrote:
> >=20
> > Hi Dan,
> >=20
> > I'm sorry. There was an opinion that the pach sent last time was inconv=
enient to look at because the entire patch aws modified at once.
> >=20

> What you should have done was just fold everything into two patches:
> patch 1: add the driver
> patch 2: add the device tree bindings

> Instead you did:
> patch 1: add the driver
> patch 2: add the device tree bindings
> patch 3: re-write all of patch 1.

> Re-writing everything is not allowed, but it's also not necessary.  And a=
lso it is against the rules to submit broken code and fix it later.

> It's a new driver so just fix patch 1 and resend that as a v2 patch.
> Same for the stuff I mentioned in my bug report.

> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> regards,
> dan carpenter


Thank you for your kindly advise. I read your report and it was very helpfu=
l.
As I understand, I already sent it the wrong way. So I want to pick up the =
pieces.

First, I already sent the new driver code a few months ago.
After that, I got several feedbacks.
I've edit and test it. So a lot of things changed at once.

Since I changed so many things, I didn't know what to do, so I just updated=
 it as a patch.
It's my mistake...

So I already sent about patch 1 and 2, if I get the feedback, should I send=
 a lot of changes as v2 patch?(not patch 3)
For each change, should I send patch log per commit?

Like that:
Patch 1: add the driver
Patch 2: add the device tree bindings

(instead patch 3)
+ Patch v2 1: change 1 about feedback1
+ Patch v2 2: change 2 about feedback1
+ ...
+ Patch v2 10: change 3 about feedback1

Is it right?

Or should I revise it again and send it again from v2 patch 1?
(It's not registered with the kernel source yet..)
Patch v2 1: add the driver (applied the feedback)
Patch v2 2: add the device tree bindings

I'm writing this email first because I am worried that I might send it wron=
g again...

Thank you for your kindly help.


Best regards,
Kiseok Jo
