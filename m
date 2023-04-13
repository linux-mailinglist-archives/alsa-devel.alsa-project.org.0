Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AAD6E126B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 18:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63606F2A;
	Thu, 13 Apr 2023 18:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63606F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681403805;
	bh=BdP9/nFUxQSIq/VQzR1GD+ys+ZNjkOkoXSLaUurgRH8=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:From;
	b=YbSHJBegQK2db7ZBKoWkdR74HNnyuOwz87sXf+dO6WpVxphSo+oYx+KwOZG/Kegao
	 L8KJyUKIQ0r3hCSym1+3Gl5zw8heibEUYFrEBm1eEVoVfbIxN/j8vkMWShP+h+XPey
	 0/THH6tiigmmB95KY1Bh3X6BnFNWAKnR2Ze7p/WM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D473CF800E5;
	Thu, 13 Apr 2023 18:35:54 +0200 (CEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Baishan Jiang
	<bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
	<tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
 for acp6x
Date: Thu, 13 Apr 2023 16:35:40 +0000
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
 <MN0PR12MB61013DABE036B5D1BB3518A5E29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <c6a91f32-8c6c-4a39-95d8-ef5c031953ab@app.fastmail.com>
In-Reply-To: <c6a91f32-8c6c-4a39-95d8-ef5c031953ab@app.fastmail.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6JINTT3PH2AHPD2CUFYOYMT6AFKX233/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168140375367.26.15605092753409482220@mailman-core.alsa-project.org>
From: "Limonciello, Mario via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B07F8032B; Thu, 13 Apr 2023 18:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77E29F8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 18:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E29F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xfjVqq+d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaucaI+xh9XmVGvmWn4vQXUNcurMYuDD61bbGbQWYp6h84/Zcu6d/Aa5HqXEDvJ6TMGmdE2fpRHn2JOF23o6nwSyG2TRTlnS+3XNd8k1v3SpzKlYUs/3VGq96IBG5P1u7fkzqXPTvRRNrIR3sXr/4H0QOOn7p0R4zdxtazUpSDByeyJ05Azqee2JWfBsPIf2Cg2NLr8bYyMuYwPWeSJwy13Qkm/gDYuXbNbg0SHzNGzcNOdtCO0JfqLJSDNxUk6l94mXd7qEGDlOd0Hzj+lfyp6OML7JmM4JU9O7cI9ZC5NcySCRETrTaeWtrAglLz0SFzOL/UMshnTQAqwF28NxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1lGiVTQ7x8EgQmcBM+oFihxzb5/iA0XuvJVRHpb+eE=;
 b=I2iNadBK11Ue5YuCPakQhsKWwNPxhMFOQXUO00P6OPi8kN9/OMoBeZLnRClraiZQGE16ITmeKBz1MbJ+mA1UGw1AXeTv+mDuCcHKSjtPUqI0q9v+++LkhUINECjqN/rAumYrs3cDq9pXd5DTMCxbtxicp2OxVC4SFjE/MKXFMV3BVzwnmk5klnjE1jzIad+Nee9TVQj9NxxLiNFwQ550DJBrIsOivCuGUdAsnQGV1U6RonnbUhl5CO0Ij1uP9PnzxPlELXu+4ymkhEoiLL00eiLwzk0tuhHGtzccLgSyAm4hgoSus3cmdylom8BFo92nXwRV/jZJ5BYUermtReER8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1lGiVTQ7x8EgQmcBM+oFihxzb5/iA0XuvJVRHpb+eE=;
 b=xfjVqq+dkkiIb/dZpM8msMiruGqttfE+QC7Sl35yqGwk1dRz2e5N+NJJEyofTtHs5ScF8i/F0wLl5dK8Lv6ZU+gZOYdALCLC+tS146k2NF9AL2uCInxIA0sgIeCHKA+yOslaW253i48yVQeuvZwqrzLUgop0K47icsOU+MIe25w=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:35:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 16:35:40 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Baishan Jiang
	<bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
	<tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
 for acp6x
Thread-Topic: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks
 list for acp6x
Thread-Index: AQHZbRt5wxXeIJaS+0KmLy+xNuZVFK8nvi2ggAGy+ACAAABSwA==
Date: Thu, 13 Apr 2023 16:35:40 +0000
Message-ID: 
 <MN0PR12MB6101890FB094506EACB94F72E2989@MN0PR12MB6101.namprd12.prod.outlook.com>
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
 <MN0PR12MB61013DABE036B5D1BB3518A5E29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <c6a91f32-8c6c-4a39-95d8-ef5c031953ab@app.fastmail.com>
In-Reply-To: <c6a91f32-8c6c-4a39-95d8-ef5c031953ab@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-13T16:35:38Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=c327613d-7546-4ee6-b1f0-3a67adbf4208;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-13T16:35:38Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 
 746d6715-30a4-4b63-8502-472e5ba8035c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS7PR12MB5790:EE_
x-ms-office365-filtering-correlation-id: 806503d4-2834-42ac-d592-08db3c3d1e71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /wdXA+IzQQ7UkJFSG7Yt5mbRZK1YAxkQ13dkl7/K+xwfzEvJuM+/rhD6vEMmqo0+EMQSd4o8uzFv8IrQZGmFfM+gHy9MZ8YsSqz9Bes98zIfMim9Z46KJHgM/3vMsBJvdEwkv/Y/EP1lzUzDYqmN04A2qjrEuxHsKDyqPt3scneUJYspHOI6xbOJH+v8LQ2KjPO9rrEsrkCj6IeYnb/NMAcZn5i+SS23Iv5h+U1iiN2VHiSyEGZ+b6phi209Rgy5A6jDl0gTDD1y0dt6FnjcKKO43LMu9cTvRk9kpzln0NqTYJrwrj9AYgXKoAfxJyKI23aH1kNBUMWMa+j3NFVWIVtZeKB2rGOME9LqPw4u5Mfp4Wdayqr9AucYxV2aeRiO43drMHsTiH41Q0cjwsJLOgoEnu5dM2qmlnZL7G9/b2601WHxUBXRmIXmY9mWOxrCcD203X7q8YNcJoF6wJWp/PwoS4XE2WkS5XkF/qd729TwL2ZRGSjQbSn/ggED4roOOyfvnwjRV/P5NuZL3Jet7KhGrkbliuP+UpGb1eQRrs4Xg36SOvyM1vMSjb45gFxsoZj+O6j6zliwHWDZPtW9TwaaXoEtc8bXZXu/wkv2EzbRLLvUuAM+yBMT/oOWxtJvw2G471PQWCKiM5CrINCNYQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(71200400001)(33656002)(38070700005)(5660300002)(122000001)(52536014)(2906002)(38100700002)(55016003)(86362001)(316002)(8936002)(8676002)(66946007)(66446008)(66556008)(64756008)(41300700001)(66476007)(83380400001)(76116006)(6506007)(186003)(478600001)(110136005)(53546011)(9686003)(7696005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dudhPttGQ+adybeQPHcDtjPQFh0naOs94byeGyscpAw1OBXyUI3awz3sEu6t?=
 =?us-ascii?Q?Oy2ZsZuw+HUrbmthXZJjXnBvkwFPLGsvGK0S0SwmRC3ixfd5Z+NFjrZzQvlp?=
 =?us-ascii?Q?3yDN018U5Xpv3F2QNW4/E4wDGL4DtfC1tFmob1MtW7MFp6oqa1zevYUfur6o?=
 =?us-ascii?Q?eaB2TKB0VdIC0XABX0/TfYF0IStJEGFnfhYm33nkYCjIguus1U24RNwfd32Z?=
 =?us-ascii?Q?9kihfXonh7oB0vra3NNGHNLykf1IqIEvgmAFhPhmPryD+5hSMGQ3uY8mcarO?=
 =?us-ascii?Q?CsAlG9/zeFVkUvq+QsQxv7xaPr5WALPR/+7RY/MikhzgTmpg158LrK9BmOSs?=
 =?us-ascii?Q?VbJM2J792UrBy3QTc8fTK+BuNhG5QARI+DQchdL7DCX977UH1LYvJsNwqp+Y?=
 =?us-ascii?Q?g31JPo4IyrJcoVFJGeE9u3w4EuQp+snGOppDjdxRWj78nIcCIy5PgGkw1lIl?=
 =?us-ascii?Q?VHNf2l9afboZ3DySA4LgXGQWeQ8qgqDqU3YvzmG8hx31xkfFz2bBNpcdW1MJ?=
 =?us-ascii?Q?jjGeQX+uApO45bms1h3tEjeTtBSFr6H7wc6QvqfgnzRxah5WjrrLPU5y9cNj?=
 =?us-ascii?Q?ZZGVdpmT3JzIzBUurKyPbaef2Zr8QCkNisoHIR8u8If0bZFipfMdl0WJ/2ky?=
 =?us-ascii?Q?ARIvXhPH3WGoUccyBBXE9SGAiEH7ExrFgCKcdfHyG/x3L6xYI38xVwkwNbSk?=
 =?us-ascii?Q?pnFNCqk4aVvOB6rn8vBlsmtrUas/yrMWcQhCPRNGD+KPPg82LGoeGAuXTdqz?=
 =?us-ascii?Q?gliUd8+BtVn6AnUITfbzN1U8dXcwpmCMbcMUN8VIpSpfDI74QBF1xVfPTKPR?=
 =?us-ascii?Q?0RE9X3p4Oq4j8ox7xaICjr49b7ELu1n4xxbrFyvoDZjpIB1rNayC2oq3y9je?=
 =?us-ascii?Q?AptCZs49i+qXh6/b1Unu2a3LszarXp2ypkkS4WR+oFIF7wqoNf9nl01Yfyo0?=
 =?us-ascii?Q?9etylGQr9CDHmpQhibW4MefKY/21d69zp6ilxy/T/vEbQvEKHyZxvI5bFkxm?=
 =?us-ascii?Q?G56r0sgfGOitvq1QkRc1tOxCw8aTMn5kUMc27dsSyZKOAKt7HHbjCUg3WMUn?=
 =?us-ascii?Q?ZFuM5Ync1Hf5NrcvkMi5R9URlvaFPrCcl/pQpcRtDDyNf4+YrQs/VxXYqiTx?=
 =?us-ascii?Q?fZ+2tsw6AysblB4J55HJjbLxiDCmpcebdfTqQKJN4aijs6p9K5938HCSoEPS?=
 =?us-ascii?Q?lgGeP/a3bIExkfIZ0wJCvv7JYlvn/TOE/aPcelP9Acm45JP8lBSveSEK7OiS?=
 =?us-ascii?Q?sUXxCZIUwC57GFdmBFBwSZsXQEB/2lKZeQXcjKDTqXReqj9ihrUsFgSfMRE4?=
 =?us-ascii?Q?U8gQ2AxWwC11PtrREcb3+bMsiOkmSJo73RCtupOARYvMnOmCZVp4ZJgY1vze?=
 =?us-ascii?Q?f++P5T+1ybmjqSggGRVquXS4LZ/tovJJZTnusGLYJeBUyjPd3suvy4N28Bgb?=
 =?us-ascii?Q?X4wYZWLQqo7hFrRT16jq29owDo+UOzRxaNCqM1oH7sA3IeLAVhwM9GkyjnMH?=
 =?us-ascii?Q?3EeQqZ+BDalCpQ75yiCBZFg3Oc8FDrUAtIwBahhfEBF/nO/IJQ8jCwqDmv8F?=
 =?us-ascii?Q?hUf92Yf0R40+YkWwRNmN8qqqa1LvxArjJVf0jLJIDwOegGGb77ThRC/q2kBc?=
 =?us-ascii?Q?7sxGJ74TDBif447u1+ISWks=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 806503d4-2834-42ac-d592-08db3c3d1e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 16:35:40.4418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qNKbNeYFwR0LYQNGjisMqyfFfdic6HTU5a1fksHt0xnKY9EQn2+BFrAChc5lO/5SEEFFst3hCY2FlHiDZTjekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
Message-ID-Hash: UKTEBACMBC4DNO7IFDVKMC6S2474NFJJ
X-Message-ID-Hash: UKTEBACMBC4DNO7IFDVKMC6S2474NFJJ
X-MailFrom: Mario.Limonciello@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6JINTT3PH2AHPD2CUFYOYMT6AFKX233/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[Public]



> -----Original Message-----
> From: Mark Pearson <mpearson-lenovo@squebb.ca>
> Sent: Thursday, April 13, 2023 11:34
> To: Limonciello, Mario <Mario.Limonciello@amd.com>; Baishan Jiang
> <bjiang400@outlook.com>; Mark Brown <broonie@kernel.org>; Takashi Iwai
> <tiwai@suse.com>; alsa-devel@alsa-project.org
> Subject: Re: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks
> list for acp6x
>=20
>=20
> On Wed, Apr 12, 2023, at 10:47 AM, Limonciello, Mario wrote:
> > [Public]
> >
> > Loop Mark Pearson from Lenovo for awareness.
> >
> >> -----Original Message-----
> >> From: Baishan Jiang <bjiang400@outlook.com>
> >> Sent: Wednesday, April 12, 2023 03:41
> >> To: Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>;
> >> Limonciello, Mario <Mario.Limonciello@amd.com>; alsa-devel@alsa-
> >> project.org
> >> Cc: Baishan Jiang <bjiang400@outlook.com>
> >> Subject: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks
> list
> >> for acp6x
> >>
> >> ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
> >> microphone problem as ThinkBook 14 G4+ ARA.
> >>
> >> Adding 21HY to acp6x quirks table enables microphone for ThinkBook
> >> 14 G5+ ARP.
> >>
> >> Signed-off-by: Baishan Jiang <bjiang400@outlook.com>
> >
> > It would be generally preferred for systems to start including the _DSD=
 in
> the
> > BIOS so we can stop growing the quirk list, but if they don't then patc=
hes
> like
> > this make sense.
>=20
> Ack. I've forwarded to the FW team. Internal ticket is LO-2404.
>=20
> Realistically though - I'd recommend still carrying on with the patch. Th=
is
> platform isn't in the Linux program and it could take me a while to see i=
f I can
> get them to accept making changes I'm afraid.

Right, I also think the patch makes sense but if you can try to get the BIO=
S team to
get it added on other newer systems not in the Linux program it could avoid=
 it
in the future for those.

>=20
> Mark
>=20
> >
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >
> >> ---
> >> V1 -> V2: Fixed signed-off-by format
> >> ---
> >>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
> >> mach.c
> >> index 0acdf0156f07..62d8a8e060d2 100644
> >> --- a/sound/soc/amd/yc/acp6x-mach.c
> >> +++ b/sound/soc/amd/yc/acp6x-mach.c
> >> @@ -178,6 +178,13 @@ static const struct dmi_system_id
> >> yc_acp_quirk_table[] =3D {
> >>  			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
> >>  		}
> >>  	},
> >> +	{
> >> +		.driver_data =3D &acp6x_card,
> >> +		.matches =3D {
> >> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
> >> +		}
> >> +	},
> >>  	{
> >>  		.driver_data =3D &acp6x_card,
> >>  		.matches =3D {
> >> --
> >> 2.40.0
