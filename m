Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F63FDE78
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:58:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23B61668;
	Fri, 15 Nov 2019 13:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23B61668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573822731;
	bh=4cWNDtOwB/QcSkb0jas8fFhBcf5EpJaSNQipOiQLCTk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om2Wd567+Qo1ysJzgRQlTBf1LBnexGVRnS8adBS/MTEv3YjwYhEu6Qup8zZdoc47P
	 qKa8mnLrPeH/AG+8HBaoaY9mFU01N3TdHM8C3eY/o66kaZmpggVw5Tvkr8tvFe5/4m
	 d/48LFkmyA3i99d6bES2+U9RrjgYlWkV3mhATRGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F113FF80106;
	Fri, 15 Nov 2019 13:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB0F1F80104; Fri, 15 Nov 2019 13:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB75F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB75F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KEkGXAuv"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAFCrvMU171878;
 Fri, 15 Nov 2019 12:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=mjgjA83UH1LV91jlNw8j7ztgT04qqDA9+bGjH5HQNqw=;
 b=KEkGXAuvjTTI64JdS5zACzkZi+Qn37DgV6bhmrl3XMwiJcQ5c/QYG/V1duy8E5aW7y4T
 uqIUDQvVPNuWWmOfH4Sg7typejG0RQ3WPpgPEnjLt+8jpeNSdVghIlkeDe8qbKCcc/Ic
 iDuPWqryfxSiAmhPDF25sQyC850JJkG295MbfjjOrE+zWEYp+NFYYdX0Ycp1t3fUOZsR
 lx/W1oE1Ne/Y5pEGkncpFPzx4YdBrkVcu9oXBraq/2PumPMvP5Cra2O6IuB0b25RtT9q
 VgEalTLkdgDRvW7WOLudPGshT9u7lSrtgLcozROkuYEVP8dA40PkbV+091NaJs2dyfwe PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2w9gxpk437-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 12:56:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAFCs8lJ072821;
 Fri, 15 Nov 2019 12:56:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2w9h17ygs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 12:56:58 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAFCuqNO006689;
 Fri, 15 Nov 2019 12:56:53 GMT
Received: from kadam.lan (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Nov 2019 04:56:52 -0800
Date: Fri, 15 Nov 2019 15:56:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191115125642.GK19079@kadam.lan>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573819823-23731-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573819823-23731-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911150119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911150119
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v6 1/6] ASoC: amd:Create multiple I2S
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

I'm sorry but the probe error handling is totally broken.  It has a
bunch of double frees.  Here is how it should work:

On Fri, Nov 15, 2019 at 05:40:18PM +0530, Ravulapati Vishnu vardhan rao wrote:
>  static int snd_acp3x_probe(struct pci_dev *pci,
>  			   const struct pci_device_id *pci_id)
>  {
> -	int ret;
> -	u32 addr, val;
>  	struct acp3x_dev_data *adata;
> -	struct platform_device_info pdevinfo;
> +	struct platform_device_info pdevinfo[ACP3x_DEVS];
>  	unsigned int irqflags;
> +	int ret;
> +	u32 addr, val, i;

Make i an int.  Loop iterators should be int unless we are going to
loop more than INT_MAX times (which hopefully is seldom in the kernel).

>  
>  	if (pci_enable_device(pci)) {

Ideally this should preserve the error code from pci_enable_device().

	ret = pci_enable_device(pci);
	if (ret)
		return ret;

But 1) you didn't introduce this.  2) This code is basically fine.
This is the first resource allocation so there is no error handling, we
just return ret.  But after this the most recently allocated resource is
'pci enable' if we hit an error now we will want to do
"goto err_pci_disable;"

>  		dev_err(&pci->dev, "pci_enable_device failed\n");
> @@ -43,7 +43,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,

There is a bit where we request regions so now that's the most recent
resource.

>  			     GFP_KERNEL);
>  	if (!adata) {
>  		ret = -ENOMEM;
> -		goto release_regions;
> +		goto adata_free;

We failed to allocate "adata" so we have to release the most recent
resource "goto err_release_regions;".  "adata" is allocated with
devm_kzalloc() so it gets freed automatically after probe().  If we
free it ourselves with kfree() that will lead to a double free.  So
let's remember requet regions still as our most recent allocation.


>  	}
>  
>  	/* check for msi interrupt support */
> @@ -68,11 +68,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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


unmap_mmio is still the most recent so the labal was correct.  The
advantage of this style of error handling is that when we add new
allocations, we don't have to change a lot of labels.  adata->res uses
devm_kzalloc() again so we keep unmap_mmio in our head as the most
recent allocation.

>  		}
>  
>  		adata->res[0].name = "acp3x_i2s_iomem";
> @@ -80,28 +80,52 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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

Loops are a bit complicated.  What we do is if we allocate more than one
thing inside the loop, then we free until the start of the most recent
iteration:
		for (i = 0; i < end; i++) {
			foo->a = alloc();
			if (!foo->a)
				goto unwind_loop;
			foo->b = alloc();
			if (!foo->b) {
				free(foo->a);
				goto unwind_loop;
			}
			foo->c = alloc();
			if (!foo->c) {
				free(foo->b);
				free(foo->a);
				goto unwind_loop;
			}
		}

But this loop only allocates one thing so it's fine.  We can just
goto unwind_loop;

>  		}
>  		break;
>  	default:
> @@ -112,10 +136,22 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  	return 0;
>  

Then at the end it looks like:

   136          return 0;
   137  
   138  unwind_loop:
   139          if (val == I2S_MODE) {
   140                  while (--i >= 0)
   141                          platform_device_unregister(adata->pdev[i]);
   142          }
   143  unmap_mmio:
   144          iounmap(adata->acp3x_base);
   145  disable_msi:
   146          pci_disable_msi(pci);
   147  release_regions:
   148          pci_release_regions(pci);
   149  disable_pci:
   150          pci_disable_device(pci);
   151  
   152          return ret;
   153  }

Note, that I have an if (val == I2S_MODE).  It's not required but the
unwind code should be a mirror image of the allocation code and it's
better for future proofing.

Also if "i" is unsigned this error handling will break.  We see that
bug with unsigned loop iterators pretty frequently.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
