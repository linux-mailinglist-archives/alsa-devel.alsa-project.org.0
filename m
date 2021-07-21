Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02BD3D1494
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 18:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F17016E4;
	Wed, 21 Jul 2021 18:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F17016E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626886272;
	bh=rL96Ld31fDmBiEYboXbL0o9MMeK7AsZvgIeSXYrMYsM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcJuAOF1bSxCorCrEjjnO06WsZBWpOMe6MbIOfXXEKExhLTzuZ8lmvgVdHH7D2WQm
	 b7EyZmkHLCPCnaLWsTSwQ0Y57uL1gVVmX2ZJAm/IV0pnBVTdKSF7T5GMM3wxBsHJmB
	 t9GmELUTwdcJQjJyACWXGFs/AZHnVATDdrMGhLLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E55F800DA;
	Wed, 21 Jul 2021 18:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78716F804AC; Wed, 21 Jul 2021 18:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98DDAF80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 18:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DDAF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hTlaor4s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W++91a4lIf1a6D/YnhLvRHoZcBxfA8MbcMlRencPNCWU8y3NybStIF+GIWz/VnWURwkn4OcDLvkSlyuU6bFFG8Izs3uAUH/OiDMnScZuF92hLXkJPC5bQIFB2Ja6U9AqbSWunArphD0H7zCUh/6grs9IU1ySkJab6YLsE+iAt4cTPYdgW2O+xuSwGwantL4jNkctC1BFrO91NjA8dxbavyCwAMBt8ow2u6NqAc7hGe+85JIeKLW36PPcl2KlWoUUlfDDAWvoTDGna9LAude2F+WFjemB4YnrR00b74tLL/SFAlDs+x3GDtHyxgqEF1voHImqdh+hxMPx+UAcMPay/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7hFp0tWJcBltd4zo2VY063RLydz/x7QUm+8nN1gIqk=;
 b=jRmqocgg4DTlQ3UlBKrFPFc/LOqbBXCjFxf8P00D5YJcqMmdkKzaBj6yhIUOpL68rr5Tr5f+5TodkFcCDSpBRJNEUyroGBTCO7jSur5WuCTcg1fAI//FIHGsTvrF59QTMakSbVFE/mLSKEdYIByt12gvrzPTkH2ix+Mzqz2ssYhpWA2IHX6rBuWR9/BZBIydpFuVNT9cEZ0SHRr+GUArsWdCgvxDVYKxSEihjm5Xr0l8Ss2+sPouXTJwtW/yIlYdu9RNEd739OUo09V4vd8XfTLcXnJYMPR0ZPR1mHuTdA9WVGTVFzQRIZMBPf4Q5mQjUe15LZ9F2SIlEhoxxERJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7hFp0tWJcBltd4zo2VY063RLydz/x7QUm+8nN1gIqk=;
 b=hTlaor4shdkz6pRj0D9ppwJIEqQl3WcK7YpVgziFXvrwYR5EkFQbPf36jd8cecmxW+m9xMz3FLxjh7maJbewYz61eHRbyMHX8KsF8TvC/1gsvQbRlKhRNaZTsI/a+jAPsRK9+KHROlcAjVpusMXdvtJfwRe47QSdc7Pv2xqtEI0=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Wed, 21 Jul
 2021 16:49:33 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:49:33 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, Takashi Iwai
 <tiwai@suse.com>, "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: amd: Don't show messages about deferred probing by
 default
Thread-Topic: [PATCH] ASoC: amd: Don't show messages about deferred probing by
 default
Thread-Index: AQHXXvLocQSdycVLIkStL40Wq+dbH6tN4phw
Date: Wed, 21 Jul 2021 16:49:33 +0000
Message-ID: <SA0PR12MB4510211EF35A346F187448D6E2E39@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20210611185155.12504-1-mario.limonciello@amd.com>
In-Reply-To: <20210611185155.12504-1-mario.limonciello@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-07-21T16:49:29Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=255ef62e-13e7-4680-a889-f459fd1faed0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6a4ac1d-9d22-41da-a3a4-08d94c67842d
x-ms-traffictypediagnostic: SA0PR12MB4382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4382E0870842B5C9DEA3A138E2E39@SA0PR12MB4382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:118;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Zpz3HHdFH0IqzigzHbtucvRoHmj7YOmJWs6LloMl0kbWI5yKZrykyVidQUh1MlsACHSJNRuOurnTkKeolLINlBMgUH8NZ5CNCQtKOx5XUEu32zNo3uto2fmJ1Pt1GvB+80jwHE4PLSJP+Y4CQBnVnUicLeQ7oqcixKWhTFZ4syCduhS48SqWW82C3nICnatxyoPZKF6XvP8M8TBRl/h/SIgK6mMgib7ABFQqVOFyp+4WZPKNxm/yCQgP/X0lcFDVEpQlIpnbGjielPZ/p/556p+ADiH6QyIto1M9q6JaMzrtFKiBldJjSP57SUdq++n/zIP1teCsWIBtsoma0TT37ZxDtlUUFpSdQgaD7dUqoEsn7vWT3MHybOTEMyV01eMrtLK3q9qQkDBFs7o06mkpa5CVDMMHvOWg9tOCGbdkRx8TOwCByoGaJxQjABBKbK1GPw+ehHCRU9X/gjYpyQj/4bMvGlCdrlyq64L54w4MlVmQwp08vUGLK7l3la/V/DlvCV2w/lmybHXjPC7JeQaLjMLaxZawP8BXnTnnDPtbhqjrXGD6Z/BuWxBBpCf+sLww6dscu9S8nTRTODujyXHGPpAafNfarnnMgY+S3/D0Ls9w1l6oBJRSwHXWmzd/N5zxOWb9udxj7HRDjCOpsUpA6gejCrfu6oIGcNCry/ia9/eWRR3uY7cRB63vbGnInubgK3hqfpaAxdrZqGUBiQacQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(4326008)(76116006)(316002)(508600001)(122000001)(7696005)(2906002)(6506007)(5660300002)(8676002)(53546011)(186003)(52536014)(66476007)(66446008)(66556008)(64756008)(66946007)(38100700002)(54906003)(110136005)(8936002)(86362001)(26005)(83380400001)(33656002)(71200400001)(15650500001)(9686003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sMuICyfV+9pf0B9+TQKEmYOsjm9DCJlZLfx8xE4uE3lKToNu85B87rUoe06N?=
 =?us-ascii?Q?tL/5KXT3R2exc7GwIk4rD59yLjm2YzwOzjuMQ/Ch3PBJjkpGIJXqV/PmdO/r?=
 =?us-ascii?Q?DQwa3JHYmEi3qz8prGi1aSjs40IYQ6a2Nsqopn2DDAmJuUifoWv2cjnE+CUZ?=
 =?us-ascii?Q?DRNAWrWVI6UoeruKxDiZx24w436D49HmHzC+5htWtCvyyETPji5zdp2QYZQD?=
 =?us-ascii?Q?Um/vD6RM3VWuDk5F3kSP76g0y2kSQ1ntNZWnyRwDSA1gH/u2dGV8tIzrFAje?=
 =?us-ascii?Q?ScUb5JtFJCwURqRCXVssKMp8+QLlk9MPizyyXh84QtH6Re4h9xv7Yo+6OUEx?=
 =?us-ascii?Q?4IPv/nouzZq2Ga/gmG17BYI+1+dTuDMYussud4z6NiiV0kHhOKzayo0HurUH?=
 =?us-ascii?Q?Vn2WhenoTglk3iefkvv3jYQwazpNQsvgtaz8GVFSSqXFjTv7MSsLdWKdQxb1?=
 =?us-ascii?Q?SwDS0hcX1OI4NaYuyJ0BYO0CDsCk0ETSodmW1+l6Y9nV2ACidFRZPTrONchQ?=
 =?us-ascii?Q?1QyParZwavjaqYlJUM53scfxdYky5Gdt8KsEGlbZqjSQyyKcPzltJIJiPDvw?=
 =?us-ascii?Q?nK8wObY0TaUVcvYLEUxky6Ow/IWStIIJVylIlEpnsLL7hwEqMWxspamH9cXp?=
 =?us-ascii?Q?9kYaimwlrkeE0qUkMou+uv/yqjMloLYuVbWbjTUUvim0MHz92pTL6ibqYwf/?=
 =?us-ascii?Q?F66pXLRCnNTHrLRP5MQ7ok6cT49anV8JGhWT9KczMoF4SmToYmu612JSqEVo?=
 =?us-ascii?Q?uN948SSN6iBo2pR+vgiDfXRRFSL/7AvWe1WOpwigZ3DWR21aUIv8ZqgzC6wu?=
 =?us-ascii?Q?t/j1OUx3yWI65xuDkyUubQkyGu0APylEdsCHQm144RwoXo7U++WNlE9wONmF?=
 =?us-ascii?Q?ewQrWX0bwpoDIrlA/uIBt6wjt0Z0qD4zL8FAG5hZx+WsFU9F53ptIuBc+NLz?=
 =?us-ascii?Q?LZlp8/BoRRXYRttXSaZ4nXfS5Z3q6BiWhBf9jy+3bZcdlGL6M1yD8tteFJxt?=
 =?us-ascii?Q?xV64Km9pqj3u/Indp0LnqR0xlbE++ztMsUkIlsqg3sd505PmQbg4ZxHFRPoF?=
 =?us-ascii?Q?wwLOPP1aEj6XdqgNevsFYbvYjhTuT0maytapbCFMnvZ1JCQNOKrxm1e7tfTF?=
 =?us-ascii?Q?gMa/HhWG/P5k010DNTxd76QOW5rVIXedvMv3pFr9Vog9EDbAwQI8oUUygBK2?=
 =?us-ascii?Q?wkcVQJV1MIhAf4NGk5GVaJKJMWkH2oD/vWDgqdJAIKbkhtJQLK5A2WY2NwMG?=
 =?us-ascii?Q?Xv39M9qeMMkYQan7fRKsV8+77Ak2j2XJyBLkzsY3fz9KAgknKglhTC4ufZ+9?=
 =?us-ascii?Q?UCRWzTUXE0Jm+ELe0G68Q8vA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a4ac1d-9d22-41da-a3a4-08d94c67842d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 16:49:33.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Blu+HP44gS+uh9tzyvWs+Pf7vJA0l81bWDT2yFkiFGq5K4gOtAtr+scvo9f0iRgGkYgg7sQ6TB/2jLlM4gNoOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
Cc: "markpearson@lenovo.com" <markpearson@lenovo.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>
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

> -----Original Message-----
> From: Limonciello, Mario <mario.limonciello@amd.com>
> Sent: Friday, June 11, 2021 13:52
> To: Takashi Iwai <tiwai@suse.com>; moderated list:SOUND - SOC LAYER /
> DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-project.org>
> Cc: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; markpearson@lenovo.com
> Subject: [PATCH] ASoC: amd: Don't show messages about deferred probing by
> default
>=20
> Nearly every boot with a Lenovo P14s is showing
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
>=20
> This isn't useful to a user, especially as probing will run again.
> Downgrade the message to debug, and only show errors.
>=20
> CC: markpearson@lenovo.com
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  sound/soc/amd/renoir/acp3x-rn.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x=
-
> rn.c
> index 306134b89a82..e785994de614 100644
> --- a/sound/soc/amd/renoir/acp3x-rn.c
> +++ b/sound/soc/amd/renoir/acp3x-rn.c
> @@ -54,9 +54,14 @@ static int acp_probe(struct platform_device *pdev)
>  	snd_soc_card_set_drvdata(card, machine);
>  	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>  	if (ret) {
> -		dev_err(&pdev->dev,
> -			"snd_soc_register_card(%s) failed: %d\n",
> -			acp_card.name, ret);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"snd_soc_register_card(%s) failed: %d\n",
> +				card->name, ret);
> +		else
> +			dev_dbg(&pdev->dev,
> +				"snd_soc_register_card(%s) probe deferred:
> %d\n",
> +				card->name, ret);
>  		return ret;
>  	}
>  	return 0;
> --
> 2.25.1

Hi Takashi, Vijendar,

Did you see this?
