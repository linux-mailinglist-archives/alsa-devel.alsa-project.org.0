Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00254D3F42
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 03:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B5416D5;
	Thu, 10 Mar 2022 03:25:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B5416D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646879201;
	bh=tVbWU0aTdzalkiTZeiHjKBurlDeyJR7BoX9qLVz+ijs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sdb37SvN4H0ueBIqvTbyKBTlnozATyZNm3sL7H2sVsm1WxAwSoABmxaExJ3T8kXYw
	 K6Z9IiVU9r7zO4zArj8uKBWD/W42BN5fM9pEPMvlK/AaLOS+qYcSBXumwUZko89EAR
	 Qcz1BHVyXSuCgJPKr69QbQSbcEyPciWPdEH/aJJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F6FF80236;
	Thu, 10 Mar 2022 03:25:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AACD9F8012F; Thu, 10 Mar 2022 03:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0626EF8012F
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 03:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0626EF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="D+I9DprT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yn9ja1Ksqb8dWueUWzjOw1YxKuvb1eA5yUOOKrEXH4FfaEcGwOJb6Z8R8iZir3ONnmdaXJfPxayIdJzAYkt/FYHz9QNNSZM9609ZH/8vXM6jfLJlk7IDJ2oLuwHbcP5WJVmZ7JWKHcz3R9Ud8Jax5i61Y9j5LtMGv27rS8aUCrBxxle+zyr3OEa6TnmAs0SBuZrg0UmUVTI8ow7oLoq6926e4VagWipxKhnO+zbUZL70/TL58FCvO5YusYyQ4fAliYQoHiBPkm6ebJbT+prcswiaAPJPhX62LFaYgCZHN+2zT6sYkFwJtzvqIektLUUZHDb+M9HwRIvHvliWeNhYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la8fxLw20DCIaemovPdRl41fIDbObie7xhsnhseY1ko=;
 b=GL+fOxV0U1+jYwhhRoj5C97+Kqc1ZAOmwJlQZaz8sO+mf5i1qiy+ZJFQreBY0UYONtvBpgSvD9ac4oanjYepRQk5kIJCzUL6qGHo9evnkh2KNUujMvCLJC7ZFzzWns82qCrPS9lcoWClL8m0iC7hgOpFTQfn4oWQO5BYNBJmLoBLZSjBRl2GWJATwEn/Ds39alx21ij4gCQ9B9tJD8ZAIWZYV0iCVTLs5WAd7DtzDYwFnDhGNWi+DOQy66bAIWbPlo75OoXjkaKpNux6edv0KQPKo0KSD22vZfJQ4/JnrkERdhPoFEv/RpBlE+BX9QTUqL/1Nahl+5666l+KuAj8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la8fxLw20DCIaemovPdRl41fIDbObie7xhsnhseY1ko=;
 b=D+I9DprTch5KK1gZeDxEjbxWXUPzl3Me2tSuBK4W3iKn4pL8gTKPgiTQz7NhmYI+YcdR4Nn3GU+YLvQbsShLwCbvfAHu/SJ2rQvKadmK7nvyBzgOY3sk2ya99Hc/eRwxcK4bpamUUD2oO5P9XAueSRnU2OzM3pNgwqPnlUlYnpk=
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by AM4PR0401MB2387.eurprd04.prod.outlook.com (2603:10a6:200:46::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 02:25:27 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb%8]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 02:25:27 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Issue in pcm_dsnoop.c in alsa-lib
Thread-Topic: Issue in pcm_dsnoop.c in alsa-lib
Thread-Index: Adg0JdU3ct0f8AHKTNKxu6Jsn1aOww==
Date: Thu, 10 Mar 2022 02:25:27 +0000
Message-ID: <PAXPR04MB90895C938258A36B92595C78E30B9@PAXPR04MB9089.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80bb5a23-888c-4056-cebf-08da023d3da3
x-ms-traffictypediagnostic: AM4PR0401MB2387:EE_
x-microsoft-antispam-prvs: <AM4PR0401MB23871CD1112A68A0FC003F2BE30B9@AM4PR0401MB2387.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ysU6dgLCKgOJnLccAnutIp4a+erYFm9NnaoaQNOj90CRDwaJKgV+RJR2xpMpCp8rrF1yHt52WI1zxkJBeVCwgirpXt9KOnd817bedoIqtkiHUWYyvlRCKsMdRh8h8vYWU2j17j7N52/g9KFFiJ0gvNu+1PGxd0xfLN/de7WRsF2+aXM0K273KgWPKOn0t+1J/RWqMINkQENdgsahZtnloh0G8C54iFhC3F609SsW8qutnPNCFoOGGUv2nDuk2iTljiwjTst+OHvQaBvnfRBfuN6DfiVfvyjygA2zXzc1uNuJXILg/R08bdaQRSjAJHci5tX0i4Zzx7as8GIB3lVkxFwDj+0lNGUIaWn3d1o5e5IaDN2/6pziIsAUATK230RYCjnAEsbHQLQTaCH/EbPg13qa5jdhwOUpRX9/wmEkl2F0DM8RdhmSdZ9W28VrL0sB9qiShqMhy4+Zz3dQU1IktT0JwXaMBs4havmkmnmn9bzY3+bOhkZ0BYtHmJWLbq+fSmgNEEPyT4moEQ3l7xm23VxfZi3mnrEG7P97FcfD3inj3EbDQd06TJ5wfxJhxo3yYRof15Q7xMi7sj49FabrRmrZYJ7Grl11SHQ39KRHH5WYnDelvz0pXgyOTINq8HJQ/96vO7HHFukUZfZvzKWVlMVtY9DgFqk1eqNKVXgk3hyHDSdg2c2dWs62W3Nqk87CAs4fHWt6i+y2cjuC2WejX7qWRCfbykQ5n6b3fedql1el/d0/hfUXVIMsrSiYli37NyZ5V+h1f9WGnLp76p/CW9Ib10GvbYkucP3AxpoZSdVb8PlP5AVwAtKPeY+kmIWtcJLoXnB4f9ueaAwAs5mfFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(8936002)(66946007)(33656002)(26005)(6916009)(186003)(66556008)(4326008)(52536014)(9686003)(2906002)(6506007)(86362001)(498600001)(66446008)(55016003)(66476007)(122000001)(45080400002)(966005)(8676002)(76116006)(83380400001)(54906003)(71200400001)(64756008)(5660300002)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hEeJQc/XtCkSBwMbgjMI+CwqJMV547Kpm+0Jvo6Vj/2bJPeHj6ANiwMw0N7M?=
 =?us-ascii?Q?CWLmR4TRf2u2/pgjQJXjMOwRIk3sQZiNyWay1ur8R3OBuKWwx2ZP5hiY5aHP?=
 =?us-ascii?Q?nw0VAyqb8Pp6jpJXOYAw/8a5sAxSMB7S7ECl5BExTukp+7jA0N1F0iRzPh0z?=
 =?us-ascii?Q?m8oDiURlEzir5X/dsyd3D7lSB07BN+wGxn7KLMchjuHJlVp9QFd1bIeJKu1E?=
 =?us-ascii?Q?qecaHu/5KqtinaTWIhPkQfsIJN2aUx/UrlEWx8z1sNlPTsmIbsoRwTrmusrc?=
 =?us-ascii?Q?4kYpjIrcSunQRsDgM0iCw0utZuelQxNJs8sIIA+OWN1kkPkMY4uymrE1Rvek?=
 =?us-ascii?Q?MeURwVJWiGaYKlYG+/vEMMifMLzQ+zi/+Ph+7uE6N90dlhUXSsjoeaf0y1KZ?=
 =?us-ascii?Q?O2OAskW+a8MDEjYouNPeqsLthGSP6llgUu4Pt7MwI/F1fVN31cR3VUjOT1ex?=
 =?us-ascii?Q?pPNbFkwAilEGqPcF1rC4j+QrAD8O+15jKWVe/OomoU8k6pnw6s9fb3XR7rvb?=
 =?us-ascii?Q?cTNvo0cpxEbO34Yy3b8eC9ww2wLddbWLe3lb30Pf1Kbl9ZxH7AcXgNxgmxcP?=
 =?us-ascii?Q?LxuiM6JDVxZ1gEFd0zEPJtFRfcMKs6DMWjxxDtYLrJXUuzFz/JTpThub0P0H?=
 =?us-ascii?Q?C2QwyHIkeo4BDAxagbLyhGMyVfVHr35ssNGNUjFMeg+pOhHBvcAbZDSUT7jY?=
 =?us-ascii?Q?QRiI3x8lSg/TyxdjeL0955uS8UdRBj0LcV+9ZODescY8vXUwt5JHU9FDudM/?=
 =?us-ascii?Q?Z7igK7TsaGFX5mmeHl2uEljTSX7q2BmU04RdckzGngV4/WxaPR2JtXAtiSZd?=
 =?us-ascii?Q?P1XHB2uZQNoSfxZIXxri+kMofkyUQeddS8SnF2HfXPDAQPQEqxCzGRHES8BV?=
 =?us-ascii?Q?40ZyhgpIJI4wi+gF+McSx7CTBOeIs1wDMXf2UsXtRLf2M5YOqwIaP2wn9GZ8?=
 =?us-ascii?Q?FyLdWWrWgAHN2VOvQ1svGhqHETlN4jOyj+S5neNGiNi2apHhTfJCjfpMX9Su?=
 =?us-ascii?Q?+xTmbo3vUaduuTclP0ObQoP+BY2ltSmFpFCKZCC/z1V45VkSlYYunRb1CbMI?=
 =?us-ascii?Q?nx3I45U+RP5fLUA+kgIJihZselExBEmKG2+xRNIaIqbObTMxPYL78iwu0k53?=
 =?us-ascii?Q?flxFuOCspLdjen8fBvZbQ16fDQgjuxPhyCjzvRCmv3ODfFJURq0TP5J3w2yP?=
 =?us-ascii?Q?cIYnGAXh7bgzJtw0smVcI+3ohlFIyiWHkpQ2yhqj25PYfsX5eLSbt3O3qJIP?=
 =?us-ascii?Q?fLNj05Eg0J8hB1DwmIXNW0IYtFkmgXSic9g5zQjSfO2VJQeLeglG/Kax/g4d?=
 =?us-ascii?Q?YLavhQtNHnv0lBiNRvicJIDAYAMh0oCOSZkM18xfnJncJ2p0GXK/hEB2zEXO?=
 =?us-ascii?Q?J9ZlNGot63TJjIMg6t8LEVOQbNxWvC6KpJCgYY7peBWLh8mD+n7q4+ro+Fo4?=
 =?us-ascii?Q?g0xklydIhq4dVT/6QVAO3nZJnnq/cA5y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bb5a23-888c-4056-cebf-08da023d3da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 02:25:27.5971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t79EsGkr8cF1jRHLbfWTW7p2iRZL3H+Di3DWP04F4fXGTsZX2uWPDHxZYJS9l0Figm/FYK9pkU2j+/lcwnZcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2387
Cc: Chancel Liu <chancel.liu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

Hi

> >
> > > >
> > > > Hi Takashi Iwai, Jaroslav Kysela
> > > >
> > > >     We encountered an issue in the pcm_dsnoop use case, could you
> > > > please help to have a look?
> > > >
> > > >     *Issue description:*
> > > >     With two instances for dsnoop type device running in parallel,
> > > > after suspend/resume,  one of the instances will be hung in memcpy
> > > > because the very large copy size is obtained.
> > > >
> > > > #3 0x0000ffffa78d5098 in snd_pcm_dsnoop_sync_ptr
> > > (pcm=3D0xaaab06563da0)
> > > > at pcm_dsnoop.c:158 dsnoop =3D 0xaaab06563c20 slave_hw_ptr =3D 64
> > > > old_slave_hw_ptr =3D 533120 avail =3D *187651522444320*
> > > >
> > > >   * Reason analysis: *
> > > >    The root cause that I analysis is that after suspend/resume,
> > > > one instance will get the SND_PCM_STATE_SUSPENDED state from slave
> > > > pcm
> > > device,
> > > >   then it will do snd_pcm_prepare() and snd_pcm_start(),  which
> > > > will reset the dsnoop->slave_hw_ptr and the hw_ptr of slave pcm
> > > > device, then the state of this instance is correct.  But another
> > > > instance may not get the SND_PCM_STATE_SUSPENDED state from
> slave
> > > > pcm device because slave device may have been recovered by first
> > > > instance,  so the dsnoop->slave_hw_ptr is not reset.  but because
> > > > hw_ptr of slave pcm device has been reset,  so there will be a very=
 large
> "avail" size.
> > > >
> > > >    *Solution:*
> > > >    I didn't come up with a fix for this issue,  seems there is no
> > > > easy way to let another instance know this case and reset the
> > > > dsnoop->slave_hw_ptr,  could you please help?
> > >
> > > Could you try topic/pcm-direct-resume branch on
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
i
> > > thub
> > > .com%2Ftiwai%2Falsa-
> > >
> lib&amp;data=3D04%7C01%7Cshengjiu.wang%40nxp.com%7C95f97de3f2c840d
> > >
> 9853508d9fd2e79ea%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> > >
> 637819198319430045%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> > >
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> > >
> a=3DWWX1ZlcQhJF3pHJdHPIH%2B0xG9o%2FjQnHG5fHDbKXwQwE%3D&amp;r
> > > eserved=3D0
> > >
> >
> > Thanks,  I push my test result in
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2Falsa-project%2Falsa-
> lib%2Fissues%2F213&amp;data=3D04%7C01%7Cshe
> >
> ngjiu.wang%40nxp.com%7Cf71e70640d1b40b66be508d9fdbb2ac2%7C686ea
> 1d3bc2b
> >
> 4c6fa92cd99c5c301635%7C0%7C0%7C637819802581943763%7CUnknown%7
> CTWFpbGZs
> >
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3D
> > %7C3000&amp;sdata=3DfZ2ogNj2RDTv4DV8vgB71M2m0XtU8UhMiXEV1%2Bl
> wUrQ%3D&amp
> > ;reserved=3D0
> > Could you please review?
>=20
> Please keep the discussion on ML.
>=20

I saw you have update the origin/topic/pcm-direct-resume branch, I test you=
r=20
latest change, it is more stable than before, but still meet once of the is=
sue after
overnight test, it it very very low possibility.

So I suggest if we need to do below change, shall we?

diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 729ff447b41f..cc333b3f4384 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -134,14 +134,21 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t *pcm)
        snd_pcm_sframes_t diff;
        int err;

-       err =3D snd_pcm_direct_check_xrun(dsnoop, pcm);
-       if (err < 0)
-               return err;
        if (dsnoop->slowptr)
                snd_pcm_hwsync(dsnoop->spcm);
        old_slave_hw_ptr =3D dsnoop->slave_hw_ptr;
        snoop_timestamp(pcm);
        slave_hw_ptr =3D dsnoop->slave_hw_ptr;
+       /*
+        * FIXME: Move snd_pcm_direct_client_chk_xrun after getting the
+        * dsnoop->spcm->hw.ptr. If the snd_pcm_direct_slave_recover()
+        * of another instance happening before dsnoop->spcm->hw.ptr
+        * is got, then a wrong spcm->hw.ptr is got which cause a wrong
+        * 'diff' data later.
+        */
+       err =3D snd_pcm_direct_check_xrun(dsnoop, pcm);
+       if (err < 0)
+               return err;
        diff =3D pcm_frame_diff(slave_hw_ptr, old_slave_hw_ptr, dsnoop->sla=
ve_boundary);

best regards
wang shengjiu

