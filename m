Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A777F421
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 12:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C5F852;
	Thu, 17 Aug 2023 12:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C5F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692267154;
	bh=nsPo7Kq2dCfc09tdgoeAD6gyf8OIShNucMqftxNVu4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iLxzAB1fNOBVrc+7OBOdx7ecYxo0Gz97Zv+3l9lDLIgyEVDasQZd8qnFQLd+RWVBe
	 z79kAn79EVqXJY30XT37Oqyy9iOS9dT3y6BVNZLIkhJRdiLmxeVkYLUKqyAtsDSeYF
	 wa5W9vGA69zPeSyPJwHNvR2LC38tU3D+D2MtdWcM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3096F805A8; Thu, 17 Aug 2023 12:10:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42401F80588;
	Thu, 17 Aug 2023 12:10:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF2CF8016D; Thu, 17 Aug 2023 10:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C007EF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 10:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C007EF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dBE5tNr5
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c3ca08c09so212204866b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692261648; x=1692866448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsPo7Kq2dCfc09tdgoeAD6gyf8OIShNucMqftxNVu4o=;
        b=dBE5tNr5rDg8jAS/pG1Ve9xgUFxsf5+W0bHRWygxjQHYUJvvGjmZiUz760zMyoPM0F
         E6fvEh/F1zNrOKml8mZjjEwDBVQBzRaPHSPt9jFJtSWzRYoQI/C1qj9CVOnMPRP+BOGx
         iym/6ENAdfrpsXsaUPTwm2i+ub+zHW2qj6Js1QYo1X9SSpvkrvPPdBNsIFeKvnxzXFc6
         gVS5kSEa2lpGIz6vr1m3VV4MGw7xKUeymT9Ebjt3hWhqDGwJESRvam2I5qt7ew4CmTO8
         n9smC+3+gQUphGZliYMSJHNCY0uoNY0WScTRyv4OYIefRiCR+8EQRwKa6j+BF/p/lDyy
         Jx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692261648; x=1692866448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsPo7Kq2dCfc09tdgoeAD6gyf8OIShNucMqftxNVu4o=;
        b=j2Jpa6doHsS7yhN4hcdIWD+k0fC0i2MsqjIbZYf65m+M1tl8YsR24ycXZHM5OUnJA4
         95+/R8MIKeoQLfvWIPuFGx5VULsw2bFnOTSltUPZAeWooUXhW+KLCWjpiUmuiu0sdhPj
         58W0CbVfpqSp1+0ms4VfOZ/O+SIo1q46vPkGVrWD9Oj5ooa0QCaA7yekPU1gcDjkUWxe
         jpj9+/Cw8jaNcpyNGrv9yT0Zcer1VaZxJz9swZpvYBNHnm2El+R/sS3uZ1M7fPKs5lkN
         VeBxlKBZi2aoes426bqCR70BztoPHQls4fPBUCHWvQPV6SXORAEL5ylPGKRgtvmlcOAs
         dooQ==
X-Gm-Message-State: AOJu0Yy+Q+JtDpdKxCjDzyGBshv7hSlmRE9CnVN03jMytWm/D2SUDHLm
	uWZ6YjZqRxLBD65uVHIclauP2uxLYHD+YLHe
X-Google-Smtp-Source: 
 AGHT+IHhe8zuAxo/2TYjHn2yIFNtSVDKCh2mJecgwVnNrKEoBtUqpf2T0wzCGq4HtsAPNKRTVYFIYA==
X-Received: by 2002:a17:906:cb:b0:993:eed1:8f7 with SMTP id
 11-20020a17090600cb00b00993eed108f7mr3600927eji.3.1692261647454;
        Thu, 17 Aug 2023 01:40:47 -0700 (PDT)
Received: from [10.10.19.120] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 e8-20020a17090681c800b0098e42bef736sm9904739ejx.176.2023.08.17.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 01:40:47 -0700 (PDT)
Message-ID: <efc50848-75a0-e65b-9b76-881e1499ea05@gmail.com>
Date: Thu, 17 Aug 2023 12:40:46 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230817063922.282746-1-ruanjinjie@huawei.com>
 <87bkf6w4go.wl-tiwai@suse.de>
 <021dc4f3-f544-237d-489f-2296c574ec62@huawei.com>
 <1182f6ea-f303-04f3-e19a-b8cb041252e3@gmail.com>
 <64abb3f8-3134-65a4-a56f-a405e40079ad@huawei.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <64abb3f8-3134-65a4-a56f-a405e40079ad@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZVTPLO6TVECMTQBXBDYXJDTG55CTRRQC
X-Message-ID-Hash: ZVTPLO6TVECMTQBXBDYXJDTG55CTRRQC
X-Mailman-Approved-At: Thu, 17 Aug 2023 10:10:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVTPLO6TVECMTQBXBDYXJDTG55CTRRQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17.08.2023 12:33, Ruan Jinjie wrote:

> Yes, I'd like to. I'll send it sooner. Thank you very much!

Alright, thank you for doing this :)

