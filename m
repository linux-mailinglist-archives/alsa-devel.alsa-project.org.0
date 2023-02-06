Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C01C768BF7B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:05:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7EC241;
	Mon,  6 Feb 2023 15:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7EC241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675692349;
	bh=wPpF2Pp0lDTcJo+yewd2AFWrf+QVF41xImkr2JYBHsg=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZLMjR3WBjrLzzsmp0zY7GoRyX0ksJNU1WDpf2DIPNUpyfnT+8kJr5WVSrbBpAhv1H
	 XXjM/mDGpqS0N45hqfZkBSJzFw9gL9TkI1rcXVsd48Wsndil5T5ub8VcAZZPHCIi4P
	 3ZxPSxMWa9FIpi8aAc4HLaF2DIXeV9N9tJRu1oAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC00F800F5;
	Mon,  6 Feb 2023 15:04:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FD1F804F1; Mon,  6 Feb 2023 15:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457AAF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457AAF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DnyGpXsF
Received: by mail-ot1-x32c.google.com with SMTP id
 g21-20020a9d6495000000b0068bb336141dso3210476otl.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FqCfgYIduMpW5p7a5hUsldl/3wfeQTqY76tooEP032g=;
 b=DnyGpXsFlpveu0IYQM1Xfx9HIIaoLeO8QN5tGRVRkU1waaDsD7k2MlmoY2PvSu/fUx
 EAgJoOhqef51u1Cebvfe6nMpHvPzOq5jmJvyZE90OzHlCeYb/KBZg6IriOX5jvpeHWhg
 GJxcqYXT8E9bRsPxbpNGMwLftCOptjcli/2Az1dHVC115LPYnZ1HU48Gnf5opwb1i38q
 J3T/ZemXPMYtg2BBLdKPn4lbc78600Hcc2FBYDoyD3QHLxOUNkEsTGa3+BZYYoHJ6O+G
 osxpaTNE4ugadm22ElvMJDZli41BaG9TSjclZXoIzdiM1nskavJysfbsotpO9Dq28ZKr
 Nl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FqCfgYIduMpW5p7a5hUsldl/3wfeQTqY76tooEP032g=;
 b=Y0mBWZzfg3zo91cQBVZqWK6jcSwRlW88L+GzZI1OJHPXnlSs8hCaiKfLMS0peiuxV0
 UXFKqJU5hL3qTjwvBGUF/oZMwfdILkBZp1+w6G+HlSMgwYvaBvTcD/DdT6HPKeHbQn2j
 wPSsk5GT5pq3e4WxRJ0xcOpLvK8btu3kvxuHMR2xBh5fC+ICkynTOCNPvrE1ktZRpdnb
 LlJZeWPkBEtVdmy47TlUrXihHDLYsa363ixwq/152cqHpdc9ZhBXm7YaxVPMSklvse2q
 8Uf4zeEZFoW90BtvI7dA/mD7N0ja8QXZA3DVbgFBn9w0RjafRWvrjA7DT149xYp+FUTG
 4yXQ==
X-Gm-Message-State: AO0yUKUIxXa1PZjX0rg+eRi6jHS/hbKOBlFPWoJu3pszdKh6dIPmvVyu
 /xahHX/L3Q49en32fYaa0Ms=
X-Google-Smtp-Source: AK7set9SFjS0GJsFRorEMiNYTOeUZqrzss49nl/vIfEMjuHcvaD0UnXQMmuGOYXd1ZcVf1Ek/JAjYA==
X-Received: by 2002:a9d:1b27:0:b0:68b:dd09:2b6 with SMTP id
 l36-20020a9d1b27000000b0068bdd0902b6mr11374574otl.25.1675692284033; 
 Mon, 06 Feb 2023 06:04:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a9d5e16000000b006864b5f4650sm5030851oti.46.2023.02.06.06.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:04:43 -0800 (PST)
Message-ID: <1ba5cedb-0f0f-69a9-96f0-d93ba060745e@roeck-us.net>
Date: Mon, 6 Feb 2023 06:04:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: David Rau <david.rau.zg@renesas.com>, Mark Brown <broonie@kernel.org>
References: <20230117195645.GA83401@roeck-us.net>
 <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230119161221.GA981953@roeck-us.net>
 <OS3PR01MB66416C10BF8E6400C84DAD02CDD09@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk> <20230202155101.GB1373010@roeck-us.net>
 <Y9vtIISfmpICi+9u@sirena.org.uk>
 <8f89eeac-b3ef-4137-80df-6cf044873b05@roeck-us.net>
 <Y9wQygzbFyOWl54r@sirena.org.uk> <20230204154222.GA877819@roeck-us.net>
 <OS3PR01MB6641CA1DB8524BCA0F9867D9CDDA9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
In-Reply-To: <OS3PR01MB6641CA1DB8524BCA0F9867D9CDDA9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/5/23 21:38, David Rau wrote:
> 
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Saturday, February 4, 2023 23:42
> To: Mark Brown <broonie@kernel.org>
> Cc: David Rau <david.rau.zg@renesas.com>; perex@perex.cz; lgirdwood@gmail.com; tiwai@suse.com; support.opensource@diasemi.com; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music
> 
> On Thu, Feb 02, 2023 at 07:36:42PM +0000, Mark Brown wrote:
>>
>>>> they have the potential to actually lock up are the
>>>> cancel_work_sync() calls but they were unchanged and the backtrace
>>>> you showed was showing the thread in the msleep().  My guess would
>>>> be that you've got systems where there are very frequent jack
>>>> detection events (potentiallly with broken accessories, or
>>>> possibly due to the ground switch putting things into the wrong
>>>> priority) and that the interrupt is firing again as soon as the
>>>> thread unmasks the primary interrupt which means it never actually stops running.
>>
>>> That is what I strongly suspect is happening. I don't know why
>>> exactly the interrupt is firing continuously, but the hang is always in msleep().
>>> One possibility might be that the event is actually a disconnect
>>> event, and that enabling and immediately disabling the ground switch
>>> causes another interrupt, which is then handled immediately, causing the hang.
>>
>> Could be.  I'd be willing to guess that it's not just one event but
>> rather a stream of events of some kind.  Possibly if it's due to the
>> ground switch it's spuriously detecting a constant stream of button
>> presses for the affected systems, which don't produce any UI visible
>> result which would cause users to pull the accessory for whatever
>> reason?  Whatever's going on I bet it's broken accessories triggering it.
>>
> 
>> That seems to be unlikely. The average number of crashes per affected system is 1.92, which points to something the users are doing and less to a broken accessory.
>> We do observe crashes due to broken accessories, but in those cases the number of crashes per system tends to be much > higher.
> 
>> Anyway, below is a patch with a possible fix. Of course, I still don't know what the patch originally tried to fix, so it might not do much if anything good.
> I added the software debouncing before insertion task to ensue the better compatibility of OMTP Jack.
>> For example, it keeps button detection in the interrupt handler to avoid dropping button events, so if spurious button detection as you suspected is indeed (part of) the problem we might still see a large number of interrupts.
> 
>> Guenter
> 
> Thanks a lot for your big efforts to implement the temporary fix and verifications.
> Would you please let me know the average number of crashes per affected system if you rollback to the pervious fix?
> Ref:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/codecs?id=2d969e8f35b1849a43156029a7a6e2943b89d0c0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/codecs?id=06f5882122e3faa183d76c4ec2c92f4c38e2c7bb
> 

You mean just keep the above two patches and revert 969357ec94e6 ?
Sure, I can do that, but feedback from the field would take some
2-3 months. Is that what you recommend to do for now ?

Thanks,
Guenter

