Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8C1BB89E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD30168E;
	Tue, 28 Apr 2020 10:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD30168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588061685;
	bh=A9BZX0G/ULzOVi6RQnmBm5JmbhPSEdIEOTBL9MHeLls=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBdh49E8NmPe9oXX+9OvA//sU+Gg6F5P7y/CCye1/v2RmOCJTNnUNqXf9Tevt2fL4
	 xUcMSEwALcRDd1Kh1L+wZxcLL/70QE1OU1iq4SqVIgqUTGCb+d6bS7f7j/5+zzX2o+
	 zRK3teVNhaOBnh2TmOmkx9UpmYchCPCbL3mH8NzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 702C0F801DB;
	Tue, 28 Apr 2020 10:13:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE294F801DB; Tue, 28 Apr 2020 10:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD63AF800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD63AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OCWnPWOj"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03S8CpPF056069;
 Tue, 28 Apr 2020 03:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588061571;
 bh=3xjMu9onpulA2kur4sqLpTmL4sNgAay/v4viJL4Tx4s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OCWnPWOjttsHUNxX57fKwHivjGFuY6igEVvRBP9h0uMk5SZ7A2DIAKtt7daZZMD84
 gYBXiLNm/jfB1i7aRprHnHrSlG2YHkDba0v01kEX7kv4ZaBIzB3nmTZLrNJffmKCYD
 wXgFQRc8Mrk4Aa+68GcFX5Os7fWolGr0IXcU3PlE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S8CoG7009430;
 Tue, 28 Apr 2020 03:12:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 03:12:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 03:12:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S8Cljp056226;
 Tue, 28 Apr 2020 03:12:48 -0500
Subject: Re: [PATCH] ASoC: davinci-mcasp: Fix dma_chan refcnt leak when
 getting dma type
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
References: <1587818916-38730-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <a64cfa62-c377-b516-7386-23340e532285@ti.com>
Date: Tue, 28 Apr 2020 11:13:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1587818916-38730-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu
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



On 25/04/2020 15.48, Xiyu Yang wrote:
> davinci_mcasp_get_dma_type() invokes dma_request_chan(), which returns a
> reference of the specified dma_chan object to "chan" with increased
> refcnt.
> 
> When davinci_mcasp_get_dma_type() returns, local variable "chan" becomes
> invalid, so the refcount should be decreased to keep refcount balanced.
> 
> The reference counting issue happens in one exception handling path of
> davinci_mcasp_get_dma_type(). When chan device is NULL, the function
> forgets to decrease the refcnt increased by dma_request_chan(), causing
> a refcnt leak.
> 
> Fix this issue by calling dma_release_channel() when chan device is
> NULL.
> 
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 734ffe925c4d..7a7db743dc5b 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1896,8 +1896,10 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
>  				PTR_ERR(chan));
>  		return PTR_ERR(chan);
>  	}
> -	if (WARN_ON(!chan->device || !chan->device->dev))
> +	if (WARN_ON(!chan->device || !chan->device->dev)) {
> +		dma_release_channel(chan);
>  		return -EINVAL;
> +	}

If we get a channel then chan->device and chan->device->dev never NULL,
it can not be.
I think the reason why this is here is that static checkers tends to
scream at us.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>  
>  	if (chan->device->dev->of_node)
>  		ret = of_property_read_string(chan->device->dev->of_node,
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
