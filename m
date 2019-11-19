Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C193C10250B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 13:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3563B168B;
	Tue, 19 Nov 2019 13:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3563B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574168377;
	bh=IZPWiH1ZbYAiS0ln3YQgBaZhdlVOdq2uC6vmYNKXC4s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kw/ib0E+0e/MgVs1X+OpeKWiPtG59e/CBLXXWKa+mBD6wkDAGIUYbrSUs9Gv0B0z1
	 98AIsqmb6f6JJtI59jp4Jy3EBJXubZToj+ekIIqvHxXRc2k9ecRWl1+lHhdM2xEhIv
	 IxscCSX9X5wwtGYxO1IOKVoe5FBabVInhBWSfG6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F521F80139;
	Tue, 19 Nov 2019 13:57:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CB52F80137; Tue, 19 Nov 2019 13:57:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB59F80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB59F80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="IAXFXz/C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmyiwgqPjRo1Ee/IwyVIV5dNvCbYLvhwbUHLXiVk7VkxJ8bdQ0xK0iwjLyH2DxMu7mTUhBTrPd4I09BUr76w4O2XaO+rotIYhhuZ5SqyCMGyj9j5NERlVUg84aMGNZBXWIKJPOdVrx++tn+/HSQ0rRro+9KHHKxNQeUQWyxIB49NAO8hKcpt4/1hsLB74UwnIVx9YZscy17wogF6EcZkkg1guimDWR8iWtgs23qajHffEZl/BqFlJ3Hjjihj6RqZ9v56JTKrLp2wRc05UtQkUMFLGN+nZyFHFugF3RONSApKdpeaFfmj+wVe0+rl5b7eEFJbjqnLefLooeYBAuR7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j72m/jIJuO6hQEhPm9A5ITEUc0S0NpJJAmyltWW27WI=;
 b=TS4bUUd3wla3wk/ETpi504lrLvoZXG5xnDvNNUZzeOPZkK0lBGtU8IqF+jy6w7LPalLO+NZwV70VXuCjASAxVqUz/OMRZdm+Tir4SSQn7tjaG9O2AknkYJ4AORnbBNYJUYHE1l3GqPGie6rzJo9dIhiZ6yyN9BR354KWeJTupBsABClWfaF792YLohU4PWY/PnJW3LcSMD877ULqmQBGRHDdaV3UHEpebWiizaTSWBU3p0yQSmrrSsEWyMBxThr0sZ4UvZ/8ecEwu55rJX5MzNpytV4z9wh/fdqhdpyba/dkUPqbEI5bFlBYjEJnBKBptsxVFO0dSNx9q+faQbMb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j72m/jIJuO6hQEhPm9A5ITEUc0S0NpJJAmyltWW27WI=;
 b=IAXFXz/CXSFF8NJamD9LGV9n1JgbQ0UYre3xlf+1NN417UJTXRrfa7FVRvVyVtWGowmlyTDUjOqdElTsPQ2GKVvifB8sdMeVh1LGAGbJixn1JI5Dk1WHDA8g1JU1knMmJOO9DAzpnJbk4FnRuAGVOOWVMEJmPbRxsfxPcMGNZgs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
Received: from CH2PR12MB3862.namprd12.prod.outlook.com (52.132.231.219) by
 CH2PR12MB4312.namprd12.prod.outlook.com (20.180.16.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 12:57:44 +0000
Received: from CH2PR12MB3862.namprd12.prod.outlook.com
 ([fe80::3d47:8737:20c4:1834]) by CH2PR12MB3862.namprd12.prod.outlook.com
 ([fe80::3d47:8737:20c4:1834%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 12:57:43 +0000
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574165476-24987-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191119123531.GA30789@kadam>
From: vishnu <vravulap@amd.com>
Message-ID: <3321478e-de8f-2eb6-6e6f-6eb621b8434b@amd.com>
Date: Tue, 19 Nov 2019 18:26:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20191119123531.GA30789@kadam>
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::29) To CH2PR12MB3862.namprd12.prod.outlook.com
 (2603:10b6:610:21::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 855cb2cc-8806-4545-0e69-08d76cf01148
X-MS-TrafficTypeDiagnostic: CH2PR12MB4312:|CH2PR12MB4312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4312038BAD01529D1C98C4C5E74C0@CH2PR12MB4312.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 022649CC2C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(199004)(189003)(23433003)(3846002)(6116002)(99286004)(316002)(229853002)(58126008)(76176011)(52116002)(53546011)(6506007)(386003)(2486003)(23676004)(54906003)(6636002)(230700001)(65806001)(66066001)(110136005)(31686004)(47776003)(478600001)(14444005)(4326008)(65956001)(66946007)(66476007)(66556008)(14454004)(31696002)(8936002)(6512007)(81166006)(8676002)(2906002)(81156014)(6486002)(50466002)(6436002)(6246003)(25786009)(7416002)(305945005)(7736002)(2616005)(476003)(446003)(11346002)(486006)(5660300002)(6666004)(36756003)(186003)(26005)(43062003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4312;
 H:CH2PR12MB3862.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbVC0DGV9KMCvmdheoV6+dx1VHicgyg3ljO3SOFPu80mK3RnjvnJvzq1+Ejw+T1gxH7bwa5bTq4onpFZSD/cZqgWFOc6fYx0/ohkSIw3+9rYYVXGJrHTx1imk+SPQ2cVulXsBK4l9T5lds6UgBjXfIiG+E2tTALXTlqgB9DHJG8uIqZM/qruGWyOS2bRGQjzQYXiN2aF4cjTF65OPF1M37pN1dW7+mMgZmYrtRhw1XgDAue6xYcPEMnVxnJSrCbvtaW7f/9s5eQVIulnjabxTSozYNRKFi1daY1NR+lYnhFW1cxWwItpYnNWoued/LEoWHXiaRQjDRWuaN/QTrGIfnMiXNPxtSdeReYD+UNdpZ/2QFQrpwGAs8UHLWAJHWJM1rHjTPT/OcaDRzA0z8tWTL4kTkFXYajXqAYuokngjJ3EudZTkwebywLgyMluHe46
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855cb2cc-8806-4545-0e69-08d76cf01148
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 12:57:43.8737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIf8qAukZYyItkdFlt9FJocxXn48Kr+PH1zuVIwUuI0CjQcWfMcLZKCdPSWoM0zb6pUa1SZqRC8x7kzu/FA8Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [RESEND PATCH v9 6/6] ASoC: amd: Added ACP3x
 system resume and runtime pm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 19/11/19 6:05 PM, Dan Carpenter wrote:
> I can't apply this because I'm not CC'd on patches 2-5.
> 
> On Tue, Nov 19, 2019 at 05:41:16PM +0530, Ravulapati Vishnu vardhan rao wrote:
>> +static int acp3x_power_on(void __iomem *acp3x_base)
>> +{
>> +	u32 val;
>> +	u32 timeout;
>> +
>> +	timeout = 0;
>> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
>> +
>> +	if (val == 0)
>> +		return val;
>> +
>> +	if (!((val & ACP_PGFSM_STATUS_MASK) ==
>> +				ACP_POWER_ON_IN_PROGRESS))
>> +		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
>> +			acp3x_base + mmACP_PGFSM_CONTROL);
>> +	while (++timeout) {
> 
> while (++timeout < 500)
> 

If I check with timeout<500 and in next condition i have
if(timeout >500) this never happens.

Our intention is to wait for time out and exit.

>> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
>                     ^^
> Extra space character.
> 
> 
>> +		if (!val)
>> +			break;
> 
> return 0;
> 
>> +		udelay(1);
>> +		if (timeout > 500) {
>> +			pr_err("ACP is Not Powered ON\n");
>> +			return -ETIMEDOUT;
>> +		}
>> +	}
>> +	return 0;
> 
> Since we combined the ++timeout and the < 500 this becomes
> "return -ETIMEOUT;" here.
> 
> 
>> +}
>> +
>> +static int acp3x_power_off(void __iomem *acp3x_base)
>> +{
>> +	u32 val;
>> +	u32 timeout, ret;
> 
> Both ret and timeout should just be int.  Please update this throughout.
> 
>> +
>> +	timeout = 0;
> 
> Move the timeout = 0 next to the loop or put it in the initializer.
> 
>> +	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
>> +			acp3x_base + mmACP_PGFSM_CONTROL);
>> +	while (++timeout) {
> 
> while (++timeout < 500) {
> 
>> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> 
> Extra space char.
> 
>> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF) {
>> +			ret = 0;
>> +			break;
> 
> return 0;
> 
>> +		}
>> +		udelay(1);
>> +		if (timeout > 500) {
>> +			pr_err("ACP is Not Powered OFF\n");
>> +			ret = -ETIMEDOUT;
>> +			break;
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>> +static int acp3x_reset(void __iomem *acp3x_base)
>> +{
>> +	u32 val, timeout;
>> +
>> +	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (++timeout) {
>> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
>> +		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
>> +							timeout > 100) {
> 
> This timeout > 100 limit was difficult to spot.  Like finding Waldo.
> 
>> +			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
>> +				break;
> 
> This is a duplicate condition.
> 
>> +			return -ENODEV;
>> +		}
>> +		cpu_relax();
>> +	}
>> +	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (++timeout) {
>> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
>> +		if (!val)
>> +			break;
>> +		if (timeout > 100)
>> +			return -ENODEV;
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
>> @@ -64,6 +186,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   	}
>>   	pci_set_master(pci);
>>   	pci_set_drvdata(pci, adata);
>> +	ret = acp3x_init(adata->acp3x_base);
>> +	if (ret)
>> +		goto disable_msi;
>>   
>>   	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
>>   	switch (val) {
>> @@ -73,7 +198,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   					  GFP_KERNEL);
>>   		if (!adata->res) {
>>   			ret = -ENOMEM;
>> -			goto disable_msi;
>> +			goto de_init;
>>   		}
>>   
>>   		adata->res[0].name = "acp3x_i2s_iomem";
>> @@ -134,12 +259,23 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   		ret = -ENODEV;
>>   		goto disable_msi;
>>   	}
>> +	pm_runtime_set_autosuspend_delay(&pci->dev, 5000);
>> +	pm_runtime_use_autosuspend(&pci->dev);
>> +	pm_runtime_set_active(&pci->dev);
>> +	pm_runtime_put_noidle(&pci->dev);
>> +	pm_runtime_enable(&pci->dev);
>>   	return 0;
>>   
>>   unregister_devs:
>>   	if (val == I2S_MODE)
>>   		for (i = 0 ; i < ACP3x_DEVS ; i++)
>>   			platform_device_unregister(adata->pdev[i]);
>> +de_init:
>> +	ret = acp3x_deinit(adata->acp3x_base);
>> +	if (ret)
>> +		dev_err(&pci->dev, "ACP de-init failed\n");
>> +	else
>> +		dev_dbg(&pci->dev, "ACP de-initialized\n");
> 
> 
> We can't overwrite ret (probe failed even if deinit() succeeded).  I
> dont' know that the debug printk is useful.
> 
> de_init:
> 	if (acp3x_deinit(adata->acp3x_base))
> 		dev_err(&pci->dev, "ACP de-init failed in probe error handling\n");
> 
> 
>>   disable_msi:
>>   	pci_disable_msi(pci);
>>   release_regions:
>> @@ -150,15 +286,58 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>>   	return ret;
>>   }
>>   
>> +static int  snd_acp3x_suspend(struct device *dev)
>               ^^
> Extra space char
> 
>> +{
>> +	int status;
> 
> int ret;
> 
>> +	struct acp3x_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	status = acp3x_deinit(adata->acp3x_base);
>> +	if (status)
>> +		dev_err(dev, "ACP de-init failed\n");
>> +	else
>> +		dev_dbg(dev, "ACP de-initialized\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int  snd_acp3x_resume(struct device *dev)
>               ^^
> Extra space
> 
>> +{
>> +	int status;
>> +	struct acp3x_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	status = acp3x_init(adata->acp3x_base);
>> +	if (status) {
>> +		dev_err(dev, "ACP init failed\n");
>> +		return status;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops acp3x_pm = {
>> +	.runtime_suspend = snd_acp3x_suspend,
>> +	.runtime_resume =  snd_acp3x_resume,
>> +	.resume =       snd_acp3x_resume,
> 
> Fix whitespace.
> 
>> +};
>> +
>>   static void snd_acp3x_remove(struct pci_dev *pci)
>>   {
>> -	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
> 
> This was fine.  Leave it as-is.
> 
>> -	int i;
>> +	struct acp3x_dev_data *adata;
>> +	int i, ret;
>>   
>> +	adata = pci_get_drvdata(pci);
>>   	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
>>   		for (i = 0 ; i <  ACP3x_DEVS ; i++)
>                                  ^^
> There is an extra space char here as well.  I guess I missed it when I
> reviewed patch 1.
> 
>>   			platform_device_unregister(adata->pdev[i]);
>>   	}
>> +	ret = acp3x_deinit(adata->acp3x_base);
>> +	if (ret)
>> +		dev_err(&pci->dev, "ACP de-init failed\n");
>> +	else
>> +		dev_dbg(&pci->dev, "ACP de-initialized\n");
> 
> Put the printk in acp3x_deinit() itself and remove it from all the
> callers.
> 
> regards,
> dan carpenter
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
