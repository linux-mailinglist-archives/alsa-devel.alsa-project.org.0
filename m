Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE153CB86C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 12:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525DB1672;
	Fri,  4 Oct 2019 12:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525DB1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570185428;
	bh=exGlPK+KnPY6nxw92p9FPOXApqDlQC9loeKFA7kU9+c=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWvuPm8VmV8C3wkAAEdbp5x2XU+KNkGU3PeITIvWEL6TuZf1shfEK/3v9FBMxJYj1
	 yL/4/4TywjbeR3hF8+bEvRMwXdyOGjOGLAa8qLMwV7LxjkOe3qRt2IFxb6x5M99WxU
	 1hZ22TZBO08LbSgx5r67v0XEOn3AxsExOE/vGQCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 503BBF805FA;
	Fri,  4 Oct 2019 12:34:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC4F5F80506; Tue,  1 Oct 2019 12:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800081.outbound.protection.outlook.com [40.107.80.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A03CF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 12:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A03CF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="tvA03TkH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpl7KB/vSgIXA8D+3TTRNnVDgHXtMfAGbAOpIzJO8hgsMdS1L596qDGvRzhVntshCOP1lNnCqgiW1niTSG9JWBG9Z4zxTzzltYi4Wy5PEdqg1TCJC3XzB0QFQcl/E3vJG7pzEoIPAPLOyjBVZv42kYMDTX+MfXGirsoexlp/pZ64+1Z4z2S76ruSEOVxl8L1YFNuhEGznwowMOMIvLPMDvawHwquazZFCOsq23Om+ykHIVwhpeK+nrunbTBv2w8Oo+Ha49l10muSxxsS/honJCoEXXWAcdGAsB7ZkQYKrJBQarnsbFY5BEL747cnyauTFgJj4pM9g9UkKVsFXnM86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeHgIrJ+Z6RZqsw7GdlZx9XIsH7+UyYt9IwswkVaF+I=;
 b=eO01ZzXhUX2CSnwHD4WZymbsxcaNqGJPkFQ9shQ6V6+gKF59YsXQGHBQQg7KoJKse4mFuMmZyYwV4kDdeStir5C48QY1EYf6DRsEO/iXY8XWGA5xTsyTmlD9eIWccW1oQ0wWkUKfHQ2ht+Icm3QPfPt2+viYISbHotmp69WEzC5fRXljJtHyINSXivJ5rLwDftCwel/Zt3joFlXSFvgG7JN3XHQk6ukkQfrYryrafnp86iXuO04ciZ1UqpjRYprw5cg+YMYVeOXaBJF4qoHQD3fp/IQVJhyVL8lEdh+Mk8X1soQz1f6TVUxT9naCVTw2eo/FrJnsqPdMJDjQiM7FSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeHgIrJ+Z6RZqsw7GdlZx9XIsH7+UyYt9IwswkVaF+I=;
 b=tvA03TkHYqBuyhvnr31eLHm/T5F/MX+XdYb1uvE7VSk/AHQuRjBp42Nqy+Ij47h2/4IvTiKIsvbbrVCeQW9/AhH0yYlcrCXTT1SuNT7dJ606dyTiCBSvDKlgmo6AJpz48FjBIgbxDSZQ/xB3MSnjjcNn/LLDA/H1O3Sh+Dr3j40=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2617.namprd12.prod.outlook.com (20.176.116.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 10:00:46 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 10:00:46 +0000
From: vishnu <vravulap@amd.com>
To: Lee Jones <lee.jones@linaro.org>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
 framework
Thread-Index: AQHVd5gysBGn4q83rEe097OrmwWXeadFWHuAgADs8gA=
Date: Tue, 1 Oct 2019 10:00:45 +0000
Message-ID: <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell>
In-Reply-To: <20191001064539.GB11769@dell>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb87d24-645a-4794-04e9-08d746563a5f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2617:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2617D1F8E4912B4CF7A053F3E79D0@DM6PR12MB2617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(189003)(199004)(25786009)(52116002)(5660300002)(66476007)(66556008)(64756008)(476003)(26005)(99286004)(6506007)(11346002)(446003)(53546011)(386003)(305945005)(486006)(31686004)(76176011)(66066001)(6246003)(66946007)(36756003)(66446008)(2616005)(102836004)(478600001)(7736002)(8936002)(81156014)(81166006)(8676002)(6116002)(71190400001)(71200400001)(19627235002)(4326008)(186003)(229853002)(6436002)(31696002)(256004)(2906002)(54906003)(6512007)(3846002)(316002)(6486002)(6636002)(110136005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2617;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmCHJ6/jvcYcRfYCoGBt63WXSQ5pejqFahloeYN5ppr9kjfcv9968UTQF/fiMA1Dt88vxSeeZc3LOtp+XXkD14ul/hNt/N8EcImeqWZPU7Ds9gkLyLlNDv8J/ieJRQwaFl5eDBl0ufSc1SFopzjgIlkdSnivRBFpv9vnfv0HO1cXfEZnYX9qjXj8450wwmySCTUQzdXDxfG6nufgocOszXEWyz4lT5GxMWVn31+5Fjixd6FdK8K3B8G2cl5pCpmNOc2W1hiTH2d3U7jo4YoyfKn+iUiSYas0EnwMP/QLr40PhgPYeHGjnWKiz5rmdlc2DIx7im/WJv7WlhavPdGV6owNHCRnQS+ZERpaEucS17ypxLnozFeQjqQL5xT+PDqSppdaHJYkdIsBFCH+f7Kt3zLFMXFVoNVLXSqiKw90JyY=
Content-ID: <453B006A05864C46B1DDBA61C4C13C1A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb87d24-645a-4794-04e9-08d746563a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 10:00:45.7791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3HC06fhTcJlLVqd7wEYuZc4avkbQm/L+6Zp0BezJ8o83giXcuKLUZU98Rp/FbK3fPjMt228gCKV95QveY4GMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
X-Mailman-Approved-At: Fri, 04 Oct 2019 12:34:35 +0200
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
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

Hi Jones,

I am very Thankful to your review comments.

Actually The driver is not totally based on MFD. It just uses 
mfd_add_hotplug_devices() and mfd_remove_devices() for adding the 
devices automatically.

Remaining code has nothing to do with MFD framework.

So I thought It would not break the coding style and moved ahead by 
using the MFD API by adding its header file.

If it is any violation of coding standard then I can move it to 
drivers/mfd.

This patch could be a show stopper for us.Please suggest us how can we 
move ahead ASAP.

Thank you once again for your inputs.

Regards,
Vishnu

On 01/10/19 12:15 PM, Lee Jones wrote:
> On Tue, 01 Oct 2019, Ravulapati Vishnu vardhan rao wrote:
> 
>> Removed platform based endpoint registering in ACP-PCI driver.
>> Now Registering PCM DMA and multiple I2S instances: SP and  BT endpoint
>> devices automatically by using MFD framework.
> 
> This is a hack.
> 
> Why are you using the MFD framework outside of drivers/mfd?
> 
> If this driver is an MFD, then please create an MFD driver.
> 
> If it's not, please do not use the MFD API.
> 
>> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
>> ---
>>   sound/soc/amd/raven/acp3x.h     |   8 +++
>>   sound/soc/amd/raven/pci-acp3x.c | 123 ++++++++++++++++++++++++++--------------
>>   2 files changed, 90 insertions(+), 41 deletions(-)
>>
>> diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
>> index 4f2cadd..c122dc6 100644
>> --- a/sound/soc/amd/raven/acp3x.h
>> +++ b/sound/soc/amd/raven/acp3x.h
>> @@ -7,13 +7,21 @@
>>   
>>   #include "chip_offset_byte.h"
>>   
>> +#define ACP3x_DEVS		3
>>   #define ACP3x_PHY_BASE_ADDRESS 0x1240000
>>   #define	ACP3x_I2S_MODE	0
>>   #define	ACP3x_REG_START	0x1240000
>>   #define	ACP3x_REG_END	0x1250200
>> +#define ACP3x_I2STDM_REG_START	0x1242400
>> +#define ACP3x_I2STDM_REG_END	0x1242410
>> +#define ACP3x_BT_TDM_REG_START	0x1242800
>> +#define ACP3x_BT_TDM_REG_END	0x1242810
>>   #define I2S_MODE	0x04
>> +#define	I2S_RX_THRESHOLD	27
>> +#define	I2S_TX_THRESHOLD	28
>>   #define	BT_TX_THRESHOLD 26
>>   #define	BT_RX_THRESHOLD 25
>> +#define ACP_ERR_INTR_MASK	29
>>   #define ACP3x_POWER_ON 0x00
>>   #define ACP3x_POWER_ON_IN_PROGRESS 0x01
>>   #define ACP3x_POWER_OFF 0x02
>> diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
>> index 8f6bf00..d9f5bc0 100644
>> --- a/sound/soc/amd/raven/pci-acp3x.c
>> +++ b/sound/soc/amd/raven/pci-acp3x.c
>> @@ -9,13 +9,21 @@
>>   #include <linux/io.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/mfd/core.h>
>>   
>>   #include "acp3x.h"
>>   
>> +struct i2s_platform_data {
>> +	unsigned int cap;
>> +	int channel;
>> +	u32 snd_rates;
>> +};
>>   struct acp3x_dev_data {
>> +	struct device *parent;
>> +	struct mfd_cell *cell;
>> +	struct resource *res;
>>   	void __iomem *acp3x_base;
>>   	bool acp3x_audio_mode;
>> -	struct resource *res;
>>   	struct platform_device *pdev;
>>   };
>>   
>> @@ -23,9 +31,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   			   const struct pci_device_id *pci_id)
>>   {
>>   	int ret;
>> -	u32 addr, val;
>> +	resource_size_t addr;
>> +	int val, i, r;
>>   	struct acp3x_dev_data *adata;
>> -	struct platform_device_info pdevinfo;
>> +	struct device *dev;
>> +	struct i2s_platform_data *i2s_pdata;
>>   	unsigned int irqflags;
>>   
>>   	if (pci_enable_device(pci)) {
>> @@ -56,55 +66,87 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   	}
>>   	pci_set_master(pci);
>>   	pci_set_drvdata(pci, adata);
>> -
>> +	adata->parent = &pci->dev;
>>   	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
>>   	switch (val) {
>>   	case I2S_MODE:
>>   		adata->res = devm_kzalloc(&pci->dev,
>> -					  sizeof(struct resource) * 2,
>> -					  GFP_KERNEL);
>> -		if (!adata->res) {
>> +				sizeof(struct resource) * 4,
>> +						GFP_KERNEL);
>> +		adata->cell = devm_kzalloc(&pci->dev,
>> +				sizeof(struct mfd_cell) * ACP3x_DEVS,
>> +						GFP_KERNEL);
>> +		if (!adata->cell) {
>>   			ret = -ENOMEM;
>>   			goto unmap_mmio;
>>   		}
>>   
>> -		adata->res[0].name = "acp3x_i2s_iomem";
>> -		adata->res[0].flags = IORESOURCE_MEM;
>> -		adata->res[0].start = addr;
>> -		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
>> -
>> -		adata->res[1].name = "acp3x_i2s_irq";
>> -		adata->res[1].flags = IORESOURCE_IRQ;
>> -		adata->res[1].start = pci->irq;
>> -		adata->res[1].end = pci->irq;
>> -
>> -		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
>> -
>> -		memset(&pdevinfo, 0, sizeof(pdevinfo));
>> -		pdevinfo.name = "acp3x_rv_i2s";
>> -		pdevinfo.id = 0;
>> -		pdevinfo.parent = &pci->dev;
>> -		pdevinfo.num_res = 2;
>> -		pdevinfo.res = adata->res;
>> -		pdevinfo.data = &irqflags;
>> -		pdevinfo.size_data = sizeof(irqflags);
>> -
>> -		adata->pdev = platform_device_register_full(&pdevinfo);
>> -		if (IS_ERR(adata->pdev)) {
>> -			dev_err(&pci->dev, "cannot register %s device\n",
>> -				pdevinfo.name);
>> -			ret = PTR_ERR(adata->pdev);
>> -			goto unmap_mmio;
>> +		i2s_pdata = devm_kzalloc(&pci->dev,
>> +				sizeof(struct i2s_platform_data) * ACP3x_DEVS,
>> +						GFP_KERNEL);
>> +		if (i2s_pdata == NULL) {
>> +			kfree(adata->res);
>> +			kfree(adata->cell);
>> +			return -ENOMEM;
>>   		}
>> +		adata->res[0].name	= "acp3x_i2s_iomem";
>> +		adata->res[0].flags	= IORESOURCE_MEM;
>> +		adata->res[0].start	= addr;
>> +		adata->res[0].end	= addr +
>> +			(ACP3x_REG_END - ACP3x_REG_START);
>> +		i2s_pdata[0].cap	= 0;
>> +		i2s_pdata[0].snd_rates	= SNDRV_PCM_RATE_8000_96000;
>> +
>> +		adata->res[1].name	= "acp3x_i2s_sp_play_cap";
>> +		adata->res[1].flags	= IORESOURCE_MEM;
>> +		adata->res[1].start	= addr + ACP3x_I2STDM_REG_START;
>> +		adata->res[1].end	= addr + ACP3x_I2STDM_REG_END;
>> +		i2s_pdata[1].cap	= 0;
>> +		i2s_pdata[1].snd_rates	= SNDRV_PCM_RATE_8000_96000;
>> +
>> +		adata->res[2].name	= "acp3x_i2s_bt_play_cap";
>> +		adata->res[2].flags	= IORESOURCE_MEM;
>> +		adata->res[2].start	= addr + ACP3x_BT_TDM_REG_START;
>> +		adata->res[2].end	= addr + ACP3x_BT_TDM_REG_END;
>> +		i2s_pdata[2].cap	= 0;
>> +		i2s_pdata[2].snd_rates	= SNDRV_PCM_RATE_8000_96000;
>> +
>> +		adata->res[3].name	= "acp3x_i2s_irq";
>> +		adata->res[3].flags	= IORESOURCE_IRQ;
>> +		adata->res[3].start	= pci->irq;
>> +		adata->res[3].end	= adata->res[3].start;
>> +
>> +		adata->acp3x_audio_mode	= ACP3x_I2S_MODE;
>> +
>> +		adata->cell[0].name	=	"acp3x_rv_i2s_dma";
>> +		adata->cell[0].num_resources	= 4;
>> +		adata->cell[0].resources	= &adata->res[0];
>> +		adata->cell[0].platform_data	= &irqflags;
>> +		adata->cell[0].pdata_size	= sizeof(irqflags);
>> +
>> +		adata->cell[1].name		= "acp3x_i2s_playcap";
>> +		adata->cell[1].num_resources	= 1;
>> +		adata->cell[1].resources	= &adata->res[1];
>> +		adata->cell[1].platform_data	= &i2s_pdata[0];
>> +		adata->cell[1].pdata_size	=
>> +				sizeof(struct i2s_platform_data);
>> +
>> +		adata->cell[2].name		= "acp3x_i2s_playcap";
>> +		adata->cell[2].num_resources	= 1;
>> +		adata->cell[2].resources	= &adata->res[2];
>> +		adata->cell[2].platform_data	= &i2s_pdata[1];
>> +		adata->cell[2].pdata_size	=
>> +				sizeof(struct i2s_platform_data);
>> +		r = mfd_add_hotplug_devices(adata->parent,
>> +					adata->cell, ACP3x_DEVS);
>>   		break;
>> -	default:
>> -		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
>> -		ret = -ENODEV;
>> -		goto unmap_mmio;
>>   	}
>>   	return 0;
>>   
>>   unmap_mmio:
>> +	mfd_remove_devices(adata->parent);
>> +	kfree(adata->res);
>> +	kfree(adata->cell);
>>   	iounmap(adata->acp3x_base);
>>   release_regions:
>>   	pci_release_regions(pci);
>> @@ -117,10 +159,8 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   static void snd_acp3x_remove(struct pci_dev *pci)
>>   {
>>   	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
>> -
>> -	platform_device_unregister(adata->pdev);
>> +	mfd_remove_devices(adata->parent);
>>   	iounmap(adata->acp3x_base);
>> -
>>   	pci_release_regions(pci);
>>   	pci_disable_device(pci);
>>   }
>> @@ -142,6 +182,7 @@ static struct pci_driver acp3x_driver  = {
>>   
>>   module_pci_driver(acp3x_driver);
>>   
>> +MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
>>   MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
>>   MODULE_DESCRIPTION("AMD ACP3x PCI driver");
>>   MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
