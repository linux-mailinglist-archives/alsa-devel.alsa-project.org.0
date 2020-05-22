Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA41DE2CE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 11:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE64B1890;
	Fri, 22 May 2020 11:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE64B1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590139123;
	bh=ubhUKgRIXiqte3c6aRd8xN7bLum8I7IRuAQ4VVQz7wc=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkyvZEd6xi+EC7fC6Ekk9jSJXa5A4IUbnrd+rvI4RNcVbiL7qymasA7ftlmJSIG1+
	 8TkiYcXdAWmUx5wpAgFOf4a18veoXSqwPFIy4LNmiJK4YvvrkUM1BrxY99kp6GSRVb
	 ptDvJ5CPhJgUYh5wPR5h3e7BjhccFsOO8PGFc1WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2181F801DA;
	Fri, 22 May 2020 11:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FA4BF801F9; Fri, 22 May 2020 11:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19551F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 11:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19551F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="fKss1aqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFqY/tYDpvszG700pxpseXwD9GPBjNpDjqgXahdafa+NNUUwYsGhkDp0lRSypTcXTyBa42yHD1yNiSbbgR0BT5PP5HWMWsGgelT9co0uaq0tDoAsAINJ70VYHy1pE2pWILTJQYNcJ1odmdl3jcuRPH0QXrjQ752J6tWGHa8oHXuh06BrDASeFe5aIO0JIZqj0GTreHGQ4qUMBbCQf6kqJAmNUv+ckYmJfFqpFub7SEGZ7JbSc6G6qe0kVUTbsVdjYHsBerEibsidJ87iTK80UI4O5Nxt2u/+Qcw3LCmJLfWZEwSrSBmhLIqX17kfLRHpju7oEQsk/LLsqpdidQKtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDM2DyU6MB+RePmSRVQogA68DrzvCSuRX5SP95LitCo=;
 b=RjOTrvjDOc/ge1dt4uX/plWpeBT6mABi7c3Vieth6ukujewFd3p12y2lYN2Fl8PWW0m4JbYZsISKNY9J4xLs03ykqIDSUL4mI0VKkYHvhIgI7gb5cqpmtfdI7B9mgXHwDJEKY5t2kphbqN5rd6ka48FTWAGhzTEq3m4cwyTQshPaYDbhLHzYeBNMjjNvwjWVjVF6fw3srLIelFCNQJZTLhqoeALJzMyt7SjjL44TtWJOZTNFyfkUWVSOFYfxRRIJJhghT+vanIbZD+PvocMKAwzJmFlauAAecYepC/Md4TpMZ4w80EEzAK64pRSvp7ATS0SEffXScc7BrMhw6sD4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDM2DyU6MB+RePmSRVQogA68DrzvCSuRX5SP95LitCo=;
 b=fKss1aqhA1FSE3PAUlk0MeUH0nNF8RYm/g+sjjgvh0Ty/wUhoaGlemmVVEaLCVesHJwi1r3EEh9oK70d5Xjj7tYeEW5y3SdiGI6ynkWD8r5MvF4HGwhXD5FW5gUJhW9DdqYW27cBYl31z/jIt9fvxSKo9NMyhdSNNLnTCu2XIYg=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3195.namprd12.prod.outlook.com (2603:10b6:5:183::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Fri, 22 May 2020 09:16:44 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 09:16:43 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Hui Wang <hui.wang@canonical.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqizxxJQ
Date: Fri, 22 May 2020 09:16:43 +0000
Message-ID: <DM6PR12MB26330E411A264053F18C3B3E97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
In-Reply-To: <20200522081738.11636-1-hui.wang@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-22T08:33:09Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=dd680a47-b1db-41d3-a0ea-0000455f2f5f;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-22T09:16:41Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 68dfa040-2436-4e39-a2e9-0000fdf35eda
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab2cfaa6-29b0-47c3-9b99-08d7fe30d878
x-ms-traffictypediagnostic: DM6PR12MB3195:
x-microsoft-antispam-prvs: <DM6PR12MB3195EE873393FA7323C194C497B40@DM6PR12MB3195.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZaHJNm045XCbP0FnVOrzmbVkBT1OsGmuiwH7Lz9UWzPmwWBDH6XmOsWcWv7WT7wKjzOxnrL4d3NDyBky4Fs2E4llxPVWesNfgKhb55XQAP0XuhzFprj+van3fsaAC3A4NiWaZtCyR9zGbO51KLmhydcerB30LjAEgldbp7seS1VWFX4gIwklOkfvfInLW/AXWaBDGctoyiBAM+9vX+n9wdHQSXtRCHRmExK6p5QJuurSHOBR1Js3EHRvVRRtIcsTerc3biCuSKhh2F0SwCSclXSrjMv29CR/UROc0nw6xZYTwFTOLpvNrYIDN9IL5RSB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(71200400001)(86362001)(5660300002)(64756008)(66446008)(66476007)(8676002)(76116006)(66556008)(8936002)(2906002)(9686003)(7696005)(33656002)(53546011)(186003)(66946007)(6506007)(316002)(55016002)(52536014)(26005)(110136005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uUu5o9jVBBO5bAQnZEEFITqnnFmcqjKnC5He5VjYIhhwejNIUXuXZb7uaXVoBH+rel5ORCSYp0QZt6b8BMZOHl0zExYN6U/p6iR+uzDaSbYdeCpvqrDeTbeXeNv+dY5o51DH79k/EQX1sDlzAQRpVAiKLPYDfybaqIiHt8AyG6PncYs2g7UNP/vk4BNbz7Bohr1HL9Ohq6t6rt2ddBobO+Is6759GLyo2UptRJGET2RZaPPHWC5kIZqDfptFxEVoqlQJKdBC+z1VDWhf+yxuecK7J7KXYvgbp9AL5ZO478vWDAla+a86+wdh/UVMV/9EYOMn0B2mAFXVCu/ERnOLGK7k7rtlslI8bgCURyzUNEpkPltOSERQqOWOUMGdkW6ZZ3vDYf146++Omo0EBrP+g1/eyseRFAdlGOPvnxTLmOP2i32zpe0yDVd8GhzV4CnpLjivP1DrLxKqhLINRyqfTdd/W6/12vvEsbP+V4v8QUajUiPr2g3VrfJr5wcHx3MN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2cfaa6-29b0-47c3-9b99-08d7fe30d878
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 09:16:43.8303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSzWxMo0D2pBbHbcZ5o+B+RxVWFONOhhYZNCsTxtfS+DldhQuTbJVhkM/PTcuDizNcP93p192+05BZY+60K1tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3195
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



> -----Original Message-----
> From: Hui Wang <hui.wang@canonical.com>
> Sent: Friday, May 22, 2020 1:48 PM
> To: alsa-devel@alsa-project.org; broonie@kernel.org; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>
> Subject: [PATCH v2] ASoC: amd: put off registering mach platform_dev to a=
void
> -517 err
>=20
> If the mach driver's probe is called ahead of codec driver's probe,
> the kernel will print -517 error message although the audio still
> works finally:
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
>=20
> we could workaround this issue by moving the registration of mach
> platform_dev to plat driver's probe.

ACP PCI driver creates the platform devices for DMA driver,
Machine driver & DMIC generic driver.

During machine driver probe, Sound card registration  fails if
it is unable to find Codec component and platform component=20
throwing an error as EPROBE_DEFER.(-517)

It will try few more iterations to bind the DAI links.
I guess this is an expected behavior only.

Sound card registration is successful after several attempts.
This is the reason audio is working without any issues.
Below is the sample log.
acp_pdm_mach acp_pdm_mach.0: dmic-hifi <-> acp_rn_pdm_dma.0 mapping ok

Not really sure do we still need to fix the sound card registration fail is=
sue?
We have seen similar issue in Raven I2S driver also.

Ideally ACP PCI device should be parent device for platform devices needed =
by
DMA driver,  generic dmic driver and machine driver.

In one way, we are forcing machine driver gets probed only after=20
DMA driver and codec driver to avoid sound card registration failure

Correct me , If my understanding is wrong.

>=20
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  sound/soc/amd/renoir/acp3x-pdm-dma.c | 13 +++++++++++++
>  sound/soc/amd/renoir/rn-pci-acp3x.c  |  3 ---
>  sound/soc/amd/renoir/rn_acp3x.h      |  3 ++-
>  3 files changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c
> b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> index 623dfd3ea705..46055c244998 100644
> --- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
> +++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> @@ -402,6 +402,7 @@ static int acp_pdm_audio_probe(struct
> platform_device *pdev)
>  	struct pdm_dev_data *adata;
>  	unsigned int irqflags;
>  	int status;
> +	struct platform_device_info pdevinfo =3D {0};
>=20
>  	if (!pdev->dev.platform_data) {
>  		dev_err(&pdev->dev, "platform_data not retrieved\n");
> @@ -448,6 +449,16 @@ static int acp_pdm_audio_probe(struct
> platform_device *pdev)
>  		dev_err(&pdev->dev, "ACP PDM IRQ request failed\n");
>  		return -ENODEV;
>  	}
> +
> +	pdevinfo.name =3D "acp_pdm_mach";
> +	pdevinfo.id =3D 0;
> +	pdevinfo.parent =3D &pdev->dev;
> +	adata->m_pdev =3D platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(adata->m_pdev)) {
> +		dev_err(&pdev->dev, "cannot register %s device\n",
> +			pdevinfo.name);
> +		return PTR_ERR(adata->m_pdev);
> +	}
>  	pm_runtime_set_autosuspend_delay(&pdev->dev,
> ACP_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> @@ -457,7 +468,9 @@ static int acp_pdm_audio_probe(struct
> platform_device *pdev)
>=20
>  static int acp_pdm_audio_remove(struct platform_device *pdev)
>  {
> +	struct pdm_dev_data *adata =3D dev_get_drvdata(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	platform_device_unregister(adata->m_pdev);
>  	return 0;
>  }
>=20
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/r=
n-
> pci-acp3x.c
> index 859ed67b93cf..f5f450cbd249 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -230,9 +230,6 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>  	pdevinfo[1].name =3D "dmic-codec";
>  	pdevinfo[1].id =3D 0;
>  	pdevinfo[1].parent =3D &pci->dev;
> -	pdevinfo[2].name =3D "acp_pdm_mach";
> -	pdevinfo[2].id =3D 0;
> -	pdevinfo[2].parent =3D &pci->dev;
>  	for (index =3D 0; index < ACP_DEVS; index++) {
>  		adata->pdev[index] =3D
>=20
> 	platform_device_register_full(&pdevinfo[index]);
> diff --git a/sound/soc/amd/renoir/rn_acp3x.h
> b/sound/soc/amd/renoir/rn_acp3x.h
> index 75228e306e0b..232eda4db055 100644
> --- a/sound/soc/amd/renoir/rn_acp3x.h
> +++ b/sound/soc/amd/renoir/rn_acp3x.h
> @@ -7,7 +7,7 @@
>=20
>  #include "rn_chip_offset_byte.h"
>=20
> -#define ACP_DEVS		3
> +#define ACP_DEVS		2
>  #define ACP_PHY_BASE_ADDRESS 0x1240000
>  #define	ACP_REG_START	0x1240000
>  #define	ACP_REG_END	0x1250200
> @@ -59,6 +59,7 @@ struct pdm_dev_data {
>  	u32 pdm_irq;
>  	void __iomem *acp_base;
>  	struct snd_pcm_substream *capture_stream;
> +	struct platform_device *m_pdev;
>  };
>=20
>  struct pdm_stream_instance {
> --
> 2.17.1

