Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC635E5D7
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 15:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC84C16AD;
	Wed,  3 Jul 2019 15:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC84C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562162216;
	bh=09ER/FVdX7G+Se91f8mhftq5sZUm+Ao/Mjv5oR/cxoo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fe8os4r0gk8LfkNex1JZroDl0aYKntbko3hy38oewJVHScLxae4+Rk4uF9D/rFpVj
	 qasB4KJFNhzxypFSmuvaW3h30CFEYdEEnvPHh3wUQvvLc/dNowwTKRpTfzyzlXVM7a
	 LxOY29Xe6o0rG+cxQgvwL6O6/qgmBvIaNWoqUHJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DC4F800E8;
	Wed,  3 Jul 2019 15:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9C34F80058; Wed,  3 Jul 2019 15:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05513F80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 15:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05513F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Nj/gDrwa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63Dt5EO018724; Wed, 3 Jul 2019 08:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=L90T/GlgU1MaQGyAFE7vEL8Bp6VDhRgZMQRaYBA9ec4=;
 b=Nj/gDrwaFBX2pdJvGiLpjgRZAUioUtaCgRJYDcmTpJgiquleCI4TqvGwIi7lHBpTg6ZP
 Rax4PwyGhmj2PNloQLvCP9O+kWoFlsQTCmW3Jm818M8UcvaexmhGPHMcw2St3tWnxcqa
 v18GNO2MSplkvS0jTP6/pP+yAG98qUaIDR2wlnRKhOz2k0HDO6D1Cm0yYDqDJGD9FNz7
 JPk/wfi4kXvDo4DctmlUhbbLWecpKxnyucVqX61NRlSE2Il8FVx+7iYLTAiwyd0dCB8A
 v6K/SBaYEXO4IvvaujHShR+r1TqayrhWNyiXhmRrxFeuOyg+Aqy3wIqmrhqA00BxOqZk fQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=rf@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2te4dr6mnw-1;
 Wed, 03 Jul 2019 08:55:04 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 5DB74611C8BB;
 Wed,  3 Jul 2019 08:55:04 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 3 Jul
 2019 14:55:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 3 Jul 2019 14:55:03 +0100
Received: from [198.90.251.101] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.101])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 79B792A1;
 Wed,  3 Jul 2019 14:55:03 +0100 (BST)
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190703131842.26082-1-huangfq.daxian@gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <547c68b0-f55f-ca1d-c5b3-f6a5f89d93a9@opensource.cirrus.com>
Date: Wed, 3 Jul 2019 14:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190703131842.26082-1-huangfq.daxian@gmail.com>
Content-Language: en-US
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907030170
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 30/30] sound/soc: Use kmemdup rather than
 duplicating its implementation
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

On 03/07/19 14:18, Fuqian Huang wrote:
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memset, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>   sound/soc/codecs/wm0010.c             | 4 +---
>   sound/soc/intel/atom/sst/sst_loader.c | 3 +--

Should be one patch per file as the drivers are not related to each
other at all, and if one needed a revert you couldn't revert this
patch because it would revert both drivers.

But apart from that, for wm0010.c:
Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>

>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
> index 727d6703c905..807826f30f58 100644
> --- a/sound/soc/codecs/wm0010.c
> +++ b/sound/soc/codecs/wm0010.c
> @@ -515,7 +515,7 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
>   	dev_dbg(component->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
>   
>   	/* Copy to local buffer first as vmalloc causes problems for dma */
> -	img = kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
> +	img = kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
>   	if (!img) {
>   		ret = -ENOMEM;
>   		goto abort2;
> @@ -527,8 +527,6 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
>   		goto abort1;
>   	}
>   
> -	memcpy(img, &fw->data[0], fw->size);
> -
>   	spi_message_init(&m);
>   	memset(&t, 0, sizeof(t));
>   	t.rx_buf = out;
> diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
> index ce11c36848c4..cc95af35c060 100644
> --- a/sound/soc/intel/atom/sst/sst_loader.c
> +++ b/sound/soc/intel/atom/sst/sst_loader.c
> @@ -288,14 +288,13 @@ static int sst_cache_and_parse_fw(struct intel_sst_drv *sst,
>   {
>   	int retval = 0;
>   
> -	sst->fw_in_mem = kzalloc(fw->size, GFP_KERNEL);
> +	sst->fw_in_mem = kmemdup(fw->data, fw->size, GFP_KERNEL);
>   	if (!sst->fw_in_mem) {
>   		retval = -ENOMEM;
>   		goto end_release;
>   	}
>   	dev_dbg(sst->dev, "copied fw to %p", sst->fw_in_mem);
>   	dev_dbg(sst->dev, "phys: %lx", (unsigned long)virt_to_phys(sst->fw_in_mem));
> -	memcpy(sst->fw_in_mem, fw->data, fw->size);
>   	retval = sst_parse_fw_memcpy(sst, fw->size, &sst->memcpy_list);
>   	if (retval) {
>   		dev_err(sst->dev, "Failed to parse fw\n");
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
