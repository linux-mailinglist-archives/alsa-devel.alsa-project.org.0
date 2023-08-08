Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BB7738B8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 09:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60ED483B;
	Tue,  8 Aug 2023 09:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60ED483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691481032;
	bh=G0JGoL/rMNRUtDqtTifRpYE2RlmXvngvcsipnYYMJRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KFsMqMrbguCbp9gvlNrBmKlmiq7UQIXtF/Z5bUlyF5oK9xlVpZxxqFpgVTZbMtT1s
	 jeuvkAtizSYdrKKBxJ8rkdXeCDbsmEmw27/sdxyQUboHSYjlNE95+NK/TWQFYBI9wc
	 JON7v+1YO4J3lm21pEZB6CAxj2EttabJjGW9w5hE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE7DDF8016B; Tue,  8 Aug 2023 09:49:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C34F8016B;
	Tue,  8 Aug 2023 09:49:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E89FF8016D; Tue,  8 Aug 2023 09:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 210E1F8016A
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 09:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210E1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IViOAf2L
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686f1240a22so5191443b3a.0
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Aug 2023 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691480968; x=1692085768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gVaSTYejp99j2UgPSGmR/5wX1Q1ia2oLZnesCpWyfk=;
        b=IViOAf2LrzjWVvD5K0lHr1s0S1GanQDo3mmLtxKssTSppE6jToL9DUy+vkk+te0lQX
         Eru2I72qy6YK55r/ft7BDjMa7on4lQkAb/c3QhGFObH4Uli1fYvM3Kg8h7gurK2fMY6x
         9/8tTaLLpusCG03/YwAcGVUSEZsXD5oBqkQq4rmRjSEIIkMSopN2DOdUm8pvjrLctwH5
         a/MVAMEvmRmOMisYJmZjXJKsDxHTOZpsGRmXpE4cDwzQm2VVXSYsuCdaNmDmrX0oRBRz
         3FC7D2EydHsXCygkVOMktQiky5U3AaXQH88+PcCLC29OiTed2uUppY6/a37j5DWvNVWY
         nY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480968; x=1692085768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gVaSTYejp99j2UgPSGmR/5wX1Q1ia2oLZnesCpWyfk=;
        b=hd+Ee6NrHLxKXeQ0fIBnQUJv8FF95ssCpfL//nj1o76/Y+wCytvybt052x0mu+N1M/
         00IoD9w90pTFh1QKEdOQfn+eLQSWOjw5GT5+1M2GwptyHozcHkFaEhH8MG/8R6MbaW2z
         asDlcOZ/v/Y3rYjvwFPtj1lrJROaEdGDmGtXo34R9G6vOvzCB+llJfu7vjWflu/1HS6A
         KfRM6jyzrtjCPuauU/FrgYFGqg25Z02d2tAKXe4nl58xUiw6ALOZkiI3rEO7juv+sSGn
         nIJVHzad/lQwca3vuCK/VTU2zvuhZTp+e5pqTCYyyAl3Nszjj//mv6BcoooE9Q4iBxdJ
         TM9Q==
X-Gm-Message-State: AOJu0YzB/w6LeVLhd7z5ms4bZUOlAvgl0msQtcBVuxxtgSG+edgpmqW5
	ObbJ/fNESjBGbwCmBPedx7pWS+aitXg=
X-Google-Smtp-Source: 
 AGHT+IFBIakaNZTIdA4oBI0rRadsOxlGCM7E8XCGcQIJSD++iUF3+awZ266RBP1ugSs47Y8uw2N+pA==
X-Received: by 2002:a05:6a00:194a:b0:687:596e:fa6a with SMTP id
 s10-20020a056a00194a00b00687596efa6amr14097463pfk.16.1691480967688;
        Tue, 08 Aug 2023 00:49:27 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a62aa13000000b006875df4773fsm7404855pff.163.2023.08.08.00.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:49:27 -0700 (PDT)
Message-ID: <103c4acd-df75-4d5f-9f53-ce956c01aca5@gmail.com>
Date: Tue, 8 Aug 2023 16:49:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Configure jack as not
 detecting Line Out
Content-Language: en-US
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20230805162216.441410-1-alpernebiyasak@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230805162216.441410-1-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6GCCDBNH7FIXSJCIEUF4XEETKHZ7BLZK
X-Message-ID-Hash: 6GCCDBNH7FIXSJCIEUF4XEETKHZ7BLZK
X-MailFrom: akihiko.odaki@gmail.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/08/06 1:22, Alper Nebi Yasak wrote:
> The RT5682, RT1015 and RT1015p codecs used in this driver do not seem
> capable of distinguishing Line Out connections from Headphone, but
> the driver configures its jack object as if it can. Remove the wrong
> value from the jack creation call to avoid any confusion.
> 
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
