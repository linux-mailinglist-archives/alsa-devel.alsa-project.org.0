Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF245E382
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 00:43:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B973918E8;
	Fri, 26 Nov 2021 00:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B973918E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637883793;
	bh=sNtOFjXYwS+kRt2+yBT2xD0LgcHFcsZrpv8SFs2uBGs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qb7L1GruvH+7oQn/Ap23713jUz7gQpNr4gPe5x/W15lOv6mWA0JrkFVQxdE9UVsyt
	 /V1ZfjfH5AzeyQUx2XZLZGQt/x1BJG+AsYi7FBRrAq/TvAGQ+SaQd5cowCEyDzRxJX
	 fkZCSkbm8ctC7dRY4ucfFOX+Q9lP9fcWYliDevbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC58F804AB;
	Fri, 26 Nov 2021 00:41:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F6CF8049E; Fri, 26 Nov 2021 00:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PDS_BAD_THREAD_QP_64,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FD4DF8007E
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 00:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD4DF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="BFgHsydD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1C8OtAX9/kaM9c0CDLTUCMiqzR/iSnKZBSuP360oKZ3aonXHFq+70nYiaMXaWxj/SjgqbZfJ0pn5jAzdMD8Hl5nCc/KNXaEzyitj+F/b7ToDrIPsnutx3C5EJzUanoJLkP26qn+/Jj5RGXW+kWnIISnV5gVJnXo/BvLVwR4wE1VumMFaKpEOXuI4oB0uokPVpXl/efU8D1CX9iCTOe0dCt97jR7sddiQd1uFEyFz+wWAs1ugIr5ZI0T+sga6XoFYhZjl8ATA81xv8/hDIZOrI/xZibP2KJLPRzbOUWcF3ueemuLZ+WaWF1cWtU88tCmgXgYd4cCkoHtwGGOYPLOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNtOFjXYwS+kRt2+yBT2xD0LgcHFcsZrpv8SFs2uBGs=;
 b=g6wmkrNzBYWhO+B+QCStH2UQTTh8wUrh3R6cfBIdVo3csV8EOKQWOG+PzZIEDNAL1QbrV+QEVKiyiF7AwwctzkqU1rnKsIWNug5Hny/CYJNgcMJpthLJGk2oTIjHt7jJgteuPgKUrdoE9IbJN1PyEj9SF98KCsgv/G4RyPJZqqTnJfoO//WFdAfBfwvKOjtzmVOFwbAdWrzdalWSQH4HL+haA5NYjZd79MObaXMiKYDPCYPtp+cvmuom+GIzK6dP8pjKWga3WrjdI6r6VDB28BJ38/z61mHYSAjIZ7Q4DywCsQoJ8GOBJlXRC2EPPyD3nXdGsGypXpHKdCNGcsmiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNtOFjXYwS+kRt2+yBT2xD0LgcHFcsZrpv8SFs2uBGs=;
 b=BFgHsydDDmh3JWrxVSlLZsCH2z8qNsoYvqz0Kybfns88K0qJ9vL9Fx+QjP+0FxqkIkft9lJHJSc8wFx/EwzZUpLd99Kk2/DEWzyCVTmFGsuk2Os6kF5ThgTIau5XtixJvJMeS5HXnePVWr6wPExrzbHUEtQL8GYHcY8G/CG4mF8=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TY2PR01MB5034.jpnprd01.prod.outlook.com (2603:1096:404:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 23:41:39 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b%8]) with mapi id 15.20.4734.023; Thu, 25 Nov 2021
 23:41:39 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
Thread-Topic: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
Thread-Index: AQHX2r4LFfTu2AAOvUeLogE5CKzAVawHNp0AgA1KC4CAAHRC0A==
Date: Thu, 25 Nov 2021 23:41:38 +0000
Message-ID: <TYCPR01MB5581F87D324E2499303E36EAD4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
 <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
 <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
 <YZ+8WbwDA9oQoRSk@sirena.org.uk>
In-Reply-To: <YZ+8WbwDA9oQoRSk@sirena.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89fb18ff-c257-498e-f5dd-08d9b06d206d
x-ms-traffictypediagnostic: TY2PR01MB5034:
x-microsoft-antispam-prvs: <TY2PR01MB5034FF59EE2725182DA92A24D4629@TY2PR01MB5034.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d4Jb4fZRckyNXk33EWBk90TNlpnNACRa/CSS+oMicBtcbz7d4J+inXRUzu6cCWewQJK/xCjfMGA6QcbBejRNTQ8UdGBhvgNYYGN4+72kOno4RB9hHLknkSeLa3cSdt1Y6mqNOiFy+sanIkhyA46k6I4bboO1Y7yVw2lBvzLyiBgJFTekMiEOObPOIy9MM0CZSJ/+XujsylxpkRcR22mUXGuwG3WCTO2ltmLwx0gZqNnhhlvJ/M/O3UgQOQ5uikJaMQuBd5zxlSobhN/IOZOcXGSChmNEadND/xc2m79aHvPip0S7n7Hg/5DqR+x+XwqwjmVqjrgtgma5QskwBGdI/MXLYtYtNgNa8Gfgx8HaqGy38RdhRXzWzQQayXto7PUsw9VQh0q76RkjyNVpVxLn6prqbalTkx1zDvDz81khCuoBp3mcvL+NyJxjp74sN87TwRgfTmOpeYrN4J2yFOBmvbFGNJbg0lZUb+usIRmG5BCQ4wUyXFl7x3IYuy3agF3yqBmJkwIrIyDIWMzTLZCOJdKMoLZ97fne1AR+B7sR1/wvt/CLHFE2VfhrOpxYC21pEfIDQpWno8lAm89qPrWDTMW84CrGzRVI7u3+F5Zcwg5gaLH/u1UwJwYNPlNyyJS1j8VclVGEycqQAvVCZ2MaGJ71mJZG6XT7laVnQncKvdObQ8Oa9z0oqgL/YYjXAK1hFRtHaazIrG4jAl9lxR2KvoIwgfhsU7PHVNPdZ2NU2cifak9nKedF3NX1GRKEFLPOCSSyhxxmpgLg6diY0W/aHw80BhMEj0xSyCW2CetVECs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5581.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6506007)(54906003)(71200400001)(33656002)(508600001)(110136005)(52536014)(38070700005)(76116006)(966005)(55016003)(7696005)(83380400001)(86362001)(26005)(4326008)(66476007)(2906002)(4744005)(38100700002)(186003)(122000001)(66446008)(66556008)(64756008)(66946007)(5660300002)(8936002)(15650500001)(8676002)(9686003)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3MkhKOCrAuAjQUmfaVorvFEBZ1nDxThiEchygdhJ3ddSYNvkG/KOF435nHEG?=
 =?us-ascii?Q?e6kuwowcujuYaLBpcf/CuWYELyYSAVhKlh3LgsgnyJBmE/DsooHgUs07oJco?=
 =?us-ascii?Q?yb4461uPB9Q4yhq06ImPDNvIk3Gg0ZYh0euRQCh+IK0o9lWhMkcd70byWl5b?=
 =?us-ascii?Q?3BAv0QDiJo3qhzsi4sGWv0ba3hCFoRDW7qpFeRpQuEJ+5glzaEUMgy22GY2a?=
 =?us-ascii?Q?xFfmXdR8TWqQ8auI9C6tsp4QVYsPa6axtn7YisahlgN5oL8S1ZbLm4jqOXxU?=
 =?us-ascii?Q?P4BQ3pPKz86F07IRuUcLh46WKfH8hEOdtaW9xgiItjKrhkhZy0tOj7Xk2ygz?=
 =?us-ascii?Q?dmt+1IlifDH7GsM9mZVLtCwx0wUnqJ/eEJGqfujzLZFYGlRpuPR977sH2x8u?=
 =?us-ascii?Q?WtTZIcyr/ZT3yQVx4C5MIISFI9f2eqTc3QGRmXdM6DBGVuSwYQxUJHjugfQ7?=
 =?us-ascii?Q?Qv7TDGXDL5/6EMo2DZA01XoQ45F+dnNMIW+mMH+Tu2avPzG8MhO7G5YUz3e5?=
 =?us-ascii?Q?zMp+Y8TTzv0l6AkhG6dOnVWUEZH7CTqgiB4vCtx/z+PIpg35q276K2DKZNof?=
 =?us-ascii?Q?5u8XPrGqDnzRw3oFpLHGlKLLrDRhiJrP3uRJE0Kg+5IUj9w3HDQBfXHvjA5S?=
 =?us-ascii?Q?GmJjD3J+9yDGDXdBHt+yx1Zrs6OaKbjOBwNJWNfGnCDXE+WX9ujLdkTNHgci?=
 =?us-ascii?Q?+CprQfFkeiz6TJDFIeo8yE5cRDRptFlzN/VksT+AFeU0kQAlaF7usmrtaVy/?=
 =?us-ascii?Q?lcwSETkxWzkKguRZhW6AAOiC2AF4emE153W4OZwkHlI9kpEtgbkO4Eaxjimy?=
 =?us-ascii?Q?ssgGpieRk06LSeEyKz0VnB9F7a99uN6R1c4FotV7EGE0b6Rn3O/R9Xzr9JwZ?=
 =?us-ascii?Q?IXPbiM4A2eHVsPsmzlki03fheeOz0C8Dli16pK8vKhhu8pEVeDhL96UQUYF2?=
 =?us-ascii?Q?cwWTsieURZmd6u1W2vqbqHZpCPrUcsiFudbuyZgvKVxsC7H3GcngR+bQMQNH?=
 =?us-ascii?Q?zGYzUlNvsK20DD4MGz03IaRnty29B/DemitXymMFAZ+TtiAgDQZqVcxbgOT7?=
 =?us-ascii?Q?rtJMbT3WbspSgZ2eGKi8UbfHu5f66HNpPIOyR6J75w9801XltUw79c/2Ai4t?=
 =?us-ascii?Q?ztpB5/JjOv2zAX+5IBUKWP4p3tyOFV9dHVs/J7a9/YkLaJlQNMYZs0HrSAkT?=
 =?us-ascii?Q?ncizux4/s5yi6hGt6rUDVw131MOroJM4j1LxPmypwEEnC1G49Qplxg3Q4+Cl?=
 =?us-ascii?Q?mKREaPgBVdvmAA7GKzkjUjZP0KjO0R3/twUdexFkj+x7eVLamkrZ2fRhxoE+?=
 =?us-ascii?Q?vYG8YoSFXctyCFNTTqzL5PKfyPyt13KZKa5oEp8IFGK3kokq1TGoB+XSH2h7?=
 =?us-ascii?Q?7IlnOmOWsqCh06lhCIPrgSCqfWpLEvYhM32XUccgPpLrjU2dSee4JDtNbx5u?=
 =?us-ascii?Q?NKoz48eRaDnWhXlLoLcEibRraO0vUllgvDy6y1YEDKjkKxhpuSehCE6uiuES?=
 =?us-ascii?Q?wPGMOAyMCAaaZz6sfemil4AzpDX/LkBpZy9+IJoPl0214nRUMEFNGxYson/e?=
 =?us-ascii?Q?4UsPe5l+RHAodxrLH/1TImWBEYx4qc8nH3SRHvH84tbBUqsCWKVQM7SzRuLr?=
 =?us-ascii?Q?E0r28bIH4VYKVzj0/R2JD1tIPKTcH1ww6Y/1WbZg5tedJzSbp3D9EO/zukF0?=
 =?us-ascii?Q?NoiAps68wF9e7pYldACF9o2oTIcccGv6mnzyCH/fFCoj7ZNmNYTV1FgOgn6v?=
 =?us-ascii?Q?w4b4gll3YQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fb18ff-c257-498e-f5dd-08d9b06d206d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 23:41:38.9864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8lmy2JcY7ZoxzuWRxRtTJUxRTLfx+IccT1NinBY9+J5g1MUC1CNjFsXUXr+L0bLes8RMptSXhP2XFceOwIHg0TeE4j2tqw34y3ZAhjScOMQ+dlOLrfCAUh0FspFuaqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5034
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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


Hi Mark, Pierre-Louis

Sorry for my late response.
(It was PC replace week)

>> When the hw_ptr is updated, the avail/delay value are also modified.
>
>> see the diagram in
>> https://www.kernel.org/doc/html/latest/sound/designs/timestamping.html
>> ?highlight=3Dpcm%20timestamping
>
>> I would think it's more accurate to update the delay information while=20
>> dealing with the hw_ptr update, no?
>
> Morimoto-san?

I think your opinion is very correct.
But this patch-set is for "cleanup/refactoring",
and your opinion is for "add new feature", I think.

# I'm not familiar with detail of delay...

Best regards
---
Kuninori Morimoto
