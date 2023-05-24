Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A513A70F63F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC28836;
	Wed, 24 May 2023 14:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC28836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931023;
	bh=Q6hgvymM5lJQyemS29A6b/gp8EqDcLzGdjNeX5gMwWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eEdqESYpaqrGkz1yLCEbSojEcegJHCyy97lRJHpNCu+yMGlAfCDre1n3dIQHWQw/Y
	 wv1rfO5z5xiSi0Wcq2v2DdVpB60aOglOK2cK7DKNAprjVj1YrQR8ee1cVjosShtlim
	 eeHojikVahUSC/oVBEW/YY/WQS3QfvHvJo/Rg1JU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0937F80571; Wed, 24 May 2023 14:22:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D88F80578;
	Wed, 24 May 2023 14:22:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E049F8024E; Wed, 24 May 2023 08:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E096F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 08:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E096F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=kCgeZ8ob
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-513debc49e8so183861a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 23:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684909861; x=1687501861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjNzEJWtwaikCiJE57i78ekQMAO9RRitNfS4hH15fr0=;
        b=kCgeZ8obhDo28nCt2Ds+bmfQMAx8mv0ObMk/woGuLotfZnRmNlwttE7rEINi+eBHp4
         T85lOdsQ89z/7asGLFdEVaOXGEZpklxW+Eh280kwqbsE9f1w7IGv05Xfd5tacAMnRyY/
         kf1ZywsNSME+NH632UvTNglT0DuYcz5jetPbXvBqAbcpszLeCLNtoohZaImOL14Zegnq
         ug4unNdHE6FoFdA2TgTNiupihcgrJSztv7jcjiT5advmAvehFoW3oHUt6KzFZ5tKOyWo
         Tqrc1RD8kc6hV7Wi/YnAjWbJ/r+Uj7kY9b4YnuOH8O/h+Tai6u2/WsAzbX4oPZBHKIhX
         BEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684909861; x=1687501861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjNzEJWtwaikCiJE57i78ekQMAO9RRitNfS4hH15fr0=;
        b=SHNlDqciLN5bpHMWevq0jLcwObVstrNROf5DXzTG7ATY+6C7xmQFTY0PaDD9ZhiXQa
         wJSOEZrv3ZKV2xo3nebiiVqG8I0TFc8c4Dpsy6RmvXiCx4SF3QVDwBVT10nbvg1VeJnj
         NMKbtC3Kw+6jBGPIFGml/elgbQx1bol8QbMR5TQAPhnrtkGRvOBTY9gZCou4BAK2aimT
         alYyXf2pa+e/Ao/UVF5I9epc4rzzCBD2AT6lPI3KKxxZvB1DKoUSDBPYgmNk9TksCGH+
         dGwGXdjJP+lXHhhg7sY3O+ZcUyI9UiLqRHHZOWcFOAampHgqyeXUsN20q7yJ/pKRCFxz
         0AVA==
X-Gm-Message-State: AC+VfDw+lCRxahfCTaP2Il2iVzNS+VukxIRx+VBxZ1+6BeUNs2Whim6y
	Oq8XEzHnIAUBPP5G2U9DpKo=
X-Google-Smtp-Source: 
 ACHHUZ4EFPbBocz0ldfP6auAAnd4+8ZZzau3uJD3txGc+GMgqlL/AK60wRd+0xwo+bekiYkQDNiRmg==
X-Received: by 2002:a17:906:748c:b0:965:9c7d:df96 with SMTP id
 e12-20020a170906748c00b009659c7ddf96mr16034695ejl.1.1684909860542;
        Tue, 23 May 2023 23:31:00 -0700 (PDT)
Received: from [192.168.10.215] ([141.136.93.87])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a170906229300b0096f5b48fe43sm5265343eja.47.2023.05.23.23.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 23:31:00 -0700 (PDT)
Message-ID: <8f0b51f6-bc95-794d-929f-11b84629d0cd@gmail.com>
Date: Wed, 24 May 2023 10:30:57 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] docs: sound: add 'pcmtest' driver documentation
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, perex@perex.cz, tiwai@suse.com,
 corbet@lwn.net, broonie@kernel.org, skhan@linuxfoundation.org
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230521183218.9641-1-ivan.orlov0322@gmail.com>
 <ZGtntdJVy8dZBnf9@debian.me>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <ZGtntdJVy8dZBnf9@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E3REACHHJ72BYQZGZCQL3URJTNXDTXE3
X-Message-ID-Hash: E3REACHHJ72BYQZGZCQL3URJTNXDTXE3
X-Mailman-Approved-At: Wed, 24 May 2023 12:22:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3REACHHJ72BYQZGZCQL3URJTNXDTXE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/22/23 17:01, Bagas Sanjaya wrote:
> On Sun, May 21, 2023 at 10:32:16PM +0400, Ivan Orlov wrote:
>> diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/cards/pcmtest.rst
>> new file mode 100644
>> index 000000000000..ea8070eaa44e
>> --- /dev/null
>> +++ b/Documentation/sound/cards/pcmtest.rst
>> @@ -0,0 +1,119 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +The Virtual PCM Test Driver
>> +===========================
>> +
>> +The Virtual PCM Test Driver emulates a generic PCM device, and can be used for
>> +testing/fuzzing of the userspace ALSA applications, as well as for testing/fuzzing of
>> +the PCM middle layer. Additionally, it can be used for simulating hard to reproduce
>> +problems with PCM devices.
>> +
>> +What can this driver do?
>> +~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +At this moment the driver can do the following things:
>> +	* Simulate both capture and playback processes
>> +	* Generate random or pattern-based capturing data
>> +	* Inject delays into the playback and capturing processes
>> +	* Inject errors during the PCM callbacks
>> +
>> +It supports up to 8 substreams and 4 channels. Also it supports both interleaved and
>> +non-interleaved access modes.
>> +
>> +Also, this driver can check the playback stream for containing the predefined pattern,
>> +which is used in the corresponding selftest (alsa/test-pcmtest-driver.c). To check the
>> +PCM middle layer data transferring functionality. Additionally, this driver redefines
> "... corresponding selftest ... to check the ..."
>> +the default RESET ioctl, and the selftest covers this PCM API functionality as well.
>> +
>> +Configuration
>> +-------------
>> +
>> +The driver has several parameters besides the common ALSA module parameters:
>> +
>> +	* fill_mode (bool) - Buffer fill mode (see below)
>> +	* inject_delay (int)
>> +	* inject_hwpars_err (bool)
>> +	* inject_prepare_err (bool)
>> +	* inject_trigger_err (bool)
>> +
>> +
>> +Capture Data Generation
>> +-----------------------
>> +
>> +The driver has two modes of data generation: the first (0 in the fill_mode parameter)
>> +means random data generation, the second (1 in the fill_mode) - pattern-based
>> +data generation. Let's look at the second mode.
>> +
>> +First of all, you may want to specify the pattern for data generation. You can do it
>> +by writing the pattern to the debugfs file (/sys/kernel/debug/pcmtest/fill_pattern).
>> +Like that:
> "For example::"
>> +
>> +.. code-block:: bash
>> +
>> +	echo -n mycoolpattern > /sys/kernel/debug/pcmtest/fill_pattern
>> +
>> +After this, every capture action performed on the 'pcmtest' device will return
>> +'mycoolpatternmycoolpatternmycoolpatternmy...' for every channel buffer.
>> +
>> +In case of interleaved access, the capture buffer will contain the repeated pattern
>> +for every channel. Otherwise, every channel buffer will contain the repeated pattern.
>> +
>> +The pattern itself can be up to 4096 bytes long.
>> +
>> +Delay injection
>> +---------------
>> +
>> +The driver has 'inject_delay' parameter, which has very self-descriptive name and
>> +can be used for time delay/speedup simulations. The parameter has integer type, and
>> +it means the delay added between module's internal timer ticks.
>> +
>> +If the 'inject_delay' value is positive, the buffer will be filled slower, if it is
>> +negative - faster. You can try it yourself by starting a recording in any
>> +audio recording application (like Audacity) and selecting the 'pcmtest' device as a
>> +source.
>> +
>> +This parameter can be also used for generating a huge amount of sound data in a very
>> +short period of time (with the negative 'inject_delay' value).
>> +
>> +Errors injection
>> +----------------
>> +
>> +This module can be used for injecting errors into the PCM communication process. This
>> +action can help you to figure out how the userspace ALSA program behaves under unusual
>> +circumstances.
>> +
>> +For example, you can make all 'hw_params' PCM callback calls return EBUSY error by
>> +writing '1' to the 'inject_hwpars_err' module parameter:
>> +
>> +.. code-block:: bash
>> +
>> +	echo 1 > /sys/module/snd_pcmtest/parameters/inject_hwpars_err
>> +
>> +Errors can be injected into the following PCM callbacks:
>> +
>> +	* hw_params (EBUSY)
>> +	* prepare (EINVAL)
>> +	* trigger (EINVAL)
>> +
>> +
>> +Playback test
>> +-------------
>> +
>> +This driver can be also used for the playback functionality testing - every time you
>> +write the playback data to the 'pcmtest' PCM device and close it, the driver checks the
>> +buffer of each channel for containing the looped pattern (which is specified in the
>> +fill_pattern debugfs file). If the playback buffer content represents the looped pattern,
>> +'pc_test' debugfs entry is set into '1'. Otherwise, the driver sets it to '0'.
>> +
>> +ioctl redefinition test
>> +-----------------------
>> +
>> +The driver redefines the 'reset' ioctl, which is default for all PCM devices. To test
>> +this functionality, we can trigger the reset ioctl and check the 'ioctl_test' debugfs
>> +entry:
>> +
>> +.. code-block:: bash
>> +
>> +	cat /sys/kernel/debug/pcmtest/ioctl_test
>> +
>> +If the ioctl is triggered successfully, this file will contain '1', and '0' otherwise.
> 
> The rest is LGTM, thanks!
> 

Hi Bagas!

Thank you for the review! I'll fix this in the next version of the patch 
set after getting response from the sound maintainers - probably it 
isn't the only part which needs to be fixed :)

Kind regards,
Ivan Orlov.
