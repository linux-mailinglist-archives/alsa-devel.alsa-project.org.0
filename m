Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54C6621AE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 10:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10E59922;
	Mon,  9 Jan 2023 10:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10E59922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673256892;
	bh=OyNe7S/bqsItKHnWJwWXhpxPSIc4jOfB2yL4/Djkc9E=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XMjHSEs6o/HItkRy5r6OmmStQHj2oY6/h/sdH0jbYt10FTgiP9YxmFS6CRVilqhCC
	 7hb14KSBfqh9ZqIbbSrp3jdj9fyd6HCYAA+hca1XLJLsJ6CHwa8ifmDENXtp2I3VoP
	 78FMr2kJZwL4BDySyuGBUfmRXmZBNR2WgbyxHHJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E55F80245;
	Mon,  9 Jan 2023 10:33:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA11F802BE; Mon,  9 Jan 2023 10:33:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feac::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF819F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 10:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF819F80245
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPpZ6u/Y73/1TynQyrV77VlAuXJd60MH34cO+gC4KREpoCMfq1MawrOlZZ/22K2PwbOcr/AKK2+1Q36BW1yzXWg30jNSctE0zjFl4gHZgb9wc1Cda02C5qAA/ojvBlrBbkC+Vj2HVcwutzGNaTvEMIOlYTrT652tgP0F+wAmCB+DxjhaCo/hBwjXAMkAAc0Ze5IKDpcCNJu7vRqO2G71aQB6p7MvfhJ2btgMQiz+Z2zKKGznEajASH+kw4WmnmLzuJ2RIErR9d7/P7l6XRF0pfgwiM300GdB7+DKXkzHcVuNBGlJSQntALEN2KXGj1cHhkJmfBvyjvCYAACvgKnusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA/UMewjkDBQ404u/kPhnXxke4i5Phwt1sJn099z0D8=;
 b=RaN5F4qq8lnxgTwagFILU7WEMxJU+Giem8TBLDnqrKYdRow14uo/yJnyKsKq1MnFHygYZwXoCWOl4o7YRZ4GAm/DDezPnVKBU/QHoB/mr/h7lytlQzvpmhwMzy44++JtEoSTSBPYNWr0u/av/nVSnR2y5y+mBPJEiMuubW2kz7Ou7IITCNY69f6JkQpnVEApJ20V8NRwI+ulZUWJ+rGaKnzfJplOZexD04QaICmsTf8N+y2OQk8R+MJycOHAe+F7vndPNiTlYwxWhn9rprR35PfiETzp3Le8rAiqhMLB7KFVI8Ys3Gdn2iHMjrtuGkcxw92ho4WsYgidE+37QhxBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1275.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 09:33:33 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:33:33 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 04/14] Removed the usage control and add the power switch
 on DAPM route.
Thread-Topic: [PATCH 04/14] Removed the usage control and add the power switch
 on DAPM route.
Thread-Index: AQHZIa98T87p8we4602bGlVSt779GK6RatAAgARpQAA=
Date: Mon, 9 Jan 2023 09:33:33 +0000
Message-ID: <SLXP216MB00776F662E780535D5DD50A68CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-5-kiseok.jo@irondevice.com>
 <Y7gpQPuVLmDj/S95@sirena.org.uk>
In-Reply-To: <Y7gpQPuVLmDj/S95@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PU4P216MB1275:EE_
x-ms-office365-filtering-correlation-id: 25f289f9-fdc8-478a-24bf-08daf22493b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Ayl9QgLHge7iJBbyh3jLL4LU0WpK1gLIqceDfW1Qbo74VoRnr3nIjdOCiFPdQHEUpYBgsHiHSiVY49LtTuKkgk0FhVV2Kp65OltPSR/f9GxhfT7/TJQldN8xocH/sAaBfWGCJcnEW/8+mHLNzZ+UZ1q5rYw3S6hy0CJoZdvctYodLqTsBXati3gt2OOuiAiRoutsE+iUjILxITXmrQ8fpHom/LxrgjLxyj3gXgUfHUQiMMLhkYVK+89eeIxJ8oiDYvcoQZVKCxNPm5HiAgcJgFQ/ZqPeHBVvdfYlre/EsujCSEeYNKg1/M1NUowyIkE7+71oWfJQsCMpvi6ydLurc0qacn6AYmN54q3XvrLsY3KbfwuG492F81kb8E4IXWSVzZakePt54uNHkCWk2r4KI2cazUZJ8wKtatx+vVuAHYfjDgGh95o86TJcl4Zf1alJf0nsbjT2K8KfXUFuHfHGZQO83y+XIWy/g418iUa9vl6qOJTsWlIjHPaaF3OTZxQNzvPKKKkkh4dPWn0dB/OM9pfHX/5QAuoSqq4VW/ReXifzUf6QcIfU2nw+AuJgskeGULSqFg0C1iNDCq27v3iUhKcsdkUBZi5k/bF+JMlXrflopvl+pWn0opxLm7LES5+Ut1DHN4thmo9X4vohUmWkK3ZCp351L2KOcBKXDEdDv9uySgb6pH9oBR1BNw6XJMllNeVT0kBsvIsAOnFZU5M/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39840400004)(451199015)(8936002)(2906002)(5660300002)(52536014)(41300700001)(71200400001)(66446008)(38070700005)(7696005)(66556008)(66476007)(4326008)(6916009)(8676002)(76116006)(64756008)(316002)(66946007)(54906003)(186003)(9686003)(26005)(122000001)(55016003)(38100700002)(83380400001)(86362001)(107886003)(6506007)(33656002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tH4+kl1aOlTBjdDK6k5tiTtECC3i2GelZMVAs6gL/IcWD9hzviTjUFE0QKRa?=
 =?us-ascii?Q?3C/uk99WqK9e1+li5krmOC6nOJs5BrARS3DMJ+GAg0z2jzr4hZTecTAy7vhb?=
 =?us-ascii?Q?74e67g8s+moFUGTCrgFWc2rO0bECjpC6PRyTHNIJpxoZnHYwLvhBDeD8IPI+?=
 =?us-ascii?Q?iU0tU8H6h4/DK+cHeKnUfwQfE0diVgcugAW4ZMlWry5Gr+I+w0QBHDv4j1cq?=
 =?us-ascii?Q?TsaVPJeBKpQZTwTku3Kh/K74snt5f3Ed0GsvruiZfAVL6MXxNZN5nW7L2RgA?=
 =?us-ascii?Q?Q7jzIXsf5NBR6+XT0WM7/MMifCBCSP1bGlL6zSNn0zkiZmkC7NPspMXBy5sV?=
 =?us-ascii?Q?rmydNN1KsY85Do1bm4uhTXGtBBoacfBMQpqRPvkUOAtP3OCNUHai20NufAKV?=
 =?us-ascii?Q?zBiRyy/Sq0uWRXRQBKt+n0a7Rup7tNYF6R+GnhmgYTxBWkmjEMJraPtLFYBO?=
 =?us-ascii?Q?lcJ9wVQowNXEH08jslt1bpsuF2DwZZ+csOKZti+IXFXdmufJQiV/+h1fhZzU?=
 =?us-ascii?Q?9WeOi8Gsm3DWqMe+uaVN0Z/Ozuo9SB4qITHatFyMeeTNX5DHajXHxd1ohhHO?=
 =?us-ascii?Q?h1Xh1nEuXYgwqu5wcfAlEal18vRUCCmzZHuPLNmtzpDH7Y/aBbIMu0o5Sv5O?=
 =?us-ascii?Q?QAye4foPbgz+9rFeeBCFzMASzjgIkBRNOwGKcxKzzURiUVQKon6Zedj4dU0c?=
 =?us-ascii?Q?919zdyYWJNopBElOAiZTryrKECG4N5VvnPkUkyjC6QIatoa+VtIhTcTAfFZR?=
 =?us-ascii?Q?26Wyo6XaLNxSR/tvIMj7EVsX6+dvCqD7ftl+yePSAWmoS/kXjpM5OFOmtOKi?=
 =?us-ascii?Q?UzVL4VMpR9+EKzkkjqup3JIz2Motbz8LJDWeIaaYwW5kwdRA3Io0bJYJv1yz?=
 =?us-ascii?Q?psBJV5Y6cUp/qy1ULgHc4PtsiHsdDwEtBJ1vfqyVeq1NC3AWWCpZy4oCcOTI?=
 =?us-ascii?Q?Zy2K/gREgJ/NftCcnTXmOhUxyVKGl7ikfeozPbSJjS8oun7HGkdTvqfI/ZeD?=
 =?us-ascii?Q?WbwV3sN8tfHdxh4YAUEYL+C9U8GHDvNdXyZRO0wFJjkB+bgwT7yxya+jCDrx?=
 =?us-ascii?Q?1GBYpG62Pn223NBuxBbnMVn7Be/pTC/ncins9u07CkO1+l34OKAafd0ZaOhg?=
 =?us-ascii?Q?C03/z9qHG+BkBgdgIc3gy6RInAialxb2R2ymOeqbn7t1jpvSqPxv/3lSDBj4?=
 =?us-ascii?Q?WIHnRTeu3LpBSuLfSl9JmxKOSSZSs5J7H9RC+5LyHoyhtTQ+/hkGVD1YxEZ+?=
 =?us-ascii?Q?4Y/17dKBSnbmBFBQ+x+wBPkhm5yADZ1N/teFvhQ1cU8BmQ4RN6B0fPatNQP7?=
 =?us-ascii?Q?Zuq8IGnY/VV7552NiwQxA3jXc/wmQVOD+1IcB3m43ULnIW4ub7191JZ4qjsT?=
 =?us-ascii?Q?Os/bHmosAgLi3/J6D+6Lnj/iDhzQg2sM+fCgCS3jORD43H/AmVS9Lbpk0qsJ?=
 =?us-ascii?Q?sMpcZn3gSM4SvN6u+J2nLReOGt3oGJ07yZzJ+nJ06iFNkvXnFkAWhAqymnYH?=
 =?us-ascii?Q?6X2IpH2oLtNngmGr9hxrNbFwBtbwbAhRAAhdE49xHNfV6P4tc/JAS2ZHsSGT?=
 =?us-ascii?Q?jPYca6nGVZ2yyow+vajCzRHaSl+qtAa+Guu8r4x9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f289f9-fdc8-478a-24bf-08daf22493b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 09:33:33.6941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b51baaI69nuFGK2aITM5uK7iFqhZ6OoCzIuVSSYO1CPUsSomCF3hDV2uzHru30GwZqv9oToYtcRRXpMca2o0L/gJ5G5UegZia4cjx3tCrGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1275
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
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> On Fri, Jan 06, 2023 at 06:15:33PM +0900, Kiseok Jo wrote:
> > Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> > Reported-by: Mark Brown <broonie@kernel.org>
> > ---
> >  sound/soc/codecs/sma1303.c | 79=20
> > ++++----------------------------------
> >  1 file changed, 8 insertions(+), 71 deletions(-)

> This and most of your other followup patches should be part of patch 1 - =
normally you shouldn't introduce problems then fix them as part of the same=
 patch series, this makes it very hard to review things since people will s=
ee the problems earlier on and perhaps not get as far as seeing the fix.  O=
nce the code is merged changes need to be incremental but until then you sh=
ould fix the patch itself.

Thank you for your reply.

I misunderstood what you say. I haven't registered the new driver code on t=
he kernel.
So I think it's not new patch. So I resend the mail updating patch version =
applied your feedback.
(Because this patch's topic is 'Add driver')

If the driver is registered and there are any changes, I'll make a new patc=
h for each changes.
And the patches doesn't make same patch series.

I already resent the patch mail for registering a new driver, please check =
if there is a problem.

Thank you.

Best regards,
Kiseok Jo
