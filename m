Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A060B48B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 19:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB41B381F;
	Mon, 24 Oct 2022 19:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB41B381F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666633879;
	bh=7Q0tMWB/opxGkLVZYWpv96sSCgRoTwzIPVLDuLd07xA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUK21OoWOMA40gKpi8pnkpm9R1aZ3K0c0KaaN4z96Ac9LCwcd8CRMjxx94MG0ujE+
	 E2qHE/8DKTtI0damYYCKDj82dUh96Kzj8sBGf2VCZcL61lOr/X1SToEVQ2ZrIm/I4M
	 irQRCOcSD62NUiWaSzUbWechhgULXehUg8Fjo+eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B1CDF80533;
	Mon, 24 Oct 2022 19:50:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728B3F80543; Mon, 24 Oct 2022 19:50:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A699F80431
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 19:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A699F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vZ2xa7yr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPbfEp7IRgh5WA0P1bq4vJnHhrstfEk6Z2cYd2XD9rElnqsu689SJiDv5Tp+5mzVXu+E6BEHHjg+OEPezw9yHrq5KHSYEUMdEorhmBurqr34RX22fyBgB7Q37d1ySXeoqaOUsuTpO3nawS4XONXwiHmq7Qzaf7ZvmElBzrOTtGPnbEjDoTCg7kEV08z1fhBPgxoVaMI9QbAe4Tnj4indG9x+Bbb9j17yHNlkLZV1QQ24Nxi98BMgHrRxXkFwmsnrkBRsKC6XFeMA+IvVHq19BZZHmFc5gbYCPZxtyo80hPckCaTJARPOYDhaH9Nvq63azCBachHKI3blyU9vMIxeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsQQ8uLcu7Cd9E1f8kRluhajqhiPEEawmWsVK0uQg5A=;
 b=c67BnqKtddg61y+EUbK/2a2xgdgvG85mIYYOvo4w4H8/K5761mPaaVRNn7ggDdJGiPvZVNtl+taWL9x3tFyfIiK85uSTQD52LcNm9PbV1vLo8/SsbdwK8sOS3e2vVrHDgwXtkFNbs2hVKGopAuFpVKt2lXPSe61a8+7MoJE3CaPGmFMiokt2UxPCjkR9dA3hEPAtylZrdZ+e008C0hTG9ZuB/Vrt0/TVitrkd49hDwoRLYQnyEs4BzTIwH+j8r0WxpCmR7BrBeajT0ulQ9/UOLsSiwu4DxxwrPbRiWRdq1M4lPdUvyylLeCSGbKPR0WD1H1fnBwLUMCsGl56y+0rFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsQQ8uLcu7Cd9E1f8kRluhajqhiPEEawmWsVK0uQg5A=;
 b=vZ2xa7yrdq/WzlLmvL2KfCmU+ij+T/ND88i2HJW053mDr0LDag+CfizJYQmdK2BNR1SfB/L4ZzbbziGag36/rkAFJVxRLQkXcUpoyqv3Z+WTirhScd5cUoOlqCjaFY+9MKDs9StjUckVDb9LrtILio9GU5udPF9XodgfXBRX6j0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 17:50:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c%3]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 17:50:11 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Brent Mendelsohn <mendiebm@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
Thread-Topic: [PATCH] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
Thread-Index: AQHY59ANOTB08xOpuUWNQUJ4BoQYtK4d0e0A
Date: Mon, 24 Oct 2022 17:50:11 +0000
Message-ID: <MN0PR12MB6101864008875C2E38665409E22E9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20221024174227.4160-1-mendiebm@gmail.com>
In-Reply-To: <20221024174227.4160-1-mendiebm@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-10-24T17:48:10Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=99be1890-7e81-4941-84f1-2d5e3f737ae0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-10-24T17:50:10Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c5d06184-c1e8-41b8-a6b2-797f3a88e6d7
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH3PR12MB7523:EE_
x-ms-office365-filtering-correlation-id: ffbaaf5e-6150-44d6-71ce-08dab5e832fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRQ99kVvuxt5pWVg7zM4kZlkxQi+LjiDO0dmCjGNUwIXZ+whVCd08BtjxNALwQMBsG50HSPe0gsYToigMAbS5VVJlV9i/o2xdX6+NU0vUgS+OPmZIljFE7xhrnoMPC9fHPYBFeB4taNAWQnLWs6v1jTG1l7XPN2wMeFTLfuokV9yxTSPO1HUSkLtcOPIRWL/1h32QON+vjpprf72q8fwINmUTG7uES8Fw6W+RAO4SzWeEDxjk/maJ1zaMG6Lfjk3Ul9sG3yKB6LiTbIi0TwRSbCS4nyIBTl43w3eGejfr9Es6y2oeWe6m02OvXDFQdVSArkhdoKPXBRBC0U7DLsZtP3DjgG8GG3ng7wA2Io6sk3XBIAUi868A0EfTZsziC8Gg7e7wIoy0uj/1jPbEZoxuNTN51e7PBqa/w5szMzW1i+8nvj1dSQ0Vdk8KLtrj+3yL3rHxIQQn0a4Xu4rWnHbNMm2oynZAW96cwQXLI7s1gI1O/0f0+UtoFPpsScUzTsrQ9R7rdiqaXiB6WE5iixXeLS7FVVm8Ff8f2VMI0mNgBrpeBiWGhlKdocNmAP/JE4CnNi0ftVYQZdQ1j3VpIC9D0dU4IDBqZDqA93Cx/zmwa44mTiMl2NIPUYDVp2sx6VjTb7040epkOLgi+4dbCGD82LfZBczwcY5m0nthLDBAKwn33UxgOxL0rLakNgRKlHKewMwOCZxdHbatXL37R2nn56W0znH69xCLLkAUrebOkN36Hhd7MfX5NkXptzMg1UyTW90sh6ylxA1epIYzr/viOiKjWJ7xKiDmpg/q2/P4JE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(33656002)(38070700005)(54906003)(2906002)(5660300002)(8936002)(66556008)(64756008)(8676002)(4326008)(110136005)(66946007)(66446008)(41300700001)(86362001)(76116006)(316002)(52536014)(26005)(66476007)(9686003)(53546011)(7696005)(83380400001)(186003)(55016003)(38100700002)(71200400001)(966005)(45080400002)(6506007)(122000001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a/Pl+JH/E5XLFNkOazj3qmT/YVDm/ZXq3qs9K3QmSb03hAEGdLlvLdwhJmaY?=
 =?us-ascii?Q?6kYhFUcfKku2e/PlvdLBnPSoW86UvTvH7IqPMnuZLnOPKzqHA5uQFkuyNdIA?=
 =?us-ascii?Q?OGw5hgSH9TfQXTsWHxuXsimOayXtliFAatK/C6KXz3cQtNf+Dqb9IWCqfBK5?=
 =?us-ascii?Q?lQe6FwvqEKITUOo3vtKWC8G9OT9jEMOOsQiMNuTulhDr/ULrshYWSfP7BcEr?=
 =?us-ascii?Q?P0JUXmdaQxIHMgdYX3IUQDN0j9UOA6ydAHIAcWKoBlkCSsqUWNlv6QxWyEqU?=
 =?us-ascii?Q?qz5y7MyVrjttg1khDGeslpsfN3VlVq8SD1EUxtqHzpXfBxbXYpxo51Xjc4jK?=
 =?us-ascii?Q?ee1J8BGBnx0DoHtSYj+LUyJxvzlAGb8vZoq7tIAiCEXm9R25Bgck9YoeYa02?=
 =?us-ascii?Q?XQu4StrDTFIC3gn/eoZcY6Lks1b2mS2EMhDlsl7ojn1Zlc1PKnfytJ8hv9Jr?=
 =?us-ascii?Q?KWAfw024GyERGQYGA4EUCgTrHK3gLQuknywyq2sfJH8oA65o0Q9P9BmUREpq?=
 =?us-ascii?Q?jURlbUCAPzJusujoviv1EPl9IF7mEJ5tTT7ipPVPrDjNhM2Zui9Mn/hX2sMN?=
 =?us-ascii?Q?ZoJqoNZbjiU9De0PgcndZOCAiFr8sHCsqjVl74BLjSywMpGg1xowl9p6A5WY?=
 =?us-ascii?Q?DI8fc9FzaJtzEfFmQwNqA3EL0mTz+AF0GM2dcGjXaekE/ohGCQ+StSIFxtT+?=
 =?us-ascii?Q?e1j+ePFQ+ryb0HV3JAtjJE5ErqO9hv8iR/nWH0JDwze/I2PYDxJjxYJAu//d?=
 =?us-ascii?Q?XVlVNqGGn8GZIwV9hFdtbM2bMxvOWJWGg5Y8opqiJDXcjiFX5Jtf9cl1Sgt6?=
 =?us-ascii?Q?6fdeUet8x0cAjEabCQ4DDECrUONe+1qYZR+oD2f2/8epFEPhDdTqndrXXAdQ?=
 =?us-ascii?Q?98+ku9FljNQLDxKO4tijDQn1J/BbgkIrvCQOeBytKdKb2V3vS/Ak63GB4eTx?=
 =?us-ascii?Q?6bGhQ/wCAhn2NaFeGnkcghokrOBtdt0KdElOOzlf7EGDWEZa43Tt+oAHQ49V?=
 =?us-ascii?Q?rVRlJsrJcD2i9c2qrrR7kWTy7odgi5DB5he+2gV/mGa2GVhvo1rqQ8hbDUFs?=
 =?us-ascii?Q?xbSYGzNQgJH3f2yVzoOs5fXB8S+IfPptjZRD7XR0y3oPUNoxWUrycgnfYqjo?=
 =?us-ascii?Q?lysheOWAbGKbHtPhkbfG/wPpjjEyhMy4/QF1C/G6+VksH1MISu2i486CBFYG?=
 =?us-ascii?Q?B9H95ulsOfuQQSSACx+gR0x4NdP9mvKt7/XYG8mCfnsOA2sYs5uYVwVRy/Q+?=
 =?us-ascii?Q?HpNBt9gPAZW5I5rQhDBqgsjXQ61cak3t98eWWyu/kkGBiJHijFNTbcNmAQ4T?=
 =?us-ascii?Q?fTAsaADv/Z/cm3LfM22KubdmxnOLix5KCLbxbikCFP8JZ5uo6i3WD6OqAcmH?=
 =?us-ascii?Q?1nfxn963biSNYU6kZS0uqJXflwmDlSbgsfMXcvF9XYjajulDNuqTPpOnabkp?=
 =?us-ascii?Q?Kjh0N6xzMrPt2cqv6OuKcTlYeE5ks9MLO9K9PiB3U0Don61cW9sBVKBHp5AT?=
 =?us-ascii?Q?Js0cQIAgPZVKUb4Sbd7gkig/cfhoelTYWZNzh2BwR0Bkh5ZDmSMORcpvaBIX?=
 =?us-ascii?Q?M9jOYwIx9cO6HeaevFw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbaaf5e-6150-44d6-71ce-08dab5e832fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 17:50:11.8257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RMcxQURSKB2WzAVapunofMq8/SK9oOD9z9TrGnPjXpCGyh+sqi9dJg+QG/PFJoP1JCzlMdtg8jgU1xnsrvdZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>
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

[Public]

(Cc Dell guys for awareness)

> -----Original Message-----
> From: Brent Mendelsohn <mendiebm@gmail.com>
> Sent: Monday, October 24, 2022 12:42
> To: alsa-devel@alsa-project.org
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Saba Kareem, Syed
> <Syed.SabaKareem@amd.com>; broonie@kernel.org; Brent Mendelsohn
> <mendiebm@gmail.com>
> Subject: [PATCH] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
>=20
> This model requires an additional detection quirk to enable the
> internal microphone - BIOS doesn't seem to support AcpDmicConnected
> (nothing in acpidump output).
>=20
> Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D216590&amp;data=3D05%7C01%7Cm
> ario.limonciello%40amd.com%7Cc3808da832884e6852ed08dab5e726ae%7C3
> dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638022301772415092%7C
> Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DD9XYJZnX
> p9koWxyqdGDMTrfQtfflA2oXmsGek9UMbQs%3D&amp;reserved=3D0
> Signed-off-by: Brent Mendelsohn <mendiebm@gmail.com>

Thanks!

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
> mach.c
> index 2cb50d5cf1a9..a868a890f00c 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -185,6 +185,13 @@ static const struct dmi_system_id
> yc_acp_quirk_table[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
>  		}
>  	},
> +	{
> +		.driver_data =3D &acp6x_card,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware
> m17 R5 AMD"),
> +		}
> +	},
>  	{}
>  };
>=20
> --
> 2.37.3
