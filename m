Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345925524DD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 21:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960442852;
	Mon, 20 Jun 2022 21:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960442852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655754905;
	bh=gXdV02kIlEalFvE5z804KD//nPwM11QqSYUFJVFn+Ok=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J76vxM3ePh9sAl4A4LuZZ4NIutn7CP3MCx3oPi9PqS4WizsRZ0HezrrjNSDr9C8+z
	 /iMaZ2hvuapqXT4I1XfYUqVu2Zc8Vc717TfqrYI4/J2Ih/d1EyDPsv9Syuum/yOXTS
	 SEkWI4c5i6cw1024EXzpEJ09g55Tb7FqZRKm4OoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DEAF800E3;
	Mon, 20 Jun 2022 21:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F91F804D8; Mon, 20 Jun 2022 21:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD47FF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 21:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD47FF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com
 header.b="kqUzQxK+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=culGKCA9q9tS7G+O9SES/b2zYG+LR7REgVGSAaA+728ROaBTcXTCnypr+Jm4UMEofHq6mmXojKw1DBgKVGAfG3SyfauT28xZRkhTCPZtojgK9B9CSEkqIid22oGOGYRycbeWl1sEdxRU8RCwxYDOFnCk1ZKZzY28/9HjpIC5FfWpsrD+GtbrGD0pilnio4EC3vRiuLYQpMRI2zPTxaPs+2+f7Yl65jJ/xj5MBUnvwf3IY9KE8gpbz9vDyyjtOzC4DtJSZuUBzWq91heSBoJl5K8zEn4QbxdZsCNgp+BVaD9PYGaSYBx+/ZOLDH6CKG0Vl4KenR+yr8X2bRjk+6oceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXdV02kIlEalFvE5z804KD//nPwM11QqSYUFJVFn+Ok=;
 b=dT1ZeChpLteyqJlY5HO+0hTzoGBlrLgbeg8wUBIfEgk1mq0R6jo6zFUakisa2ZG4kNvUhXYMhLp5j9eWRHvH0YOf9KO7lZWWRrpGDA3JfIlJTosIRlh3eMzf4ZYO6FSlnxvQx4E1yrS3oOARGeG4NVj1EbbBKde2N9Cf3d0R7TK7IR5N6Ww+Zh9AVk8ycazKcpTyqJSZoIBRaEGGn87eZ1G2EKkBnADnQGE4t89uwvbP+r6dtnZdo7QJuNd0Sowqro6Qq54IaAudn0gT0NKqEGWvyEsHH7Nt8VH0kAdmtno4/eYEoh9uR1wRm38Rwg/N3IB3YTdHUpLBq7iB4xPoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXdV02kIlEalFvE5z804KD//nPwM11QqSYUFJVFn+Ok=;
 b=kqUzQxK+/0um6oafVj0VvP9o59Xeaiu2iwjv0xyUfBEcmdHCPx9QTlo5Z4/OsiYRvJZtzdVkgvi+jlUn5fnuP3AL4fr8L6YGx9e5wPyBjJv0qHTzwm31CYQX0VehcRg6bjdqKQUG1ELpx2BeyvUC+hXOSa5Y74YQgKdf6nrPDs23Qe2p9y/J/x6p6Inw247XYtFhQRXZ0u66cNhw5vbV41rDhD4tS77m4ZPR2GYZB3vILVGtItRSOIYRnziBMlYwAHHmv1XPoP6g127l766iygmBxmj72hnAJVjFW7p83jMzxV6n0rZsmXdVhhlgeMTBlfAetqJ+cEaS/MkfVCvQgQ==
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com (2603:10a6:20b:bb::21)
 by VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 19:53:56 +0000
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539]) by AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 19:53:56 +0000
From: Pierluigi Passaro <pierluigi.p@variscite.com>
To: Alifer Willians de Moraes <alifer.m@variscite.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Thread-Topic: [PATCH 4/4] ASoC: wm8904: add DMIC support
Thread-Index: AQHYMi1TNXoCdLdmoUytTPQKBEiLua1ZWlp7
Date: Mon, 20 Jun 2022 19:53:56 +0000
Message-ID: <AM6PR08MB4376411B180D8860E2AD3AE0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-4-alifer.m@variscite.com>
In-Reply-To: <20220307141041.27538-4-alifer.m@variscite.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8cdd3870-7455-9450-6b45-ce6f3e814b27
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0e0401e-5efc-46e1-13c1-08da52f69c45
x-ms-traffictypediagnostic: VI1PR08MB5312:EE_
x-microsoft-antispam-prvs: <VI1PR08MB53124D2DE9DCD77BD6275F6BFFB09@VI1PR08MB5312.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JrGnmuPVPeFc826dhy1kfrWThywVRvMX1dLmgfCY6lFr+p9eubifjnKCmVosRH8xuPqX0NX215/U+DoFSpsVwYMnSyiCDbQ6eRAf1iDVPgA0ZQIJT7QIgZA4OxNy7T2GMTO0DccS+fG6aYdfWKlMQzZB7pzsc8pM2gBz2Jw/Kfq3hMyoM+U9G0+s7XAVqUHEkdOzO2mTUdTTlC5ZrjSBgnvXi9as7kEZd6PogMAWOV9VRmY1lp+Rwd2Zg+RxpLPP+u6/FFoSXrkHrqVXWnaV6TOl8Q9SWB2gqVANS4IKB11ZNKf5bxg6iZRROiCY14R4V/NqRby4c8gX/4VU+FK0xb2OhNCYAHHfjvvT0AJVLNGWfVuvfoNcD2jdINiAzORalkRxMKTZfuoIpuEN/KTf9XVMnRfJuvS/Fp5TJzgqZlXVPciRaEAahVliwRwgLxClBK/Tw/4Rk3sOyjhNZJwQhKxt5r0MVoCW5OmSaG90meLo4ZKImKUA0iklryRRVD4stC5/LczMQQlXP20xMAW/XJUgw0plgKfaO7U5dyTFN940e7HIJu1O8eQylAJuMP1q6Tg7WgHpF33Y+CDk+vOGr/NQxTt4DaTwciyHXM0zafOBxwVtAZajVSWZd5QKccd6Xnd2nIjb9cE8jg74LRfKC1slFkt4TDlBels1biTyIwaAZ/x6RRIqBrNBsCpbmhLV7LbJF9Tf0e/VTzlpKzpePw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4376.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(38100700002)(26005)(6506007)(9686003)(7696005)(41300700001)(110136005)(33656002)(5660300002)(2906002)(55016003)(8936002)(52536014)(7416002)(478600001)(64756008)(76116006)(66946007)(4326008)(38070700005)(71200400001)(91956017)(66446008)(8676002)(66556008)(86362001)(122000001)(66476007)(186003)(54906003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MZ7AryodLSvKFcuhQc+Keo3moiML28O3vf1QM/N6TaMMic4sBazJr7WHL5?=
 =?iso-8859-1?Q?/FH6L+NYx0BUUSbiFs3J6jSEzhEdh3N/QFdoCsJRWxR6wfG6RdX1rsWYyO?=
 =?iso-8859-1?Q?Ii42GKPzHTYLYsdA5DJg7ZTOmq73h66uz05VAr3UIXVQK/4qZGQyLknqL/?=
 =?iso-8859-1?Q?Ovo081uK/is7cza0FABDkwpqjUe7JGoLEPxzdIHjNReHPcGR6ER0KjuKAg?=
 =?iso-8859-1?Q?niBuJyK0T7uk+xOhnCBjHmGqjO2RIMH1wYBLEld+qLh4XDeRnBcrP56cX4?=
 =?iso-8859-1?Q?m3EFZOIzpdcJL25KEOrHDz5iDhMa3GgZxcyPWYlnJWOaSQQtpR2+B+/Hye?=
 =?iso-8859-1?Q?lgYfuReCwnxFoDk925SBLmdJ4+l38Zbmh25xONkv48+2t8r5Iz/yjnv1E0?=
 =?iso-8859-1?Q?M1Bgki1gjoQ8AHDSVOwcBAv8jM2tI/nMKLSJ21XG7XnZEfhF7DLc6vZJ3P?=
 =?iso-8859-1?Q?iJ4BRzUMHT8+cc8Y6HAlMJgP9vqqbyMXQ6TgAcZg7Lg43USVwAHgI4m4dX?=
 =?iso-8859-1?Q?Tx+pbAEo0mWyQUc7qK+/wKwMA7dK3xOmb7eLxhpmpb5EVPSivkORVCw/FD?=
 =?iso-8859-1?Q?cf1dn7gwhNd9rARW5I9TpA/NJyaKhi3y6HiD05bBkB+FG4+AsLZTHSf4ZJ?=
 =?iso-8859-1?Q?IitDXViRAQu86wUzq0IZOpTVCMUBKVQrHl0Rg05xDRmunYsgSc0V5HY/uc?=
 =?iso-8859-1?Q?980ElED2JDa6EkyVc/3B/bTjZkBvFWyL4kw1NHJI0U1PEc2ij0xijjSOci?=
 =?iso-8859-1?Q?lOiM7o34m14oYWwOCboBQKOpnywNsID7y4MAvqU+ENR/SYmbeAbNuqKa2g?=
 =?iso-8859-1?Q?uuyP69klfcZAPbnwoUlI88eWTKXBj80izO0TmFlyKTInhYZNl6IeZgdtqF?=
 =?iso-8859-1?Q?yTWxogsyeDXHiesvWXOWuJ18w0Xgi2o3jH90So0+RnqXRtRb5saSzkj6nr?=
 =?iso-8859-1?Q?rpgc/1Asj07fiFIgyJMu0c1ekKU/J0wWEDg+UNN0Zloj0e6486esfWu0bd?=
 =?iso-8859-1?Q?zX9fsKNbv3TAaOBtp1EchlhAGYx4mkPNbyFynTOwpqsdSV8/q3B5NaSes5?=
 =?iso-8859-1?Q?YenI/2Xj9y7SXCCrPRU5Jp70dym3yYaS8/cgIEbobMM9SknDeH1wSALUV5?=
 =?iso-8859-1?Q?ox3M/9gkSP1PdvJ/byBc3/0yjuPYMwzGsQI5GUFJ2ERckovRGujsKYvewx?=
 =?iso-8859-1?Q?vmoTQg0crDrI5Kfr4cbWzKBNE2MS4b5soNBxmixMbtmSPuaJqajzl9Pexp?=
 =?iso-8859-1?Q?0T4YfAdNYKsakJkU2+3TuCotITotHYNAgKNeCUuP8QtjizWVyvVJvPG1vK?=
 =?iso-8859-1?Q?CiBdYqYfNIqvm9rXd2zLevDg+XLlMQLGsgr31+V9WWSsR31hD+nw9dZteW?=
 =?iso-8859-1?Q?TxRqg/P/nFzHfPB7K8Eaz2VD9QqtgZ89qi9pyk/v+yJQz/anPxaFnhOFVD?=
 =?iso-8859-1?Q?pht1vQJQ5zuOna4el/uhlzNmk6Gg/sy9y3bn7nh7yLBV8/a57lWpgWyrgo?=
 =?iso-8859-1?Q?oaKLvd0r/5ipTAVkZVTQL5rOo+6jvbR18qXYEzZX8h9nKEINOJX6NXKWs6?=
 =?iso-8859-1?Q?uB3OIU0LUOnQp6jo7r32VFe2dfhCx4McO0Rs0qjv4jPu7tNTuo0Go1Rrg0?=
 =?iso-8859-1?Q?mB71WFBdDCaI4v5c5IVLOPlqyI6F5sTSNcnlni3tW1NdSldwYndHX9R/y1?=
 =?iso-8859-1?Q?ERSrvSzDiw20ubFgymb43433X1UTiJRBU8ebEaahuJ9fcWCBXt4aNorjFA?=
 =?iso-8859-1?Q?19P1hzshu/ZyVFuQaQm1dBDCby2MIH1IQgttAJkxG9D9fjDPOkS4L7cBep?=
 =?iso-8859-1?Q?ttCxnqcNPQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4376.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e0401e-5efc-46e1-13c1-08da52f69c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 19:53:56.3239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGnF4xiR0c6upXTxzC5ARwYhVe4C5pBz8kb/CtFVeeWgLmESweHEwuE1QRnmpFbiQMmwJwdwah7UwqORFxNGB0eQSrg0tmVH6ee1LgOCN2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Eran Matityahu <eran.m@variscite.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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

> > > > Just for my understanding, are you suggesting to set a device tree=
=0A=
> > > > property to force a fixed behavior in the driver ?=0A=
=0A=
> > > Yes.=0A=
=0A=
> > Why should we use a fixed behavior ?=0A=
=0A=
> The things that are fixed by the design should be fixed.=0A=
=0A=
> > > The device shares pins between the line inputs and the DMIC inputs so=
 at=0A=
> > > least some of the configuration is going to be determinted at system=
=0A=
> > > design time, that will fix the usable values of at least one of the=
=0A=
> > > controls which ought to be reflected in the runtime behaviour.=0A=
=0A=
> > In our design we use:=0A=
> > - pin 1: DMIC_CLK=0A=
> > - pin 24: LINEIN2R=0A=
> > - pin 26: LINEIN2L=0A=
> > - pin 27: DMIC_DATA=0A=
=0A=
> > we have no pins shared among DMIC and LINEIN.=0A=
=0A=
> This means that DMICDAT2 is not usefully selectable at runtime, you've=0A=
> got IN1 as digital and IN2 as analogue, so while the DMIC/ADC switch is=
=0A=
> useful the DMIC1/2 switch is not.=0A=
=0A=
A customer could have the following working configuration=0A=
- pin 1: DMIC_CLK=0A=
- pin 24: LINEIN2R=0A=
- pin 25: DMICDAT2=0A=
- pin 26: LINEIN2L=0A=
- pin 27: DMICDAT1=0A=
with no shared pins: here there's the chance to select DMIC1, DMIC2 and=0A=
LINEIN2 at runtime: I can't find a reason for a fixed behavior.=0A=
Can you please elaborate ?=
