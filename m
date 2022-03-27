Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D28D4E88B4
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 18:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B641621;
	Sun, 27 Mar 2022 18:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B641621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648397563;
	bh=hfhEv3NUNivu/NvdYHyHu6kr7zV/vop0QEzrtq7T5cc=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vm4LMKGPJ9LosRgCYWdWUayu6o3gWPY7gGUIyxjbEWddJQFC3lWrkqyGwBxxbR+hm
	 v1oNjgcdB+IbZ7qqrxaeFFQgxvg8+DUW3kJKcEZB7Fe4ETr6Kdhtwnf1jVXX5mbFYy
	 KINTEjZrbBsiz/6nPHL61ZsW8iPXBYX74obbBC2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AFEF800F8;
	Sun, 27 Mar 2022 18:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5A4DF80161; Sun, 27 Mar 2022 18:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9955CF80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 18:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9955CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="orqlMfSr"
Received: by mail-wm1-x329.google.com with SMTP id
 r204-20020a1c44d5000000b0038ccb70e239so2231934wma.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=6GFJ7ancB1plEhfgVzWZYVl+G7Gv/ojaNkdikZ/2jZg=;
 b=orqlMfSrIwbyWYkxZvplXPR/LEXQlsFsphWNY42yJ+k9AqwBhabrHAiJkEGgEJQ4c5
 tVuDgtkcZUw1pUawPj2wupbIlL/noe5AYE2CHM7E0rKnye5waqjP/HxuCyT9FwuCnpK2
 xsMGqznycLaxDy5IQwMEQWsmr+IyiRLbLY0HGQDcchsthrw8OOApWaGgBVIrBl4JiXAj
 2/vaEs0dJJXrLC+rjpwDoOFI8FYSXTIWoUMrh6rMex8x0zFj05tukxn4PUD+cmQSsaMr
 JozTSLpuTmfQepoKzpTN39+u5OADe14u/40UVQWLBl4P62b8cwQ7VuhzncUvLB52PfFk
 c7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=6GFJ7ancB1plEhfgVzWZYVl+G7Gv/ojaNkdikZ/2jZg=;
 b=0+lEm7CDr65IwG1SFegAKr5nHpxMQGcoFw5RaXylgj5xsHg3QDBOppZf4hpbDAZgiI
 969Js0+ki7mhD4YuNmcs1XhlovzHFaaPyAzJ9h3kOQCsxVgOJJEqScwaHPWpTUXiIlvq
 JZ7rXseZr0DvUjW7AaroE7bSJA0fHNhMhSBvgrdY2YiagsInasDtPGpN8e9kOSarAmGq
 B+tkWPoIFDHE8DJxXX3+HFF+S/u6U5341x3GQvzRa+IotEQrRAkf4euhRTvIBYvg1Kxo
 AyPcdl84FSDao8qdrZyZzMEoXnlWdB/cFkxR1S2yxrxPTBbTxJRW/G2WM8lRIvPRo0iX
 UHHQ==
X-Gm-Message-State: AOAM5309SRUw2Pg3G4zMR0voy5kcEXf5Pz9MOmqpaYPK8nll07tQlzlB
 2E7S4ZjNBwoae3gu4u9NLAl8Fw==
X-Google-Smtp-Source: ABdhPJxkS2ERSmOVuz2DI45w4YukiucqyQOcslY68QODGIq7pyctREMo4NgaLnq/arb34R/RiBevjA==
X-Received: by 2002:a05:600c:5029:b0:38c:9768:b4c with SMTP id
 n41-20020a05600c502900b0038c97680b4cmr19962707wmr.123.1648397486308; 
 Sun, 27 Mar 2022 09:11:26 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm9633355wmh.33.2022.03.27.09.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:11:25 -0700 (PDT)
References: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
 <20220327130801.15631-1-xiam0nd.tong@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 18:05:26 +0200
In-reply-to: <20220327130801.15631-1-xiam0nd.tong@gmail.com>
Message-ID: <1j35j374us.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com, tiwai@suse.com,
 lgirdwood@gmail.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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


On Sun 27 Mar 2022 at 21:08, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:

> On Sun, 27 Mar 2022 13:03:14 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>> 
>> > The bug is here:
>> > 	*dai_name = dai->driver->name;
>> >
>> > For for_each_component_dais(), just like list_for_each_entry,
>> > the list iterator 'runtime' will point to a bogus position
>> > containing HEAD if the list is empty or no element is found.
>> > This case must be checked before any use of the iterator,
>> > otherwise it will lead to a invalid memory access.
>> >
>> > To fix the bug, just move the assignment into loop and return
>> > 0 when element is found, otherwise return -EINVAL;
>> 
>> Except we already checked that the id is valid and know an element will
>> be be found once we enter the loop. No bug here and this patch does not
>> seem necessary to me.
>
> Yea, you should be right, it is not a bug here. id already be checked before
> enter the loop:
>
> if (id < 0 || id >= component->num_dai)
>                 return -EINVAL;
>
> but if component->num_dai is not correct due to miscaculation or others reason
> and the door is reopened, this patch can avoid a invalid memory
> access.

This is a speculation which just does not hold ATM. What this patch does
is adding dead code cause the last "return -EINVAL;" will never be
reached.

This no fix nor improvement.

> Anyway,
> it is a good choice to use the list iterator only inside the loop, as linus
> suggested[1]. and we are on the way to change all these use-after-iter cases.
>
> [1]https://lore.kernel.org/lkml/20220217184829.1991035-1-jakobkoschel@gmail.com/

You can make improvements as long as the code is kept clean an
maintainable. Dead code is not OK.
