Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2A729D4E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128AC836;
	Fri,  9 Jun 2023 16:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128AC836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322241;
	bh=cRiC6NytWNVTshJVwhZtZl3nrxf90/Yfi1YPRqaX2X4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TPW9aj/tT2hlS8fUoD8tgfliXYjUvG8EG0l1LXdvjee8K9RHR1oS2RfBfpmDNAOu1
	 DvGBPtJKi1eytpCiWufzmyMdDpXfXEwgKdJjXDBAjEb69/CS+rLv7idIsZN/5gZrpf
	 USmdmiPTp09Cg8oBGbCYOv2VoevE2D2sKICaFfVg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD81F805D8; Fri,  9 Jun 2023 16:47:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CCEF805D6;
	Fri,  9 Jun 2023 16:47:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC9EDF80199; Thu,  8 Jun 2023 04:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1893DF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 04:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1893DF800ED
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D9BA824E25C;
	Thu,  8 Jun 2023 10:15:04 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 10:15:04 +0800
Received: from [192.168.125.124] (183.27.98.122) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 10:15:04 +0800
Message-ID: <d941ac20-e8b3-cb13-4258-3a9a86e978d3@starfivetech.com>
Date: Thu, 8 Jun 2023 10:15:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] ASoC: starfive: Cleanup and fix error check for JH7110
 TDM
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Claudiu Beznea <Claudiu.Beznea@microchip.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
References: <20230607081439.1517-1-walker.chen@starfivetech.com>
 <3eb7ffc5-a16a-4ac2-93a0-260f7cb1f81c@sirena.org.uk>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <3eb7ffc5-a16a-4ac2-93a0-260f7cb1f81c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IS236AXUB226HBQO7IYXXF46LAOXYCFY
X-Message-ID-Hash: IS236AXUB226HBQO7IYXXF46LAOXYCFY
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IS236AXUB226HBQO7IYXXF46LAOXYCFY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/7 19:44, Mark Brown wrote:
> On Wed, Jun 07, 2023 at 04:14:39PM +0800, Walker Chen wrote:
> 
>> Some minor issues were found during addtional testing and static
>> analysis. The patch fixed these minor issues.
>> 1.Use BIT() macro to indicate configuration for TDM registers.
>> 
>> 2.Fix the check for devm_reset_control_array_get_exclusive return
>> value. The devm_reset_control_array_get_exclusive() function may return
>> NULL if it's an optional request. If optional is intended then NULL
>> should not be treated as an error case, but as a special kind of success
>> case. So here the IS_ERR() is used to check better.
> 
> As covered in submitting-patches.rst please submit one patch per change
> rather than combining multiple changes into a single patch, it makes
> things much easier to review and handle.
Hi Mark,

Thanks for your review.
OK, I will submit a single patch for each change in the next version.

> 
>> -	datarx = (tdm->rx.ifl << IFL_BIT) |
>> -		  (tdm->rx.wl << WL_BIT) |
>> -		  (tdm->rx.sscale << SSCALE_BIT) |
>> -		  (tdm->rx.sl << SL_BIT) |
>> -		  (tdm->rx.lrj << LRJ_BIT);
>> +	datarx = (tdm->rxwl << 8) |
>> +		  (tdm->rxsscale << 4) |
>> +		  (tdm->rxsl << 2) |
>> +		  TDM_PCMRXCR_LEFT_J;
> 
> I'm not sure this change to use numbers here is a win - the _BIT
> definitions look fine (I might've called them _SHIFT but whatever).

This is Claudiu's advice. Using the macro BIT() to replace these definition of *_BIT, 
it will result in big changes in the code.
Please refer to previous comments:
 https://lore.kernel.org/all/143e2fa2-e85d-8036-4f74-ca250c026c1b@microchip.com/

@Claudiu What do think about this ?

> 
>> -static const struct of_device_id jh7110_tdm_of_match[] = {
>> +static const struct of_device_id jh7110_tdm_match[] = {
>>  	{ .compatible = "starfive,jh7110-tdm", },
>>  	{}
>>  };
>>  
>> -MODULE_DEVICE_TABLE(of, jh7110_tdm_of_match);
>> +MODULE_DEVICE_TABLE(of, jh7110_tdm_match);
> 
> This rename wasn't mentioned in the changelog.
Will be added in the change log.

Best regards,
Walker
