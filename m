Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9E96F612
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD88F55;
	Fri,  6 Sep 2024 15:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD88F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725631015;
	bh=0HVxap2WfUaoSbJ6P5wXUA6AtuQouKc0QdxQVKFfCSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TEaJjKxrLEcHnBHvwmaIdreCgjVb3M3ZFNrVEFFLBLJk2KpH7lT9SL/qWdbXIX2S5
	 sU4tko5cZ003/IDC0PbEHVZlRtUFQAb9IAgw9NLaGfE2hPT9PKa8Y87J5d8AsgLc9W
	 CEDseQdWb6DeGFKQfl3Qex/B8rASxujelJ5CSwqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E20E1F8069D; Fri,  6 Sep 2024 15:55:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7C0F806A9;
	Fri,  6 Sep 2024 15:55:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AA7F8016C; Thu,  5 Sep 2024 17:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19681F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 17:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19681F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=atzSTwZ0
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso9619075e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725549115; x=1726153915;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5ydbHAcLR6S2kZ2UiSe4taaN+JWRdShTwsXukZfYrE=;
        b=atzSTwZ0DxaOoaZQl67p/yzebbaW9zfO2x/FDLv6SpDW2VaZnaqS3EPaaXCqO6KJlM
         xq1kj47ayCbH47X0dJGALm+gac86jq/bttS26vLin6AueS1J3bgZa/aa5DDa1LFVIVwJ
         GgTWFnxlpA3XM1vYS/Og5hDx95mt5dSCF7nS0JaWfbXvJwEe5J5ZdnazS6y5sn3SZkqc
         PwrVAQuyFn/wevQDHH2vyjIxEfZ+sC5/7oiGz5XHgJX0jIFJbhzJi4ci6ludlJumnZ72
         twOSkTaXq8HaHftdQc8BuSHbuoPgbVnX5EbVrA8HXv/vPpgBN4n35EW0tWQID+tYXkw/
         b4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725549115; x=1726153915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5ydbHAcLR6S2kZ2UiSe4taaN+JWRdShTwsXukZfYrE=;
        b=Wdamvr53UX32Z5qTsaf8YaqNIyCkzu1Dv0tZB3WqqTnfkrl+cSn3mxpRdK8nTeexoj
         3rmKvlK6461Z8BdBH+xQqxEx7ITSgbd//chByPhwrsy47lPTqfkLIx4qIFOH64Ie0EVi
         jydk7qacLWwcDoI907j9jCR7Zdd6qN59ta1nFDBP0UBnT2+OdcjYNncszlqvU/mxPLpb
         bgJ97fUdO5sPOsboKrMbSYISGP29ds+bFIBk6OrE/vXuvBTDwQQVpp6Np7nxEH5BWj+D
         uENVtHlY5PWunkSjv458ICFFeowHrUXCAXRnlHAyL4DvKYx5zS9bgvXPW9aQeXRDu0wd
         uDUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI3KclHfTv+13zVsrtAPvVWyd4i42qcl5cxdZqXupgvYq9dzKnNNdrilQ4/Zi/cEd0sQVnkqhqBcTI@alsa-project.org
X-Gm-Message-State: AOJu0YyzE10+3THYy40Z5w5DeUa0Ymriv8RIjntkQsyV1uyz98o1t0xn
	Qj8iAhhj6BCQPxO4CvKOKBdzk7mumPhA33+BpLtiJvt2N1FSowrU7zjzMcw8nw8=
X-Google-Smtp-Source: 
 AGHT+IEb2Gx1tTCmdOI5YjqColZWn/7Fy+QvmuvrxLoHycJJrpvuJNWc5dunZZ9mWjFu1Gzsuu06PQ==
X-Received: by 2002:a05:600c:154f:b0:428:e820:37b6 with SMTP id
 5b1f17b1804b1-42c9a3938b4mr26782045e9.31.1725549114779;
        Thu, 05 Sep 2024 08:11:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df84b9sm235437335e9.24.2024.09.05.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:11:54 -0700 (PDT)
Date: Thu, 5 Sep 2024 18:11:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2 4.19.y] ALSA: usb-audio: Sanity checks for each pipe
 and EP types
Message-ID: <747a6089-b63d-4d14-b524-55a76f58d724@stanley.mountain>
References: <76c0ef6b-f4bf-41f7-ad36-55f5b4b3180a@stanley.mountain>
 <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
 <2adfa671-cb11-4463-8840-a175caf0d210@stanley.mountain>
 <2024090557-hurry-armful-dbe0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024090557-hurry-armful-dbe0@gregkh>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UEWUEYOMPGOKFV3SIHJ34TH3BCJAXUGQ
X-Message-ID-Hash: UEWUEYOMPGOKFV3SIHJ34TH3BCJAXUGQ
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:55:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEWUEYOMPGOKFV3SIHJ34TH3BCJAXUGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 03:49:14PM +0200, Greg KH wrote:
> On Thu, Sep 05, 2024 at 04:34:45PM +0300, Dan Carpenter wrote:
> > Sorry,
> > 
> > I completely messed these emails up.  It has Takashi Iwai and Hillf Danton's
> > names instead of mine in the From header.  It still has my email address, but
> > just the names are wrong.
> > 
> > Also I should have used a From header in the body of the email.
> > 
> > Also the threading is messed up.
> > 
> > Will try again tomorrow.
> 
> It looks good to me, now queued up.
> 

The code is okay but the Author header is messed up.  It has my email address.

From: Hillf Danton <dan.carpenter@linaro.org>

From: Takashi Iwai <dan.carpenter@linaro.org>

regards,
dan carpenter

