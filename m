Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6F3C23E4
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 15:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B8C1612;
	Fri,  9 Jul 2021 15:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B8C1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625835687;
	bh=lOYU7UyliGU5TqAUngdjF5p1fnc7PLJjGxIDm3Zl3Jc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXdUSApuPDkvuvd75npOPnp+SeFOY/mDwVB5RHufdZXBhL3NAoJ3m/cpKN4xG9U3z
	 HtsA+BIHRKtJ9Q2vPhtJSzK1reyPLOipgNrBs1CxpLBjbI/bPUO3f9Ff7Gy5mBh0kt
	 sms4Gn5pqCxr39iCp2SuBH4S2cQxDexuILoxxMVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A16F8025C;
	Fri,  9 Jul 2021 15:00:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 178C8F80224; Fri,  9 Jul 2021 14:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B33BBF8012A
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 14:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B33BBF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SHs4ajRZ"
Received: by mail-lf1-x12d.google.com with SMTP id p1so23042838lfr.12
 for <alsa-devel@alsa-project.org>; Fri, 09 Jul 2021 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SWmHBZLdC5NZNQ2ScKEe+hKqBEvH9WBA7y1IwIcat+U=;
 b=SHs4ajRZPu2SAknqb5pOh0a0zu4Lp06WJUSpv7ADlKwmF7m/CptwMMYT9xq04oL566
 VoGvhT0fw2oLBzGQwRAnhOsze61h0MZAvfFecMaLVnksj1+a5P3v6S6lvvONxb+H5GoP
 265yXNX+KL+xDk9KuFZM7WRBZq6OZ2bnt2pvyhuMrmXFa0LRB3yImNeRw7rSFCfCNZA7
 ydtOjPBLyYR5Lcvxuu1gzQZ3OTC2PygNq7uQC8cmVZdB1KmBMe4icTZDVddn3fBOZw8k
 O16hf501P1n34XxWHvXp+BpjLsCd+A7IWDdYE5WFjXKpwpk4jlNPO6AuzbDymCnqWF3k
 U6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWmHBZLdC5NZNQ2ScKEe+hKqBEvH9WBA7y1IwIcat+U=;
 b=XA+/r2xrZoCwzeAfP39Y89QKrFZfCJmydAAzkXl6tcCOPg0l2mXyDeOOWYDNBHet1Y
 /noLxLRx+pPak4tnrZd0MjjmhrmAkYFgPq5rfvJObDe+UG4ab9hGIZWsmjdbK/JCLPc/
 3lu8cY8LN9OK5aigNdncB3tVrv+NOV/oP4Zzy9YBwga8tyi1ZZ1831KEcyOf1awPAol5
 hrWq81eo5Chk86cE0Ukt8PgpfCfX4k/CBs/fNJ3PoUALaAcYd/WkI6DDMARUqvN0xiOD
 Z12+5BRn6ohRRIHko47kS2M9J2w4usXlxeAEHegSjRVnm+1eiSkSxfrQyGri5NQOCR7C
 fDRQ==
X-Gm-Message-State: AOAM532pTZ2j8tp0uAwQBwDctFgFBMntDd5EYzKzHRO1tfxfvFEjVINI
 bj5wm8AYO6xfIejGWrrTOyg=
X-Google-Smtp-Source: ABdhPJxgALEChnkxIOwqkPMPhicimI9FDt604TMi871X8mCspd86mTWsO5netvQY66sQRvBUiNMgMA==
X-Received: by 2002:a05:6512:1327:: with SMTP id
 x39mr29651277lfu.37.1625835595239; 
 Fri, 09 Jul 2021 05:59:55 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id a26sm463370lfr.58.2021.07.09.05.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 05:59:54 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
To: Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
 <YOftKVAsRaxtEY8n@atomide.com> <20210709124004.GB4112@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <50098bbb-089c-298c-1370-07179103706b@gmail.com>
Date: Fri, 9 Jul 2021 15:59:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709124004.GB4112@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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



On 09/07/2021 15:40, Mark Brown wrote:
> On Fri, Jul 09, 2021 at 09:31:05AM +0300, Tony Lindgren wrote:
> 
>>> The ASoC patches are not affected by this, it is just that we need to
>>> block SIDLE mode in a different way than how I did it in the last patch.
> 
>>> I'll take a look on how to implement the needed quirk for the McASP
>>> module, then I can send the dts+ti-sysc patch to linux-omap.
> 
>> OK sounds good to me.
> 
> So should I queue the ASoC patches and then let the DT patches go via
> Tony's tree?

Yes, please. I don't know when I will have time to revisit the DT part.

-- 
Péter
