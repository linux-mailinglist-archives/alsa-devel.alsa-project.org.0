Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EF36C188
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 11:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C290D16EF;
	Tue, 27 Apr 2021 11:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C290D16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619515093;
	bh=DmsDRdqaQXHs8n4RbTeNM/UT/nXG1Oq9TyhyW+b8Ogo=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUTlrVUUw1YDMpFYkq6ydZbt6AL2W7vmMrNJTO1cHcnn2Q+DOK1XSnMf3KolYU8n3
	 XgFmPkhB4eJsOv6yfaHGdlGb5nkrtHOSjr1wP/P0IuGVRMGRquE+Y++0ajYPFHrjQe
	 q7YzSOa0G5pL9PX4pIj3HcylQqV3yuF0H3rPq0QU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BBDBF801ED;
	Tue, 27 Apr 2021 11:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8227F801EC; Tue, 27 Apr 2021 11:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486E9F8012A
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 11:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486E9F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="a3DodOtE"
Received: by mail-ej1-x635.google.com with SMTP id u3so9825178eja.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=3FMaIVb8+hPFpxss5sahNQQAV4tk/aH70tObk1XSyTo=;
 b=a3DodOtE+Jfr8w0k55wnvesDq6Ad1kJ3Nzs643Zi5aUe2x8FpA9ebXVxMuScGfO6zH
 GYeU6t1jCjrbXA8o28zyp/EeHZOZfD1nk4NLlIKQTykZMO60kXnXrwbtn5x0g8Dfwf+H
 X9T2/avLw8IOqi+Cdy4XWL2TU+TlME4jcp9ae45reV1qFCZzktoyvNwCupx046zHliFG
 idbquqQLmx77XWniG/cRMPrbnF4Z6IcAazO8dWIoDFafHeORd2vEFIWK2/bGi6quKy1W
 p+uboZ5bsDCA4RxrlrPZctisMkGFBBRjScpC85KPw7locMBkZU+DXPrIMu/bZbiWuzcW
 POOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=3FMaIVb8+hPFpxss5sahNQQAV4tk/aH70tObk1XSyTo=;
 b=DXJhXC11h5H2V/TtRVFGtSVr1WnPFmIT78UtYmrWQHR2KIHRDTImg1nxsC59LBvju6
 hYBuHtWamnWX2PcuOVLvGX9RROM+3aHjsofRvEZ7zCqP3bpFmS3sEUpy01rAOwprQZbl
 FcMKfFv/zKkwk2Xph2mQ7NTLpkvgmGh4eLbfeHuLdAY6+OMlteghwXpo2htZ3N657o2L
 v8kMhfoLiKzzDpF7MlGOHoXdThKAHiyX75pUs4KsFtv015+08UUUEgX97v7CN6H7Q6Qe
 Gd/9uYJNcTBhNxKa97wXMdnFJ2U2DUH02lMq6ezmTFzJ4f3guw+vBerHUKu3CIBx+mYn
 ghRA==
X-Gm-Message-State: AOAM531iNCAqJi2UWC1RcmJsgmtjBGPcEoZXGwYC9E4jLeV2kv/m/YCi
 SKGfEYEWlfPDuDKKoC8PTM62tA==
X-Google-Smtp-Source: ABdhPJzFQSE5nXxK1ZEsw/o7nGCfYS0VpmMvK3yFH2ZUIwIOI9kQdemuWgqMHr9W+MFNsjuyBIl/YQ==
X-Received: by 2002:a17:906:4a89:: with SMTP id
 x9mr22239297eju.121.1619514986710; 
 Tue, 27 Apr 2021 02:16:26 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id aj8sm96757ejc.64.2021.04.27.02.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:16:26 -0700 (PDT)
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
 <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
 <1j7dkon8jy.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
In-reply-to: <1j7dkon8jy.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jim48jdee.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 27 Apr 2021 11:16:25 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


On Mon 26 Apr 2021 at 21:35, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 26 Apr 2021 at 20:10, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>
>> On 4/21/21 7:05 AM, Jerome Brunet wrote:
>>> Instead of using the clk embedded in the clk_hw (which is meant to go
>>> away), a clock provider which need to interact with its own clock should
>>> request clk reference through the clock provider API.
>>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> This patch seems to introduce a regression in our modprobe/rmmod tests
>
> Really sorry about that :/
>
>>
>> https://github.com/thesofproject/linux/pull/2870
>>
>> RMMOD	snd_soc_da7219
>> rmmod: ERROR: Module snd_soc_da7219 is in use
>>
>> Reverting this patch restores the ability to remove the module.
>>
>> Wondering if devm_ increases a module/device refcount somehow?
>
> The driver is the provider and consumer, so it is consuming itself.
> This was the intent, I think the patch should be correct like
> this. Maybe I overlooked something on the clock side. I'll check.
>
> I'm not sure the problem is devm_ variant, it might be 
> clk_hw_get_clk() simpler variant which also plays with module ref counts.
>
> I don't have this particular HW to check but I'll try to replicate the
> test with a dummy module and report ASAP.
>
> Of course, I suppose the same problem applies to PATCH 1 of the series

So I can confirm that the problem is in CCF and the function
clk_hw_get_clk() which pins the clocks provider to itself.

Not that many clock providers are modules and even less are getting
removed. This is probably why this fundamental issue has not been
detected before. Thanks a lot for reporting it.

Mark, at this point I think it would be best to revert patches 1 and 5
while we work this out in CCF. The other patches are not affected.
Sorry for the mess.
