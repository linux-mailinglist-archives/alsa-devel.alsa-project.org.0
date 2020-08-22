Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F724E94A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Aug 2020 20:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B27C166F;
	Sat, 22 Aug 2020 20:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B27C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598121308;
	bh=U580NZWa7zqpaSO0tNjys54DQKjuT642Kf8THIdUgDo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ls7+6ztj0tLWBp7A7otiPukzKa8IzZjvYFD8ofabWaLOpBmwZCXpRuCley5zU+M0B
	 0eIyR1oYDBI0zMZSl/96xELOMxYPv7GD8rUTcsUSJUwHpB7IwP0c1mz+eJ+35x0yPp
	 B2Crb9HsinLHQdnTA6R4rneUQADTENdtTVdNb/m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BBCF8007E;
	Sat, 22 Aug 2020 20:33:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA2BDF801F9; Sat, 22 Aug 2020 20:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B99BF80149
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 20:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B99BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UMGL7467"
Received: by mail-wm1-x341.google.com with SMTP id u18so4730878wmc.3
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U580NZWa7zqpaSO0tNjys54DQKjuT642Kf8THIdUgDo=;
 b=UMGL7467DTJb8+SJPT6QSCses9xr9mdEM/lwCiWl6mh5yta039G9x5zLvShgCcH+6Z
 0o5dYojwQ+Bqf+niqX0/1rv4PcV3USs+v+PvFc2ArS+uArFJs4wJgIxnEIfaL4tK1f5h
 XruPeU/IpASORuexX9rKHmhKDHWYsTvQjEy5iuOcGf8y/KTZ1D6AvTVoegLeycQxjnHc
 2Nt8MLB71syftHXYDGeqYwih/2GbO9oEedS3eiuRY4cL1nc4pRCcrQ/Z/C7+73+nqamM
 RQw0//6zSXQAeXA7DMCjtCZnb/e/LpFUwUuIZKDeQ+uDCFIc86b2iPtV4XtRbMaAz9+k
 HvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U580NZWa7zqpaSO0tNjys54DQKjuT642Kf8THIdUgDo=;
 b=E3Lx5qT/yV538YMo2bajiJyXJuXLMID+0EiJt6aQndp3gu74ZUq3O0MeenhFjmuFyX
 U43rFqYwZ1x/vI/gF83q0RjcWFWP3SAckqw1Ji0j3jZH2E/rx8RxKCpADfwYxCmRQZaJ
 V8eWGZiWYBPFkT+qQQp/ItPRVnWws14K0UdGJa8/g6d3ZXShVJ1UrxvTGKG53MnZClCL
 7toKQuP1BqIOJVT5qvSvwgVaD9kYeJpcg/FiIsIWAWHzyUBdCJ9I67bJdegOA+IS4ru8
 XysDfpgDbTOf4p6q+6oAZmQF+m7f8cLADsqG94erPA88AExX09PcUYWQx0hGpDhx6ra7
 Z0zQ==
X-Gm-Message-State: AOAM5307jN8g4vPYUy2jKGxPhQRqgZcA+lGGxvxf5L8Zy2+jVlOa7Y/A
 kiRLaMyeTdNf5J7+I+HLWG0=
X-Google-Smtp-Source: ABdhPJxqDeaOBf1mAITXMQbPMEUZK4P+Gr30pgc7bARwHKBW/VJolnhWGxVARh+KFnHauTqm9xnxzg==
X-Received: by 2002:a1c:3c0b:: with SMTP id j11mr8264889wma.98.1598121200625; 
 Sat, 22 Aug 2020 11:33:20 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id o125sm14115318wma.27.2020.08.22.11.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 11:33:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] ucm: Add JackSwitch definition
To: Curtis Malainey <cujomalainey@google.com>
References: <20200820233205.505925-1-cujomalainey@chromium.org>
 <b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com>
 <CAOReqxiS6TKxo7REebEs2R22Es1_kgzeq5OAhHONBZ6GYjeyWw@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Message-ID: <7160e4a2-886a-dc04-b47b-48ca8eff812f@gmail.com>
Date: Sat, 22 Aug 2020 21:33:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxiS6TKxo7REebEs2R22Es1_kgzeq5OAhHONBZ6GYjeyWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 22/08/2020 20:07, Curtis Malainey wrote:
> Typically we use JackDev over JackControl, and this would add similar
> support to what you added but within the context of using an input
> device instead of an ALSA jack.

Oh, I forgot JackDev was actually an upstream thing and thought it was
ChromeOS-specific. In that case I can't really object to JackSwitch
either.

Still, problems with jack detection are common for people who want to
use ordinary Linux distributions on ChromeOS devices and from my point
of view it's "Google makes their things run on JackControl" vs "Someone
makes PulseAudio etc. support JackDev+JackSwitch" to get things working
out of the box in the future. I was trying to propose the former, but I
don't know the merits of either approach, so can't say much other than
that.

Regardless, I appreciate your work on reconciling ChromeOS configs with
upstream configs.
