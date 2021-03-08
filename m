Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF9331315
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AFB81948;
	Mon,  8 Mar 2021 17:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AFB81948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615220069;
	bh=/uARo93yw5zIpIvGaFwg/+qyLuotllJGDtFamEgIhek=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHPSRW5xJEa1ZmhwXylQMLv0qIHQtNHNgESyTrw8rOq4t7/mOUAJLdx6K130U2sAf
	 qr5VnP2+iNkixsDfrMBBxp/bM0RlQlktEswJfnQBCB2s1oubaf7NOzr8Iq+/106cw8
	 oGk3ywwU6kxCPxFxVK8OG+nwpY73T0iMeKp65Ozo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32983F80516;
	Mon,  8 Mar 2021 17:09:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABD10F804FA; Mon,  8 Mar 2021 17:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 273EAF804D9
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 273EAF804D9
IronPort-SDR: LL85koRpSce9B2jTc2vv3f4vnqAnhoBBpWPmH4Mo4j4zXeE7qhUGRV+LRdUx3GXuMUbiN/6yNl
 jSGREy4slg8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273083327"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="273083327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:44 -0800
IronPort-SDR: OUFns45em4p49P9cokLZVeZftZt4yYCXzvn+ScjFMwJ2vbU82i/VINKStc7FNnQrtAynkOXpRR
 2HeshybNmQOw==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="430419069"
Received: from dbdavenp-mobl1.amr.corp.intel.com (HELO [10.212.234.206])
 ([10.212.234.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:41 -0800
Subject: Re: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: "Yuan, Perry" <Perry.Yuan@dell.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
 <551e30d2-0211-f3cb-fbb8-ee5b2f22a851@linux.intel.com>
 <SJ0PR19MB4528E7C88C955D2EE96CE3B484939@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ab14a0b2-3f3a-3796-8baf-76e635d82340@linux.intel.com>
Date: Mon, 8 Mar 2021 09:59:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB4528E7C88C955D2EE96CE3B484939@SJ0PR19MB4528.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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




>>>    module_param(force_rfkill, bool, 0444);
>>>    MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted
>>> models");
>>>
>>> +
>>
>> spurious line change
> I just want to make them separate with more space .
> If it cause concern, I will remote the line in V5.

it's fine to improve spaces/alignment, just do it in a separate patch.

> 
>>
>>>    static const struct dmi_system_id dell_device_table[] __initconst = {
>>>    	{
>>>    		.ident = "Dell laptop",
>>> @@ -2205,11 +2209,17 @@ static int __init dell_init(void)
>>>    	dell_laptop_register_notifier(&dell_laptop_notifier);
>>>
>>>    	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>>> -	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>>> -		micmute_led_cdev.brightness =
>> ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>> -		ret = led_classdev_register(&platform_device->dev,
>> &micmute_led_cdev);
>>> -		if (ret < 0)
>>> -			goto fail_led;
>>> +
>> 	dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>>
>> not sure why you changed the alignment?
> The previous alignment is a little not correct.
> So I adjust it
> If it cause concern, will restore it to original shape.

same here, use a different patch.

