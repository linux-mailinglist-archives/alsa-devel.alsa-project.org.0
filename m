Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06653CAAA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 15:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8DFC172B;
	Fri,  3 Jun 2022 15:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8DFC172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654262846;
	bh=MwA7m2ci/8lhdIQOjIUy+bj5e3NAB5R/W4jC/w8UH1E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFHnRKNEq/cl6ZsO7TIGMzGc2iQJdwnKy0pUJk8RrG//9QRGIeIIPFho57tqNpPLv
	 OBBBfctc8VgD0MKLuvpVIn0ajCTRRV099Cb31El1tZv5VOTe/Ru8EBGsQXOZKbuqPz
	 8BO/JD1Q/utJbfaYDLl33LD/AI84+kgTXLAv1i/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 109A6F804D1;
	Fri,  3 Jun 2022 15:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240A3F804CC; Fri,  3 Jun 2022 15:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46081F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 15:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46081F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eSXMy1OQ"
Received: by mail-pg1-x52d.google.com with SMTP id s68so7209241pgs.10
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=92oLMCKeonoMqFDJZ0Z1xzX0ntLYQdnC+gNY9jGM+/w=;
 b=eSXMy1OQFeiJ0irT7b+pNoF4F+VPngPDkaeHc3QSqTgbVgDwqfJfQ6nVBGvsc2FZIk
 hzkB44Sj54HnOwOi3NhJHutRl5yKm688ad4MMO7yPf50eP6BAXhUo+LCWiTj9rEmnkqP
 39ou/sn+B8+X5i3sdSWtJ98z2zDCHC1FzIGoNvCE9UEHRns7QQDhzzGHxpfWWE4EuOSs
 oEV0t2wO7tPM/EpiBlpGAn3J+da5f9c+zfdEDZALhvWrdbEnoqwsMh/TiGkMVZwppw0f
 2oAk+rUcP+gpIxx+ImdayYtrq0xlLIbbjuTB2mxrWLrXGXzh49yKNVPyWRe2dzUx1baJ
 IgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=92oLMCKeonoMqFDJZ0Z1xzX0ntLYQdnC+gNY9jGM+/w=;
 b=LeLdd7G/nv89eJNYGiPC1lIlI32UyONoXHYmXb1Lhn9zBowRvUqfCIU1dsFFHj7fXL
 IeJNwrOMuiJUMjj7C9DB3obff4Q820Xz+zV0jIeN/yUyNZhIFaRYTYbfJeFa3rocMyfo
 E7zJFkE29WjZvRDCD+t+cRoBrg01JjqOYHhQQjgVSWaJGqmVibVnNsf9lgPO9gn1oGpb
 DE4QNcFIy9GFp5AwqQdvcQBvtoU/Nro1xGy1zfwoEiQCcxIK0dJfo6BstXtnUEoSBUDk
 vfBxxqCaJF3i3iZeXPO9XFmzUDAsogz/m5vVp4u5VfC0yPIEPfezaTJ7AHzyMmi3JK7U
 TrVg==
X-Gm-Message-State: AOAM5319FaTCatjJWVSg/fggZpm3XyMg6Yw6xMk9K2aueAQB5OsV/yeo
 LOq67ITCs9iRZweQRuP2Q8k=
X-Google-Smtp-Source: ABdhPJxbQlD7ykGAqdDcT+js2FBaY9ETDMzMO78ZHLkAwom2Wk/sHiCNsIoXIks6bw3TSF02eqiD3A==
X-Received: by 2002:a63:1c4b:0:b0:3fa:c20d:1eec with SMTP id
 c11-20020a631c4b000000b003fac20d1eecmr9032038pgm.321.1654262781200; 
 Fri, 03 Jun 2022 06:26:21 -0700 (PDT)
Received: from [192.168.0.103] (39-13-101-104.adsl.fetnet.net. [39.13.101.104])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a630e02000000b003fa95b940bdsm5300149pgl.88.2022.06.03.06.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:26:20 -0700 (PDT)
Message-ID: <95d95e72-4230-a1c9-83f5-ed1449164182@gmail.com>
Date: Fri, 3 Jun 2022 21:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off and
 on
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Hui Wang <hui.wang@canonical.com>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
 <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
 <YpiR5ov8X/5yQACT@sirena.org.uk>
 <cd69d7e3-6a54-7438-b126-5962a8951ca3@canonical.com>
 <YpneCrGXLYeK9WB5@sirena.org.uk>
From: David Lin <ctlin0.linux@gmail.com>
In-Reply-To: <YpneCrGXLYeK9WB5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, ctlin0@nuvoton.com, alsa-devel@alsa-project.org,
 kchsu0@nuvoton.com
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

On 2022/6/3 下午 06:10, Mark Brown wrote:
> On Fri, Jun 03, 2022 at 05:55:18PM +0800, Hui Wang wrote:
>> On 6/2/22 18:33, Mark Brown wrote:
>>>> Thanks for your comment. But it is weird, it doesn't work like you said,
>>>> probably need specific route setting in the machine driver level?
>>> Is this triggering due to reprogramming the PLL for one direction
>>> while the other is already active (eg, starting a capture during
>>> a playba
>> Yes, it is. With the current machine driver of fsl-asoc-card.c, if starting
>> a capture during a playback or starting a playback during a capture, the
>> codec driver will reprogram PLL parameters while PLL is on.
> So your patch fixes that case - note however that you're probably
> getting an audio glitch in the already active stream while doing
> this.  I'll send a patch which should improve that shortly.  BTW,
> shouldn't the PLL power be left off if the output frequency is 0?

Agree Mark's comment.

By the way, when the platform's dai_link support be_hw_params_fixup 
callback, the sample rate will be fixed to same rate, so PLL will not be 
also reconfigured during playback and recording at the same time.

>> And in another case, if the  snd_soc_dai_set_pll() is called in the
>> card->set_bias_level() instead of card_hw_params(), the PLL will keep being
>> off since check_mclk_select_pll() always returns false.
> That should be fixable...
