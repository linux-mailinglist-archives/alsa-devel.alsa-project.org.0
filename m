Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84068B7C2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 09:53:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB921E8;
	Mon,  6 Feb 2023 09:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB921E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675673633;
	bh=ya64Q58j5GlS353Wojf+Y9hSaDTrXmnXX+lgPAnm7oM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X607IqwxTvGeilYtbVoi4mM02OktTbENXeg43G9XToH68bKCgBB/KQ0HMp3v+UQs5
	 FitL+qEl9L2n+pqeJf9qN3/tcTpxtgudd4eRO15kFWIOCXMngXjMnGwJkxWUK7wRrE
	 IZmW0QmTOJaFzLH6t1YEH3I+5wNz1O2Sw/quPatg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16364F804FB;
	Mon,  6 Feb 2023 09:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF0FF804F1; Mon,  6 Feb 2023 09:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A287BF800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 09:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A287BF800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DvD9DZlE
Received: by mail-wm1-x333.google.com with SMTP id u10so5039865wmj.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 00:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90ne2Gei+m07JIsYwNJAPNCWiAJQqYUs/YX03YMrRtU=;
 b=DvD9DZlEetWOhA16GpsQh+WdueyMVuLYOxBWPbTTRtJXTUsIt7PLFOvCw+merNCw+k
 /K23A1GmKBzvDL7fJbzBIYyR5qLM+2mu1/KgoKvAFeGLucolkcFhL5CIZc9RJcYSK795
 3Tr9VMchuXbAaNJ0VAkN3YE+xVpb/lkcQEC2oT9dCG1/qVmc1YwMn31Dxtw/AfKRc1ai
 VVl75hharixk/47SQ2XvFaf9or9GHxyH4kBK02UgFTm6qsK9VwT0J4ALSDh/QHTHJC7B
 ZkgGpLbASC8jO+PBe2pvQBHW1oDECEpARHqAtlR+fRX3RophpSWt2uooWPZ0bzyCgTaK
 mEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90ne2Gei+m07JIsYwNJAPNCWiAJQqYUs/YX03YMrRtU=;
 b=gJAKlS4jfwsaukfXve1Br4urHDpVjNPyjTZiPLmxRMKNCMWUAKFyZannWS7VuSvqlN
 L0ZIHPzYQ68in9Yn8b97I2Tkl+/mLNT2q1Y1K/+/Jy/ksANk2+o3Nh7tEljaPjryh0BA
 3g3cws2ydYqkkb7vUhTKBz+ZBol/Cy3HObLAHLOkEBNXHJ1JIAkmtRkh5RsRFaeax5Ti
 73DejHByTAX+6CgwrnWIuicFJrEm2YSm2xIJ+7huOM21fbo5wICcifJwvaqM6O87xEB5
 3IQ4HfH+fjk6izX2XDD2Id6zoV/6zUoy2tpxcGg2EBMuucQ1BlbQxwBbZjy6w4orzuNm
 k++A==
X-Gm-Message-State: AO0yUKWUUIPcTnATzolOiJLHHF3Pe5jQk1LbXBOG5R7CFoG1Co2VjW6z
 AKY/rccEwxRKnlMfbfQwWgkB1ozUUWU=
X-Google-Smtp-Source: AK7set/T1A1627Yia0MGWfwgmWMTRqeySbZ5A/oz75VubWzCPLJ45vrzLo/n+8t3FhGlOEbzjLd6OQ==
X-Received: by 2002:a05:600c:154f:b0:3db:1d7e:c429 with SMTP id
 f15-20020a05600c154f00b003db1d7ec429mr18485278wmg.40.1675673558741; 
 Mon, 06 Feb 2023 00:52:38 -0800 (PST)
Received: from [192.168.21.204] (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002bdda9856b5sm8309064wrz.50.2023.02.06.00.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:52:37 -0800 (PST)
Message-ID: <4a1eb148-d246-7a10-9eac-57408d57cf74@gmail.com>
Date: Mon, 6 Feb 2023 08:52:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-GB
To: Jaroslav Kysela <perex@perex.cz>, o-takashi@sakamocchi.jp,
 pierre-louis.bossart@linux.intel.com
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
 <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
 <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
 <e2ab7f52-4fc9-bcff-5051-5590ca4f8496@gmail.com>
 <fa44f39c-4dea-5433-fd89-1286ed6a94da@perex.cz>
From: Alan Young <consult.awy@gmail.com>
In-Reply-To: <fa44f39c-4dea-5433-fd89-1286ed6a94da@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On 04/02/2023 15:40, Jaroslav Kysela wrote:
> For 32-bit apps the boundary is near to UINT32_MAX (see 
> recalculate_boundary() function). So only one crossing point is not 
> enough to cover a decent time range.
>
> There should be a better check, if the add operation crosses the U64 
> range for snd_BUG_ON. In my eyes, it looks safer to use counter here 
> and do the checks
> in the function which uses this value. 


I think you are misunderstanding how crossed_boundary is used. It 
relates to a single call of snd_pcm_update_hw_ptr0(), which should be 
called once per period, or at the very least once per buffer-size. In 
its processing, it may be detected that the boundary has been crossed. 
There are three separate tests that could result in this but only one 
should actually happen during a single call. The snd_BUG_ON() is just to 
detect (report on) a failure in that logic.

None of this restricts the total number of frames that might be 
processed, as a result of multiple boundary crossings.

Changing hw_ptr_wrap to be a boundary-wrap-counter instead of its 
current use as the cumulative number of frames processed at boundary 
wraps would not make any useful difference.

Unless there is something else that I'm missing....

Alan.

