Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA6102495
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 13:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B457A168D;
	Tue, 19 Nov 2019 13:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B457A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574167079;
	bh=Jy8+LH6Tx6gCytU2thWssb/oluxRQ2QBS6VrsiZ0pgw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRRv4UR4irJI7tPkc2DzO9WQ5DP+UcIpPKQCKl314dpv/TASkPkNJ3wjRPXHfG1xa
	 JVjycYhdhtclzKgwIisiRfK/Td/8RuX2/hubU9mrz9vpLMyxa7EZ3GWtGPk56fjWBr
	 OTcsX9AKo8bE22h7vGRxU+1FWMwMds0Xnj+saOLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC55F80135;
	Tue, 19 Nov 2019 13:36:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B46AF80137; Tue, 19 Nov 2019 13:36:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF888F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF888F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="YluPSUBz"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJCOETM069076;
 Tue, 19 Nov 2019 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=G4C/OBGSQj6Rpmyhw8nXepKxoQaXDaP/8PfpPecSB/0=;
 b=YluPSUBzz9OC6CnxjhKqVI9CaznglJfLy214AKHilJej0LKEOorInwcOdXBG50mlgSMA
 8dZk0jMVboOGQHaIzmH8aioQLz83CsDjKUuopuM2ANxfL2to4OREl60NMzB9pM8iGDte
 jtZQdyZVSbxhNEe+x4mJPJM84acpop1idbV/uG/boHi+DP48Uh4LxXeO+R0nISQ+U307
 dgOJF4JOKFhmavef6n8nIQVKoJMJjT8s8JQz/SBYLDeLuIrBqW09kRxg2F7F0M8CG5qM
 i5qvwm41vNfl5h7tAnUy0GwDOCJPaW55rn7cZmxyFs2TEGggIwtmfJry2n3POoDX9zdE 2g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2wa92pph96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 12:36:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJCS6CG117679;
 Tue, 19 Nov 2019 12:36:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2wc09xapjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 12:36:04 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAJCZufY025862;
 Tue, 19 Nov 2019 12:35:57 GMT
Received: from kadam (/41.210.141.188) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 04:35:53 -0800
Date: Tue, 19 Nov 2019 15:35:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191119123531.GA30789@kadam>
References: <1574165476-24987-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190116
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I can't apply this because I'm not CC'd on patches 2-5.

On Tue, Nov 19, 2019 at 05:41:16PM +0530, Ravulapati Vishnu vardhan rao wrote:
> +static int acp3x_power_on(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout;
> +
> +	timeout = 0;
> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +
> +	if (val == 0)
> +		return val;
> +
> +	if (!((val & ACP_PGFSM_STATUS_MASK) ==
> +				ACP_POWER_ON_IN_PROGRESS))
> +		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout) {

while (++timeout < 500) 

> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
                   ^^
Extra space character.


> +		if (!val)
> +			break;

return 0;

> +		udelay(1);
> +		if (timeout > 500) {
> +			pr_err("ACP is Not Powered ON\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +	return 0;

Since we combined the ++timeout and the < 500 this becomes
"return -ETIMEOUT;" here.


> +}
> +
> +static int acp3x_power_off(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout, ret;

Both ret and timeout should just be int.  Please update this throughout.

> +
> +	timeout = 0;

Move the timeout = 0 next to the loop or put it in the initializer.

> +	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout) {

while (++timeout < 500) {

> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);

Extra space char.

> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF) {
> +			ret = 0;
> +			break;

return 0;

> +		}
> +		udelay(1);
> +		if (timeout > 500) {
> +			pr_err("ACP is Not Powered OFF\n");
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +static int acp3x_reset(void __iomem *acp3x_base)
> +{
> +	u32 val, timeout;
> +
> +	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
> +							timeout > 100) {

This timeout > 100 limit was difficult to spot.  Like finding Waldo.

> +			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
> +				break;

This is a duplicate condition.

> +			return -ENODEV;
> +		}
> +		cpu_relax();
> +	}
> +	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if (!val)
> +			break;
> +		if (timeout > 100)
> +			return -ENODEV;
> +		cpu_relax();
> +	}
> +	return 0;
> +}
> +
> +static int acp3x_init(void __iomem *acp3x_base)
> +{
> +	int ret;
> +
> +	/* power on */
> +	ret = acp3x_power_on(acp3x_base);
> +	if (ret) {
> +		pr_err("ACP3x power on failed\n");
> +		return ret;
> +	}
> +	/* Reset */
> +	ret = acp3x_reset(acp3x_base);
> +	if (ret) {
> +		pr_err("ACP3x reset failed\n");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int acp3x_deinit(void __iomem *acp3x_base)
> +{
> +	int ret;
> +
> +	/* Reset */
> +	ret = acp3x_reset(acp3x_base);
> +	if (ret) {
> +		pr_err("ACP3x reset failed\n");
> +		return ret;
> +	}
> +	/* power off */
> +	ret = acp3x_power_off(acp3x_base);
> +	if (ret) {
> +		pr_err("ACP3x power off failed\n");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>  static int snd_acp3x_probe(struct pci_dev *pci,
>  			   const struct pci_device_id *pci_id)
>  {
> @@ -64,6 +186,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  	}
>  	pci_set_master(pci);
>  	pci_set_drvdata(pci, adata);
> +	ret = acp3x_init(adata->acp3x_base);
> +	if (ret)
> +		goto disable_msi;
>  
>  	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
>  	switch (val) {
> @@ -73,7 +198,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  					  GFP_KERNEL);
>  		if (!adata->res) {
>  			ret = -ENOMEM;
> -			goto disable_msi;
> +			goto de_init;
>  		}
>  
>  		adata->res[0].name = "acp3x_i2s_iomem";
> @@ -134,12 +259,23 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  		ret = -ENODEV;
>  		goto disable_msi;
>  	}
> +	pm_runtime_set_autosuspend_delay(&pci->dev, 5000);
> +	pm_runtime_use_autosuspend(&pci->dev);
> +	pm_runtime_set_active(&pci->dev);
> +	pm_runtime_put_noidle(&pci->dev);
> +	pm_runtime_enable(&pci->dev);
>  	return 0;
>  
>  unregister_devs:
>  	if (val == I2S_MODE)
>  		for (i = 0 ; i < ACP3x_DEVS ; i++)
>  			platform_device_unregister(adata->pdev[i]);
> +de_init:
> +	ret = acp3x_deinit(adata->acp3x_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
> +	else
> +		dev_dbg(&pci->dev, "ACP de-initialized\n");


We can't overwrite ret (probe failed even if deinit() succeeded).  I
dont' know that the debug printk is useful.

de_init:
	if (acp3x_deinit(adata->acp3x_base))
		dev_err(&pci->dev, "ACP de-init failed in probe error handling\n");


>  disable_msi:
>  	pci_disable_msi(pci);
>  release_regions:
> @@ -150,15 +286,58 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  	return ret;
>  }
>  
> +static int  snd_acp3x_suspend(struct device *dev)
             ^^
Extra space char

> +{
> +	int status;

int ret;

> +	struct acp3x_dev_data *adata;
> +
> +	adata = dev_get_drvdata(dev);
> +	status = acp3x_deinit(adata->acp3x_base);
> +	if (status)
> +		dev_err(dev, "ACP de-init failed\n");
> +	else
> +		dev_dbg(dev, "ACP de-initialized\n");
> +
> +	return 0;
> +}
> +
> +static int  snd_acp3x_resume(struct device *dev)
             ^^
Extra space

> +{
> +	int status;
> +	struct acp3x_dev_data *adata;
> +
> +	adata = dev_get_drvdata(dev);
> +	status = acp3x_init(adata->acp3x_base);
> +	if (status) {
> +		dev_err(dev, "ACP init failed\n");
> +		return status;
> +	}
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops acp3x_pm = {
> +	.runtime_suspend = snd_acp3x_suspend,
> +	.runtime_resume =  snd_acp3x_resume,
> +	.resume =       snd_acp3x_resume,

Fix whitespace.

> +};
> +
>  static void snd_acp3x_remove(struct pci_dev *pci)
>  {
> -	struct acp3x_dev_data *adata = pci_get_drvdata(pci);

This was fine.  Leave it as-is.

> -	int i;
> +	struct acp3x_dev_data *adata;
> +	int i, ret;
>  
> +	adata = pci_get_drvdata(pci);
>  	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
>  		for (i = 0 ; i <  ACP3x_DEVS ; i++)
                                ^^
There is an extra space char here as well.  I guess I missed it when I
reviewed patch 1.

>  			platform_device_unregister(adata->pdev[i]);
>  	}
> +	ret = acp3x_deinit(adata->acp3x_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
> +	else
> +		dev_dbg(&pci->dev, "ACP de-initialized\n");

Put the printk in acp3x_deinit() itself and remove it from all the
callers.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
