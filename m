Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9FA17916
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 09:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CBC3603A9;
	Tue, 21 Jan 2025 09:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CBC3603A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737447238;
	bh=I8QjCiFdn6fue3Z2B0YpsHrA6t0QvRCDVIdgvi0jL+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XA1yFU54JEPfIEHuE7yb6wbm22OASj+g42+0aXGS8rotGFHj83ELTOIdxMWSK5u+s
	 NJney6UcFIo6+Tk2pUrQ101eYveydaumeOSkmE6L3F7wGU/o2eZH2qye8NbpJiYnig
	 BbXZwgw0/L6MpzUhiOvvVZFAqXo6KJ1u/qC7Kcdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C71BF805AB; Tue, 21 Jan 2025 09:13:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78749F805D9;
	Tue, 21 Jan 2025 09:13:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95C18F804E5; Wed, 15 Jan 2025 07:10:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49302F80169
	for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2025 07:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49302F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BGnqV28y
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso938632a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Jan 2025 22:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736921405; x=1737526205;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdjUWXMpCuGTyhpaGbaUHH2q6d5HqfhmCxI2osIrDFE=;
        b=BGnqV28yCPV6BvwP3cdAsGPlea3c+J+zxoh6T34DqLDvpk+ejr7PQzFvoPSvVwwfDd
         elwCQnXrnWbdYR7AbmkYoTPMuWmlbdABjhQHuGkZEQv8XmV7SjCurKrDhH1e0qISMoQF
         CRGjGww5VFhAPwZhrFTBEy4zj4DDdBtCfIac2tmtJr1T+R6s7j4QgRcAIp6Txrhx2lLW
         CiEd5xiXMfCb0Zy0WQ0B4Dm/1Kfi/ShZOi2fUv8z8KBKrrTpk3JNvha/8fCo0Y6JwP9G
         QCL2QtKRwyu/ZzdLX2hsj6y/2J7PEIt2eJPeHtKrV4hukwrdKuohhZUUgY8kF1NDGZTz
         w+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736921405; x=1737526205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdjUWXMpCuGTyhpaGbaUHH2q6d5HqfhmCxI2osIrDFE=;
        b=lrN0UZ/FXTHQqX95l3GAiPqTgJuwIYxEB2haYvkDhu8hoDvsMBT/IktFnGOQoRW+EK
         3uyYsZDUGwzv+9vDvFePO3wl/HmhoTKOqmrTCv3S1WkIbK+JKtgMLy1Kk1Na1X3wa15r
         rlCPXY4cM7OLSS04IBvTZvTSV98Pf8We6Ssw6VKJnMFj98UWTkTdnwnopg3zq0qKVzdp
         ajVNSCE31ykOjYbOjvUIAUllP9paP+pmS4zU2qqWhqoDaGoAAO/PNw5tzyxAncJ/Uuql
         7Ytiys1Tr7Vsg+bM5s+S8Up+R5i62t3S4EcGEi536s2Ty8bKSRcd6qfObDYjuj8DdEJX
         ZpdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYeazIQ0DAnxtJqZX7xD+GA0p1t8RuddLtJzbtkV8HF3JTpCx5Rw4eY2MC+s5LVjq9jhUISuCT9DFg@alsa-project.org
X-Gm-Message-State: AOJu0Yy59FOIYbCKPNW1BgUUFsOp8CXxpe26oYOocfaRZMVpwiebN1e1
	hgpezk3VhPh9yqwYvlmnSQGtgA+zrMX5Lloic+hEf/0nQSoHOO8J
X-Gm-Gg: ASbGncvTzWLGkxJI2c+wVhfhLgayoS2vTwD1hH44QcffUocfsyufb+WMpiygGMgpTAS
	Ii04A006vKFTqnbECTRqHi4JkkVgnSD5IF2bDf9oeiLYMjgUMSKASpx4tW4bdvkJbtgvOnA958Y
	54ZK+ROe/7cz6s47Bnprbptr1e6tTzmlz5FMlwktJAIkdTRegUqxuIsMJ6nTm+Qu2OCM5ciffl8
	SscfhitWAFAFlqR9HiFVgWjv95TRtiiItEVnx+kJJbg7c8IUX7h5I2pEEsF64tA3WrpCw==
X-Google-Smtp-Source: 
 AGHT+IF1qX0sohkzQNYygxvcTY4ghAIHYfUuxS0V98Bx3zv5ZoKf8Y8yDgyz+5+cURy2NIFhXVKBEw==
X-Received: by 2002:a05:6402:358f:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5da0c2efefemr1539937a12.10.1736921405004;
        Tue, 14 Jan 2025 22:10:05 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c394sm7071443a12.7.2025.01.14.22.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 22:10:04 -0800 (PST)
Message-ID: <e2a019da-b8db-4976-8cbe-bbbfac771d38@gmail.com>
Date: Wed, 15 Jan 2025 08:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 tony@atomide.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
 <87y0zdsxme.wl-kuninori.morimoto.gx@renesas.com>
 <98a19395-7056-48d1-ad89-fb057025f46c@gmail.com>
 <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivo.g.dimitrov.75@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3LALAPLYWN5O5ERBTBUXVM7WJYFMKMPQ
X-Message-ID-Hash: 3LALAPLYWN5O5ERBTBUXVM7WJYFMKMPQ
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:13:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LALAPLYWN5O5ERBTBUXVM7WJYFMKMPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On 15.01.25 г. 1:49 ч., Kuninori Morimoto wrote:
> 
> Hi Ivaylo
> 
> Thank you for clarify your situation.
> 
>>> You want to parse "remote" endpoint (= rep) directly, but the function
>>> requests "port" (= rport), and it will use endpoint0 ( != rep).
>>> Is this the main issue you want to fix ?
>>>
>>
>> Yes, it is the 'remote' side endpoint, currently it is always remote
>> endpoint0 that is used, because when you get 'port', it is endpoint0 of
>> that port that core uses.
> 
> OK, I could understand, and I can agree to your idea.
> Getting "port" from "endpoint" is always stable, but getting "endpoint"
> from "port" without parameter will be issue, indeed.
> 
> But I guess your original patch is based on very old kernel ?
> It can't be applied to Mark's for-6.14 branch as-is.
> Please based on latest branch.
> 

Yes, it is based in 6.6, that's why I sent RFC patch, as rebasing will 
not be trivial and I didn't want to spend time on something that could 
possibly be rejected.

> And about git-comment,
> 
> 	When link parameters are parsed, it is always endpoint@0 that is used and
> 	parameters set to other endpoints are ignored.
> 
> Please indicate that current function requests "port" as parameter,
> thus, it always selects endpoint0, etc. That is easy to understand.
> 

Ok, will do.

Thanks!
Ivo
