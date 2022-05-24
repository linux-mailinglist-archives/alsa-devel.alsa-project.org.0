Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B1C532056
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 03:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 258141711;
	Tue, 24 May 2022 03:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 258141711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653356695;
	bh=XiaYsLurM9WQWXCt7I8btl9NhHIChxoEFcXVSL/SFPI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ih/zwN+rJojDRB0o+W/Bx2PM5SwE4JaM1XzJ6Bkw2n2572GU+VUAxjFvabJhpwBqQ
	 AGZ3GlOR00HIZq/PIfV43xnGNecsZ+0T+UNRNMoEayKBdmhoHxvyVzZbLv33pz49eX
	 4eRP8b4rHaKhaSCa9hePgj2/TPDYdt+NVRdqARN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 849F5F804D6;
	Tue, 24 May 2022 03:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA86F804D1; Tue, 24 May 2022 03:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by alsa1.perex.cz (Postfix) with ESMTP id 32254F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 03:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32254F800E3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.89])
 by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee8628c384d905-e977c;
 Tue, 24 May 2022 09:43:43 +0800 (CST)
X-RM-TRANSID: 2ee8628c384d905-e977c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.26.114] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvrnew05-12026 (RichMail) with SMTP id 2efa628c384394f-9b02a; 
 Tue, 24 May 2022 09:43:42 +0800 (CST)
X-RM-TRANSID: 2efa628c384394f-9b02a
Subject: Re: [PATCH] ASoC: stm32: sai: Use of_device_get_match_data()
 tosimplify code
To: Mark Brown <broonie@kernel.org>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
Date: Tue, 24 May 2022 09:44:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YovZAf4S0XphBsco@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi Mark & Olivier：

On 2022/5/24 2:57, Mark Brown wrote:
> On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:
>
>> The current patch requires a change in the driver.
>> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
>> For instance:
>> struct stm32_sai_comp_data {
>> 	unsigned int id;
>> }
>> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
>> 	.id = STM_SAI_A_ID;
>> }
>> struct of_device_id stm32_sai_sub_ids[] = {
>> 	.data = &stm32_sai_comp_data_a},
>> }
> Either approach works for me (or a revert for that matter).

     Thanks for your advice, I was thoughtless.

     I think change the date of STM_SAI_x_ID maybe simple. But if we 
don't change the id,

what about add a "#define" like the line 47:

#define STM_SAI_IS_SUB(x) ((x)->id == STM_SAI_A_ID || (x)->id == 
STM_SAI_B_ID)

then in the judgement, wu use:

     sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);

     if (!STM_SAI_IS_SUB(sai))

             return -EINVAL;


if you think that's ok, I will send patch v2 for you .

Thanks

Tang Bin

