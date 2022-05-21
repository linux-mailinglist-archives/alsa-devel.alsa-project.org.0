Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B252FBFB
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 13:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2F6616F4;
	Sat, 21 May 2022 13:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2F6616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653132731;
	bh=qdDx8OdM9C4AgsUkJl4n+85I3M1aVD/JlGrc7yOzCBA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eiRvpXHlICFScLF60p70b6ObadV/h296Aw2POP1tCQmbpCne3TNS7Go0iidhKnAeK
	 7aT9h3fn/fL0kv9a3QJMs/mgQ5fMPdjz2HHK3VhYU5z6+wva2McRzSFqFSwudG4Kng
	 GFd2xhj+VKd5Nj5gje47Zueu32/8OeHc5Dpw0J7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3D8F80212;
	Sat, 21 May 2022 13:31:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28522F8015B; Sat, 21 May 2022 13:31:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37838F800D2
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 13:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37838F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qY87l3ZR"
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f1d2ea701dso12971624fac.10
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c8pe66nrvJK0OiDEnM7rEvFZVbObCXbFInnFMWPTF8o=;
 b=qY87l3ZRiluI1qnUhAuNIJSnIdtpLduy9/j8EuFqbyRaofNqQX69oFRHLrSv/KHzFg
 SKs29amESZYCMqA3efaIwcEaRWyEux1tdX5U6lwgpflEcXqlOtqvT+Q3OKR+kwMOmWwM
 p229vJV1ACRamxm1T0o5yDTerGUcoUu2Pxa9lh0ufEvSpqBxoOCMawo+Ayby6ofapSad
 XzR4GPSGDh2gdWZoATDK3M/tZ3SzH4kTi1+1ZX6ahy0UlCg4rXi1B4RYHA9AZQgeyJhQ
 AYTIWj9OaFKRaTLwlh8RjlfrBSM7lLBt92znbm0DkQP5fgQyhi7JTFYUc7mT2WVgNNUy
 oWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c8pe66nrvJK0OiDEnM7rEvFZVbObCXbFInnFMWPTF8o=;
 b=0nxQG1bHd8qhu6ccgbO/+v5UgF3RUzYvVoAOS2xsDQ1oABXb/d6+C1WWiVuO+XMZr0
 8Vu4ByFoXdW/ztWRVmIBIa3TRD07nQ1+oup41RyCFH8tZvhVZLjvzzva7g4QO8Tve2UV
 VPF86+YmyaHsPyljSZsfIPzx8CN43K/mBhIqotgu8KqiqTH1aO0IJXyfFyg58Fkj0Dw/
 WSNrX7iI5BVaS99K5b+LQmNM/q7ieTa9Ndi8mNRVFTSvQ+0V5W9bNEFeZwodoo/kILa7
 zJo2HEczT9T9xxlmNvC3wiLRrHbCQjKALbs+9OU1fA6MTXZCkw7WKYk8P+nGj5OuEXrK
 MT6w==
X-Gm-Message-State: AOAM530cNYyfRnDXR4drAxI3MPDU04pjTEVNsnzlhDVZNpvKJGZ5kraM
 uKCFaBubhR2tpVoJ/G7mFJQ=
X-Google-Smtp-Source: ABdhPJzfVsqhW9/iw7Ap9kC4TALM3ioRScXjyLpclepkQqRrEVaBz18O8TOf5C5V9A77gGk4iJ/Drw==
X-Received: by 2002:a05:6870:d110:b0:f1:d546:13b9 with SMTP id
 e16-20020a056870d11000b000f1d54613b9mr8303165oac.41.1653132663811; 
 Sat, 21 May 2022 04:31:03 -0700 (PDT)
Received: from [192.168.1.97] ([47.189.58.205])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a9d64da000000b0060adbf4f89dsm1954460otl.77.2022.05.21.04.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 04:31:03 -0700 (PDT)
Message-ID: <844c9018-7ea8-79a9-9644-6005596d927f@gmail.com>
Date: Sat, 21 May 2022 06:31:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ALSA: ctxfi: Add SB046x PCI ID
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <cae7d1a4-8bd9-7dfe-7427-db7e766f7272@gmail.com>
 <87o7zrnp93.wl-tiwai@suse.de>
From: =?UTF-8?Q?Edward_Matijevi=c4=87?= <motolav@gmail.com>
In-Reply-To: <87o7zrnp93.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 5/21/22 05:39, Takashi Iwai wrote:
> On Sat, 21 May 2022 06:45:15 +0200,
> Edward Matijevic wrote:
>> Adds the PCI ID for X-Fi cards sold under the Platnum and XtremeMusic names
>>
>> Before: snd_ctxfi 0000:05:05.0: chip 20K1 model Unknown (1102:0021) is found
>> After: snd_ctxfi 0000:05:05.0: chip 20K1 model SB046x (1102:0021) is found
>>
>> Signed-off-by: Edward Matijevic <motolav@gmail.com>
> Does / did everything work as expected?  The model field influence on
> a few device-specific setups such as the GPIO initial value, ADC and
> DAC selections, not only the name string.
>
>
> thanks,
>
> Takashi

When first wrote the patch years ago I still had audio output with this patch
and the cards with that ID are already using the default cases/values in cthw20k1.c
so adding the name is just a cosmetic change so it no longer says "Unknown"

>> ---
>>  sound/pci/ctxfi/ctatc.c      | 2 ++
>>  sound/pci/ctxfi/cthardware.h | 3 ++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
>> index 78f35e88aed6..fbdb8a3d5b8e 100644
>> --- a/sound/pci/ctxfi/ctatc.c
>> +++ b/sound/pci/ctxfi/ctatc.c
>> @@ -36,6 +36,7 @@
>>  			    | ((IEC958_AES3_CON_FS_48000) << 24))
>>  
>>  static const struct snd_pci_quirk subsys_20k1_list[] = {
>> +	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0021, "SB046x", CTSB046X),
>>  	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0022, "SB055x", CTSB055X),
>>  	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x002f, "SB055x", CTSB055X),
>>  	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0029, "SB073x", CTSB073X),
>> @@ -64,6 +65,7 @@ static const struct snd_pci_quirk subsys_20k2_list[] = {
>>  
>>  static const char *ct_subsys_name[NUM_CTCARDS] = {
>>  	/* 20k1 models */
>> +	[CTSB046X]	= "SB046x",
>>  	[CTSB055X]	= "SB055x",
>>  	[CTSB073X]	= "SB073x",
>>  	[CTUAA]		= "UAA",
>> diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
>> index f406b626a28c..2875cec83b8f 100644
>> --- a/sound/pci/ctxfi/cthardware.h
>> +++ b/sound/pci/ctxfi/cthardware.h
>> @@ -26,8 +26,9 @@ enum CHIPTYP {
>>  
>>  enum CTCARDS {
>>  	/* 20k1 models */
>> +	CTSB046X,
>> +	CT20K1_MODEL_FIRST = CTSB046X,
>>  	CTSB055X,
>> -	CT20K1_MODEL_FIRST = CTSB055X,
>>  	CTSB073X,
>>  	CTUAA,
>>  	CT20K1_UNKNOWN,
>> -- 
>> 2.36.1
>>

