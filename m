Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138E3FD439
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 09:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B360B175C;
	Wed,  1 Sep 2021 09:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B360B175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630480141;
	bh=9w+qlICT0ued9kGekszscHuM8jNdZgcX8KnWlV2KRr8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMv26/5DSiKM1hheVX/DwTKeXT9Au/nikWrDmK1+iI+2tBZufEUGZzMMRpCexfb6r
	 m3oeSn5iuATXPXlJdWp7DzWscap/6PcoRt8ssIj69LAKYzLOCEfRbjZFA1/MR433zU
	 uR7pHICM6sLCMjzJOU+gVSvmT4R+y8LfeCU0VlGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B9E2F8020D;
	Wed,  1 Sep 2021 09:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C37F80254; Wed,  1 Sep 2021 09:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9770FF80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 09:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9770FF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JpZndJyO"
Received: by mail-lj1-x231.google.com with SMTP id j12so3117676ljg.10
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tkBnSZ8tPceYf/KAGSxnZEdY1ZtMechZKaYpAIYU2LU=;
 b=JpZndJyO+xZ+tPnCYMD2xifEVddZnLPmd+brJFxJkwgMGOki8Lmrj1E5wmSr96IMF2
 S2Apqee7gU620BrjYj372ooKP+8t9+eOpanhgTbBXxuyW1S1QJdek8diuRmJnZWBSHP0
 f8x73VwBsyNvw8onW+48c7JbZjT/DCDNyA0vsq7xZocBUOVHgMuHajEYEwa4rQrzualO
 pFJGL87zIX0WAtdWO9FdmeIubO/opQkioRArXx5apfDvDl7UbupTCfjwlIOa/IS1hozI
 YIiI68VsoRZf5cZRnVcWpLbvJcpgHr+p8mRnRd7DYMOuMqGgRGDcpwiNgsUOa00/uAss
 1fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tkBnSZ8tPceYf/KAGSxnZEdY1ZtMechZKaYpAIYU2LU=;
 b=iyu5gFWbvpB01adP94Yp8YoQpxBj6uzKdy1F2jcuXSago30lbrZ1vXd1Zxso7TDVL9
 ie/rkH8e4Wcl0UdCGOjckVXCIpTeAEnMrlD2IsfGUKDxcxRrce4w713HryEDC/epk+ry
 iZpDJpqFcsGlykkaJNZ4+JjAmPKSlf7jQJv0souynsCHJdVJDsJEutDbpMF4fZH7Yup6
 AlJDHnv0Y5+QTffJC+OxNKM8U3PFyStDJ5WZGLbNRUXFa1qicNPcpmJ6TkHMO+aKoggH
 KtCDbTnmmUAjUUnvz0tPVENoHdOrBHAjtGPuy1wPatw2DZSb8ozYVcx2tKU8Y9zQm6Al
 rFXw==
X-Gm-Message-State: AOAM532NnxmU0sh8ysoUULqyDp8JpHZBuXZwtX6XWxsb8O1R6YvD5ZHG
 vT6AAzVYVeXF6o9ZzrZN5QY=
X-Google-Smtp-Source: ABdhPJzBtCI4VowD9Iwme8UWUOdfX0tOvBmQwSrdCZKL4TslD81zSa8XW6GbUD12UflGAFZbRun0ew==
X-Received: by 2002:a05:651c:2120:: with SMTP id
 a32mr28497251ljq.252.1630480058455; 
 Wed, 01 Sep 2021 00:07:38 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id j5sm1942288lfu.1.2021.09.01.00.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 00:07:37 -0700 (PDT)
Subject: Re: [PATCH] kconfig: forbid symbols that end with '_MODULE'
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20210825041637.365171-1-masahiroy@kernel.org>
 <9df591f6-53fc-4567-8758-0eb1be4eade5@gmail.com>
 <CAK7LNATDMzR1DnwwAcQFHaKZeGVYDZ1oDKL-QOe_7DaB_yByAA@mail.gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <d9e777dc-d274-92ee-4d77-711bfd553611@gmail.com>
Date: Wed, 1 Sep 2021 10:07:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATDMzR1DnwwAcQFHaKZeGVYDZ1oDKL-QOe_7DaB_yByAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-wireless@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Luca Coelho <luciano.coelho@intel.com>, Networking <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>
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


On 26/08/2021 05:28, Masahiro Yamada wrote:
> On Wed, Aug 25, 2021 at 8:59 PM Péter Ujfalusi <peter.ujfalusi@gmail.com> wrote:

...

>>> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
>>> index 698d7bc84dcf..c56a5789056f 100644
>>> --- a/sound/soc/ti/Kconfig
>>> +++ b/sound/soc/ti/Kconfig
>>> @@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
>>>         Say Y if you want to add support for SoC On-chip voice codec
>>>  endchoice
>>>
>>> -config SND_SOC_DM365_VOICE_CODEC_MODULE
>>> +config SND_SOC_DM365_VOICE_CODEC_MODULAR
>>
>> This Kconfig option is only used to select the codecs needed for the
>> voice mode, I think it would be better to use something like
>>
>> SND_SOC_DM365_SELECT_VOICE_CODECS ?
> 
> I do not have a strong opinion.
> I am fine with any name unless it ends with _MODULE.
> 
> 
> The sound subsystem maintainers and Arnd,
> author of 147162f575152db800 are CC'ed.
> 
> If they suggest a better name, I'd be happy to adopt it.
> 

Can you resend (a separate patch would be even better) with
SND_SOC_DM365_SELECT_VOICE_CODECS

for sound/soc/ti/Kconfig ?

Thank you,
Péter
