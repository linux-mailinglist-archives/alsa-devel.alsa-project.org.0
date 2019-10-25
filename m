Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FCE4402
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 09:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DD31763;
	Fri, 25 Oct 2019 09:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DD31763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571987234;
	bh=MtWtWZSL56u1TNCgyZhrnt/BnbH4h2+Q0Li0yq46UAA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrVZAaeOeb4qgRgm/X3uW93udBLocgCJ1kJd6eI0rjFTJWhNGrcwZsfNzZGv2o4nu
	 LnkiRv5l/StZZWPKBfIybcMZ3FZZgZCOm4kbtjz9j7hxu96Lf0F0bBLwyDxsFJXRVR
	 NOIL6DHxcLo0SYRKsO8PlUX1fZ6nnIxZtonhiuWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B7AF80393;
	Fri, 25 Oct 2019 09:05:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD022F8036F; Fri, 25 Oct 2019 09:05:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCE9F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCE9F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="fxUAPpRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpDQ1WaM95kAF6CTLeeQUD1KGf9pxWR/gJEGeYlgtYikVm9f1LddTFxoN0dWSu0lVjnoC/Bo5SHAdrexsO9BNz1QTs3XUrGeHnS0EYc7FicJH6m/cTqnIHDLKJ+4uPLXWYK7kdT2Via+LO18t0hfe0DULkw9c7zrordbw3/Bo62YxR5SuzeYEFYEMU8DVED5sNCOcNhwsugjEIcXwAnNvqoEdzk+f7rrPW3cMYAstOqfaQYaO4zPN6T81PLQj3cPXVP+oVb5eQlo0h/HETkRfSBIs6et4TPjMGRefmBu3EZ3YCOhH4/YtHHbpsBx7QSVwl/fLUus8IM1E1+Sy9jFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMvCXJYahdqoK3nyTEmAhnpGmjZgy+i5kiNMK2fdUVE=;
 b=ZQpo1hDU4iT/VIAWQqtNqfy4l1poiitJZqf8e1Bnr5L9PD70xtj4a8OlN2mUlQ6pSrJ0eQheil0XOkObZB7gy1pk6YPoprA/vttv8XUmRD55wwjn16j6/f0st7tDCMh1NeLIfgD4PnKpJOFXJauSGrpf6J+Fth9g4wO1dr5TBbWoMizjYtSyKeIVUn5Alg1WWAX1HXcS3tIB1K9Ja2a1o0QRjtijjQeFiQoj0svTGUoMjrVcOyqCi5G8J0+HcprW7exqlu5cVEDpY2fUkAt6/jlvUxdoKbOjKRgEJe1Y/Kw4A8qzhq/xMMRileEpTit5ph/jSod9odc0TlVrhu+3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMvCXJYahdqoK3nyTEmAhnpGmjZgy+i5kiNMK2fdUVE=;
 b=fxUAPpRWoAj+ysA66rTxKYH9qAgc86C6oOojqE4fdODxP7LffshUOjmNgrvNI+Hr62JC8kjGfCr0G5VRY6qne5ENOHiHy259+8v/cPb5lByPrN92Pg+itJFzDf/j6O9B1cJ5eM3kw+dbNvt/HTRIaaCxi1MDfgBppAvnTXS/l/E=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2747.namprd12.prod.outlook.com (20.176.116.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 07:05:21 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 07:05:21 +0000
From: vishnu <vravulap@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 1/7] ASoC: amd: Create multiple I2S platform device
 endpoints.
Thread-Index: AQHVhffLV6dTyVw4dkCUUrYwEmzXIqdq+Z4A
Date: Fri, 25 Oct 2019 07:05:20 +0000
Message-ID: <0e142f91-de3e-9a8c-3040-fc90a0c91f25@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 283fd0a8-f47c-44ab-691a-08d75919b2d8
x-ms-traffictypediagnostic: DM6PR12MB2747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2747EAE5FC3445A21625F7ADE7650@DM6PR12MB2747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(52116002)(102836004)(19627235002)(53546011)(71200400001)(386003)(6506007)(486006)(26005)(71190400001)(6862004)(36756003)(229853002)(8936002)(6512007)(81156014)(4326008)(6486002)(6246003)(6436002)(256004)(6636002)(478600001)(99286004)(66446008)(66556008)(76176011)(316002)(8676002)(31686004)(2906002)(64756008)(66476007)(31696002)(66946007)(7736002)(3846002)(186003)(54906003)(37006003)(11346002)(305945005)(2616005)(476003)(446003)(5660300002)(6116002)(66066001)(14454004)(81166006)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2747;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XyHV719XnUShwH6dL69Mn0Z+Hah/iKkwNjkF47nYljNd9Snl8afLWpf54W7gwcHhQrQ34zH8Ju4Aq6xiY2fG2bU7GRAfJuQOCuF/ON5ehZBCvUygHQou+I72IS0ePX+tJLU5ypeLJWVjbeSJaIb0yWQPsIi8zY+g4pSHpNHBra61TD+beYg3X0FDtB0BO05qdqeZXenDFiHZzEUItmNUR/neX54S4ZuU3OuUVAW51l6qucZU8UunxKDbzcBpD4/96d8ffW7+1SwLGgtfDq9JytxvgwXcFvxuyiZe8vXAxQklBsTz0DVZ4Yb9bDU6U1uY0tIFd6+ZJUN4AVQyxJwP6YsdMfXEjA9bflxOzBMfis+kEvUcwb1KrKE0JBka5h5n+NIPokmFlWbzVXbNt9IbjiROmjHFrUDTMj8Er98Up0okocm+dfRKxlLEenKVZYgy
Content-ID: <DC0620828CADDE428E619CA634DFCA6F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283fd0a8-f47c-44ab-691a-08d75919b2d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 07:05:20.8044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAWZ041BwNIZjjJ8ywNJOEhkSwU4+uLpQA1i4ypjmzN7rgW+YTaNRrNkVXbv+CbNy/PmvuWSd2Vgd84NO+Sa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2747
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: amd: Create multiple I2S
 platform device endpoints.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

Any updates on this patch.

Regards,
Vishnu

On 19/10/19 2:35 AM, Ravulapati Vishnu vardhan rao wrote:
> Creates Platform Device endpoints for multiple
> I2S instances: SP and  BT endpoints device.
> Pass PCI resources like MMIO, irq to the platform devices.
> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x.h     |  5 +++
>   sound/soc/amd/raven/pci-acp3x.c | 83 +++++++++++++++++++++++++++--------------
>   2 files changed, 60 insertions(+), 28 deletions(-)
> 
> diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
> index 4f2cadd..2f15fe1 100644
> --- a/sound/soc/amd/raven/acp3x.h
> +++ b/sound/soc/amd/raven/acp3x.h
> @@ -7,10 +7,15 @@
>   
>   #include "chip_offset_byte.h"
>   
> +#define ACP3x_DEVS		3
>   #define ACP3x_PHY_BASE_ADDRESS 0x1240000
>   #define	ACP3x_I2S_MODE	0
>   #define	ACP3x_REG_START	0x1240000
>   #define	ACP3x_REG_END	0x1250200
> +#define ACP3x_I2STDM_REG_START	0x1242400
> +#define ACP3x_I2STDM_REG_END	0x1242410
> +#define ACP3x_BT_TDM_REG_START	0x1242800
> +#define ACP3x_BT_TDM_REG_END	0x1242810
>   #define I2S_MODE	0x04
>   #define	BT_TX_THRESHOLD 26
>   #define	BT_RX_THRESHOLD 25
> diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
> index facec24..7f435b3 100644
> --- a/sound/soc/amd/raven/pci-acp3x.c
> +++ b/sound/soc/amd/raven/pci-acp3x.c
> @@ -16,16 +16,16 @@ struct acp3x_dev_data {
>   	void __iomem *acp3x_base;
>   	bool acp3x_audio_mode;
>   	struct resource *res;
> -	struct platform_device *pdev;
> +	struct platform_device *pdev[ACP3x_DEVS];
>   };
>   
>   static int snd_acp3x_probe(struct pci_dev *pci,
>   			   const struct pci_device_id *pci_id)
>   {
>   	int ret;
> -	u32 addr, val;
> +	u32 addr, val, i;
>   	struct acp3x_dev_data *adata;
> -	struct platform_device_info pdevinfo;
> +	struct platform_device_info pdevinfo[ACP3x_DEVS];
>   	unsigned int irqflags;
>   
>   	if (pci_enable_device(pci)) {
> @@ -68,7 +68,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   	switch (val) {
>   	case I2S_MODE:
>   		adata->res = devm_kzalloc(&pci->dev,
> -					  sizeof(struct resource) * 2,
> +					  sizeof(struct resource) * 4,
>   					  GFP_KERNEL);
>   		if (!adata->res) {
>   			ret = -ENOMEM;
> @@ -80,39 +80,61 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   		adata->res[0].start = addr;
>   		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
>   
> -		adata->res[1].name = "acp3x_i2s_irq";
> -		adata->res[1].flags = IORESOURCE_IRQ;
> -		adata->res[1].start = pci->irq;
> -		adata->res[1].end = pci->irq;
> +		adata->res[1].name = "acp3x_i2s_sp";
> +		adata->res[1].flags = IORESOURCE_MEM;
> +		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
> +		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
> +
> +		adata->res[2].name = "acp3x_i2s_bt";
> +		adata->res[2].flags = IORESOURCE_MEM;
> +		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
> +		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
> +
> +		adata->res[3].name = "acp3x_i2s_irq";
> +		adata->res[3].flags = IORESOURCE_IRQ;
> +		adata->res[3].start = pci->irq;
> +		adata->res[3].end = adata->res[3].start;
>   
>   		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
>   
>   		memset(&pdevinfo, 0, sizeof(pdevinfo));
> -		pdevinfo.name = "acp3x_rv_i2s";
> -		pdevinfo.id = 0;
> -		pdevinfo.parent = &pci->dev;
> -		pdevinfo.num_res = 2;
> -		pdevinfo.res = adata->res;
> -		pdevinfo.data = &irqflags;
> -		pdevinfo.size_data = sizeof(irqflags);
> -
> -		adata->pdev = platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(adata->pdev)) {
> -			dev_err(&pci->dev, "cannot register %s device\n",
> -				pdevinfo.name);
> -			ret = PTR_ERR(adata->pdev);
> -			goto unmap_mmio;
> +		pdevinfo[0].name = "acp3x_rv_i2s_dma";
> +		pdevinfo[0].id = 0;
> +		pdevinfo[0].parent = &pci->dev;
> +		pdevinfo[0].num_res = 4;
> +		pdevinfo[0].res = &adata->res[0];
> +		pdevinfo[0].data = &irqflags;
> +		pdevinfo[0].size_data = sizeof(irqflags);
> +
> +		pdevinfo[1].name = "acp3x_i2s_playcap";
> +		pdevinfo[1].id = 0;
> +		pdevinfo[1].parent = &pci->dev;
> +		pdevinfo[1].num_res = 1;
> +		pdevinfo[1].res = &adata->res[1];
> +
> +		pdevinfo[2].name = "acp3x_i2s_playcap";
> +		pdevinfo[2].id = 1;
> +		pdevinfo[2].parent = &pci->dev;
> +		pdevinfo[2].num_res = 1;
> +		pdevinfo[2].res = &adata->res[2];
> +		for (i = 0; i < ACP3x_DEVS ; i++) {
> +			adata->pdev[i] =
> +				platform_device_register_full(&pdevinfo[i]);
> +			if (adata->pdev[i] == NULL) {
> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[i].name);
> +				ret = -ENODEV;
> +				goto unmap_mmio;
> +			}
>   		}
>   		break;
> -	default:
> -		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
> -		ret = -ENODEV;
> -		goto unmap_mmio;
>   	}
>   	return 0;
>   
>   unmap_mmio:
> -	pci_disable_msi(pci);
> +	for (i = 0 ; i < ACP3x_DEVS ; i++)
> +		platform_device_unregister(adata->pdev[i]);
> +	kfree(adata->res);
>   	iounmap(adata->acp3x_base);
>   release_regions:
>   	pci_release_regions(pci);
> @@ -124,9 +146,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   
>   static void snd_acp3x_remove(struct pci_dev *pci)
>   {
> +	int i;
>   	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
>   
> -	platform_device_unregister(adata->pdev);
> +	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
> +		for (i = 0 ; i <  ACP3x_DEVS ; i++)
> +			platform_device_unregister(adata->pdev[i]);
> +	}
>   	iounmap(adata->acp3x_base);
>   
>   	pci_disable_msi(pci);
> @@ -151,6 +177,7 @@ static struct pci_driver acp3x_driver  = {
>   
>   module_pci_driver(acp3x_driver);
>   
> +MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
>   MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
>   MODULE_DESCRIPTION("AMD ACP3x PCI driver");
>   MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
