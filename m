Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEC30C6C2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3886B176E;
	Tue,  2 Feb 2021 17:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3886B176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612285172;
	bh=itWR1yuZCOd5wbdqyF+Qv2/jyc5kRLJwLtPxrn2Ea/U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSr0NIrINtGAB+LPcdoKJ3YO16aKsn6rSshA//K3UmNPGQ6Eun08QmzEtTRaJEfbz
	 +I5509cZ04/A2w35XkHR1p4cIJ6F/PLl0mtVjFPw+JkeH0534Myik7Qb3kvtZVYrgs
	 7N6Hzp7c7goBxJe2gzWOco3w7rG0NwSUSkWDpzbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECA5F800E1;
	Tue,  2 Feb 2021 17:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A24FF80171; Tue,  2 Feb 2021 17:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EA3EF80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA3EF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lbpqq56s"
Received: by mail-lf1-x130.google.com with SMTP id f1so28978028lfu.3
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nwpPlS9MjT737XxxcrUZtECdOnIxemsu+NrondIvc+8=;
 b=lbpqq56s6LvejvAeOwCQmGbMeFB+iKVoCg4snZ1Ev8Jqxtb3K9240iD4L17QHxadTO
 XMIgeiSMoq+oGmO78p/lVO4YlEkfbu87ioa/GOgsE+K3ye98v3fPQgpffsAoDPlCw6kd
 BUHwJHWM6etsUBjZenEmUzMbl1wwTsbL7ZVHzLQtfod9chYgEi+wEkijo8bMAW5TC3Eh
 w9RCVQ4bdAfz3YeGlI2Yv39d1vtO2ZeipPdSURbWrloWKK/aNANcJYm57Q+dK33JaHoK
 F4tJerPMfNMwQtFBlY0A2Utuj6dHxabR8wTYAbWF/vciPB/skI+UE43D/cG8IiuKzI6C
 MDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwpPlS9MjT737XxxcrUZtECdOnIxemsu+NrondIvc+8=;
 b=PeWFKZVVDY9x8Vbo6hu1CqF4DInxr2jCmtLH6Kru8q3CaV9mpYI9letiPcG6jIzm6y
 pwyQ7vlX4tczZNiAkFr3Qcyod+rIVbVvVAE3BhyACgigYmrHEMQ2cG0SZc3Jm9R16bmN
 LhHI9JqALrnYwxWPONf6GvxmCQeX/+gHEqgSjCyv6ghQeqDDU8J64mHEb2Td2EWvqn7y
 m6/5IkGNUkQxkAJpIlDTdrxrFyMuGt6cggjFp61pjkiUnrdHWcFI/UTqKDo4spmqiy0k
 E/oEvSMLSPRoF/hna1VTjW1uuZFT11GqK6+48lPtjsJmtO/kDnmNEJVOhcKiW4pT6F2W
 /JfQ==
X-Gm-Message-State: AOAM5302ASUPuuJ33h4r2Rs/gei4pdtRHJLT94B6ft5l2FnfzhoIDn49
 L6LhMv+ZGBmEIeyEpTxpxPA=
X-Google-Smtp-Source: ABdhPJylGmwbmiAU0xzI+fDP1qXJu7D4drYkzhizCth3IZP0qIWWEH8U+ZpYlF3q69KQJEaXekafWw==
X-Received: by 2002:a19:e43:: with SMTP id 64mr11085733lfo.642.1612285063231; 
 Tue, 02 Feb 2021 08:57:43 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id c6sm3366314lfc.11.2021.02.02.08.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:57:42 -0800 (PST)
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To: Jon Hunter <jonathanh@nvidia.com>, Ion Agorria <AG0RRIA@yahoo.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
 <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
 <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc0d7a20-f5ef-e8b4-6be8-ac9879399023@gmail.com>
Date: Tue, 2 Feb 2021 19:57:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

02.02.2021 19:24, Jon Hunter пишет:
> 
> On 02/02/2021 15:25, Dmitry Osipenko wrote:
>> 02.02.2021 16:22, Jon Hunter пишет:
>>> So this is very similar to tegra_rt5677, is it not possible to support
>>> both codecs with the same machine driver?
>>
>> These codecs require individual configurations and those
>> "../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
>> quick glance.
> 
> Right but not all of that is needed. What is actually needed from the
> header files?

I recall that some downstream drivers were doing some special
programming of codecs. This is not relevant to the current upstream
drivers, but potentially it may become needed and then that single
driver could become unmanageable.

>> The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
>> driver should be a better base anyways.
> 
> Sounds like a good time to update it :-)
> 
>> Overall it shouldn't worth time and effort trying to squeeze these
>> drivers into a single one, IMO.
> 
> Not sure I agree when these drivers appear to be 90% the same.

Of course we could try, but I suggest that it should be done separately
from this series. Certainly it will take a lot of extra effort and this
series isn't about improving older drivers, it's about enabling h/w
support for the RT5631 codec.

It shouldn't be a problem to switch to the common machine driver later
on if this driver will turn out to be feasible.
