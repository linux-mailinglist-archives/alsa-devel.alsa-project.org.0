Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 821276C11FA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 13:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A63671EE;
	Mon, 20 Mar 2023 13:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A63671EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679315676;
	bh=ZrFrHR0kfa1A2Qh1WpYS59kAfHP4rbIuGEz2hCo4kYo=;
	h=Subject:To:References:From:Date:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tdzIn0VgPzlU9FQzb5xS3zAbumH3jTeNvUzkBQ9QsqvzMw83+JBOEIclPWb3uXSZu
	 NnDc46mVP+NPfENirmxnmWdm09EsrLIOEyKgPJqF0Hmdm9lT7McR3WiV0yvmL3Gply
	 UjzYSgZJav9M633OpB9NVN5B3qPU35b8+Wswtl1o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8048F80254;
	Mon, 20 Mar 2023 13:33:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932DFF8027B; Mon, 20 Mar 2023 13:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F622F80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 13:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F622F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=OcQRAJ2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679315613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mL7Pa+Jk7dydG+7X5vomiVh7eAKGEcv01KgJbTLjz/Y=;
	b=OcQRAJ2/IUfTCTNDJ5RcCFh60yImyo96zABa1wAf5mFWVAsFdHAKM0ycPEBoQ/QbGC6+Bn
	EyMLbCrFpAND95TrxYsjt7Y7Th6RL4Ofkb3mOeVKaghDU0d91linqbNKtoEnbZyimscr+F
	kIUPlr/qWwBaY8asSn+5/hG8pBwjjQ0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-w2sMwmiKNQmgwgIkg3ZEMQ-1; Mon, 20 Mar 2023 08:33:31 -0400
X-MC-Unique: w2sMwmiKNQmgwgIkg3ZEMQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 66-20020a370345000000b00746886b1593so867503qkd.14
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 05:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315611;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL7Pa+Jk7dydG+7X5vomiVh7eAKGEcv01KgJbTLjz/Y=;
        b=aV9DpJrFTCur4mLjnoF+0+IYJeuSmMS3F3iJJKxHEILlFDLzeDOmBiZ30dQPbZmZAC
         UvW4L9Up9cWL4O4lc1LBzPtYLB9sysQ+zkdYEujP7wc23bTipnz0doW+RbHgukvs/gls
         brCTLvBUqbKiFOdJ0VIW7IAe0fEQr7yrh/mun1L4kJk5Fst6s40GgTxASIiBNRzCa9rO
         3TOMDnt4uEBTu+fMKZ1lgc95WZ3ZNW0IZAsXGitboPmOngrOXlybJTbUJVRtL/ioHyKs
         +kOQIR+QBRfTUTnkj3yOmjd0lgKidV+ar2CzZoEYASfu2pNoR58/xtqAsi9qoSvmluaD
         I6Kw==
X-Gm-Message-State: AO0yUKVg9cSUwsrtgyVG2EemFUK12kMlsHrwofdx/YeGtIagzuOlkkBA
	udo2R8wsnRw14sJ1HJlz1F9AidP9ck3bsU5HQQiZ83QSBBS6uROkF2EWqxVQDxyFtidmWQ52dMb
	nWm+olQBAk5r7+Q9b2/tu9EA=
X-Received: by 2002:a05:6214:509d:b0:5c8:15bc:f630 with SMTP id
 kk29-20020a056214509d00b005c815bcf630mr8113715qvb.24.1679315611326;
        Mon, 20 Mar 2023 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: 
 AK7set9m58vXQOg3Ou0SQtJl6BazktNBq/LaOdPM7o0iQnoGKYlgBO/jM4F6HPU2A5dh/YPqrJKRyw==
X-Received: by 2002:a05:6214:509d:b0:5c8:15bc:f630 with SMTP id
 kk29-20020a056214509d00b005c815bcf630mr8113670qvb.24.1679315610953;
        Mon, 20 Mar 2023 05:33:30 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id
 75-20020a370a4e000000b006ff8a122a1asm1702109qkk.78.2023.03.20.05.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 05:33:30 -0700 (PDT)
Subject: Re: [PATCH] ALSA: ymfpci: remove unused snd_ymfpci_readb function
To: Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20230318132708.1684504-1-trix@redhat.com>
 <87mt49mabx.wl-tiwai@suse.de> <20230319233444.GA12415@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <6896b706-a406-1667-8d87-765cd02e6fca@redhat.com>
Date: Mon, 20 Mar 2023 05:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230319233444.GA12415@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-ID-Hash: AMELMS6EGODUK3LCL55VCXZPBQT4EP72
X-Message-ID-Hash: AMELMS6EGODUK3LCL55VCXZPBQT4EP72
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, ndesaulniers@google.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMELMS6EGODUK3LCL55VCXZPBQT4EP72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 3/19/23 4:34 PM, Nathan Chancellor wrote:
> On Sun, Mar 19, 2023 at 09:09:22AM +0100, Takashi Iwai wrote:
>> On Sat, 18 Mar 2023 14:27:08 +0100,
>> Tom Rix wrote:
>>> clang with W=1 reports
>>> sound/pci/ymfpci/ymfpci_main.c:34:18: error:
>>>    unused function 'snd_ymfpci_readb' [-Werror,-Wunused-function]
>>> static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
>>>                   ^
>>> This static function is not used, so remove it.
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>> I applied now, but still wondering why it warns at all even if it's a
>> static inline function...
> See commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build") for some more information. The key part
> of the commit message is 'with W=1', this will not happen with a normal
> clang build.

IMO from this general cleanup, being at W=1, is the correct location.

There many functions that could be removed and some that should not be.

Tom

>
> Cheers,
> Nathan
>
>>> ---
>>>   sound/pci/ymfpci/ymfpci_main.c | 5 -----
>>>   1 file changed, 5 deletions(-)
>>>
>>> diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
>>> index c80114c0ad7b..2858736ed20a 100644
>>> --- a/sound/pci/ymfpci/ymfpci_main.c
>>> +++ b/sound/pci/ymfpci/ymfpci_main.c
>>> @@ -31,11 +31,6 @@
>>>   
>>>   static void snd_ymfpci_irq_wait(struct snd_ymfpci *chip);
>>>   
>>> -static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
>>> -{
>>> -	return readb(chip->reg_area_virt + offset);
>>> -}
>>> -
>>>   static inline void snd_ymfpci_writeb(struct snd_ymfpci *chip, u32 offset, u8 val)
>>>   {
>>>   	writeb(val, chip->reg_area_virt + offset);
>>> -- 
>>> 2.27.0
>>>

