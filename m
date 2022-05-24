Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12E532C36
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 16:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E20316FC;
	Tue, 24 May 2022 16:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E20316FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653402706;
	bh=7fADz8AmHzNbpdncnvsAABI9fXMHsyB7Fb1+kIL2EKs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRzELn//5+PoiWk2/TVwfPw0ueHu1kl+fuQzTrFTBMI6kZLBdXgCPO/df4Yz+CZDh
	 gzVgYkuiudcNZ8aasSe+9EyQPPrrSpTH0XYm9zDqgFxWX2CFEei8vX/0JHg3QpArmT
	 oq1SWFsvhYZzGy9FbLdamXdKB9shsk9UMo7G0VB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA535F80100;
	Tue, 24 May 2022 16:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A01BF80100; Tue, 24 May 2022 16:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE360F80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 16:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE360F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="5vp8d10b"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OD9lI2006610;
 Tue, 24 May 2022 16:30:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AQKsEZBpRPgvOP9pH7S/TD4toEUBrB462VVqfLm/lIg=;
 b=5vp8d10b91pQwCDM64drMqKGwHc5+FDSrh6uBPoLyCI0i42OlptsPwe+5J9lyYa8Dk1h
 GpVs+BkZVx4v3eb7QAELGQebfGvN8ZoiY+dP24PwjD2PlmtUmSEu4ZCOfdsdr+pxISC/
 TkPctLdGreD7CSfD9skaBTsCvrrNpTZz4x8wOziWNBjFI8aVY7VTT1Bne02vOcb593mF
 +3MxGBBbnchvs9YXFg5RKF+Mx/vtkCxedo+0cF/vWd0jmdGgMk74zEivMo7Xy3DZ4rdy
 vnT8pn7p10xwjQzcbkLlvC/SKsFcYGcI9AHKy5YpRvtdziEGpArWDaZgKMO+Yn6RenCf aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6rv6rfhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 16:30:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A8C110002A;
 Tue, 24 May 2022 16:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08D1323152E;
 Tue, 24 May 2022 16:30:40 +0200 (CEST)
Received: from [10.211.10.185] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 24 May
 2022 16:30:39 +0200
Message-ID: <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
Date: Tue, 24 May 2022 16:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ASoC: stm32: sai: Use of_device_get_match_data()
 tosimplify code
Content-Language: en-US
To: tangbin <tangbin@cmss.chinamobile.com>, Mark Brown <broonie@kernel.org>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
 <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_07,2022-05-23_01,2022-02-23_01
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Hi Tang,

On 5/24/22 03:44, tangbin wrote:
> Hi Mark & Olivier：
> 
> On 2022/5/24 2:57, Mark Brown wrote:
>> On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:
>>
>>> The current patch requires a change in the driver.
>>> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
>>> For instance:
>>> struct stm32_sai_comp_data {
>>>     unsigned int id;
>>> }
>>> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
>>>     .id = STM_SAI_A_ID;
>>> }
>>> struct of_device_id stm32_sai_sub_ids[] = {
>>>     .data = &stm32_sai_comp_data_a},
>>> }
>> Either approach works for me (or a revert for that matter).
> 
>      Thanks for your advice, I was thoughtless.
> 
>      I think change the date of STM_SAI_x_ID maybe simple. But if we 
> don't change the id,
> 
> what about add a "#define" like the line 47:
> 
> #define STM_SAI_IS_SUB(x) ((x)->id == STM_SAI_A_ID || (x)->id == 
> STM_SAI_B_ID)
> 
> then in the judgement, wu use:
> 
>      sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);
> 
>      if (!STM_SAI_IS_SUB(sai))
> 
>              return -EINVAL;
> 
> 
> if you think that's ok, I will send patch v2 for you .
> 

If we allow null value in STM_SAI_IS_SUB(sai) check, we can miss real 
NULL pointer error from of_device_get_match_data().

The simplest way is to change STM_SAI_x_ID enums I think.
But honnestly, I feel more comfortable to let the driver unchanged.

BRs
Olivier

> Thanks
> 
> Tang Bin
> 
> 
