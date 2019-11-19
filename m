Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181171022C3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 12:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B16C1696;
	Tue, 19 Nov 2019 12:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B16C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574162196;
	bh=4xBfTZdU+PssfpSr9xBS/CzCXmeloNdzBP46XSGbF7g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L09E/LuGG1Tx8OYLQmcY/lhVdQHa9I9gILtY11JIHkEOf4WLTe/toKS3QuMtHDCuY
	 Seof9ecJgliXjW+pyWJuOEB0nFvYXW+Zs7WJ4l/PlBB+lyWP2fhwBWb3PwrFMHWHs2
	 0kLFSQqsMDe3CcC0xSyrsxJQYn+GaL7uwEiU0wr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40089F80137;
	Tue, 19 Nov 2019 12:14:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E25F80137; Tue, 19 Nov 2019 12:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FED9F80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 12:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FED9F80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Y7Jb/cKm"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJBEhmG012119;
 Tue, 19 Nov 2019 11:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=TLz55deBTOPUc26gtut2U7xNXx6/No2sxu52r3KcQXw=;
 b=Y7Jb/cKm91JDsBLQ39hghY2OTvQFWWRID7tegmXtpJheNKEYuhaRn9FIHqQbx8uggWcF
 ujMPiVEWOBY9wvd9P00pivq4Rft7H+AfRfG70K9yzaLH6MNQ5hqS2aB4D8Fjf6+iLSny
 Iss33Fcr54eF3D2J17CTHqmpdRzMd5/QwrRqVmvJIWobdikdi9/w9kS8L6Bz++CGwB8y
 bJ1pT0Q0eZQPhg2ZmOBX57hadTwxZSp8lF1kh3jlc7u6/LPyZTj59eYLmgJrOlYckZxI
 MME7oY/ZuV7a9oHRukpCK/9uQYBgnVa4PSOnrrxyVcn+KyOWFJd1V66kdmTBJoV3pWgU +A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2wa92pp519-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 11:14:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJBD33V191019;
 Tue, 19 Nov 2019 11:14:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2wcem8d5cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 11:14:43 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAJBEcJ1005137;
 Tue, 19 Nov 2019 11:14:38 GMT
Received: from kadam (/41.210.141.188) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 03:14:36 -0800
Date: Tue, 19 Nov 2019 14:14:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191119111424.GD5626@kadam>
References: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574155967-1315-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574155967-1315-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=591
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=660 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190106
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v8 1/6] ASoC: amd:Create multiple I2S
 platform device endpoint
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

On Tue, Nov 19, 2019 at 03:02:42PM +0530, Ravulapati Vishnu vardhan rao wrote:
>  static int snd_acp3x_probe(struct pci_dev *pci,
>  			   const struct pci_device_id *pci_id)
>  {
> -	int ret;
> -	u32 addr, val;
>  	struct acp3x_dev_data *adata;
> -	struct platform_device_info pdevinfo;
> +	struct platform_device_info pdevinfo[ACP3x_DEVS];
>  	unsigned int irqflags;
> +	int ret, val, i;

val should stay as u32.

> +	u32 addr;
>  
>  	if (pci_enable_device(pci)) {
>  		dev_err(&pci->dev, "pci_enable_device failed\n");
> @@ -43,7 +43,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  			     GFP_KERNEL);
>  	if (!adata) {
>  		ret = -ENOMEM;
> -		goto release_regions;
> +		goto adata_free;

Release regions was the correct label name because if you do the goto
then it will call release_regions().


>  	}
>  
>  	/* check for msi interrupt support */
> @@ -56,7 +56,8 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  		irqflags = 0;
>  
>  	addr = pci_resource_start(pci, 0);
> -	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
> +	adata->acp3x_base = devm_ioremap(&pci->dev, addr,
> +					pci_resource_len(pci, 0));
>  	if (!adata->acp3x_base) {
>  		ret = -ENOMEM;
>  		goto release_regions;
> @@ -68,11 +69,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  	switch (val) {
>  	case I2S_MODE:
>  		adata->res = devm_kzalloc(&pci->dev,
> -					  sizeof(struct resource) * 2,
> +					  sizeof(struct resource) * 4,
>  					  GFP_KERNEL);
>  		if (!adata->res) {
>  			ret = -ENOMEM;
> -			goto unmap_mmio;
> +			goto release_regions;
>  		}
>  
>  		adata->res[0].name = "acp3x_i2s_iomem";
> @@ -80,41 +81,68 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  		adata->res[0].start = addr;
>  		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
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
>  		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
>  
>  		memset(&pdevinfo, 0, sizeof(pdevinfo));
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
> +			if (IS_ERR(adata->pdev[i])) {
> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[i].name);
> +				ret = PTR_ERR(adata->pdev[i]);
> +				goto unmap_mmio;
> +			}
>  		}
>  		break;
>  	default:
>  		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
>  		ret = -ENODEV;
> -		goto unmap_mmio;
> +		goto release_regions;
>  	}
>  	return 0;
>  
>  unmap_mmio:
> -	pci_disable_msi(pci);
> -	iounmap(adata->acp3x_base);
> +	if (val == I2S_MODE)
> +		for (i = 0 ; i < ACP3x_DEVS ; i++)
> +			platform_device_unregister(adata->pdev[i]);

This label used to unmap, but now we're using devm_ so it doesn't any
more.  Change it to unregister_devices or something.

>  release_regions:
> +	pci_disable_msi(pci);

This should be "disable_msi" or something.

> +adata_free:
>  	pci_release_regions(pci);

release_regions:

>  disable_pci:
>  	pci_disable_device(pci);

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
