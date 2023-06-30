Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B69743485
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 07:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83817F1;
	Fri, 30 Jun 2023 07:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83817F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688103890;
	bh=iV4hRZZ8Uyl7Y3hScDikLY9nlGQ4sDf8q48JBokv9lU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iupxpSbwOejlsfU68s2xBIJDUVCrE/ZPvFXA2OJGU1SuqSpTN09dbEuOTog/C3FHR
	 6/fvbfSWT02qBPWo5mGY9lZfaY0W9xIwGfxEnt4EAa2NqKdntVtgLoQCFFnmffxojn
	 xzgoJQon74+Uhtqgdh1UJYzvZ+wHMeiGsWrUlYHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E095F800E3; Fri, 30 Jun 2023 07:43:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8436F800E3;
	Fri, 30 Jun 2023 07:43:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932CCF80246; Fri, 30 Jun 2023 07:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A89CF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 07:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A89CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ShY6QgMY
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so12421115e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688103764; x=1690695764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6H3Wh/u4h8U2hzhBkBZKlb9dLwPhiKplGCFao13VLdY=;
        b=ShY6QgMY+8oJf4I7rAttvpNGVQ1KvQO/4cKxqAcCdPX3+c5ECpQdewFuLRgXapjvu8
         khi9gPU2b6GQ9lg2FxW7pZxFaXzO62pXVGV541qdVr5jZ6kraRVWjEWNWXHAnxoXzQuE
         L10OL4rxncrXQV+MzzZz/NTA4XFLPq+YbEUzF7ZppyhlwnM2vyTxjzbVFIrEyPkcJh4i
         ja+KoAhJZ0vxv/ExTeb845+K9nmBAjJJ3+F7q37dNFdAEApf9IQELKQXJf7XupzAALUG
         UHirCJ8jbV4CAFd6eTJi0pHjTitwx88z0yC+/JhDVkE6r+pFZjijQ8sUgawvXl4zcJdg
         ZRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688103764; x=1690695764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6H3Wh/u4h8U2hzhBkBZKlb9dLwPhiKplGCFao13VLdY=;
        b=jrBoChYK6tiLNrNGVwWVhPE/1VFen/beP2jCD841Dol+Lk3Kg8IpA3G+vADVfwlWZz
         XVBua8F0VJgyObz2agBNgbOrrK+miITf6zgypykV0NxqYQwE4etna3Yb+GQzjZvpmZKa
         tuxFGgGQAT1fVgqatu63BKh06e/oe4TmTKPULy2/tj0z1G7p7mIpUXESt22LkrnFu88i
         4aqftjMMgt6etlTi5u38Kiz9vU5+cwzHGlAqR5Gz9PxQQvv2z4q/oRvzU4xxN2akteFM
         S1lUQUY61jHeoJ1PzthL05huuUZJUMsW1bmtA7sLiZWAYVfqh2qFkvuReGWvGSZG0jJm
         jEKg==
X-Gm-Message-State: AC+VfDwlAq+mGGgq5rEP6/WIhxGCmFYVSbLrZQlI/nTwnphhQ+2b0kRe
	CjbtutqpLls9uZOTvlwtukHKBw==
X-Google-Smtp-Source: 
 ACHHUZ75GbpqF6qcI9T1fiIIeKEFp0E/418uzdIfmYjFysVRcoVBsW9k2qMDWpjsSwcEN4eu8hG26g==
X-Received: by 2002:a7b:c7cf:0:b0:3fa:9741:5b73 with SMTP id
 z15-20020a7bc7cf000000b003fa97415b73mr1581327wmk.10.1688103764148;
        Thu, 29 Jun 2023 22:42:44 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 z2-20020a5d6542000000b00313eee8c080sm13821824wrv.98.2023.06.29.22.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 22:42:43 -0700 (PDT)
Message-ID: <5fe3cbfe-645a-185b-9c88-5da56cfd7114@linaro.org>
Date: Fri, 30 Jun 2023 06:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Stable@vger.kernel.org
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <77b348f7-0475-5e16-95e1-0e5831408d2b@linaro.org>
 <8c3be94e-56c0-4820-853d-669e90969c24@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <8c3be94e-56c0-4820-853d-669e90969c24@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LK5WJQZURWTVAO6EZANWAM43MFVPLRMH
X-Message-ID-Hash: LK5WJQZURWTVAO6EZANWAM43MFVPLRMH
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LK5WJQZURWTVAO6EZANWAM43MFVPLRMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 29/06/2023 18:42, Mark Brown wrote:
> On Thu, Jun 29, 2023 at 06:33:09PM +0100, Srinivas Kandagatla wrote:
>> On 29/06/2023 16:43, Mark Brown wrote:
>>> On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
> 
>>>> For some reason we ended up with a setup without this flag.
>>>> This resulted in inconsistent sound card devices numbers which
>>>>    are also not starting as expected at dai_link->id.
>>>>    (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)
> 
>>> Why is this a problem?
> 
>> In existing Qualcomm setup the backend pcm are added first, which results in
>> frontend pcms getting pcm numbers after this.
> 
>> For example: with 3 backend dailinks in DT we have frontend pcm start at 3.
>> Now if we add new backend dai-link in DT we now have frontend pcm start at
>> 4.
> 
>> This is a bug in qualcomm driver.
> 
> Why is this an actual problem rather than just being a bit ugly?  What
> is the negative consequence of having a PCM with this number?

Yes, it is ugly but also breaks the existing UCM as the pcm device 
numbers keep changing.
Which is why I refereed it as bug in the driver.

--srini
