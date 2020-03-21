Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF618DCDC
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Mar 2020 01:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A62844;
	Sat, 21 Mar 2020 01:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A62844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584751899;
	bh=zH7oNjjOvAJqSptIJ7W8RuBrZiiZWsYhZlx4VOab54w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzvH0/jG11F0eVV9/vIIQgWDw2sVhHYI8JJbVgwBYTmCewfpOqPHEwrWSEuCpjBL3
	 nzk3BlFK+VqKJgi3NmeT0ajBNa3g/8XDKqwupd8so7w1r8vzgRthjhuil7M2WJcO8d
	 i7RfuOMv9p5GoSeG/0U87lrAR8NH0eebXNXUhd8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8928F800C0;
	Sat, 21 Mar 2020 01:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E54B4F8015B; Sat, 21 Mar 2020 01:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB466F80126
 for <alsa-devel@alsa-project.org>; Sat, 21 Mar 2020 01:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB466F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uZ3Avk7s"
Received: by mail-lj1-x241.google.com with SMTP id u15so8134863lji.10
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hfTzf6AkODc+KHzE3s2ZnR2MPNAojxSRMj8xOLinhFw=;
 b=uZ3Avk7smEVbod80RzW7uRr6ijNtsqyaJdy3tnFO6K5xUOHId0xQS/6taPTQAHYmV8
 twvZXk/+MpZrWG/SOHy7OfEJCkF3Hr+MY2NQ+tpsErU8711gBYwqjCV5GqPVsFwnFBQM
 BUkZPs46woWRQruYhlE/WJd6qzMKcJFbpVt6jvmqpGoDhNNAsvWNNhvE/qvS8KDTazVa
 zdJw9VNPr+HwEti4V6IHD7deRzwG14hwIbTFHaVJwGHhGraiNXSRDT20pNAPZU+QNBsL
 NAHyJsSvsKZkUtGl2Jg1R+InTgY7Fp2besemwjIrpTsPBQCTN2y05a5wZ8h0cVydVTS9
 wm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hfTzf6AkODc+KHzE3s2ZnR2MPNAojxSRMj8xOLinhFw=;
 b=s7ZImqYi8oZtlmmLgveMOuucsz4dGGSrbsBVzLPQ4JgZMMEXM0jDg/TI+fuv02/Czm
 B86VYjSKJOh0jeiy0QPEEu+3oNK84Wri+7Q0YJpy0R/N1gvOYIOFFb4WemNSD87aaRmC
 6WYefOAZBWBI1JL6pVUdVjcg2jDYzecGlZmdGE5YsSoVVpl7mkaNxURWdku4n2wqOIYa
 djvgWZl17Xe/vqVisIVcEOMmlLB7V4IhBJXGEfmqU1hwvZLj/1uQxDkEL+vLk9Y2st56
 DEPngvWLp16Mdg6BrZRaqU9ostiBWFQxrt38mi5KlvpRScv8qhiyT0tkRGBKPG+/kOsy
 UgEA==
X-Gm-Message-State: ANhLgQ1mS0SF9LToNWz3Qugo0X7hhl3yRrTEKJGP233TgJOzCiQkABGv
 Jqr4cvh2ajzayu3st1uo9Ck=
X-Google-Smtp-Source: ADFU+vtonjhhEKMbX+G14ChpIgBEzsZ10+qImyxwJ+S+brN4HJLsOs9NIn81D5tr8u0qJosVBYu/Vg==
X-Received: by 2002:a2e:964e:: with SMTP id z14mr7248148ljh.44.1584751791010; 
 Fri, 20 Mar 2020 17:49:51 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.googlemail.com with ESMTPSA id q4sm4194078lfd.82.2020.03.20.17.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 17:49:50 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Support built-in Mic on Tegra boards that use
 WM8903
To: Stephen Warren <swarren@wwwdotorg.org>
References: <20200320205504.30466-1-digetx@gmail.com>
 <c27c2087-14cf-614d-a8c0-05072a54f24b@wwwdotorg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2f5c1082-2ce9-dff1-4f9f-3442a2ac51fd@gmail.com>
Date: Sat, 21 Mar 2020 03:49:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c27c2087-14cf-614d-a8c0-05072a54f24b@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org
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

21.03.2020 01:30, Stephen Warren пишет:
> On 3/20/20 2:55 PM, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series adds audio route for built-in microphone on NVIDIA Tegra
>> boards that use WM8903 CODEC. In particular this is needed in order to unmute
>> internal microphone on Acer A500 tablet device. I'm planning to send out the
>> device tree for the A500 for 5.8, so will be nice to get the microphone
>> sorted out. Please review and apply, thanks in advance.
> 
> It's been a long time since I looked at this code, but the series looks
> plausible,
> Acked-by: Stephen Warren <swarren@nvidia.com>

Thank you!

> (I wonder why machine->gpio_int_mic_en was already parse but never used!)

Perhaps there were plans to support it later on, but that never
materialized.
