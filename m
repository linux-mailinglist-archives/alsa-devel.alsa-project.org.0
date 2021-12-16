Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801F47756A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:10:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7BAD2004;
	Thu, 16 Dec 2021 16:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7BAD2004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667440;
	bh=R5TMlMnm/xlSHF2TWVkm6Xnyo/Hq8Y/v7JxYesayRnA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxYzbb/F3hbhmh+0/vYUid/UD4L+U0rNq+s7W2dsIV4HnZJZMmBnO8M8QCAeSJCRM
	 rJc3ldfVBYEwcvRx7xIgr6sOScVLM5xJ8cRq8iEM6AR9XNDqsym/63Lfm7q+5HMY5R
	 +KsZNSXBxx7o4p1X6M//BbREF+fgGOvWLsTinmj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6AEF8015B;
	Thu, 16 Dec 2021 16:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43C03F800DE; Thu, 16 Dec 2021 16:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC4E6F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4E6F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ztghiy1S"
Received: by mail-lj1-x231.google.com with SMTP id a37so37887434ljq.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1qfd395IYWj+B/UdbiFiPVdCXFHwSx1zWwQl0BrdIvo=;
 b=Ztghiy1SxXBJ21k5EHGfOxtkLitrM3pminuWlLG7d35vrjB9Ud0njt3RXd7DzwIITZ
 9R0EkJ7CKk02W2fvI21ouo0VeL6rB583kIEbWMEJRVT8A0/t+WPpMSzI3xaPKP35qMpZ
 JA7LtaXd3Oyb5P3Aemn/pGmzOhomhGHP5nEzGdUjqx1vfeu9WJzgBTXxK8wSx9CgzlkL
 Foj6WyQjz8rD+0rl31WtPDh2E8RXfdQJrk1/o3HRcZ00MmtPLClv2KN61TS7NOqsRuXG
 HCL+NipbTzGoPbcY/ZkN0ILJZx1FSSQeRvrURn3C/Jo2USIuwwi6BZXYvHDckU/wkwlx
 hufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1qfd395IYWj+B/UdbiFiPVdCXFHwSx1zWwQl0BrdIvo=;
 b=bksdUkLhmcW1XT3RwjA3G5ckIWOQn9+uhy8ptOxu6GxL1bHP9PRkZzd2tLo52+gytL
 tdubt5Doj9o1dFSg5mqb8l54TK2N97ww0hjz24ncp8oblMagVnj+SsVJsLh7+IU/dj+3
 XyC+Sg8qrqhv6JnThw2VhC2wpOKqIUKJYGjuZPdJsu+/nS6xqPjNLeN5S8STKXd5+73i
 z94LQA2qFdb5AB2acezQ2YV7IdfDYNS/gUbjaePmoDpaUlHB2wavNJzbfnNdUf8QlYre
 FfWtK0erd2SCF0Bpe0RqsP4RLN7cFrjibwKkMYoJgAqftOowIj2MlJ9071ENTemzoCxF
 kMEQ==
X-Gm-Message-State: AOAM533i4wh7NdNxMWGsHE0fN+iM5tCI7PJGsxihqcHBv1mQF49yK0+2
 3IiY45P0yi+sUX+uRvPMAGZOxjjxWDM=
X-Google-Smtp-Source: ABdhPJzSYtr+35JjMyfwDiGDowXvrdjIoh3vwsMwh7YTEgoBMb3070lHBDEXydaKeMXVufN4FZEHmw==
X-Received: by 2002:a05:651c:b11:: with SMTP id
 b17mr15513775ljr.272.1639667364213; 
 Thu, 16 Dec 2021 07:09:24 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id s9sm910898lfr.304.2021.12.16.07.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:09:23 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com> <YbtFXcteESF0nLZz@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03ede0df-e86e-798e-e2c7-c0ed3dc81fca@gmail.com>
Date: Thu, 16 Dec 2021 18:09:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtFXcteESF0nLZz@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

16.12.2021 16:55, Thierry Reding пишет:
> On Wed, Dec 15, 2021 at 10:19:07PM +0300, Dmitry Osipenko wrote:
>> 15.12.2021 21:57, Mark Brown пишет:
>>> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
>>>
>>>> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
>>>> that removes obsolete slave_id. This eases merging of the patches by
>>>> removing the merge conflict. This is a note for Mark Brown.
>>>
>>> That's not in my tree so I'll need either a pull request with the series
>>> or a resend after the merge window.
>>
>> This patch is included as a part of this series, please see the patch #6.
>>
>> I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
>> but there is no stable branch there.
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
>>
>>>  It's also not clear what to do
>>> about the DRM bits, I guess it's probably easiest to just apply them
>>> along with the ASoC patches.
>>
>> I already asked Thierry Reding to take a look at this patchset. He will
>> let to you know how the DRM bits should be handled. Hopefully this
>> should happen tomorrow.
>>
>> We will know how to move forward if Vinod and Thierry will reply ASAP.
>> Otherwise this series will have to wait for the next cycle.
> 
> I've applied the DRM patches to the drm/tegra tree and pulled in the ARM
> device tree changes into the Tegra tree. I think the rest can go through
> ASoC. Well, provided you can sort out the patch 6 issue with Vinod.

Thank you!
