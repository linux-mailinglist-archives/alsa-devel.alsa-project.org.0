Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0F68CCDA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 03:49:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF2CF7;
	Tue,  7 Feb 2023 03:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF2CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675738180;
	bh=dSMy3DQlJqeQY5OqS3iuTDkhHjtK4BRjXWrXFi/uji0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G9+k27XMWNbHuXGZgmd7CNVTsO6zT9q30pu9keQoVVISpNWZq8L+3RZjgNrQeiahX
	 MnD6Qr9Pe4w6N7Zhg0tg3ApBiToed4QASEQX8z3of9SYdMOA95bGQVFKRV21Tcn0/2
	 v8i2nXD6wtYMftNu1jLFzN8uOVBvBXh0GySJH2GU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57908F8014C;
	Tue,  7 Feb 2023 03:48:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DD6F8045D; Tue,  7 Feb 2023 03:48:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03981F8014E
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 03:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03981F8014E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bH089nlk
Received: by mail-ot1-x32d.google.com with SMTP id
 e21-20020a9d5615000000b006884e5dce99so3806028oti.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 18:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=caqrxhzay3mKppVJOFKLbO06SUDxdUdgwwK4Eikrq+o=;
 b=bH089nlkTreKVHkiZa2crACt5xJ5s/P+zEaQ4knbhNTR9gd6X6nlQUBkk1J4fgHEeE
 h4GB+yBhCCFUB9u0a72qZiNqXcqwsbJ/NQszaNZQvmzdh7lV83oUlPW73pp09OyrBjvu
 ovqNwG8hldY+3k3L7s6RrQfth1J71vsiSQxKWqJ5Hro8N5nRFRMKLXx1/LZqQ7V09Bfg
 +uZcb5JrFYIFz1y2mTvcg+Uj3QoofqIX9LS4r+C4DnvltX4gAC5s2jC/Y67YSEZnQ7kF
 1lBefHrYWgn3FTf3SnJTlYRArRPYYUYs4bbMfakPr2r7IKRnZfcv4E0OI3CNI3w64v2S
 tQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=caqrxhzay3mKppVJOFKLbO06SUDxdUdgwwK4Eikrq+o=;
 b=TCBD8lFzaWdMfGD3CJjtBgt2ii3kjDhd8m1cIJZmF062UdHS+LmEJ8JcX0s6xFqYUD
 QMdyzhn+rdpw01xitYtTHswUH9pl88pRpFGQNpJgdf+i5eYlDkwijgylCXnMBNAW5QG3
 ap3obX3t88x32KEo3WY8P+hL8QJi0B0WixZQEL40GEL85dFFldYo+myYoHCH9f0Vz/0k
 Ycnh227U/qQtA9s55YkA2ARIKzUcEUfWkIc3KUfUjJx+bQdKgCZ4YYkdJ+eVBiTi9ne6
 Fvs7bHXeNu0XDRoNzwK8d7zc7GB3N8fXLqVHAehJLiAtPpnohYSk/hOgVir1EdmfFqCd
 sniA==
X-Gm-Message-State: AO0yUKX1nOHvjcV4Y+l2MKbSUTaGDsMRoBTfJNjHkaWRkD1BaJ8OWCa4
 wiZTvZqstwV0rpm2nK+xpys=
X-Google-Smtp-Source: AK7set9gWvkzZQcrkGmJxERTHD9VgrcyYi4keIZtMsESuITS5vtOx7F8GQq9HcaNIdBVAfCl/B3Ddg==
X-Received: by 2002:a9d:1b09:0:b0:68b:c06f:5e67 with SMTP id
 l9-20020a9d1b09000000b0068bc06f5e67mr975323otl.37.1675738111402; 
 Mon, 06 Feb 2023 18:48:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056808020500b0037834b1a20bsm5081181oie.0.2023.02.06.18.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 18:48:30 -0800 (PST)
Message-ID: <a8a8990d-ac65-f980-2c96-610b54f4f7ef@roeck-us.net>
Date: Mon, 6 Feb 2023 18:48:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
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
 <1ba5cedb-0f0f-69a9-96f0-d93ba060745e@roeck-us.net>
 <OS3PR01MB6641BD5C3B3BA89F82245627CDDB9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <OS3PR01MB6641BD5C3B3BA89F82245627CDDB9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
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

On 2/6/23 18:42, David Rau wrote:
> 
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, February 6, 2023 22:05
> To: David Rau <david.rau.zg@renesas.com>; Mark Brown <broonie@kernel.org>
> Cc: perex@perex.cz; lgirdwood@gmail.com; tiwai@suse.com; support.opensource@diasemi.com; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music
> 
> On 2/5/23 21:38, David Rau wrote:
>>>
>>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Saturday, February 4, 2023 23:42
>>> To: Mark Brown <broonie@kernel.org>
>>> Cc: David Rau <david.rau.zg@renesas.com>; perex@perex.cz;
>>> lgirdwood@gmail.com; tiwai@suse.com; support.opensource@diasemi.com;
>>> alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
>>> Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on
>>> OMTP headsets when playing music
>>>
>>> On Thu, Feb 02, 2023 at 07:36:42PM +0000, Mark Brown wrote:
>>>>
>>>>>> they have the potential to actually lock up are the
>>>>>> cancel_work_sync() calls but they were unchanged and the backtrace
>>>>>> you showed was showing the thread in the msleep().  My guess would
>>>>>> be that you've got systems where there are very frequent jack
>>>>>> detection events (potentiallly with broken accessories, or possibly
>>>>>> due to the ground switch putting things into the wrong
>>>>>> priority) and that the interrupt is firing again as soon as the
>>>>>> thread unmasks the primary interrupt which means it never actually stops running.
>>>>
>>>>> That is what I strongly suspect is happening. I don't know why
>>>>> exactly the interrupt is firing continuously, but the hang is always in msleep().
>>>>> One possibility might be that the event is actually a disconnect
>>>>> event, and that enabling and immediately disabling the ground switch
>>>>> causes another interrupt, which is then handled immediately, causing the hang.
>>>>
>>>> Could be.  I'd be willing to guess that it's not just one event but
>>>> rather a stream of events of some kind.  Possibly if it's due to the
>>>> ground switch it's spuriously detecting a constant stream of button
>>>> presses for the affected systems, which don't produce any UI visible
>>>> result which would cause users to pull the accessory for whatever
>>>> reason?  Whatever's going on I bet it's broken accessories triggering it.
>>>>
>>>
>>> That seems to be unlikely. The average number of crashes per affected system is 1.92, which points to something the users are doing and less to a broken accessory.
>>>> We do observe crashes due to broken accessories, but in those cases the number of crashes per system tends to be much > higher.
>>>
>>>> Anyway, below is a patch with a possible fix. Of course, I still don't know what the patch originally tried to fix, so it might not do much if anything good.
>>> I added the software debouncing before insertion task to ensue the better compatibility of OMTP Jack.
>>>> For example, it keeps button detection in the interrupt handler to avoid dropping button events, so if spurious button detection as you suspected is indeed (part of) the problem we might still see a large number of interrupts.
>>>
>>>> Guenter
>>>>
>>> Thanks a lot for your big efforts to implement the temporary fix and verifications.
>>> Would you please let me know the average number of crashes per affected system if you rollback to the pervious fix?
>>> Ref:
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
>>> Fcommit%2Fsound%2Fsoc%2Fcodecs%3Fid%3D2d969e8f35b1849a43156029a7a6e294
>>> 3b89d0c0&data=05%7C01%7Cdavid.rau.zg%40renesas.com%7Cae6910f8ff4e4e299
>>> bc408db084b1a2a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638112890
>>> 873388020%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
>>> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=8KgHP%2FOD%2BTDcr
>>> rUVSATFkDCDDmhiCu7d5%2FKhyOszThA%3D&reserved=0
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
>>> Fcommit%2Fsound%2Fsoc%2Fcodecs%3Fid%3D06f5882122e3faa183d76c4ec2c92f4c
>>> 38e2c7bb&data=05%7C01%7Cdavid.rau.zg%40renesas.com%7Cae6910f8ff4e4e299
>>> bc408db084b1a2a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638112890
>>> 873388020%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
>>> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WosfvANk0YxeJD5PG
>>> %2FnAuAWVqt7m4U3mMaYXefLLdS4%3D&reserved=0
>>>
> 
>> You mean just keep the above two patches and revert 969357ec94e6 ?
>> Sure, I can do that, but feedback from the field would take some
>> 2-3 months. Is that what you recommend to do for now ?
> 
>> Thanks,
>> Guenter
> 
> Thanks for the feedback.
> What I mean is just do rollback to remove the "sleep" patch I did in your repository.
> 
> After the rollback, could you please let me know the average number of crashes per affected system with the same test conditions?
> Will it still take some 2-3 months?
> 

Yes, due to our rollout schedules. Those are crashes observed in the field,
after all.

Guenter

