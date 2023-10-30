Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED207E065C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B128EA1;
	Fri,  3 Nov 2023 17:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B128EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028707;
	bh=/6HPMfJBOTuuXUw73PtYXCGeBLAb0k7pSSAX6cbIlkI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GTdvtBgtct75qyr7F+2F0uALh9FymOhqXCW9k39/5DpifQDH0d2g5CLCxkv1PnPeR
	 neSOl3cu22e4qLZnAGB0lp1pveqCUcQoLHLZVUbVqRnEnFfYX5A6rep+eQEmtR6IpN
	 pufNB4AUo/aDYypKT6x2j6MySGHwbRBzo3wA/wtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08E4FF805AD; Fri,  3 Nov 2023 17:23:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 031B0F805A9;
	Fri,  3 Nov 2023 17:23:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70354F8016D; Mon, 30 Oct 2023 19:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9805FF800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 19:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9805FF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nlwz97pW
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7a950f1451fso52162739f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698689790; x=1699294590;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFDqrbYKOqLwZznuHEkDhT2cZTWKmKTM7km9nXzpM1Y=;
        b=Nlwz97pWSqSVOeg+Twab6AyBs5VNv+Y/FKeS2yXGZxaMpj1go9tk2zmJXqC+4jOeEn
         afcnUihRNnuFpIKJVvdUM6ytiELRrxoaqo+CEoKuT+2jrvVGQFO+0jODxqW9lqtpVXEI
         /+zJrjVthYmWst0z2cYVMpmpM5qdXLWeHZTm01fnpEJxI8gR0daqH3pjZ3vy7LCN3dPk
         6lGfVIIG1cM5RrxQ9ts5vEhmVlHh5TNhIwCS4ZnpAVg5O8IGWA8FduIw/3xa+pVSAdWx
         jS2o3oIdhHMv95olrTrmzSdSvegwG4N6ebGZKG4V8fh4qKnFs92LfWrsJR13meXUz1VX
         1NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698689790; x=1699294590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFDqrbYKOqLwZznuHEkDhT2cZTWKmKTM7km9nXzpM1Y=;
        b=DTGrb+yp3o7Y0/W6rdrq4S6dlUP2gPjgtPTIYv62K0YV7lx/5JpGYHXvvScJB4Z6kj
         c9SA8g1oUu6e4l4U5bbJOcxV795lN9vy2o5rnQwUF/e7qDMgpbOhBgrKZLE5cBWE1HMG
         eogRPHR57NA88gmI3AgNoA7AXL0JwokfoLzdOPKERT1F7jQIpgMSm+OwZfZWZboLr6Os
         GIWjT9ib/VK8UP3Mx4aXCmvE2F6mI/ZqZnmwXWPViYW1s+HEc84BCfXjVpQhRclUfKTa
         pkbiSLXMbXLwU4UpGGx/5SNoun6ltdLy4QP7OuGNAiIzy353DMI1mpVFZc0edEnzhmRO
         XoVA==
X-Gm-Message-State: AOJu0YxESUZj+MW+TaI+2Wh9yWvJLHzxP/deoM7a4MR3/UEjJae/1q04
	0hOuub0t0PjckaLgGCdpaLQ=
X-Google-Smtp-Source: 
 AGHT+IFyZz12GsPq2t1rm2RNfrRjgktUJJa5l2t6X2bfS34Okyj0eM3kV0jyRHGuP2Nd53ccrCnT7A==
X-Received: by 2002:a05:6e02:1d1c:b0:358:a6e:71b7 with SMTP id
 i28-20020a056e021d1c00b003580a6e71b7mr13811660ila.0.1698689789921;
        Mon, 30 Oct 2023 11:16:29 -0700 (PDT)
Received: from [10.69.0.11] (c-68-55-100-39.hsd1.mi.comcast.net.
 [68.55.100.39])
        by smtp.gmail.com with ESMTPSA id
 d1-20020a056e02050100b0035268f0794dsm2516838ils.18.2023.10.30.11.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 11:16:29 -0700 (PDT)
Message-ID: <49a2e942-97d2-4b9f-8151-e6a8b85514cf@gmail.com>
Date: Mon, 30 Oct 2023 14:16:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Use AVS driver on SKL/KBL/APL
 Chromebooks
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <ZTz9orCylVwn3Pye@arch>
 <257609dc-8fa9-40e0-8730-29e45af93878@linux.intel.com>
From: Brady Norander <bradynorander@gmail.com>
In-Reply-To: <257609dc-8fa9-40e0-8730-29e45af93878@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4X22X7GV7YAVANUVQ6KDUZLKUJLJ2FQH
X-Message-ID-Hash: 4X22X7GV7YAVANUVQ6KDUZLKUJLJ2FQH
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:23:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X22X7GV7YAVANUVQ6KDUZLKUJLJ2FQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/30/23 12:08, Pierre-Louis Bossart wrote:
> 
> 
> On 10/28/23 07:25, Brady Norander wrote:
>> The legacy SKL driver no longer works properly on these Chromebook
>> platforms. Use the new AVS driver by default instead.
> 
> shouldn't this be used only if AVS is compiled in?
>
Good point, I'll send a v2.

>>
>> Signed-off-by: Brady Norander <bradynorander@gmail.com>
>> ---
>>   sound/hda/intel-dsp-config.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
>> index 756fa0aa69bb..1045be1fd441 100644
>> --- a/sound/hda/intel-dsp-config.c
>> +++ b/sound/hda/intel-dsp-config.c
>> @@ -16,10 +16,11 @@
>>   static int dsp_driver;
>>   
>>   module_param(dsp_driver, int, 0444);
>> -MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
>> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
>>   
>>   #define FLAG_SST			BIT(0)
>>   #define FLAG_SOF			BIT(1)
>> +#define FLAG_AVS			BIT(2)
>>   #define FLAG_SST_ONLY_IF_DMIC		BIT(15)
>>   #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
>>   #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
>> @@ -56,7 +57,7 @@ static const struct config_entry config_table[] = {
>>   /*
>>    * Apollolake (Broxton-P)
>>    * the legacy HDAudio driver is used except on Up Squared (SOF) and
>> - * Chromebooks (SST), as well as devices based on the ES8336 codec
>> + * Chromebooks (AVS), as well as devices based on the ES8336 codec
>>    */
>>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>>   	{
>> @@ -81,7 +82,7 @@ static const struct config_entry config_table[] = {
>>   #endif
>>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>>   	{
>> -		.flags = FLAG_SST,
>> +		.flags = FLAG_AVS,
>>   		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>>   		.dmi_table = (const struct dmi_system_id []) {
>>   			{
>> @@ -96,13 +97,13 @@ static const struct config_entry config_table[] = {
>>   #endif
>>   /*
>>    * Skylake and Kabylake use legacy HDAudio driver except for Google
>> - * Chromebooks (SST)
>> + * Chromebooks (AVS)
>>    */
>>   
>>   /* Sunrise Point-LP */
>>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
>>   	{
>> -		.flags = FLAG_SST,
>> +		.flags = FLAG_AVS,
>>   		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>>   		.dmi_table = (const struct dmi_system_id []) {
>>   			{
>> @@ -122,7 +123,7 @@ static const struct config_entry config_table[] = {
>>   /* Kabylake-LP */
>>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
>>   	{
>> -		.flags = FLAG_SST,
>> +		.flags = FLAG_AVS,
>>   		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>>   		.dmi_table = (const struct dmi_system_id []) {
>>   			{
>> @@ -667,6 +668,9 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>>   		}
>>   	}
>>   
>> +	if (cfg->flags & FLAG_AVS)
>> +		return SND_INTEL_DSP_DRIVER_AVS;
>> +
>>   	return SND_INTEL_DSP_DRIVER_LEGACY;
>>   }
>>   EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
