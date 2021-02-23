Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F7324F34
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7161665;
	Thu, 25 Feb 2021 12:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7161665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252640;
	bh=acWenwMqc4rWq/OQX6AZ+7LCFpRmF0qZOd1EaMs9uvg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghBsFqw425dP4bIM7l77i91IA8ErjuW0SREPoVwd3+NZSRr4aas9k0VR91pUy3BxS
	 JoGc8t30guM0A1YueRSUEaPrwqGGyPIzDA3eiWZUh4jaAO6Tfz2E8pdKlq/AP31Ma+
	 2jNB6ylxUnL0LByPwmbaHxpaKvcHLZ1AdacIUxK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D307F804DA;
	Thu, 25 Feb 2021 12:25:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD44F8016D; Tue, 23 Feb 2021 07:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9669F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 07:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9669F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MadCe1fq"
Received: by mail-pg1-x534.google.com with SMTP id o63so11784681pgo.6
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=acWenwMqc4rWq/OQX6AZ+7LCFpRmF0qZOd1EaMs9uvg=;
 b=MadCe1fqvLXAqcaXVCuwBlmzdYmEFfx0HZZ03GEvB/vC/nNUMhMaa1+udVT3Y/jxvc
 beYAcXgm/QJe5JcEeTbcdopzhCJs8YJAaVtl3ul3b5/ApXblqdeNEhM6FJy/FgfZQMvA
 D8kSzO99fZSxEEMcgak9bj73IhaymTLVWUwUPInChTFeAOM0yIoyhLC6Jc8YC1cALXtk
 UcmcNbUEYqHum0p8z7QzQDoc9D1wHfXhHbxMEi6n2ltvs9e+JoIGubanWdLPPHxDLIBM
 d5fKamb4HQFv+IUcRaZ4q1RJhQFprmX6kZELIqpXTvj9fDM/zj2L9wMFii7wJhZW0cLY
 zkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=acWenwMqc4rWq/OQX6AZ+7LCFpRmF0qZOd1EaMs9uvg=;
 b=nMv6iYJSW1pjJevA9Bk4k7Vr3hUziOBiBFMnU/CdWW9nciltoHJlxzZIArG0LYLk58
 Xh2LTKOnEdGs6W5f5bNDm+FXUdn39QFQEiRSi/gcvp3gg63fFfNG4Ncdyv3H3y5KHY02
 XJuIZ9PW+RwFIWM435tmY8ySO6gzrNbqcMuLTnaH8kUlzFcwa7kOZXeCsnNYxRMnh+ua
 xQWsSpWvxWiIkrcLsRKMJPDZ8LHdDt4lkJs909tYRJU2Eg7f3+dGDXc1IKGHccFwOdcz
 jVAvthQjXcDkGn3cTofTuykesMqw/ljRmiHeVK2z17Ymn70RNj0mgIzRXe6yJqCxnxZp
 Ot0g==
X-Gm-Message-State: AOAM531s19WqBUs3KhIoV7niIjrd9zlK2/ObRDnr4ebhxC0Z6VKB9YbN
 EcrW/HmsFLuDvaYglc3srPo=
X-Google-Smtp-Source: ABdhPJzu2rGnxMppydDeVkpLk9X0oMbOyPgpzGu88h6pJuPte5KE4fAedf3TT6sx3J9r+twYdzG2Iw==
X-Received: by 2002:a63:1958:: with SMTP id 24mr23144158pgz.320.1614062848047; 
 Mon, 22 Feb 2021 22:47:28 -0800 (PST)
Received: from ?IPv6:2409:4064:4e15:50e7:a908:6589:7ef3:8b39?
 ([2409:4064:4e15:50e7:a908:6589:7ef3:8b39])
 by smtp.gmail.com with ESMTPSA id w187sm21463969pgb.52.2021.02.22.22.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 22:47:27 -0800 (PST)
Subject: Re: [PATCH] sound: core: fixed coding style errors
To: Takashi Iwai <tiwai@suse.de>
References: <20210222194156.26758-1-sssraj.sssraj@gmail.com>
 <s5hh7m3wanq.wl-tiwai@suse.de>
From: Rajesh Kumbhakar <sssraj.sssraj@gmail.com>
Message-ID: <dd561c0f-5622-10f3-5c8e-1156a1584612@gmail.com>
Date: Tue, 23 Feb 2021 12:17:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hh7m3wanq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: sfr@canb.auug.org.au, alsa-devel@alsa-project.org, tiwai@suse.com,
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

Alright, I will resubmit the patch.
