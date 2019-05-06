Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A51507C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC55B18F0;
	Mon,  6 May 2019 17:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC55B18F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157334;
	bh=kSP+CgnqrB5HXMygn8ow82bDTPjJuoMK/ScCIZp2GS4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXWecnL6CwGoEAn/GgTwHBc/GvsCxyZjc8qDxPaTrU++ulD6lcmfsWNpyyt8FKIhR
	 llOz0NBC78YjvKTTl9P4DJnps5eY/9kdDb0cfHwAZrsWgIAKLrdkeOPwSZ4pipco2b
	 USX+2xfVAi7nCo7/qmOQpmE9M9ggSufhTCJCNvbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6220DF896FF;
	Mon,  6 May 2019 17:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B359F896F0; Mon,  6 May 2019 17:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08816F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08816F80C07
Received: by mail-ed1-f66.google.com with SMTP id w11so15788936edl.5
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 08:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uAt1+pUkHfiJ3Hg4XJTNXo+R9FukguOnVl+FlWHruWQ=;
 b=NePr4HSc5V9FwjUApR4G5TwidkmFp+kwlag2KwcNT9/VTOGUco44bT/7LQ0N+cBbdH
 zcdE/8AGCWwpmbZFxFTC9+OpRxBsTDPJCaWUAQ/ggNgcSbG0c3be/gSqV8UITbZlIMMQ
 /nHhYu/Fl79QKnT9Nzi0919foIeZ5Ag/xYu0rlg9iO+nhvv5YQcyn+2aQUegUbGaxtzS
 SiHay//C8/cYlvHojpHvPTowFgxvgnHi+T5FcLDAFiErYENdexU5Arsc5L4s/cp10d1D
 RFpQjzJBKSOUWmyTgKoTpl3r7hskTTzSoujo/1X+sdHLSgc9Zk3pPvCCI7mqOU8FY+5b
 BmFA==
X-Gm-Message-State: APjAAAXFzvjo9jUL2wevAhWbpfIDIS0qYkY+ZpyTND9kRzQsaNt4L6OP
 mhePleBljU5pKmfORa0QNjS8gWShx/I=
X-Google-Smtp-Source: APXvYqwkOVwYLQgYelDo9ZzuV43ZZ0RTtcphw9n4FCkU4LkSY4qTAmycWdlu02lc4BAATUf6N2RTrg==
X-Received: by 2002:a17:906:5c0f:: with SMTP id
 e15mr19687933ejq.151.1557157222769; 
 Mon, 06 May 2019 08:40:22 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id f40sm3239068edb.55.2019.05.06.08.40.21
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 08:40:21 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, Nariman <narimantos@gmail.com>
References: <20190504151652.5213-1-user@elitebook-localhost>
 <20190504151652.5213-4-user@elitebook-localhost>
 <s5ha7g1l4oq.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b9ea51f6-29fb-5ae8-607b-a047eba4bac0@redhat.com>
Date: Mon, 6 May 2019 17:40:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5ha7g1l4oq.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Jordy Ubink <jordyubink@hotmail.nl>,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5651.c: remove string
 buffers 'byt_rt5651_cpu_dai_name' and 'byt_rt5651_cpu_dai_name'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 05-05-19 09:51, Takashi Iwai wrote:
> On Sat, 04 May 2019 17:16:52 +0200,
> Nariman wrote:
>>
>> From: Jordy Ubink <jordyubink@hotmail.nl>
>>
>> The snprintf calls filling byt_rt5651_cpu_dai_name / byt_rt5651_cpu_dai_name always fill them with the same string (ssp0-port" resp "rt5651-aif2"). So instead of keeping these buffers around and making the cpu_dai_name / codec_dai_name point to this, simply update the foo_dai_name pointers to directly point to a string constant containing the desired string.
>>
>> Signed-off-by: Jordy Ubink <jordyubink@hotmail.nl>
> 
> If you submit a patch, please give your own sign-off as well as the
> author's one, even if the patch is not written by you.  This is a
> legal requirement.

Sorry, that is my bad, Nariman and the author authors of the patches
are a group of students doing some kernel work for me and this is
a warm-up assignment for them to get used to the kernel development
process.

I forgot to point out to Nariman that since he is sending
out the entire series for all 4 of them, he needs to add his
S-o-b.

Regards,

Hans
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
