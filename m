Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FF205E55
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 22:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F44D17BD;
	Tue, 23 Jun 2020 22:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F44D17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592944065;
	bh=K/f/nj/ME5Ar85EeMi1RiqKPlRpkIXzA4IU9lQQAxj0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUhRNfHrfM1lbhfG7Q/HAz1GEVtEXiTsZ9xy3Yo12VbQSZSb07gX4101uTvoeTPkw
	 H3wWML8iHXpY2TLokliRGIxjWirEpielvrdukmdM71xpXjQT3x2LORGiT3AjE8u/wA
	 VL/n9zorIzypGimLMmSjheL4x6a2Ba00vO90eJuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC1DF802A8;
	Tue, 23 Jun 2020 22:26:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6635F802A7; Tue, 23 Jun 2020 22:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E01F8F802A1
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 22:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01F8F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="T/8h0sf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkM+6+ihgT8oxP+WIF9/YU1IAX9k4rMs0wMrKnzIUqCBuOvCa8s0YNNiL3mm/pG4Cltg26bpLfRXOd55CujEJi82q6qHrp7QhYaxji750DMbQYRtYMZejyBZTaB3QtvKA22lDTBeyYqS12AIq/X1rgmXvM7MBZpjq4AoV+G/9PYPzV7vHsb4gnKC2JUShje+XdzvznR3DyylB49mQS5oBeDTll6Bu5029XWOavGxZrGnrbup2RCwgkuhBhPBa7HnfWcHsQmUljrfYm2MWmu8fNwt3NppfvAwjWM6FPPvM64CrvKL0gMCOdzf5GSWQvDfpbxMe2ahQOnf3JEhkl5O7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfqQOBYrFi9DYS2i1lNBUMyQvBc6bu9JXjv01PldV7k=;
 b=dLs0IM7Hnj2KI4YF0wbeWhhK/VUKmb+CY3XRpja/CQu55BUIsuWNRv0/HuXydCncNY8JMh5HDiL+8TVHQ7pu5G30IkYiavE2QU1mXP5zZqtRpAMD8SXyp1eSXTAi/N5KEj1My8g3a+mHRgxcqJF6uiF+dgtzrai2dnP4a4IvXrnJoqs1eZoT0gNG/VOggFzA/iZq7xtB+Jz4FkmfTm3WzOn84HbcesVLB7MSO49IsQdBFofdyIg75vWLm9BKZkdMz6lRR2Hao4vZPoshqAVELsCCwLTVffl6E6Q5qv0BmgRUV+DMyt2T1uLU7lnLcIZ3ekvmzoPL8rOafrJeVv8b0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfqQOBYrFi9DYS2i1lNBUMyQvBc6bu9JXjv01PldV7k=;
 b=T/8h0sf9tphtSMHTLGyn0OemnrmsObbeRLg+ojQYenELQ4Wi/DNqDR4bcKUcnKm5tplPSJjldcb5QQLzwUmaZwuqp3SCkj4rqXAgMx4gGQli4+mN+OPszTx98nQbhfY4Dygj/0ayrqeD+fQFTAo6jrCAOEpwX2wuxXSWB7rnxlo=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4032.namprd12.prod.outlook.com (2603:10b6:208:16d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.26; Tue, 23 Jun
 2020 20:25:46 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72%5]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 20:25:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "perex@perex.cz"
 <perex@perex.cz>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
Thread-Topic: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
Thread-Index: AQHWSZrC3d8IrIgK5Ey6XY8Us0rKu6jmpXXg
Date: Tue, 23 Jun 2020 20:25:46 +0000
Message-ID: <MN2PR12MB4488B30CD4FB88DB3A29C368F7940@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <1592944040-12974-1-git-send-email-Vijendar.Mukunda@amd.com>
In-Reply-To: <1592944040-12974-1-git-send-email-Vijendar.Mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-23T20:24:54Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=a4261b97-d950-4df6-93d9-000045ac98eb;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-23T20:25:43Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 3ff8f445-c5f3-46fe-b239-0000edb9a343
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c7ae211-8b43-4fa2-71b1-08d817b39cb7
x-ms-traffictypediagnostic: MN2PR12MB4032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40325ECCCAEEC2A75B6865E0F7940@MN2PR12MB4032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2G9R5KoqXrreIEWVYolh4/i943TInmSb3wYlCz45tLMreNav9TECZ6Ev30QMz8xwpiX9onZe4558+l9NdHSQnKkhJyXld5YKX1CDr4J8twB1YIkvH5eB9kKhr22abOMTJl93RUWDi5swVXNPNgfVP4H+9gE3QC6H8+viYFXeSyyTQDmYGJfWJevzQv2tLjF4vF9u+exONMmwHuW4dUP1nTdMQQnk03keDf5wtGLx6JMS8onW6XdBZwSWyKr0VyNcO1JKeqBYP3z5a4dRXd7uLvh9PDvw5KeULnXxH9IM4uGR9mkCtt56wEnowug7+SflwDBvDPNuj53HVgqrVfsGgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(186003)(110136005)(7696005)(53546011)(66946007)(316002)(64756008)(54906003)(66446008)(76116006)(6506007)(5660300002)(52536014)(26005)(71200400001)(86362001)(2906002)(9686003)(478600001)(55016002)(83380400001)(8936002)(8676002)(33656002)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: eJ1uruhZ/9LoIyvLvJXoBKjni9u1eTs7wNduZKrzEmca22fE1G8sEYFAACcRP7ya5uvI5FdjZIpi+Cp50Z5exCt+WNnygFGzjSKDfnNMx38GX5Cl9aeHLCVA2BPSCJHiNHGVcG49iyar6CX8Mc/spIfbUdfZJDW/cIkY0IAFdxpHAOIns9WO74Kd4aJUFJwUJzb3ke5Z96rNzuGUEqoZdWhbZT+ddPi3avbw6sKwHtwdAGnGFE8J72c4nQQF6SXie5jd3WPqiq8Y4VE6FQGlUkTkkKtCBq6X9AErwaqDkoTjy3alNEj3zAZ3mZHxXC0owgkFqeuQX20XGXgsqCCP7WDbfODh/hPNpe+JEmrrrPnvrwRckUTaH8gU3QrmOdBmAqox3cuH/o3mVipRdNEITfSXRA2drMRC7LNJ3Tdd3AytrcbCR6ALCqV6UmBQpKtxMVseJtFNAVlQduPfQadvJFhqE0ynJxPBxe9gvIQSepmUll3zGXcZBWgsqOU7TV0x
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7ae211-8b43-4fa2-71b1-08d817b39cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 20:25:46.7941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iL6YBJRwTwh6gt3gGhZ8ncWUaBPfktlrspOULxfVJ+gQ6Oco/ALuRpeNYNr7O9l21C7f2w2ZyMWcjtSgvPMQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4032
Cc: "hui.wang@canonical.com" <hui.wang@canonical.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>, "Mukunda,
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

[AMD Public Use]

> -----Original Message-----
> From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Sent: Tuesday, June 23, 2020 4:27 PM
> To: perex@perex.cz; alsa-devel@alsa-project.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Arya, Virendra-
> Pratap <Virendra-Pratap.Arya@amd.com>; hui.wang@canonical.com;
> Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Subject: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
>=20
> Add logic to check DMIC hardware exists or not on the platform at runtime=
.
>=20
> Add module param for overriding DMIC hardware check at runtime.
>=20
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  sound/soc/amd/renoir/rn-pci-acp3x.c | 29
> +++++++++++++++++++++++++++++
>  sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
>  2 files changed, 31 insertions(+)
>=20
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c
> b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 859ed67..faa7566 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -5,6 +5,7 @@
>  //Copyright 2020 Advanced Micro Devices, Inc.
>=20
>  #include <linux/pci.h>
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> @@ -18,6 +19,16 @@ static int acp_power_gating;
> module_param(acp_power_gating, int, 0644);
> MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
>=20
> +/**
> + * dmic_acpi_check =3D -1 - Checks ACPI method to know DMIC hardware
> status runtime
> + *                 =3D 0 - Skips the DMIC device creation and returns pr=
obe failure
> + *                 =3D 1 - Assumes that platform has DMIC support and sk=
ips ACPI
> + *                       method check
> + */
> +static int dmic_acpi_check =3D ACP_DMIC_AUTO;
> +module_param(dmic_acpi_check, int, 0644);
> +MODULE_PARM_DESC(dmic_acpi_check, "checks Dmic hardware
> runtime");
> +
>  struct acp_dev_data {
>  	void __iomem *acp_base;
>  	struct resource *res;
> @@ -157,6 +168,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,  {
>  	struct acp_dev_data *adata;
>  	struct platform_device_info pdevinfo[ACP_DEVS];
> +	acpi_handle handle;
> +	acpi_integer dmic_status;
>  	unsigned int irqflags;
>  	int ret, index;
>  	u32 addr;
> @@ -201,6 +214,22 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto disable_msi;
>=20
> +	if (!dmic_acpi_check) {
> +		ret =3D -ENODEV;
> +		goto de_init;
> +	} else if (dmic_acpi_check =3D=3D ACP_DMIC_AUTO) {
> +		handle =3D ACPI_HANDLE(&pci->dev);
> +		ret =3D acpi_evaluate_integer(handle, "_WOV", NULL,
> &dmic_status);
> +		if (ACPI_FAILURE(ret)) {
> +			ret =3D -EINVAL;
> +			goto de_init;
> +		}
> +		if (!dmic_status) {
> +			ret =3D -ENODEV;
> +			goto de_init;
> +		}
> +	}
> +
>  	adata->res =3D devm_kzalloc(&pci->dev,
>  				  sizeof(struct resource) * 2,
>  				  GFP_KERNEL);
> diff --git a/sound/soc/amd/renoir/rn_acp3x.h
> b/sound/soc/amd/renoir/rn_acp3x.h index 75228e3..1462039 100644
> --- a/sound/soc/amd/renoir/rn_acp3x.h
> +++ b/sound/soc/amd/renoir/rn_acp3x.h
> @@ -55,6 +55,8 @@
>=20
>  #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE *
> CAPTURE_MAX_NUM_PERIODS)  #define MIN_BUFFER MAX_BUFFER
> +#define	ACP_DMIC_AUTO   -1
> +
>  struct pdm_dev_data {
>  	u32 pdm_irq;
>  	void __iomem *acp_base;
> --
> 2.7.4
