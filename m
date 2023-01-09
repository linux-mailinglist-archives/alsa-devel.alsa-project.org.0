Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDE66201D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 09:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9473968C;
	Mon,  9 Jan 2023 09:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9473968C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673253389;
	bh=/w2EHv65bBpfmSIEFPYwQ2PceqIA9Ilsd6ZdbmPB/OU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZDcN6QMig4QdAfIFiTAVAcGjUin/goAXPP/7KBoZ11joRuaRzcdLYEWQC67qDMNEL
	 30OJYiG5ibNuzJXg6wbOr7NDaoxtZdQ4HhqIROslKwQYmqJVqI8O15id6arnKjiagv
	 BDFo+fxzSW17L8XgzPLXFSSK2UQ5tSTpS9auqeLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E64DF800C7;
	Mon,  9 Jan 2023 09:35:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236B9F8026A; Mon,  9 Jan 2023 09:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2087.outbound.protection.outlook.com [40.107.128.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D8F0F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 09:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D8F0F8026A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFvZnuCtkXQPAkRpbgORCAe6jlCpYVT3lwmDAJUhwWfmngoMLxz+7mL9eI+Po2KcRycCekYUIJkALYKMK/DzfclClhYKD9H990wnOcAO01IRKOe5gHbxQxHQUiNDxrKDxydnNMPaOA3afOWf+wrVg2n8nkXo6nVSPjr+8Vztm4zeduMj0da0CwG7th0+FnWSUvvqmaYMFzgI/9CFZSVM1/xqinY5ykhetTeMUAxq0HthxbwVTUB9b13TEnmG1hUe1j8bV1Vl2XyJJYFjzkyk5kdKYakXqIXWqT1dqocxMBb7f1FZrBZjhzDtIcwtJyJ+5PASbHOh2Oi1iCQjXGN+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0y1zll9UIWCMp1J5cutXpq2Y0nsskUjtlq7XPJXr9c=;
 b=lqbb6bfDN3l+Y8VRMHAqA8Pz+OIN+11JCOdb6LbV5/CiuLpVbT7L0UYyL2IGvJJCGyd0PDo9fPy7IFeKJnAm6C9fQBok9nZNOsJru9aNv/smuyBIfaIQUrJT1XKGNDH5YrX+Wt+FiyGQjkBzTPvv6vZdqfY/8Lezmk3Ooh4Sk/S8c8gvYEHqmppCV1phj922BmsgYLwIDN9/u2juVPJopYbeYqnA6TYfMhLCtQGUV0aoA7dG7Ph4pDGBYvPMP7so+jK/2ZnoL0Pg8uWxscR1TgtkBLmxR5RBCjysydy+I9+WVu2/uNJC6MAyHiWvhtqpmv+S6iNrSR34Cd4mupJnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0742.KORP216.PROD.OUTLOOK.COM (2603:1096:300:14::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 08:35:15 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:35:15 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Dan Carpenter <error27@gmail.com>
Subject: RE: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Topic: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Index: AQHZIa9/JWAeJIF1MUqWJln1Q6zi8a6RHuqAgAAAWKCAAcbqgIACyCvggAAT74CAAAOhcA==
Date: Mon, 9 Jan 2023 08:35:15 +0000
Message-ID: <SLXP216MB0077C71DA8D0C81621E705268CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com> <Y7fplQ18qyhKDC44@kadam>
 <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y7lne4CN9tESjAbA@kadam>
 <SLXP216MB00778F6F7D99B56DDFBF603C8CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y7vNna94IE6EnIZ1@kadam>
In-Reply-To: <Y7vNna94IE6EnIZ1@kadam>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PSXP216MB0742:EE_
x-ms-office365-filtering-correlation-id: f9f6661c-54e0-45a6-aa98-08daf21c6e6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HCnNl1z05cTsQlgqplZcmHOvXtsGc2HVxvdhWMvqTaDFdXSXJ1aTsaoaL3Ur26zwtpEv9VoyPqHDhavbZUfrr3vznMYHwBgk5UQ/OAyIouve44eTSWNVEgkBaksqgu9i3dpVBo//ANdkf7v2hFYzCWmlwDRzkR987ySRDMklikYD/FyCNLAGH41EsA0PaQCp77grWBEvVnAyVRQTBvFbz5uZWXJqE556C2MRbwICyV+1l1RoVmdJB8T+yTj23FX7sqQkPyxukG3DiOaHVp1CaqHKMUdfYbdynIDMq4D7Bo4PO/acl9Jxrfq8a/gASxPjHy5IFIU+2uLebm0fWuJ8dTGuEUeoBIfHsmELAE63F2UxbOS5msrJMJoKWYrAXvadPBAnKDdLxStakLFP30aKgtO5nBl/VQZT1+HAm2wK3iyImJo3r2xLw1E/QKZSjEYCa209BShNRxa+3dMAH9jcz4zZnhFpwQvgiR1VAi07zTG/7oNFGx468jr9tKkD9RqVQkGJh81QI0YBumRdmBeP89zQcsUm3GSaR0E9C6gq3tldCVSVucXvYMhr/SlieMw6hyE/0MRVvslsAfLaONnyu2+4S2tem6LeqOVYKgjEh67kAggw8zQ0YyH9IG+lLzPU6gx+obOGk6xrxHcquahOqLNta+rUJj67CqmcdEHePm/jQo+iPFCuH3PROyNF0QZfCbWhSj8FJ8ugOvE4FrqrDeXAEq71XI8RpaCsCd9lrSI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(376002)(39830400003)(396003)(346002)(451199015)(33656002)(5660300002)(316002)(71200400001)(26005)(7696005)(186003)(9686003)(478600001)(966005)(41300700001)(66556008)(6916009)(54906003)(66446008)(4326008)(64756008)(66476007)(8676002)(66946007)(76116006)(8936002)(52536014)(83380400001)(38070700005)(86362001)(55016003)(6506007)(122000001)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uzk3SQbEddDubV8tNc1pISnJrggiH/p10kquBj4K4K8UkxBrDd/mZx1IDRbh?=
 =?us-ascii?Q?jP2aKINXAr5Ofp4mi2RE27dAhwXdUzoTXV6128tJYOcirFyuxOBveGB0Lga7?=
 =?us-ascii?Q?bTEzPkSd884KWru+q3VumVYnuc+CkEeRJyuVrt/4DJQqdW8UzAAaUaCYb/Dq?=
 =?us-ascii?Q?AV6jx4hmBDSxOxdj2Ktoj6283CvIcL2CvTNQ05ZpgUQo73yad9Qx+c8OPHof?=
 =?us-ascii?Q?97zvPzcyUlB4ZP3XfsVKQJtfot7PVGcE8Q/YpxgFS+bPa+peV2Wm2nPPeQWa?=
 =?us-ascii?Q?1VhUoEpNTx2bCdQgbY65WCVDOXvCgZI71xySe2z+GxbJ0ejhi0KRbv5WGqg7?=
 =?us-ascii?Q?PaHNKwW2r+VCDI3DJQzFSy/TvRCY6HodUpfYZT7pkagoSrvpen4M/GImW0yu?=
 =?us-ascii?Q?efE2mKdTkYliC5+DynmKCx54kzKj2y10VzumAxbvcIrOOcsGKfyS9Tv761YN?=
 =?us-ascii?Q?B0cpR7j6f4YTJ9xmXdA9uWbklrquxLmVKls/TRnRMXWtWXvXYCiU8U6ge4LH?=
 =?us-ascii?Q?VJwMQgviQ06CM5bGqKqpSt9xSP2Omw7mzet8NzjxW4FBEU60Aq2ghPrJrL14?=
 =?us-ascii?Q?BKGuX397DWLkmcavgK1uZiu4FwSA+F1shogeNvva1qW1LoGeXccyYU1x+RtB?=
 =?us-ascii?Q?Lmc2ERbguMenOp4RmkXM3keKWo9qh6w6SI7ufC5o4AKrK557uhopbSDVAgLV?=
 =?us-ascii?Q?nryoPDmZKvxNNQLbbxAklWLJMu8d2YZevwfAdfv1f+9Gsvktco5Ec9mUdf5O?=
 =?us-ascii?Q?ffLdcH4MeyGdQORlRgmmOFHir+SNiW98W/P1Wrz1yiZChkXGZgVty025EIej?=
 =?us-ascii?Q?AJwzqBiSoGOyDnSOtWm4bHjVBn0O1Cwa4x9p6R0jeTMWVluxhF4e9xVA80cw?=
 =?us-ascii?Q?w6ntFVqJGm08LTybipull2TWISRQBpzzAqlbGcvoupGJ/3+QnrGcVbS1KImU?=
 =?us-ascii?Q?+RVJ8pI64WzEiB6CM4a3mGOYUnannX5orLI2xEHg5Q/FLaADqKH3BLOwwN2Z?=
 =?us-ascii?Q?VthokYU3Y1MxUbXtPGXZ05a55LEuo4zOaFIyU+SyUMA49xThLIk67jbmfZE3?=
 =?us-ascii?Q?EEKmtyAA39AHA/ls7te0eUn1WZPQK7JHjPcoZ7wXLgVHVh30qItKnBPtA2Yf?=
 =?us-ascii?Q?iv2S85LTyMJue3Hp6fvaDQj0+x7lFPcgac384B+bloGpVQxn3itYX4orFzRn?=
 =?us-ascii?Q?y6ruQE4PrHFK9ESV/ca8EDFf6U77KgrAZBzQg6iFZT0vAiMIX79o1Z+j3App?=
 =?us-ascii?Q?aqSPxnC2bxY6H1nMZIByN8QF8J5+lgUctxj+nj0gutUcmU7RpxkxvTTckPmr?=
 =?us-ascii?Q?yrWdXa7Nae3Sqd22dIencfpe2OIxT2IkyvR52K465CiuRCfFd5qA8Om/mU0W?=
 =?us-ascii?Q?SiXI3PfgzZICkgq9IqQU4f8gEX/ncoM61/1DCJg3INbSIFfO3tA6JIIywUId?=
 =?us-ascii?Q?2VN3otMPXoBoAvm2lYotDleG+CYXCtIsMf1yc2d9r7RiHFka0iLu3Oc2MK8+?=
 =?us-ascii?Q?WB/WnTCzXUjsXjd7BHufQD4fgbSoZsWQrjQCCTq0CS5kr9FIN9BpEk9GB5dz?=
 =?us-ascii?Q?oc0dUJrfTOGhnKG0apj8eXRLUPKDISui+W3zFG7l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f6661c-54e0-45a6-aa98-08daf21c6e6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 08:35:15.1680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T18N54MKXhR1vXc/TQl3gnyuiafV+4KVZ8O2YN1EeE8nBH3ap6QoXkCv9JuJtrbBgVWxT6OwQu3zhfoYGChNfFaOJnStR+Z+iX9I6TJm6nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0742
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
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> On Mon, Jan 09, 2023 at 07:33:19AM +0000, Ki-Seok Jo wrote:
> >=20
> > >On Fri, Jan 06, 2023 at 09:55:43AM +0000, Ki-Seok Jo wrote:
> > > >=20
> > > > Hi Dan,
> > > >=20
> > > > I'm sorry. There was an opinion that the pach sent last time was in=
convenient to look at because the entire patch aws modified at once.
> > > >=20
> >=20
> > > What you should have done was just fold everything into two patches:
> > > patch 1: add the driver
> > > patch 2: add the device tree bindings
> >=20
> > > Instead you did:
> > > patch 1: add the driver
> > > patch 2: add the device tree bindings patch 3: re-write all of patch=
=20
> > > 1.
> >=20
> > > Re-writing everything is not allowed, but it's also not necessary.  A=
nd also it is against the rules to submit broken code and fix it later.
> >=20
> > > It's a new driver so just fix patch 1 and resend that as a v2 patch.
> > > Same for the stuff I mentioned in my bug report.
> >=20
> > > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-pat
> > > ch/
> >=20
> > > regards,
> > > dan carpenter
> >=20
> >=20
> > Thank you for your kindly advise. I read your report and it was very he=
lpful.
> > As I understand, I already sent it the wrong way. So I want to pick up =
the pieces.
> >=20
> > First, I already sent the new driver code a few months ago.
> > After that, I got several feedbacks.
> > I've edit and test it. So a lot of things changed at once.
> >=20
> > Since I changed so many things, I didn't know what to do, so I just upd=
ated it as a patch.
> > It's my mistake...
> >=20
> > So I already sent about patch 1 and 2, if I get the feedback, should I=
=20
> > send a lot of changes as v2 patch?(not patch 3) For each change, should=
 I send patch log per commit?
> >=20
> > Like that:
> > Patch 1: add the driver
> > Patch 2: add the device tree bindings
> >=20
> > (instead patch 3)
> > + Patch v2 1: change 1 about feedback1 Patch v2 2: change 2 about=20
> > + feedback1 ...
> > + Patch v2 10: change 3 about feedback1
> >=20
> > Is it right?

> No.

> >=20
> > Or should I revise it again and send it again from v2 patch 1?
> > (It's not registered with the kernel source yet..) Patch v2 1: add the=
=20
> > driver (applied the feedback) Patch v2 2: add the device tree bindings
> >=20

> Yes.  Revise again and resend everything as two patches.

> regards,
> dan carpenter


Thank you! I'll try again.
I only updates version like v2 patch as two patches(add driver & add device=
 tree bindings) for registering a new driver.

Best regards,
Kiseok Jo

