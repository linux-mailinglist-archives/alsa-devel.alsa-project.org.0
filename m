Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2057EEA02
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 00:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5127784D;
	Fri, 17 Nov 2023 00:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5127784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700177847;
	bh=L+hgtTx2YEgcrcKsWorG7evks2ScQIUsn+Blyi8J+A4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n+E15ulyWuwOFuWSEBFqgA7hRk6naKbjXgyXuh1Cm4c6qlBvfFjweSHJUdCV5paB7
	 Mdy0f0bILJrD7ImwUZE3WH9DNGK8mKI1q7ZC+xxy00eCZd/cRr7a3iaLjTRUk2jj66
	 b4Po4l9nng/CEn6q0tluvBlwsBWB8rRaVMe4K6O8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B05F80549; Fri, 17 Nov 2023 00:36:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1116F8016E;
	Fri, 17 Nov 2023 00:36:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B86FF801D5; Fri, 17 Nov 2023 00:34:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14310F80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 00:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14310F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GBiF9pcI
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so1073281a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 15:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700177685; x=1700782485;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIlDZqCcqHIUeo2ZFPIfybYwe4tkogvnCJH8Ch20WTY=;
        b=GBiF9pcIZi1VQ8SkiDQZD3yzsxNxoJELiG9kW1LiQ7KI78JNJCPQXrkAy9C6Q4dHs3
         ODpwx3arEdLov0MJsowr5rnQNnnMHFu3Zhyi3kaF9b5khfQdp69nZZf/ABkQSvWT+OSg
         0Xk7odBzFtwC4PmSUFLD5vzjsIJxTozQMIq49VB3/yzuaCyQFP7xfGpXK4RQRDUX5b9b
         ny/oq8b9xjJhoH38L8XMGVCWY7l2hzeCkEAH77BijeahZwiA/QfFFsWssGnG9n3uu5vS
         i+qGnu0JncQbB7jwqqve9qB7quN58ISMIq+/ryrnI5b979x5ZeDzIssCGd53gbVoVTxA
         l6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700177685; x=1700782485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIlDZqCcqHIUeo2ZFPIfybYwe4tkogvnCJH8Ch20WTY=;
        b=L/6HHyU3iiFz8DA+kT/NsU+FPPiZrDcqTOBWrjp3vqSOJxBwR4pfHkIn+mvBIN6pGm
         LrRkTI7pILjTaIa/IAiThVA3ubtWs81U3d9zo4R3kYIjWRB/4WyAHIYY1N/y/Rq8czIM
         7ix0QgRw8uouxQgwddsygkg1fi9WSZYowI7n6Ys5Q109teRkrVjQ65lA9HtNdzybJf8f
         WME+SIqaez58hwy0E/VSfLcUcfeiqJpDbTAVv2ubbS0H7Jyyefr+MAHBAoLoqYR3485h
         g8rQZ3eVHJ707cgbNYdWF4dAidgUVpNt5ZxyqZcp0ibYnKhFWwXoPDDK2UYIg7erk0Am
         HXiw==
X-Gm-Message-State: AOJu0Yw0SuLJ9t2TGXGqKaPQM17EQhWGmL/jtnX/YOChwJsafo4DLqVO
	4mUgBHWRa5iuTKjFbm0aX/c=
X-Google-Smtp-Source: 
 AGHT+IHQSlFjtHHnifyRR+5Low3mKJhBkumS/gS7LHof04DGhzo/G17nSkrxx0T/ja/Xt7XWz9cavQ==
X-Received: by 2002:a05:6a20:3942:b0:187:d5e8:5709 with SMTP id
 r2-20020a056a20394200b00187d5e85709mr2649587pzg.4.1700177685029;
        Thu, 16 Nov 2023 15:34:45 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 e7-20020a631e07000000b0056b6d1ac949sm252545pge.13.2023.11.16.15.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 15:34:44 -0800 (PST)
Message-ID: <a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
Date: Fri, 17 Nov 2023 06:34:39 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7
 PRO 5850U
Content-Language: en-US
To: Oliver Sieber <ollisieber@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
 <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FFHORJTSJJO7AU7PWAP6KDY5WFY237EP
X-Message-ID-Hash: FFHORJTSJJO7AU7PWAP6KDY5WFY237EP
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFHORJTSJJO7AU7PWAP6KDY5WFY237EP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/17/23 01:36, Oliver Sieber wrote:
> Hi,
> 
> thanks for your fast answer. I added my proposed patch as attachment.
> 
> Please be aware that this is my first kernel patch.
> 

Please don't top-post; reply inline with appropriate context instead.

Your patch is attached, please send it inline instead. See
Documentation/process/submitting-patches.rst for how to do that.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

