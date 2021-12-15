Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD6F47618D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 20:20:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8D91B1F;
	Wed, 15 Dec 2021 20:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8D91B1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639596025;
	bh=b21Kz56BHdA+0AkU2AFqQJFfc8+xRCp/kgzfB9VG9gA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWxTIUN/bdnDcgoFXBtFXFZ3V6Z2hUJqvu63AcVIe369uP2nGLk5RhBQNRdrVrfqg
	 wa7njWX39KPLC2ZvjcKheTOfkRB9RVznvM+G2ocOcYG2axfAao1H2hkmeKG/m3OKf8
	 mvKSJPjhAxqK8q3auqL01vDEGjo1OGXEmbRQG+Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D37F800B0;
	Wed, 15 Dec 2021 20:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBCEBF8019D; Wed, 15 Dec 2021 20:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A3DF800B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 20:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A3DF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SVHqay68"
Received: by mail-lj1-x22b.google.com with SMTP id i63so34857399lji.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mcoM9Ax1uVbLecr06Jv1GjfyazYcAb1+Wc5JbxKbgLk=;
 b=SVHqay68VUOAOHu9uBZo4mdJWTihaz5p+A6gLbEoE3abtu4VilIEkQaAoxGgkqIxCJ
 ebBrahy80p+gKC5PUp8cy/iok91hF8uU90zVfcYCEQZ3SHyk2iV/M7yBuM5xXx1q+dbU
 5HYPfT/e1p1lkh8wzWatch4fvJdJLNPZ+kGX2LpuRhZxZYaKjhQyHOeZu6pgOAkfqBrl
 j46GWZWa2ldkdxunzLARSSBw53v5jsHy5vDrAHM0XddeaZK+IBjhIpCsmR/2RIeprNMa
 B0e0JU6YbzcQ+5TIWgVjqtru1nqdqQcnUt+H+vsOBjU6fZXijMwHlxAtIxg66N9nh3O/
 8+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mcoM9Ax1uVbLecr06Jv1GjfyazYcAb1+Wc5JbxKbgLk=;
 b=tMP22d3EA0aNaccngm2tXooNXSMngT96gTiYHXLa8uMyW1BfCa4UJaILry+LkFO/kp
 sLlAlt7RAqmRfbu9YdPigzb4qQZ2VbZ8OFNvxjDXUZFJW4bsnYUFIt+Ak2YOGHY6JeV2
 xeeojmJY9+JXHLuDo9dEftvSAWTrnNKevLslz+5VX6ozjKzQkUEamCCNCO/eLLb/B/Pq
 UnDAu+expStTrWk7jeAXHMvNJy5qEs0uGRloQbsRiHWofkB38E70XTzDfFDKqoMpfkqE
 59xeU3SJ4+uEWLanlbrfgM7Yyntw/g5HGkUfy2CBOEiWA/5owXfGrFFBI5387yl9U5GB
 VF7Q==
X-Gm-Message-State: AOAM532nCwl5pKsW2riL4lEaAVlYtI55QtPybw2efOB78qLdGqGWuoBO
 iNRk+E4p1BsJepkkQpixigo=
X-Google-Smtp-Source: ABdhPJwfQiIXPLFnM45Qsq1mKLc+gw5v4w90DdqR/S/COVYdQgiDcGeqkBnZ70V6mO6ZWA17wweAIA==
X-Received: by 2002:a2e:a7c4:: with SMTP id x4mr11737287ljp.43.1639595949539; 
 Wed, 15 Dec 2021 11:19:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id j22sm455282lfu.155.2021.12.15.11.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:19:08 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
Date: Wed, 15 Dec 2021 22:19:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybo6tsnQM6OacoZs@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
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

15.12.2021 21:57, Mark Brown пишет:
> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
> 
>> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
>> that removes obsolete slave_id. This eases merging of the patches by
>> removing the merge conflict. This is a note for Mark Brown.
> 
> That's not in my tree so I'll need either a pull request with the series
> or a resend after the merge window.

This patch is included as a part of this series, please see the patch #6.

I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
but there is no stable branch there.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next

>  It's also not clear what to do
> about the DRM bits, I guess it's probably easiest to just apply them
> along with the ASoC patches.

I already asked Thierry Reding to take a look at this patchset. He will
let to you know how the DRM bits should be handled. Hopefully this
should happen tomorrow.

We will know how to move forward if Vinod and Thierry will reply ASAP.
Otherwise this series will have to wait for the next cycle.

> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
> 

Noted; I see now that it's indeed not clear from the cover letter that I
included Arnd's patch into this patchset, sorry about that. I assumed
that you will notice this after looking through the patches.
