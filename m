Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0F5F76D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 13:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC9C16A0;
	Thu,  4 Jul 2019 13:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC9C16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562240966;
	bh=zVNd+2HKR5z9yTQzIGJCSOBVZ0NOYsUEDSLKQPG8j/Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvDN1ZzGL/JEZZh5s0WNZniZMjcYl5e4bDEoYGPkEJ8N/xW+jlM8rw7ws2m8xLk5S
	 9JStDoF69eICWk0dl/FSSupqLZqpvoR9yKLVlXAGHwOx1eeNxBaSDauu01OCMfklRr
	 M5rN9D7iqC22ksbh5SJ39DBFlXt7vACtmSbVOByc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3918F80058;
	Thu,  4 Jul 2019 13:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A368F80111; Thu,  4 Jul 2019 13:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1607F80058
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 13:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1607F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eXkaECc6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x64Bihlp001158; Thu, 4 Jul 2019 06:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=UBe5gEYsgoVbt9kCQpdyaOqDwTf0IJKa5gW28ba3xE8=;
 b=eXkaECc6iWCAHvLklGh40apXQVkI0QlN6Zc7c6JhlXWZHRzkZ34NOWwnsuuBXImXW/B5
 TXaJZXxYXnGJdf11vB/Rev7Wk1rZlv7Nvgw1sOZg37uD2KmkBr7csdL5kaUAlNFzdqrm
 +iZFisMqrTvxroHQ2AwPwYA32q4TUZQRC4T5qR7BieHGWILAwcO0U/j9LzGSYqFhA6Ej
 XFjIk45QovU1y7K/3qZSpJUl2r5KiMBqpm+OoeQqatZZ0aI2Ui6vEWKnwdqI/xYQ8jg1
 YKPPGU80xEyJxNvJrqqXuzD6n3bS/dl/5gNOuN92UXVpahv/Mp4RWIQxQEMxCyxeNRPc 6w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=rf@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2te5d4gqcp-1;
 Thu, 04 Jul 2019 06:47:31 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 67043611C8C1;
 Thu,  4 Jul 2019 06:47:30 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 4 Jul
 2019 12:47:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 4 Jul 2019 12:47:29 +0100
Received: from [198.90.251.101] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.101])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B261A45;
 Thu,  4 Jul 2019 12:47:29 +0100 (BST)
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190703163224.1029-1-huangfq.daxian@gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <52ee7351-19fc-4fd3-33f8-9392a4ad9526@opensource.cirrus.com>
Date: Thu, 4 Jul 2019 12:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190703163224.1029-1-huangfq.daxian@gmail.com>
Content-Language: en-US
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907040152
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 34/35] sound/soc/codecs: Use kmemdup
 rather than duplicating its implementation
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

Commit message title prefix should be "ASoC: wm0010:" not "sound/soc
/codecs:". Take a look at other patches to the same files.

> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.
> 
> Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v2:
>    - Fix a typo in commit message (memset -> memcpy)
>    - Split into two patches
> 
>   sound/soc/codecs/wm0010.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
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
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
