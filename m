Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F6615726
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 02:49:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04131688;
	Wed,  2 Nov 2022 02:48:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04131688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667353778;
	bh=QzoeAtXbhx8Oi6HE7UZKsLmYBkoAOe89ZzHkkCn7VVY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1GXejlRopaNw5FvNGVcHAJEIUnKR0eq4zFoywDsyuSxWeP/i5LGVU9XF6JCe2vyQ
	 bi0ya/MzMzxUXeVrqGFbUC15Z0u6UPKYN8niT+2D/BwCGv9YkUNGFceDeDqOKLmkh0
	 N6BFosWnQMPZIGLnCEkrpPs+uSmw1bAOxEPyCVwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4F1F80155;
	Wed,  2 Nov 2022 02:48:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E977F80155; Wed,  2 Nov 2022 02:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E10F0F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 02:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E10F0F80155
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N28ml074vzRnwR;
 Wed,  2 Nov 2022 09:43:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 09:48:32 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 09:48:31 +0800
Subject: Re: [PATCH] ASoC: Intel: avs: fix possible memory leak in
 probe_codec()
To: <alsa-devel@alsa-project.org>
References: <20221022025804.1221953-1-yangyingliang@huawei.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <9c364bc3-582d-c4ff-9aaf-deeddc30e57b@huawei.com>
Date: Wed, 2 Nov 2022 09:48:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221022025804.1221953-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: Takashi Iwai <tiwai@suse.de>, yangyingliang@huawei.com,
 cezary.rojewski@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

+Cc: Takashi Iwai <tiwai@suse.de>

Hi, is this patch good?

Thanks,
Yang
On 2022/10/22 10:58, Yang Yingliang wrote:
> If snd_hda_codec_configure() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling snd_hdac_device_unregister() and put_device(), so they
> can be freed in snd_hda_codec_dev_release() and kobject_cleanup().
>
> Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   sound/soc/intel/avs/core.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index bb0719c58ca4..2fde2b3f8790 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -140,6 +140,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
>   	ret = snd_hda_codec_configure(codec);
>   	if (ret < 0) {
>   		dev_err(bus->dev, "failed to config codec %d\n", ret);
> +		snd_hdac_device_unregister(&codec->core);
> +		put_device(&codec->core.dev);
>   		return ret;
>   	}
>   
