Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E745DA7E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 13:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A5818A8;
	Thu, 25 Nov 2021 13:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A5818A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637844928;
	bh=2MCc04PDu9ARjjLpC/wdgiwYCydaUIXL8nM9YiqCmFg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jSR7T8laxAXJRffFXyzwPHvB75h9xYSfln3eqh1RAVdi9Rqz9hIcKHmhFyE6NbVrj
	 9BQJfcxpxoNL7zJjeaMSQaNKTLpKpxMzvW2Urt/iHdyqJnCXdRCMzb272gfMIpocov
	 DdnnkYf+Ga/44LutLtDmKIpIR8Hlk95Q3YiJi7vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93DB6F8007E;
	Thu, 25 Nov 2021 13:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6B56F80430; Thu, 25 Nov 2021 13:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5027F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5027F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oktqB96h"
Received: by mail-lf1-x12d.google.com with SMTP id bi37so16104945lfb.5
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Co+wBZHiOseLu7CK7UphzK0BLsQ6VV5mZ6eGuslWoqo=;
 b=oktqB96h7vZOItZGklHhm+PkXDcygsJhAUIroFnXj//gvB6OoF/lYcPjatrZAITeRh
 LKYeWYSWoIrkfV/rENrFvRbHWe/jDYBbFmY8tynbUZLFQksZt1svx9n5zfxC+ZzAn69e
 ci+aisbhNDgGnXjzLkpWJ/muy4AL/5Ix4ozfVNPdevB0/qeX0AnSPkif/58dlc0LDf1Y
 TiQX3udryAUjKmlcecArNEm2QqFiXEnALqXo/3XhpCrjg5zk7VT3IAMX0I6TmYfHfdFo
 Lm9c+BHxz6c3e2fp/xEBvQi87aA2LqkXbRHDtKxPfax3KIH6pOHiA2ik4MQhoEXmo4nW
 H9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Co+wBZHiOseLu7CK7UphzK0BLsQ6VV5mZ6eGuslWoqo=;
 b=yNGcrdVJFDC478oUFXcezl5zaOqV9PQn9MB85xcgzEBCGHvi+Tx0R6FB/gQ+Ru9yQt
 MJia+O14i3ZEY7LmtkdPCFjHCN0u6Zma1GhFHoRlixhKBePTfJcAxYZPYwYiqdQYARzE
 8Bu9CwH6UL4TkcVVluaoSnr7ViS2hLVMqul+7n3xL2Ba3ltZggo7msbgnq+X8ftCnv//
 86Hpp5j6DSLNI62uqE2oh3kVELd5P+opaBP3Ql4ubEHQGHHh2Gp3NVlGcm5By52kXkDe
 nk8tfmbhluZxCuiJjSFSLxmsONiNOGpsqqI8po1HmVMK5fSA9vP7oI00nUyjnAUOSwfW
 gqNQ==
X-Gm-Message-State: AOAM530C3Qz6WQIuIen7inflCbjfuvLZ7vlKkrOLNQVwwUYpPlLTmg8C
 jg1UWjuBNdup35RUsC3TwNo=
X-Google-Smtp-Source: ABdhPJy68jGQks+cI3kMem632OtGqJd3jo9wWEaciMGUlc8Z24BdPeoer1sbsgb8JnhBJSeu3hqFWA==
X-Received: by 2002:a05:6512:114e:: with SMTP id
 m14mr22880893lfg.418.1637844833711; 
 Thu, 25 Nov 2021 04:53:53 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id m9sm233423ljg.80.2021.11.25.04.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 04:53:53 -0800 (PST)
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
To: Mark Brown <broonie@kernel.org>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com> <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
 <YZ+BZRB0sUC08lCs@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
Date: Thu, 25 Nov 2021 15:53:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+BZRB0sUC08lCs@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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

25.11.2021 15:28, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:
>> 25.11.2021 15:02, Mark Brown пишет:
>>> On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
>>>> Program FIFO trigger level properly to fix x4 accelerated playback.
> 
>>> Fixes like this should really go before any new stuff so they can be
>>> sent as fixes and backported.
> 
>> This driver never worked before this patchset, hence there is nothing to
>> backport, this is explained in the cover letter. But in general you're
>> correct.
> 
> That's not going to stop the stable people backporting things, and I'd
> guess it might've worked at some point on some systems - I'm not seeing
> anything that jumps out as making the driver completely unworkable in
> your patches.
> 

I can change commit message with the "fix" word removed, this should
prevent patch from backporting.

This driver never worked in mainline because S/PDIF device was never
created, thus driver was never bound. Driver doesn't work properly
without this patch. Nobody used this driver as-is before this patchset.
