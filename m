Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C104A31AF9D
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 08:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D36169E;
	Sun, 14 Feb 2021 08:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D36169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613288448;
	bh=jSYxzSPTXadTsZ2jhNd7eGb/Ra7LaOJhSEJv6IlBkAc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaGqovkebZS/9mi8wlw3Q53D/wvUQU0tG6PjA9SoKzacZvAQdHqy4Sz2+PGV1nb63
	 gzEN4TFbGsjCOy3BG0vaJm2W2of3W0a0POzZ3DRR+6n6QlWCTsUP1NHxKew2RuSWBp
	 iPLfzgdFipoSzvkGYLRX3vPUYMiPsaRPKlI6qXH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F20F8015A;
	Sun, 14 Feb 2021 08:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C81BF80155; Sun, 14 Feb 2021 08:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9644FF800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 08:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9644FF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xcd2rPEE"
Received: by mail-wm1-x331.google.com with SMTP id u14so4898107wmq.4
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=+/pCeKCEbExGMfLFUD/YBkzoItJszt+z4ktzhK357i0=;
 b=Xcd2rPEEyrg1/VUMWDm/Xai04wqVMfZKoBE1CK3hg0/8WuMlKxJlSDUgRkk2N66Q3A
 CBsAypqJXxg3+Ntr4J/2s+v0n/UNJMOysKu2i1BDUqHkHPZ9p4sEWD4ISqac9Y5rxKEw
 4uWQxkyglhbEgA9XsuUKJZdrXRrefXnA/NVf67GpbPCTAf/KnaeMEHrwnGUAt9qmYSSa
 LtsPKbwE0Sf2KPiqGf1xncbXOEweX/p9413G25tu2IvDkgjFh/6LOOl4AuN2D94ZhCb0
 J3Puv3TzyrK/wop9f6+SMqcVty0j5eQfmuxla4i87Anpyfjvpf9uzuyY3iRqllY6g6yp
 B0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=+/pCeKCEbExGMfLFUD/YBkzoItJszt+z4ktzhK357i0=;
 b=iZpejCneUKBR1yMehF4nGw7PqB7Kzr4yifOaM4nYp3sCnjOTuGj5yu2g0MjN0TwsMl
 fVR+FUCvhpAA85sxy2Xsu6zmtVwayEHN9luV+SjjMjnJU1zjyXhv31+AEqFQydQx/oI7
 IBcY9SuZrsPSmpQMweoGWcdMB2NHO9JOrxgbuVAsweqUFwXsxfIAQT4Tqo5E1WjFfuZY
 sBxyRFP6/Jdsu34v7IUWr4kPBAmwrorTaw+7tlwkoAUbcjrUxFD/nvdT+cYzipcC//Ua
 j3QQA9N796pTehW67qxwYgvtZ0+GmvDhYXZxQQ757drPteSKFqQ42dijFihIkqXf/slh
 OYEQ==
X-Gm-Message-State: AOAM532X7VIjYAbvgpfsIesxmmp6ifSZL8CaSKWqRONZZtKKnk82jMCk
 vNopLYQ/9NW9NzyodNQg/pk=
X-Google-Smtp-Source: ABdhPJx5Hl7NUn40mJtrDk4E2H4d8NUbk6yqsbZDMe9LVyeiTVjWZna+Tuio2gPct4edXIbFMZiXFA==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr9248266wmy.120.1613288345041; 
 Sat, 13 Feb 2021 23:39:05 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
 by smtp.gmail.com with ESMTPSA id m131sm24031705wmf.41.2021.02.13.23.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 23:39:04 -0800 (PST)
Subject: Re: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for
 dell privacy driver
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 "Yuan, Perry" <Perry.Yuan@dell.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
References: <20210112171755.14408-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49137D1D7508190AF87655FEFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <42f4d67f-56b5-94f8-5373-4e1dd2353c79@gmail.com>
Date: Sun, 14 Feb 2021 15:38:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BY3PR19MB49137D1D7508190AF87655FEFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Mario:
Thanks for the review.
On 2021/1/13 1:54, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: Yuan, Perry <Perry_Yuan@Dell.com>
>> Sent: Tuesday, January 12, 2021 11:18
>> To: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>> hdegoede@redhat.com; mgross@linux.intel.com
>> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
>> Perry; Limonciello, Mario
>> Subject: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for dell
>> privacy driver
>>
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> Describe the Dell Privacy feature capabilities and devices
>> state class exposed by BIOS
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>> ---
>>   .../testing/sysfs-platform-dell-privacy-wmi   | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
> 
> I don't see a reason that the documentation needs to come in it's own commit.
> In v4, I would think this can collapse as part of:
> "Add support for Dell hardware privacy"
Merged this commit PR to privacy PR in V4.
> 
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> new file mode 100644
>> index 000000000000..3dbc2d25b60e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> @@ -0,0 +1,31 @@
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-
>> D3AB0A901919/devices_supported
>> +Date:		Jan 2021
>> +KernelVersion:	5.11
> I think this is 5.12 material now.
> Need to update this to approximate 5.12 date.
Updated KernelVersion and Date in V4.
> 
>> +Contact:	"perry_yuan@dell.com>"
> 
> I think Dell addresses publicly use a period rather than an underscore, no?
> So shouldn't this be perry.yuan@dell.com? (Although I acknowledge it's an
> alias, I don't trust that I/T wouldn't remove that some day).
> 
>> +Description:
>> +		Display which dell hardware level privacy devices are supported
>> +		“Dell Privacy” is a set of HW, FW, and SW features to enhance
>> +		Dell’s commitment to platform privacy for MIC, Camera, and
>> +		ePrivacy screens.
>> +		The supported privacy haredware privacy devices are:
> 
> You have a typo here.
> 
Fixed.
>> +		 * 0x0 - None,
>> +		 * 0x1 - Microphone,
>> +		 * 0x2 - Camera,
>> +		 * 0x4 - ePrivacy Screen
> 
> So this is an bitmap encoded in the integer?  I think that needs to be mentioned
> in the documentation.
will be updated in V4 like this:

                 ePrivacy screens.
                 The supported hardware privacy devices are:
                 - 0 = Not Supported
                 - 1 = Supported
                 - Bit0 -> Microphone
                 - Bit1 -> Camera
                 - Bit2 -> ePrivacy Screen

> 
>> +
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-
>> D3AB0A901919/current_state
>> +Date:		Jan 2021
>> +KernelVersion:	5.11
>> +Contact:	"perry_yuan@dell.com>"
>> +Description:
>> +		Allow user space to check current dell privacy device state.
>> +		Describes the Device State class exposed by BIOS which can be
>> +		consumed by various applications interested in knowing the Privacy
>> +		feature capabilities
>> +		There are three Bits for available states:
>> +		    * 0 -> Off
>> +		    * 1 -> On
>> +		    * Bit0 -> Microphone
>> +		    * Bit1 -> Camera
>> +		    * Bit2 -> ePrivacyScreen
>> +
>> --
>> 2.25.1
> 



