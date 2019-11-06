Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0CF180D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:13:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D143E169B;
	Wed,  6 Nov 2019 15:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D143E169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573049621;
	bh=zCf8HlTw/maKB3NXXUzr6hMUdRPGR6Pd9Rjq/2U83Sw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPKi/JFruWKdUGyA28h6U3VS6zb5XdB6c5wZrXTDwERH1Ts/I5EiCJrVS4UPokx1J
	 iF7Ehn+PB8hKbksIE3jMJ6ajzXS47iNZKpbD7HhkhpRw2hqGozEG/TEQQXtZzmEiF1
	 NXu6GPZyCH48aNRE8Nk0xGhxpyq31Tl3j1zu+HrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D98BF80321;
	Wed,  6 Nov 2019 15:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA70F803D0; Wed,  6 Nov 2019 15:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 522EAF8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 522EAF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="NmV/qBHf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb3q5+ZXtsbEowFkJoJ1hEj55bniFolDO3tV1UJGRsNtv61wVnZZamFtGTbU9meemA1c/0OKCD4crkNR1Cwy2iQ0HItXZFHES0vegi1f4mmx7qJGLZvKaBmh2g7i0w1j0NeYvm50paBKCQ4XhsOLdWwMCm7OaS4myRJFvRTAQaWQp6Zjv/Gty21RVnNa0WKoz3eCM0eeoalFZbKSUlB8jzTkBIZhMX+UiJR/cWZJIyUVM2mPf8Xc4nJlp1KuPjNa2mcUWj/q0RyUMVnGP2uHEx4ff+qDEIiax8Z2gWuIL0ahsghJ2MyEMNo6Z724ZN4F0gZeKlZqJ8Z1L+FFwaE1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp9kQEDYX0SpxpQtWF2qtsG7fcRv5YICmBbHD7Ksilg=;
 b=QXb4zRskAR4olGjqbD0t/SaiqvgQCVsriCgKXuUdFC+9yAEPdNauwqhotMwdsVwJQaGJDOU0/5uMACWa+UucbXODppa2wDzv6xsZpLdT2rrv6l02f+NWh65Y7aJ9VB3z+eLL8QbH8x3KEW9YWyUOsrt6SSUPP8z+QYXVtsCc/OEn87nzKQ+DnZ7d+MnpaDy4cpZhpBr3KAXGlOfZ3GVqlW056HMJmcDQjGyvJ6EnLyjN+fhA+WPFle71BV0br1604CNBLaKjmA+iwcPm0kGQisHo/0KvjZdeVDyOcSpYteD/orju+1PBKCDWWa1bPNjlt4hIjp9qMnyoltCRaJwezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp9kQEDYX0SpxpQtWF2qtsG7fcRv5YICmBbHD7Ksilg=;
 b=NmV/qBHfUJhb0LvOpc6Rj/1dGGO2StHbZCnB2RLauFfVEGUVzfFucFEjlBht1oicza2FR0XbYMhZpRDvB7UwAq9D/1gRQW0XLDh1IJqPYftZ+lk8851GC/1yf61OWJmv2XGKmXqd4amS2gF0PlnzEhWACPVzGNF35+Z12KB25iw=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB4235.namprd12.prod.outlook.com (10.141.8.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 14:11:47 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843%5]) with mapi id 15.20.2430.020; Wed, 6 Nov 2019
 14:11:47 +0000
From: vishnu <vravulap@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 6/7] ASoC: amd: ACP powergating should be done by
 controller
Thread-Index: AQHVhZzSniHALHuA0kOzcVkkYwwFe6dgNVMAgB7N+QA=
Date: Wed, 6 Nov 2019 14:11:46 +0000
Message-ID: <37667547-5b85-be25-df5d-39431b4b287a@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191018103910.GL21344@kadam>
In-Reply-To: <20191018103910.GL21344@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::22) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d017786f-d7e4-483e-d06e-08d762c34245
x-ms-traffictypediagnostic: DM6PR12MB4235:|DM6PR12MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4235C5617684B32011D19365E7790@DM6PR12MB4235.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(199004)(189003)(99286004)(81156014)(81166006)(8676002)(316002)(8936002)(2906002)(110136005)(54906003)(3846002)(6116002)(36756003)(25786009)(478600001)(14454004)(26005)(102836004)(66066001)(386003)(486006)(53546011)(6506007)(31696002)(2616005)(476003)(446003)(11346002)(7736002)(229853002)(71200400001)(71190400001)(256004)(6636002)(186003)(52116002)(305945005)(76176011)(6486002)(5660300002)(64756008)(66476007)(66556008)(66446008)(66946007)(31686004)(6512007)(4326008)(6246003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4235;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZuC2hf0/7Vlf9ilKB8Ikhrkzk+Mx/OK4v+0+5gQgY2capj3dIT8GdUQ9DSLN2rOi+afCBApzdDNCb1LVc6BLiBbVcpOv6eZD4NYiN7aqcDvWPe/A/3s2hkgeg9f2qULcGc31/2MPcm1o8iyfI8mO7noEMGf9Hw9rqQn2R14jEXqB+m1yFuUi+aJckBA3wTA0Ae3ohpbUsG3HsH+SnbWYtQudcq558iANQ5fPHnEXwHZ91rvHd5dtIXyRLj3smf4+1/L2ITcGOyPHqbPFYEvxAEhNax7Y00z1Z1aYtGPUW8RCOPAYn9E99Vmlpu0Ewr6jNxAp4c4A4xGK/25APsD5fuaIC2u1Ps4DUW0uERuJtyKfPII2fb1TyBJOTtMlMJFLGVtP5TeZzl0xkNl0hb4aXAqoqx7mKzJiN5z/B67EwpiKpPXECwMsTWoCodUc+zNo
Content-ID: <1E6B0AC370004A4895113F3306285261@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d017786f-d7e4-483e-d06e-08d762c34245
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 14:11:47.0018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VuqRM8nqN1X5Ax3LMdxi6TTUyc98aIQMO8OCZPHVc2ooVOq39mtE45xNZ7acdBITThlmqLtOP2OSSmLQd9C07Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mehta,
 Sanju" <Sanju.Mehta@amd.com>, Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 6/7] ASoC: amd: ACP powergating should be
 done by controller
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



On 18/10/19 4:09 PM, Dan Carpenter wrote:
> On Sat, Oct 19, 2019 at 02:35:44AM +0530, Ravulapati Vishnu vardhan rao wrote:
>> diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
>> index 7f435b3..b74ecf6 100644
>> --- a/sound/soc/amd/raven/pci-acp3x.c
>> +++ b/sound/soc/amd/raven/pci-acp3x.c
>> @@ -19,11 +19,140 @@ struct acp3x_dev_data {
>>   	struct platform_device *pdev[ACP3x_DEVS];
>>   };
>>   
>> +static int acp3x_power_on(void __iomem *acp3x_base)
>> +{
>> +	u32 val;
>> +	u32 timeout = 0;
>> +	int ret = 0;
>> +
>> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
>> +	if (val) {
> 
> Just flip this around.
Will address this thanks.
> 
> 	if (val == 0)
> 		return 0;
> 
>> +		if (!((val & ACP_PGFSM_STATUS_MASK) ==
>> +				ACP_POWER_ON_IN_PROGRESS))
>> +			rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
>> +				acp3x_base + mmACP_PGFSM_CONTROL);
>> +		while (true) {
> 
> while (++timeout < 500) {
> 
> 
>> +			val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
>> +			if (!val)
>> +				break;
> 
> return 0;
> 
>> +			udelay(1);
>> +			if (timeout > 500) {
>> +				pr_err("ACP is Not Powered ON\n");
>> +				ret = -ETIMEDOUT;
>> +				break;
>> +			}
>> +			timeout++;
>> +		}
>> +		if (ret) {
>> +			pr_err("ACP is not powered on status:%d\n", ret);
> 
> Just one error message is enough.
Will address this thanks.
> 
> 	pr_err("ACP is Not Powered ON\n");
> 	return -ETIMEDOUT;
> 
> 
>> +			return ret;
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>> +static int acp3x_power_off(void __iomem *acp3x_base)
>> +{
>> +	u32 val;
>> +	u32 timeout = 0;
>> +	int ret = 0;
>> +
>> +	val = rv_readl(acp3x_base + mmACP_PGFSM_CONTROL);
> 
> val is not used.  We want to turn on set but not used warnings
> eventually.
> 
Will address this thanks.
>> +	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
>> +			acp3x_base + mmACP_PGFSM_CONTROL);
>> +	while (true) {
>> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
>> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
>> +			break;
>> +		udelay(1);
>> +		if (timeout > 500) {
>> +			pr_err("ACP is Not Powered OFF\n");
>> +			ret = -ETIMEDOUT;
>> +			break;
>> +		}
>> +		timeout++;
>> +	}
>> +	if (ret)
>> +		pr_err("ACP is not powered off status:%d\n", ret);
>> +	return ret;
> 
> Same as above.
> 
Will address this thanks.
>> +}
>> +
>> +
>> +static int acp3x_reset(void __iomem *acp3x_base)
>> +{
>> +	u32 val, timeout;
>> +
>> +	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (true) {
> 
> 	while (++timeout < 100) {
> 
>> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
>> +		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
>> +							timeout > 100) {
>> +			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
>> +				break;
> 
> 
> Duplicated needlessly.
Actually have the sequence like that.
First we have to set mmACP_SOFT_RESET with 1 then we need to check its 
effect from reading same register and wait till timeout if error occurs 
and then immediatly we need to reset with 0 and read the reset register 
if it is not reset we will wait till timeout and exit with error.

Will address this by changing the duplication code thanks.
> 
>> +			return -ENODEV;
>> +		}
>> +		timeout++;
>> +		cpu_relax();
>> +	}
> 
> 
> 	if (timeout == 100)
> 		return -ENODEV;
> 
>> +	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (true) {
>> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> 
> Split the "if (!val) break;" into it's own condition instead of part of
> the ||.
> 
Will address this thanks.
>> +		if (!val || timeout > 100) {
>> +			if (!val)
>> +				break;
>> +			return -ENODEV;
>> +		}
>> +		timeout++;
>> +		cpu_relax();
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int acp3x_init(void __iomem *acp3x_base)
>> +{
>> +	int ret;
>> +
>> +	/* power on */
>> +	ret = acp3x_power_on(acp3x_base);
>> +	if (ret) {
>> +		pr_err("ACP3x power on failed\n");
>> +		return ret;
>> +	}
>> +	/* Reset */
>> +	ret = acp3x_reset(acp3x_base);
>> +	if (ret) {
>> +		pr_err("ACP3x reset failed\n");
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int acp3x_deinit(void __iomem *acp3x_base)
>> +{
>> +	int ret;
>> +
>> +	/* Reset */
>> +	ret = acp3x_reset(acp3x_base);
>> +	if (ret) {
>> +		pr_err("ACP3x reset failed\n");
>> +		return ret;
>> +	}
>> +	/* power off */
>> +	ret = acp3x_power_off(acp3x_base);
>> +	if (ret) {
>> +		pr_err("ACP3x power off failed\n");
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>>   static int snd_acp3x_probe(struct pci_dev *pci,
>>   			   const struct pci_device_id *pci_id)
>>   {
>>   	int ret;
>> -	u32 addr, val, i;
>> +	u32 addr, val, i, status;
>>   	struct acp3x_dev_data *adata;
>>   	struct platform_device_info pdevinfo[ACP3x_DEVS];
>>   	unsigned int irqflags;
>> @@ -63,6 +192,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   	}
>>   	pci_set_master(pci);
>>   	pci_set_drvdata(pci, adata);
>> +	status = acp3x_init(adata->acp3x_base);
>> +	if (status)
>> +		return -ENODEV;
> 
> Why do we need both "status" and "ret".  Preserve the error code?
> 
Will address this thanks.
>> +
>>   
>>   	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
>>   	switch (val) {
>> @@ -132,6 +265,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   	return 0;
>>   
>>   unmap_mmio:
>> +	status = acp3x_deinit(adata->acp3x_base);
>> +	if (status)
>> +		dev_err(&pci->dev, "ACP de-init failed\n");
>> +	else
>> +		dev_info(&pci->dev, "ACP de-initialized\n");
>>   	for (i = 0 ; i < ACP3x_DEVS ; i++)
>>   		platform_device_unregister(adata->pdev[i]);
>>   	kfree(adata->res);
>> @@ -153,6 +291,11 @@ static void snd_acp3x_remove(struct pci_dev *pci)
>>   		for (i = 0 ; i <  ACP3x_DEVS ; i++)
>>   			platform_device_unregister(adata->pdev[i]);
>>   	}
>> +	i = acp3x_deinit(adata->acp3x_base);
> 
> Please don't re-use "i" like this.  Declare "ret" or "status" or
> something.
> 
Will address this thanks.
>> +	if (i)
>> +		dev_err(&pci->dev, "ACP de-init failed\n");
>> +	else
>> +		dev_info(&pci->dev, "ACP de-initialized\n");
>>   	iounmap(adata->acp3x_base);
>>   
>>   	pci_disable_msi(pci);
> 
> regards,
> dan carpenter
> 
Regards,
Vishnu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
