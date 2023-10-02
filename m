Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BAA7B4EEC
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 11:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51ACADEB;
	Mon,  2 Oct 2023 11:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51ACADEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696238465;
	bh=BWc4fyZFXDo39IonVsQbQpoYRiB6MptP5BduKmKFQY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=URdNoJc1OvLwKa2wO1wtvEl9vYkbPAYa1tgAAzG19UyBasbrT18vhTZReyvCFDJRX
	 0PPLU0bhPdk8zOU+Pkw/TjR1auPyPO8ycHZf/pnJvlNFYBygdPdgR1e/L3+g9q1c1k
	 oC7jU7IwQaJHKd6SXGYoK1FHjKARkZ9az6ZfiLFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D69E7F8047D; Mon,  2 Oct 2023 11:20:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6525F802E8;
	Mon,  2 Oct 2023 11:20:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6A6F80310; Mon,  2 Oct 2023 11:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E5FF801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 11:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E5FF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TdQiC1PN
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-533edb5ac54so16966201a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238396; x=1696843196;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDzqsENmqZC+pR/lKDlB7eXL9n5zQddAKowHPx709/Q=;
        b=TdQiC1PNC6DgGNQXv4FAcd/3cATjLEmIC04z7TrnJa4FOkCh0fdk9vfC8qwmcihyyY
         mHi9Qrrv/643p+fz76z5WWmDYlvPBs3stM2fDQXQjhTJhR9cfCZaqRpNk757wzrC1q9N
         iXZRGzjGFX0ZD7G7NabEBZb8WbLcOdta+4g0hupj6Zb1KzIyG8MR5xQeVHiBEKX7mM+3
         cRN4VXmU0g9moz51fjg6rkNwuO4RebCHN4OKAWBSqRJFGtnKLyDxIOvWE9Hqphi/ETJ9
         PcUXN0e2T5Yezeta8M7nGwZ429xMIW+WhqUHAqlqNBxJMoB2VdY1dKZzb+SCqlP34hUq
         D7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238396; x=1696843196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDzqsENmqZC+pR/lKDlB7eXL9n5zQddAKowHPx709/Q=;
        b=u9ud2ZqUBk51msdmVQZgSWo7Gz1k/fRo0KKczrG0lFqXf6Rt7yV80pq0w0xz0+2hnj
         dMXKiVM5xQCGsF2wiK8kYGFapMSpzrfRaF+dB4su54IfSjqRHqAGA9yhnShawIU/66pw
         CIiiHLU8WCZxn1DF7MnNRF7ucTVXPzajIS2/GLG61Hh3iz0/ubdsolBmlFMy4+f5zb28
         J/fu6AysJ/0B7D1prXFpqYLH+RiqB30ivLzRf1Np2l8tVM3P9K4Ar2qB+IwHMp0YLlo8
         9B3kgPjdGZ/nO2E9rxZfQdSeJvZVm/2FJjF/+6cYfyBM5hG+f0j9obCQhYSJ0SWNUOUq
         hVQA==
X-Gm-Message-State: AOJu0YxgXncPeW3O8uFC/aBumcivXl/RjBXsax2dKMX3HuTTgNi2AW2+
	bAQWNx4EJkFCr7QaFzdn0RyBHlvWznViz3rpKvs6gg==
X-Google-Smtp-Source: 
 AGHT+IFYOxVbErILkpUUxd2Kitsx6GRL+/wGaFYdfoAAsFCy+qvNNNNymZNictgzBz0fGyf9rozviQ==
X-Received: by 2002:a17:906:51:b0:9ad:e101:3f9e with SMTP id
 17-20020a170906005100b009ade1013f9emr7821363ejg.39.1696238396429;
        Mon, 02 Oct 2023 02:19:56 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 h10-20020a17090634ca00b00997e00e78e6sm16723461ejb.112.2023.10.02.02.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:19:55 -0700 (PDT)
Message-ID: <d2f6ca55-1b5a-d514-6295-43fd97e71042@linaro.org>
Date: Mon, 2 Oct 2023 10:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Hamoa CLO tree access
Content-Language: en-US
To: Trilok Soni <tsoni@quicinc.com>,
 "Rajendra Nayak (Kernel-BDC)" <rjendra@qti.qualcomm.com>,
 Vinod Koul <vinod.koul@linaro.org>, alsa-devel
 <alsa-devel@alsa-project.org>, Paul Neuhardt <paul.neuhardt@linaro.org>,
 Davide Ricci <davide.ricci@linaro.org>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
References: 
 <BL3PR02MB8163B174A3A44DDBA0BE5C7E96C7A@BL3PR02MB8163.namprd02.prod.outlook.com>
 <BY5PR02MB6754052C80C0DF655CC99448B0C7A@BY5PR02MB6754.namprd02.prod.outlook.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <BY5PR02MB6754052C80C0DF655CC99448B0C7A@BY5PR02MB6754.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X4G5XTJRVIU3DCDPOLI4LGH6PXFJ7T66
X-Message-ID-Hash: X4G5XTJRVIU3DCDPOLI4LGH6PXFJ7T66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4G5XTJRVIU3DCDPOLI4LGH6PXFJ7T66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

+Adding others maintainers for more thoughts on this.


Hi Trilok,



On 30/09/2023 18:33, Trilok Soni wrote:
> Yes, we should always keep one or more QC Engineers as admin going forward.
>

We are happy to add users as an when we get a request, till we can 
figure out a better way to do this.

  > OR keep it open w/ *@quicinc.com <mailto:*@quicinc.com> wild card.
>
We have to be careful here not to expose a security back door.

Am adding other team members to share there opinions.

thanks,
Srini

> ---Trilok Soni
> 
> *From:*Rajendra Nayak (Kernel-BDC) <rjendra@qti.qualcomm.com>
> *Sent:* Saturday, September 30, 2023 10:32 AM
> *To:* Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> *Cc:* Trilok Soni <tsoni@quicinc.com>
> *Subject:* Hamoa CLO tree access
> 
> Hey Srini,
> 
> There seem to be a lot of requests from within QC for access to our CLO 
> tree, would you be able to provide me access to add folks so I don’t 
> have to trouble you guys for every request?
> 
> Thanks,
> 
> Rajendra
> 
