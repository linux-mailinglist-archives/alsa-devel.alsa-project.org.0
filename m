Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F321A793531
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 08:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D9D825;
	Wed,  6 Sep 2023 08:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D9D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693981218;
	bh=VF62B/5TkcnDX4eK7Kn/XtE5JfQO/OSBthWKgVkxFtg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pgZc8Mlw9alWufjJ6LFoVr5y5QRscfLvuedKvaPp2JKpLsk541lGJP6ynXuHk5NSQ
	 9kQ5A47HiuNmFsRc2is8QsMil3ukZxHK8LKrYi3fK92OwBN/hpjZkaqpnkdlaY53hr
	 msMPYuyQsJ4hPF5m34f25JrfZXnGVR6QDN3oqiJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4062BF8047D; Wed,  6 Sep 2023 08:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FE1F8047D;
	Wed,  6 Sep 2023 08:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C08AF80494; Tue,  5 Sep 2023 15:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36D7DF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 15:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D7DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catalina.com header.i=@catalina.com header.a=rsa-sha256
 header.s=selector2 header.b=ypgd4GVU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmDHeJxTbJwE97JR41HA/OLgjpQXP5QpuaaxoYvmjJ26gYD+t7/faQ/joff0kF6RdZXChqi/nxcApdAk2Uy4GIVZSze6o0R2WyxjyJqDUB8AoIm13KTteA69KZN+hE96VcxGlpNPIqymj+fXO72L3tull6lBfj/Cf3G/U0F5LyLpxf16MuanifWd8swVLYcUtwCzlVTmUeZepvHKgpXeeFs7WINje7HE+PHt//WYvtPILIrkfn0H7DJqRrXo0CsMVABlEy/C5K15Di1Si+oNK2fGpJR+Sfwxkgfov/aggAe1lWrUvAf//ls/lLha9b1jdCB+igK27cibMgGm3PUKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26GuQ0a6YzJrio/VbMK0CKGNqqnPGNl8DVGrlbQ/w/4=;
 b=coAgYtMNNfxWUcqIbQ1eWzCZSC5YkzhZdUJiy54eCG6XU4f9KQUk2BRudgx+Y6n/jekaFlhOp6eUqGQxQS+k3goupLGEQPBkDE6Ra0S7JFiwg2xycY6hSby4rAmbP42FeKVrt5MRWhvrMIJuuZGkghkUcS6WlIpQ1xEtoKSk2529i2yfrZKfb9DHPOvnTGgWGVqR2zpCDJM5ZRHsLe/VjjJaTWxUmF69Mw79/V5iNZtEwg7yr7pmIj/2STOXv0C4CRGZjs5VvAPx/ZX/pUA1lBUZtyokEIGaE0cqGFvOuu9zdwl5VTAaFAooPRAnt4ztmqXh4VI3DVeOfLL7Vk0Grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=catalina.com; dmarc=pass action=none header.from=catalina.com;
 dkim=pass header.d=catalina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalina.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26GuQ0a6YzJrio/VbMK0CKGNqqnPGNl8DVGrlbQ/w/4=;
 b=ypgd4GVU2So7uzQvUhfGN27oAAscbQ20MZ/DXdAv2evveznWGrAaE8qHYsrTDGmDiRPDc6V3WNLa/rRg7Ip0iuO5DzIderYgWR6q/CvNKxYcMi+uf2AMnsDyRLUb0nZJiY96gC+sSAMgvROc/kSTr8wWhPtcgRk6vIwDt5J+k4AQ+IlLmvIfmI6Tn5g8xcHPRyce2gt/zq2M8RVKGuBasYr84aAd4bFBJey71cH+oHg0xGIb2AehEJNmzIGNT+5elpaKVtQA5COtwpUq8DxSWXAO4mBdry6AiL1AY66y7RPVPmZ+jyJu/Z6aBjtmfxPgFKg72xygzrrsHVn/q53rxA==
Received: from BN0PR02MB8045.namprd02.prod.outlook.com (2603:10b6:408:16d::23)
 by DM8PR02MB7861.namprd02.prod.outlook.com (2603:10b6:8:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 13:51:31 +0000
Received: from BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256]) by BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 13:51:30 +0000
From: Terry Hummel <Terry.Hummel@catalina.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
CC: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7
Thread-Topic: Bug Report: Audio issues with CentOS7
Thread-Index: AQHZ3zuyVOwv+LHOWkuu6+CmLUIUyLAL1gOAgABkb/U=
Date: Tue, 5 Sep 2023 13:51:30 +0000
Message-ID: 
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
References: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
In-Reply-To: <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=catalina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8045:EE_|DM8PR02MB7861:EE_
x-ms-office365-filtering-correlation-id: 1ada3d1c-4d85-4c9a-a3c4-08dbae173578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MqYQLO4v6roQ8WpLYsVEVsaEeW9Z9TPc/iRCbxbLYBHyXFXyyc6wyIsQ3TO+5gG7LYNo7npLtyzgFEqAv0tlWqf6DzQMugjXouk9JYiYhegWNyTJc4yaT1GXyXjgPlEN6U6xYHxPBKYLi93yxv7pGvedsR1wBd0CxxMzF/cdbhEt0N5IZU2fceBY7YZ9KoBmh3qoA3kmaAd/+7IIydUWiJR3bHfIMWFtXx7p32EParT69AL/XSP9P6dFKltl6y+vIQ4hRU3cw8EqhJ6laCfmcnJ2FTjxn39fXpmLHPaeIc6fDo2nBu3zUA9I6WR7PSZhyor/YPPjbY5sc3/nZqC0FNDRcu/ACxKKOGQcB/6CPbwE3zh9UNKkw54mY2D8xcwAQvYlr8p6H9jhk8fVu2pQr3hx/iX//yjvDwq4CBKjvlcVN+drckdBwnXQBhfRif6pJFuNbyn7dJvCaXB83tE/i7RgFIRr3h+/hANv6qyCSqjkCNFssbgXPWBoy+yDa/tYsjBNhQTKs2on+I+HSftYKJ0TP6uCZyW5vTTJ/6HjnAkBlTN3qCMaVbWyyhdN0hKV8n0U4jRRYFuL7Z3gKPqNVzeVxoUHi223hWSBlUsXNmyzfz+CcNRR8umj08EDmIPZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8045.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(186009)(1800799009)(451199024)(41300700001)(107886003)(110136005)(66556008)(66446008)(66476007)(66946007)(64756008)(76116006)(86362001)(55016003)(26005)(83380400001)(316002)(33656002)(5660300002)(38070700005)(52536014)(38100700002)(99936003)(478600001)(122000001)(166002)(53546011)(9686003)(19627405001)(6506007)(7696005)(966005)(71200400001)(4326008)(8676002)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?pSNtyLlTNF9Z53zx4+SorwMTdlPGsKwbA7CUR6SVoJxCRlhYMLsf2lNE?=
 =?Windows-1252?Q?COJNoKYBPuqWI/smtVXQ9AaNg2XmBdYHvANlEMRmnauowMQ6Vv9jmVLS?=
 =?Windows-1252?Q?l3lcR4X5DJmU2s3n7GXYX2uPJKBKlYAvXiDL4BPPfFCWcgZGrFwVPcfh?=
 =?Windows-1252?Q?WynyGu2U0cm42QeUKcesvdL8u9vhznj8RQQ4SLtDRDYXXignWsDMeCL1?=
 =?Windows-1252?Q?VNdIIAyMoyMnqyhehviPlNKJYPqrHUHahHb9r066shYLBmrmz2QJt/vD?=
 =?Windows-1252?Q?vy60Z1QraaEEpTU9mNdxePxF76w1lyQUxoP2SPmFpo4qXHyGGz/JzIh9?=
 =?Windows-1252?Q?zP9kfNu8YD/FHJufBYRvvNJFCy+Xj3nZCnloDTW5x6LjYsnbUbhriVTZ?=
 =?Windows-1252?Q?6PbZgVVT200smJ56J4LnnCwm6EjoG5FM/Lse5M1MotcNBkB3LOPzNgTa?=
 =?Windows-1252?Q?rSfBcaKbg75LItV9XtQ+h/I1wdzp+s2ga3V2yw/6Okd7l8ZRMlFOQn4C?=
 =?Windows-1252?Q?Sha18b1UaHdR7glq6ZZIAo0hrjeLxCMPtrVytua0c9Yn+GB58+M37DLy?=
 =?Windows-1252?Q?2JyXFt1YwXJIOxsOgcY5EAz1bnIzzc17A9rH/1eKCzvX/ieo3KA+MdGJ?=
 =?Windows-1252?Q?U7k1wNCfxdKs7EI5n2RMRO/QWRfzQ7fDmnYkg0pJFgtHCdcvhoXTkVYb?=
 =?Windows-1252?Q?yZOqhiXYFwe2aN72ErRf45QU1P3wtHnMVVo819v/aT+cXz0vZynGtkOX?=
 =?Windows-1252?Q?iZBnbcn1UVpqJ0qjPTARLqxJGnqe3nn1mI9v8/OLRlhm9cjDQt9SE20q?=
 =?Windows-1252?Q?0UHq4YdnanWA1NyvoXUrw/wZnLtCFjFVV4pqzWJ0LvrycnAL+h+Oh367?=
 =?Windows-1252?Q?58LxfgM/eLv7oG6IZ0Qjul3tdUdQp8Ox6em0cKqVUxZY+Klyo7M1TVIC?=
 =?Windows-1252?Q?0MmnPaJOlNZn6+gpHSrAk11cz2aAza55t4BCSo6fcKLbzKrnn7+EyvR2?=
 =?Windows-1252?Q?qxgSim+YsuyUw+6804s1Sul1DpGSHQ+xYcp5O1T8dwjFkhNWUyr8a1au?=
 =?Windows-1252?Q?E5dsg9Y1ieWAuUBCpaBXQrvUeYebRquLJgajucd9T7UHzoxpWfU4qQI/?=
 =?Windows-1252?Q?kr4iIU08n0OH0Tf6CNJUYd1t1SZO0Ce1pEBOJeEQTeeE0/J72F3fJTuK?=
 =?Windows-1252?Q?kDyCSiiR6fKWIsGhplB3ewtyFfnnxZrGS8xuM63Z1YiJeqEipjlzYZDq?=
 =?Windows-1252?Q?YW0Qt+DVcF3yyUJWuhg00NzXl/+NQzd9i0BTecWTr9za4OOnh8P7GCIt?=
 =?Windows-1252?Q?HSsNXuF7hJXkkY5IHd+BPVHp0QMi882JGA+oAJ0i3K5SYcHwHO5pU3ui?=
 =?Windows-1252?Q?2CUOo+bLndWb3vXJZrfqMbQX3H2kYxYgO0yW4o+YeZ7CXYisAEdbc5EQ?=
 =?Windows-1252?Q?cgCIg4KHnrvTUcxNT9extKWN13TRjDokjrC4nWddFbKz9xnJeNdzDy2k?=
 =?Windows-1252?Q?UQbvD+DqYHljNfXi9bKSaDn95LR4XYZU6u1vU0Kn0gmwek4PblXGh04i?=
 =?Windows-1252?Q?ByB49HMFjjceBMA+1KKq8/TrkEUTSQJLMx3hFDcwxjrPXd4oT2W35Wus?=
 =?Windows-1252?Q?aNtdGMF+MOjeuwc/LJwXHU+FS/bZGzn0mY7io/mu/c41y8TKrZ2TKZP3?=
 =?Windows-1252?Q?pK0QOUu37A0=3D?=
Content-Type: multipart/mixed;
	boundary="_004_BN0PR02MB8045C507932EEDF72FB62783FAE8ABN0PR02MB8045namp_"
MIME-Version: 1.0
X-OriginatorOrg: catalina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8045.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ada3d1c-4d85-4c9a-a3c4-08dbae173578
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 13:51:30.7277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2eddc39c-2996-4c2a-ab97-f767c39ea155
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Tega33lfWQInFVkpOonF2jOEYkoa5Xr73ldy8UVuXYGcnm398OHzaTPiUxxGfbXKckLr0HWrAjfrdKtdY4M9iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7861
X-MailFrom: Terry.Hummel@catalina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TNUHVHIE75JQVC5WYZPARMBO6RQ4FMXS
X-Message-ID-Hash: TNUHVHIE75JQVC5WYZPARMBO6RQ4FMXS
X-Mailman-Approved-At: Wed, 06 Sep 2023 06:19:24 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6VLP2HX32N4JPHKXO4FSSXQ3S5XSFKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_004_BN0PR02MB8045C507932EEDF72FB62783FAE8ABN0PR02MB8045namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Jaroslav. Thank you very much for your input.

I created the alsa-beep.conf file in the /etc/modprobe.d/ folder and reboot=
ed. When the system came up, I still couldn't get the speaker to make a sou=
nd via the beep command. I attached the .conf file just in case you wanted =
to confirm the contents.


________________________________
From: Jaroslav Kysela <perex@perex.cz>
Sent: Tuesday, September 5, 2023 3:26 AM
To: Terry Hummel <Terry.Hummel@catalina.com>; alsa-devel@alsa-project.org <=
alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

[You don't often get email from perex@perex.cz. Learn why this is important=
 at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 04. 09. 23 16:56, Terry Hummel wrote:

> How to reproduce:
> Try to get sound to come from the HP RP 5810 speaker using:
> printf '\a'
> printf '\007'
> echo -e '\a'
> echo -e '\007'
> beep -f330 -l137 -n -f330 -l275 -n -f330 -l137 -n=85etc (I have a beep tu=
ne in a shell script)
> // when beep is run, it appears to run with no errors.
>
> Actual results:
> The above commands run without any complaints of missing audio device. Bu=
t no sound coming from the 5810 PC internal Speakers

Beeps/terminal bells are a bit different. They are handled through the soun=
d
servers these days, thus the PWM modulator output is disabled by default in
the HDA driver. I assume that you're running your system without the sound =
server.

$ modinfo snd-hda-intel | grep beep
parm:           beep_mode:Select HDA Beep registration mode (0=3Doff, 1=3Do=
n)
(default=3D1). (array of bool)

Note that CentOS 7 have the default 0 (off) for this parameter. The
description is incorrect. Try to set this module parameter in modprobe
configuration files:

   echo "options snd-hda-intel beep_mode=3D1" > /etc/modprobe.d/alsa-beep.c=
onf
   ... and reboot

                                                Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


--_004_BN0PR02MB8045C507932EEDF72FB62783FAE8ABN0PR02MB8045namp_
Content-Type: application/octet-stream; name="alsa-beep.conf"
Content-Description: alsa-beep.conf
Content-Disposition: attachment; filename="alsa-beep.conf"; size=35;
	creation-date="Tue, 05 Sep 2023 13:46:43 GMT";
	modification-date="Tue, 05 Sep 2023 13:47:06 GMT"
Content-Transfer-Encoding: base64

b3B0aW9ucyBzbmQtaGRhLWludGVsIGJlZXBfbW9kZT0xDQo=

--_004_BN0PR02MB8045C507932EEDF72FB62783FAE8ABN0PR02MB8045namp_--
