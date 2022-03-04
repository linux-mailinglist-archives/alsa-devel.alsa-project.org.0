Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC54CD000
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 09:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54947185C;
	Fri,  4 Mar 2022 09:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54947185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646383006;
	bh=0Jp97bHMTmcHNkPF2ZvC3MAnAxKJ8AULaFxKYw2rZfw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EM1afSnpCL0Yn4ip2DNNBv5zdEnSH5ARGk3NO7rdmwavlRGfo3j1yPgWp+9LJU28z
	 z0t+E9bMJGc5maoSsJx0v9J8gZ54EE2hMk5wJ6rZllc4seTD1uHaWXCT7+ccZM6LbT
	 wRShLTDFkB2xNOG1D5xtaBgpK9uJLz7kMOV57Y2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF2B1F80139;
	Fri,  4 Mar 2022 09:35:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99E2BF801EC; Fri,  4 Mar 2022 09:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6B0F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 09:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6B0F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="ZRVZ4Y1b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tvpts8is6+wjjskA1H/HxqdHHdzKcCxvKhGIYgOL87tfUYJamgTGS5djAly0gO90fNGQiHcvod+ovozTuzImHlH0xuD/LiiHhgNUBg0ySvsj7/oEdnZ0k7UeHvjWL31hwFokEB3yI6OU5cw0lFMzcT28ipzB/8TGVpWK128E4rWoHHNe3A+iRZp0eMLsaQZoRltjs6MexF3w9zWqgw7WHb5SCj1FWGuTNiK64ICgW7rGQz2UFu7WQSSpa5PwEZn/tCowMqsPLc7+nZgtA7ieVPlQKr+CyMALbEAwDrEmTZj6jX8UrqfjIlYR8GerUidd4PK0dScXhm36y/eoohud4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hBCs+N23ycPv7g0MJcWcLPW5I+lRuLOHV1b+1ekclg=;
 b=KaRiQ2S3za1Wbg9OX+sLfXVwP7qnxkyJ7y/e50/xn9sVyE2d/coWqMA2rDQkD4XCTiBI0T2iWPJUHk+s+/KR+QhhgfkQ9sGQGp3YMbkkIQkV08CRLKToBjAkIR+GGc0q0IVj2PY5CL0FEJVk7ECUGYtuqNkADJb3VEIEKFheWKrsxFzXpOwJj+yPT9E4TQ2sy62TYiMA4S+xhuyoCt9frIUuypch6feEGtbARXAKH2Q5e+OD84P2vgs+offzNF1ci40s4UXYzHniyN/8lbo2036IDoFEBQpUg2sVReELanQBtc7kURpUz2NAJyuTgx9Q7hdtd9E8f9C/Zo+M8Pc0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hBCs+N23ycPv7g0MJcWcLPW5I+lRuLOHV1b+1ekclg=;
 b=ZRVZ4Y1b8CaMMy4tQRbmDMonKD7B+f8qALs38k3vSRblQbXx0b23YtTMZZ2mBZv9lAKnVbCArbmse8VGv828HRBR3Mw4HC2tcIpfWXzZnJ4QM/42Kv2bla9EPUmF9lSJSU1ss1FauYs3uxch7MQb14jDigi3tddnlBOEQQq/Avk=
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by AM0PR04MB4337.eurprd04.prod.outlook.com (2603:10a6:208:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 08:35:28 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 08:35:28 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: Issue in pcm_dsnoop.c in alsa-lib
Thread-Topic: Issue in pcm_dsnoop.c in alsa-lib
Thread-Index: Adgvoqi4X3jn7zMXTYmREv32EqL7oQ==
Date: Fri, 4 Mar 2022 08:35:28 +0000
Message-ID: <PAXPR04MB9089532964E25CA9DB4B19BCE3059@PAXPR04MB9089.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2f56a83-0850-4a20-e485-08d9fdb9f016
x-ms-traffictypediagnostic: AM0PR04MB4337:EE_
x-microsoft-antispam-prvs: <AM0PR04MB4337CDC9F0D0A4A32EC678AAE3059@AM0PR04MB4337.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NnXxI9lOwFiu9s48cmfPd8sRY9UqoPWMA0dTLzyp2qi4OY5Glae9SeDRNQfWf6fDbS+1gVjbaP3NAuaNa+iqjaM9C7vUisLJhqLHhCcF5n3w7DkwXGxMeOp1Ha6wFoA63YYHmO+J+FWBSAeH+etdSJXcA0Y0z9Qwg44JNQzrO3shL3mmcV8kgzY05OIAz2Loi6iyPgdikHVaEpja0gS49OSRaKNBcbJW3/q4iw02jYYcV9Ak1/PAmq4CJtbHgXsMVneuZw+Q2Og17q3Pum+17CYqd7KFBYSeNnxPjrsqQwwxnDPXbvcjV4+7BVV4s7CR/DmKB/uo+B2U+SI+yjrofcDBq9sPqoUQo4PKdWzStLON1FEz8opbJB7B8teBbwviIPh604O34xGm5Np4/nXGBrvGBCTaZ8FrC0d+uciUT6bbYd43lwhlMvUkQm8jDKZvRd3vGOWdxAYH7LNFItg8hxCgSVkF2IlKSf4dfPmSXIKoE6pUKfbmdfAd5RvIET2m/jAjHTebs9qtT92iZrE3k7BNiFIUOJu9yW5oXCDlrHJbMfDMhSCQAINE/cJgY5igph9xxO8iID76OYd7UdXBEZF1NHdoh/5sUFCCf3VBwvLv+MQUYyDHmLidVNEkA0CcjBkvs18nASjEBXiXWwolwLA7mxjZyHBUh+TFdlDRcdCzVKIter83aDcvARhQ8pIP7lbIaZXMqS5M7mxgiSTxOqZmvAGHzFKMIVz+evgnpGAMWNy1dxp7Zjv27PkwGgZj7OEjveVOzAKldpa6p2a2gMzw88kIOm6lrnvDfu9dZ6lMtwgx0Pi79Ym+yMNwnUhb+Ij0EuqR1aAzOxqzoItOsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(76116006)(2906002)(52536014)(8936002)(5660300002)(26005)(71200400001)(186003)(9686003)(7696005)(54906003)(45080400002)(86362001)(498600001)(83380400001)(966005)(110136005)(33656002)(8676002)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(55016003)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jomduRoZ+CGzr1ChJEvLOxmvmCUANqo0sl2lB+vr3WHNZljMUFnWESPeaa0H?=
 =?us-ascii?Q?7WXwpR8JocZImnTpZZv2wbF7xWCjXLTsFFvTXuJ6W6/UhGz2A/TuotlV6Xeq?=
 =?us-ascii?Q?jWvf/Halzn14dW4oNeYb8NOTpvpGmGySANHu/kgo8lQmpvVD75VAySVeP8mu?=
 =?us-ascii?Q?CVglFXBdztZDcWG6U/F6bbqzFB2R0DwX4oYcJoSo4WuAKfjcXH2IFIJT1PqG?=
 =?us-ascii?Q?5bXn0yfgSgL50qn34c2DNyUiuqKQs4gL7JMyiIvbzy2CCmMTPkZ/2Lk9ryGq?=
 =?us-ascii?Q?d3mENH5St7K+2Ororb+9eAgsF2eS4T+UwKzH3Ct5X354AUn0a2k/QsNlRk2h?=
 =?us-ascii?Q?CmopxsXIgisnJBXSHGe8i1uvyEaa/sbFPxRGm70b15nNMQ05t5CNBeltICOf?=
 =?us-ascii?Q?aeO4axUIDC6UV3NDZUkJafYdYB841J3wTdpBObxUa14S21PUTl23mCh2F1b6?=
 =?us-ascii?Q?uKyzrMbQTg59on+GE2dRtyBwLH/ZRkrUxWeYtsATnDkQ0bxUbCTM5vB9SIuD?=
 =?us-ascii?Q?wEL1jlGxMQKN2JdRXGkiycUET8G+/zsGgRiYkG+L06vbZdYC2ap7m3nvprtF?=
 =?us-ascii?Q?0gsNim7CsaE6U1+irWTgVPPTW0A44euvE59CeSdeTwUoo8XuX5Mc8hs4z2Vw?=
 =?us-ascii?Q?Oz9bqi+c3KsDQ6HklAwZTRVde4hMta3JX3egDh/HXTfV7aXuAktmvrnKCF7p?=
 =?us-ascii?Q?FiaBRg++jdq24jEVOhATCk1jXaKgBvTb5vhxOAVE5YIXEIWcQRW8vfgw1e8I?=
 =?us-ascii?Q?9pW9EpouWu3GhsdrWThTwa2LEHDTFuDzgP6m0/dVkC/JuOgC5fBU/VveZZpb?=
 =?us-ascii?Q?do/WWW8ZTS9dT1XoCxNy1CM1qzuJJEKT4HMcbxaKIAYQl1uhJYXE+3oEaF7j?=
 =?us-ascii?Q?bEuC5Llbulpgqbb2IyaLpsrlkNMkYEb6qDDael13NEXeWGzG7KTVFxoKtI6x?=
 =?us-ascii?Q?Q/8jM6CV9NzJ/t2YlhH1F4ejVjCgi98wmyBerUvLESETBEw/2TxkGS0zu9HG?=
 =?us-ascii?Q?HEnsPsm/Ad3GoQwfeBe05/vTHldSXhYoKcbY695xapcf8+7E1lNp8SaEynS+?=
 =?us-ascii?Q?U423gpTQlnRtBJsmgv3QfoJpLcOeg7Ia/0vMNPTbYkYOcyU1y/PakvD/XZm4?=
 =?us-ascii?Q?y6PPCaEdozxQfZzRLvqoegrI5bw5OwpnQrtUE/0JJ2Rce7tBlrojQZyed0u0?=
 =?us-ascii?Q?YO6oWQIqlbHpqKVCbitcO4XIgYXMD3DI4QQ727e6pkjWhyZBYktjiCKFU1Vc?=
 =?us-ascii?Q?XEHnGcMSixV2MAQpQIwph8Jrke1+I8Vr/fpgo7LNafFqjpzsPZ7ji++7Vkx1?=
 =?us-ascii?Q?wiQ86j+yaDZ6NXs3F6c6QupRwjx0b1LfAkRuOWV66RtPnJK0Klb8/A0ujfEC?=
 =?us-ascii?Q?mO529DD6SeKoRPlxfw3HrI4+JHKFq3EoRBB9SbC+k3W/pF7pKLKfjaGfsthF?=
 =?us-ascii?Q?3IUgAc4jI7EquRsDIJxCpm4aAuiJkGassowxedzwTodMBSQiKXC44eJ9OAJl?=
 =?us-ascii?Q?NpzMOCYzcpfNJT0xXE9varLhs2SrQlFsw/e1RysREO7lJ3ZSGDDPu+qC/lCn?=
 =?us-ascii?Q?MP3Pi5T2cBR27inLsm6o07P/luNbw/ievRDTjwrHOFdyDmeDXXT6TuhrKKKQ?=
 =?us-ascii?Q?tA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f56a83-0850-4a20-e485-08d9fdb9f016
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 08:35:28.7507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRHGWx2gAZMfkqLcrqQIBxpfw2sOW5jmxJnZZZYDHqc8XSCdh5eMG+XZkQ8QbuXDHrqy11VORTQ4OpJvmBObrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4337
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Chancel Liu <chancel.liu@nxp.com>
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



> >
> > Hi Takashi Iwai, Jaroslav Kysela
> >
> >     We encountered an issue in the pcm_dsnoop use case, could you
> > please help to have a look?
> >
> >     *Issue description:*
> >     With two instances for dsnoop type device running in parallel,
> > after suspend/resume,  one of the instances will be hung in memcpy
> > because the very large copy size is obtained.
> >
> > #3 0x0000ffffa78d5098 in snd_pcm_dsnoop_sync_ptr
> (pcm=3D0xaaab06563da0)
> > at pcm_dsnoop.c:158 dsnoop =3D 0xaaab06563c20 slave_hw_ptr =3D 64
> > old_slave_hw_ptr =3D 533120 avail =3D *187651522444320*
> >
> >   * Reason analysis: *
> >    The root cause that I analysis is that after suspend/resume,  one
> > instance will get the SND_PCM_STATE_SUSPENDED state from slave pcm
> device,
> >   then it will do snd_pcm_prepare() and snd_pcm_start(),  which will
> > reset the dsnoop->slave_hw_ptr and the hw_ptr of slave pcm device,
> > then the state of this instance is correct.  But another instance may
> > not get the SND_PCM_STATE_SUSPENDED state from slave pcm device
> > because slave device may have been recovered by first instance,  so
> > the dsnoop->slave_hw_ptr is not reset.  but because hw_ptr of slave
> > pcm device has been reset,  so there will be a very large "avail" size.
> >
> >    *Solution:*
> >    I didn't come up with a fix for this issue,  seems there is no easy
> > way to let another instance know this case and reset the
> > dsnoop->slave_hw_ptr,  could you please help?
>=20
> Could you try topic/pcm-direct-resume branch on
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Ftiwai%2Falsa-
> lib&amp;data=3D04%7C01%7Cshengjiu.wang%40nxp.com%7C95f97de3f2c840d
> 9853508d9fd2e79ea%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> 637819198319430045%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> a=3DWWX1ZlcQhJF3pHJdHPIH%2B0xG9o%2FjQnHG5fHDbKXwQwE%3D&amp;r
> eserved=3D0
>=20

Thanks,  I push my test result in https://github.com/alsa-project/alsa-lib/=
issues/213
Could you please review?

Best regards
Wang shengjiu

