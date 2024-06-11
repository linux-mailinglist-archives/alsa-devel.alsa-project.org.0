Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37290780A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE9D2097;
	Thu, 13 Jun 2024 18:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE9D2097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295356;
	bh=B+F4jYtueaaFeYozuVyzY6N2Tp2CTNJFcO1Ip0Jlv6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lsDLcjsYh2qXcGaJe4sc/3CDn0ZCQ/ugckSRNGWJMkcvtdLvRHwRhMvd/IcFht40n
	 fVHofv4NWBEA8fMytGulndEMX/fbf9HAxStBoXrJjx/0EzdH3W3PK8M8BDYEseW10E
	 zTmv0h+IsFgo2Rp5Y04weVZGh5JtBIX2DhOkgAlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A745F899AE; Thu, 13 Jun 2024 18:05:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E06F89875;
	Thu, 13 Jun 2024 18:05:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3639F8057A; Tue, 11 Jun 2024 14:48:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 413CAF800D0
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 14:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 413CAF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EhBGbqKt
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a44c2ce80so1307188a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jun 2024 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718110103; x=1718714903;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/Oo7XjX+5E7PNpg5M8THdexoQgRehQoIPwH+7NOY6E=;
        b=EhBGbqKt58jkkQpVH9gLh52OIVXiZnfrPP4KVe8mK9Cacw9qSxRGX19oAvxawdUcnu
         W9V8zjIWjhqp96FjhpNN6Aq96WWb1axIcZXW51WvuQ2Q6Okv6vD/fmfMrNfiKkwHGTVb
         yk05Pf91OG/EgGjMMSP4Vej363dl/Pl7TDJqlTDWO7p68vnmYClM+zPhIlIOjH0ilnZx
         BeFzzokWNsMNfPQ0ISnh7lOGGXnsUcFrQAo6r6nRgeHcHJ/KesGrO/QC2Z9D3DeJFwzR
         N10l6gZ0tRao7ktde4kjfwoI8D8Dm5PCEkS5WCl4FofmgibYZBYMy9BZUIWCfxHs/Pmk
         m8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718110103; x=1718714903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/Oo7XjX+5E7PNpg5M8THdexoQgRehQoIPwH+7NOY6E=;
        b=ObJ9Q4oOnbfJ1yb6wpQ0CNEd+iAPypKQWnxjAL6dEtrbt9dA8ngWAxHpEaGT1wveNH
         bAdwxK7m+w4/viO3T4IamKLhFxBawbP+B3tfwDB0mpJDGEUWYiG54Y7pzhUiQUz8RnEJ
         /aUTF3qLJFLDmOxGjUWvon7ebeOlspk/PiG9lgc8eSMaMI0BTfIgNikFKqojesRc8PI2
         pFSsJcD6AzKLLXNqv/MV3OWvlZO/A4DhcL49elCnCILQMNyz+0zsC4tyOrJOvKZMkAZn
         zr1lwC9ou9ys6hdeqUhE+AcO5M5zJlpEmg4gXusYvA73YcRNZMFEO2u2knqsMmZVhIoh
         dorg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBfnplYCd2OU1iKWxWaeb1JtPBzOudrxW+2XNIt9YUU+/GF1VDH+bab2ZTqXFhvbF0HCnwbBtaD3urRUs/AjkK7Y6xsdFVXEqyevQ=
X-Gm-Message-State: AOJu0YxnYUdwDMHBnAk/pnLcQY3xh5NcUxdGyiPf/AtPcOE9M074wfRM
	DYpWwlGBlL9Bg+mj6PFxUdEEWBCfVssdwLt9DplKgv/TIg5T7hIa
X-Google-Smtp-Source: 
 AGHT+IFp/1CR06HJRye+2fqk8C5zPASOQlbfXCIrIAIwmwTUWtI0C1ufR5WmUqLrkAfxRNHE9HGb6Q==
X-Received: by 2002:a50:9509:0:b0:57a:339f:1b2d with SMTP id
 4fb4d7f45d1cf-57c5086e237mr8319342a12.5.1718110102611;
        Tue, 11 Jun 2024 05:48:22 -0700 (PDT)
Received: from [192.168.61.55] ([37.30.4.115])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c71b6dcaesm5635493a12.78.2024.06.11.05.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 05:48:22 -0700 (PDT)
Message-ID: <771bf8d4-5423-4972-ba27-615148a54c77@gmail.com>
Date: Tue, 11 Jun 2024 14:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: samsung: midas_wm1811: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <01590109-cf27-404b-88ff-b42bb73ca1c6@moroto.mountain>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <01590109-cf27-404b-88ff-b42bb73ca1c6@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HI452TE5ARTMFYP3XB7WT4YVDFFTZB32
X-Message-ID-Hash: HI452TE5ARTMFYP3XB7WT4YVDFFTZB32
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HI452TE5ARTMFYP3XB7WT4YVDFFTZB32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8.06.2024 16:24, Dan Carpenter wrote:
> This accidentally returns success instead of -EINVAL.
> 
> Fixes: c91d0c2e198d ("ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch, thanks!

Acked-by: Artur Weber <aweber.kernel@gmail.com>
