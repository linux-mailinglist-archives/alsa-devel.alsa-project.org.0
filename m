Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918ED35A469
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 19:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4C8168A;
	Fri,  9 Apr 2021 19:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4C8168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617988330;
	bh=XBpopgYAV4W3UN0TQ2FQ1kzeoRwhphXbdma4w4cah74=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TuLJMMhpnJUtPFRj0T7rZa5tgWnuaLT3I/5f591ErEx8mhnNb+nzhytcaAJr5VHv0
	 KAiF8vGN3P5L0q4iz+ucpsfT75cBDJrt0wk+1kEtR4JOyy7WcLBIIoQ+GVA4ro3rQM
	 gTo79vWlFoK2j1jlZb2lCxxcXR039qmlwZ63UMgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB4DF80424;
	Fri,  9 Apr 2021 19:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D49BF8016D; Fri,  9 Apr 2021 09:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A831F80162
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 09:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A831F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="1RA8xsuj"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1397axb0012005; Fri, 9 Apr 2021 09:40:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n06VPaXv/86nkAfO+Ew799xc9jm8nPwhGU0C5uayBqo=;
 b=1RA8xsujC5lSSS18IpKAI7zlKhO5HqRRLX8P+prNVx+GAvyBdI36ADgSxKkowBZ2Q5xQ
 jNxeqn6AOotH1CcVFV75WwUIuUql3AAfEoglVH5/7Z5on6nkoTD9yVnWizPzIcjqalxq
 jNeX4ZfivWEJZSkZp0Ec/cX+Bw6y06TOr4FYQYXWI6kBJIUW4O+RIL/ed48ub4clXJrN
 iQAzLEiyvgDsagp4p6osTuHJAefJ4fug62DNG3kEK+AGC8H3Ipb7dhe0kExRyapZErzA
 N/c1iuY11Wxh35H+n1LPCDlldFVpGU/X0GxTGSPquR00mAowcyY21E3aU6NuVPcwC7Pp +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d8a3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:40:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB76210002A;
 Fri,  9 Apr 2021 09:40:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 584B721CA9E;
 Fri,  9 Apr 2021 09:40:56 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 09:40:55 +0200
Subject: Re: [PATCH -next] ASoC: sti: sti_uniperif: add missing
 MODULE_DEVICE_TABLE
To: Chen Lifu <chenlifu@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
References: <20210409015953.259688-1-chenlifu@huawei.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <228beb65-2cd3-f2fe-92c8-5a4d3c0a4d33@foss.st.com>
Date: Fri, 9 Apr 2021 09:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409015953.259688-1-chenlifu@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-08,
 2021-04-09 signatures=0
X-Mailman-Approved-At: Fri, 09 Apr 2021 19:09:35 +0200
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 4/9/21 3:59 AM, Chen Lifu wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  sound/soc/sti/sti_uniperif.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
> index 67315d9b352d..e3561f00ed40 100644
> --- a/sound/soc/sti/sti_uniperif.c
> +++ b/sound/soc/sti/sti_uniperif.c
> @@ -97,6 +97,7 @@ static const struct of_device_id snd_soc_sti_match[] = {
>  	},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, snd_soc_sti_match);
>  
>  int  sti_uniperiph_reset(struct uniperif *uni)
>  {
> 
