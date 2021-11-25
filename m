Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F445DB34
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:37:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D2018AC;
	Thu, 25 Nov 2021 14:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D2018AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847456;
	bh=/xOSFa4hjFwNkIU9rvHExUyDUyu5pgieLK4Z8YMNDwk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFYtRuEWy74s6oD61Sd9HHaW/Pjkzxw1hOwDbbDf5G7DlwB8EJ4OzcsxLaRst7odF
	 gMaWclOvYh/1V1byh0WJBIOeaGSgKzYYKWLdbW4ts6mY/7kCgImUjGMF2F4Ia550HQ
	 vdBsB7tdjroOiip1yLrfT+EZcJkY3dpUSH/fCCJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98C16F804AB;
	Thu, 25 Nov 2021 14:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB93F8049E; Thu, 25 Nov 2021 14:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E64F8F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E64F8F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ab7vU2Pr"
Received: by mail-lj1-x22d.google.com with SMTP id l7so12574605lja.2
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1aDhKAkGw4wZ6NAcrIuNHy3/tUUw7G2pDuc4j6zpXek=;
 b=ab7vU2PrSnZcW5Lt23jt2x3KHTBi1zjV9RDh4+db+RcX+XbOqx2hj8Nw5hhuiL+nbO
 bQNFw5mtbsmO2cR3hEZ02xMDm3DScIRqA2wHWwbGxq+bNvpPwgdUIYHVsAlWPs9fbddR
 iFaawTWHEKBNzd3AHTiL8FM3PZ24Ttp+9xpQ46cXX4czzAubJ3YkuBtMJQnMscmVMlXf
 Ohwu3Q/BUKjgmE9i0kwyj8MeY7zYhz+6aqJBc+G6xnzweTiuNLe7qieltqfXiVzh3x1O
 3XxTBmPHVE+j6ffxByY9Cwg3nvUA/4TM0O0icjuLrb8vCAaiYztODZQoJMrwS6uvXlrL
 THWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1aDhKAkGw4wZ6NAcrIuNHy3/tUUw7G2pDuc4j6zpXek=;
 b=Qhey7tGexyOsbtPaHcxnGISzrIPa43j5M0WhqMKb4lS3WBDkK6PIqbw+3dojnI7Pqq
 8aLScYjI82XnqnufzTDUdK2QMh1tFrsuUV3qWM8/FiOrnYTEYpwuNyYLYaI7Xck1a6sU
 /hhcIFQ6j9rdsYR9MSjMXxZlaZHVR0iN4ndOl/UsWRu/bciYQkQMdTxPauw8h/FevBEG
 FTaHfQNzujm6R8VczrY7qTMaHtZSJnobjY0kIqVk4M/J3xjm5c8kJ0A84S2R4BiPjdIy
 N5HBMnvJuPY1P8yEd8ilEWQOtTU3FvK+7tZ2AmRkV3PdOkj8tLXwMCZAKeE5y5yfb8Iu
 UG5A==
X-Gm-Message-State: AOAM5324QhKZ0LaMjM1K903bmMoGEtnaBBr8e2iZXIF5zMhkUlJO7G0i
 Np6CGL9xJKPQwCpKznw8w+8=
X-Google-Smtp-Source: ABdhPJzj6H/14t2w1E6YXs0IJStRjhS9UE40vBTefi2svIoBYbe/BmV1uhLJ+ysOYxj2eWFChxx/oA==
X-Received: by 2002:a2e:2ac1:: with SMTP id
 q184mr24595407ljq.420.1637847364540; 
 Thu, 25 Nov 2021 05:36:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id h24sm224319ljg.106.2021.11.25.05.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 05:36:04 -0800 (PST)
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
To: Mark Brown <broonie@kernel.org>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com> <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
 <YZ+BZRB0sUC08lCs@sirena.org.uk>
 <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
 <YZ+NF8zHqGYfL9eF@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <184c2f65-ae49-bb7d-345f-091a29033b7b@gmail.com>
Date: Thu, 25 Nov 2021 16:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+NF8zHqGYfL9eF@sirena.org.uk>
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

25.11.2021 16:18, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 03:53:52PM +0300, Dmitry Osipenko wrote:
>> 25.11.2021 15:28, Mark Brown пишет:
>>> On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:
> 
>>>> This driver never worked before this patchset, hence there is nothing to
>>>> backport, this is explained in the cover letter. But in general you're
>>>> correct.
> 
>>> That's not going to stop the stable people backporting things, and I'd
>>> guess it might've worked at some point on some systems - I'm not seeing
>>> anything that jumps out as making the driver completely unworkable in
>>> your patches.
> 
>> I can change commit message with the "fix" word removed, this should
>> prevent patch from backporting.
> 
> I wouldn't count on it TBH.  In any case, definitely no need to resend
> for this alone.

Alright, I'll keep this in mind for a potential v2. I guess Rob may ask
to remove the assigned-clocks from S/PDIF DT binding because I just
found that there is no needed to specify that property explicitly anymore.

>> This driver never worked in mainline because S/PDIF device was never
>> created, thus driver was never bound. Driver doesn't work properly
>> without this patch. Nobody used this driver as-is before this patchset.
> 
> Someone might've been using it with an out of tree board file, I guess
> on an older stable at this point.
> 

I'm very doubtful. Still, this patch could be easily backported because
all code refactoring changes that potentially may cause merge conflicts
are made after this patch. Ideally, if we really needed to backport this
patch, then it should've been one of the first patches as you suggested.
