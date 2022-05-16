Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880A528D70
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 20:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75748886;
	Mon, 16 May 2022 20:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75748886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652727072;
	bh=ICyyCZApWdhGb/nQaOOr4pQFtm5qum1oD5r4vgzEa/Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdM1pTw+iPsw7IiPAAsx44nWCkyZ5VpEImY8O+pGmHDpVbqluFDrPGY92VfaIE2Uh
	 +wEo5/I/p0jVGBqmLI4RebR6a1LetY72FbZ7TZx9X4RemT3zw/YGsDxHpotUDGoGNx
	 uqyE3FW/aAFoJcDKNxy7eYpK1Vce/YuKf9KkyZnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9FDCF8012C;
	Mon, 16 May 2022 20:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39BFCF8014B; Mon, 16 May 2022 20:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74B37F8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 20:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B37F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hd0Yorn0"
Received: by mail-pl1-x636.google.com with SMTP id i1so15301280plg.7
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ogFgPpVvtLABZGqhLzO7aVIGrK84/NfIlVnDOzWwbx8=;
 b=Hd0Yorn0RW/CYIBNSer8vE7Dkgu4vN8r5CmeQz/yRlhWDVzomT7yKboUIDrEYN8r6H
 fuPXEADzXBCgJBnKMFjASpP31MlP4WKde1RvxkWhfeiwZwed/VkEkOSpUY78oPDAx5nH
 vnXswqBP3oQ4laULsL4AVvrMiF3woZrNQwOx+zT0oiiwiKi4t0Uzv7sKv6Qy0AoSTLOz
 j2BtRCNMtIEmnpzHMK8SHi8OLI10I9r0kB9r9g5yrrgNoLUhbZbrQ5WI5GAkpI7ePLtv
 ZEL7VVNDuTcYRffrLhc/kRD+xGfSvzZi5PMixafVOTRpY2A1sBZEKfnYkZHyLf5QqNuG
 loPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ogFgPpVvtLABZGqhLzO7aVIGrK84/NfIlVnDOzWwbx8=;
 b=tsZAMmv+vuPMzLg53aA+BBtgrWCWdnyshIJ2x2qb64NZitQh4Lyl0mwTbNvcWCGSBn
 DlYpZO6WI2c3wypTGDBc4Xqvzjbvjk9+E4OZnqd+OZ5Ftp+0t9HJdKmJzaVCc8wk9w3x
 4mHt3z6XB2QBRPi5c0nQ3TeU08vm1RqHAaCMcLybocRUBgd9ls5KjqZQD5/IjYwVXoHG
 gkWLoVhiHjFHNymTcrhvhg+12yJlkvK2DTf5qzQNERu9tnr1teYv1nWSAjGs7HeGiNe+
 INYjK1oUoTqr/U4zETF2zaNsQVSeYDADfkNyXM/t157we+a/8RHYPeENP88IVRQSD+J4
 VC3Q==
X-Gm-Message-State: AOAM533nZgvoeFD10kcYou3p051Uvl4EMoHuMeNPpzqpTEa4lHzVopk7
 MVJ0c9N+jifAgHFRBaQB5oI=
X-Google-Smtp-Source: ABdhPJwJWStGtq2F73tDt655k7SukiNeC417jxnY4Q7eSvMJW6/+8fSvzNv6EKJ51TvR0GUJcSrMHw==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr20801877pjb.98.1652727007097; 
 Mon, 16 May 2022 11:50:07 -0700 (PDT)
Received: from [192.168.0.107] ([103.86.19.192])
 by smtp.gmail.com with ESMTPSA id
 h20-20020aa786d4000000b0050dc76281a5sm7289062pfo.127.2022.05.16.11.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 11:50:06 -0700 (PDT)
Message-ID: <3f2e9cb6-9b3a-5054-34a8-7c7e1c77a15a@gmail.com>
Date: Tue, 17 May 2022 00:20:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] selftests: alsa: Better error messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <8598037d-0e24-9bc1-3f2c-a2751ec8e871@gmail.com>
 <YoJnhulbKk49rZsw@sirena.org.uk>
From: Siddh Raman Pant <siddhpant.gh@gmail.com>
In-Reply-To: <YoJnhulbKk49rZsw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

Thank you very much, Takashi, and Mark, for reviewing the patch. Helps me getting
the hang of kernel development coding styles and conventions while starting out.

The particular motivation for this was that this test tends to potentially
generate a very long list of warnings/errors.

On Mon, May 16, 2022 At 20:32:30 +0530, Mark Brown wrote:
>>  	if (err < 0) {
>> -		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
>> +		ksft_print_msg("Unable to parse custom alsa-lib configuration (%s)\n",
>>  			       snd_strerror(err));
> 
> I'm really unconvinced that replacing : with () is helping either people
> or machines - the form we have at the minute is probably more common for
> command line tools?

The intent was to separate card and error with the colon. While it may not affect
parsing, you are right, the colon separator is seemingly the standard. Apologies.

> Why add the space before the : here?  That really is not idiomatic for
> Unix stuff, or just natural language.
> ...
> This should definitely be a separate commit.

You are right. Again, apologies for this.

>>  		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
>> -		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
>> -			       ctl->name, index, expected_int, read_int, is_volatile);
>> +		ksft_print_msg("%s.%d : Expected %lld, but read %lld (%s)\n",
>> +			       ctl->name, index, expected_int, read_int,
>> +			       (is_volatile ? "Volatile" : "Non-volatile"));
> 
> I don't understand the comma here?

Those are independent clauses, hence used a comma. Looking back, the "but" can probably
be removed here for brevity.


Please let me know if there are any other things which bugs you, and whether or not
should I send a v2 with the issues addressed.

Thanks for the reviews,
Siddh
