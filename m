Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C956A2AFD
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Feb 2023 18:10:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D2F31FC;
	Sat, 25 Feb 2023 18:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D2F31FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677345030;
	bh=jI6P3YujJuHkHs48w0z8sib4GjefEUUAOM4G7QCVDSk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TpUc+OhYN6P4MifG0EcsjGTD5Ou5DQGwnH++KtfgHCerCoWMX9MNhvrPni9Urb7Ad
	 jMJqVVwWy47ZHQsjgXC40NR6svD+zMJiLpmcXV+lwrzpxxOc3c4IH472U7mgrojIDZ
	 uZNApfyFXN5AG7j+QdSN54gulimldRwf9gwMIOw4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B8BF80116;
	Sat, 25 Feb 2023 18:09:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17A42F80125; Sat, 25 Feb 2023 18:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD89CF800C7
	for <alsa-devel@alsa-project.org>; Sat, 25 Feb 2023 18:09:31 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9827C11C4;
	Sat, 25 Feb 2023 18:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9827C11C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1677344970; bh=bWvK/R1T/PJ3TkrZF70HH57MSC0I0otD86EuBtuABKg=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=xNLhLff4vjkDte1OF2UECD6jZEcz/3Eao4HeGov4wVS3y6LSVZMK8IGwobxhdu/kR
	 dx8E2xqhX9g1ofPqmgXE0v5wHs3r4nwJODeOSmJ/YJ2cnwh7I5PhkSKaIHFqt5dbrv
	 TyOSV2LQFmuQCe1TOGyxHFRSHk17iFRSEWszGrt4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Sat, 25 Feb 2023 18:09:28 +0100 (CET)
Message-ID: <72b78be1-a117-bea2-bb0a-1b3ecb145472@perex.cz>
Date: Sat, 25 Feb 2023 18:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: infinite loop in src/pcm/pcm_params.c function
 snd_pcm_sw_params_default()
Content-Language: en-US
To: bumpelo@gmail.com
References: <167734349294.22.1388671545195719262@mailman-web.alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: 
 <167734349294.22.1388671545195719262@mailman-web.alsa-project.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K6ZLAPLVHB2LEGF6S53LCCE3ONNDNM5T
X-Message-ID-Hash: K6ZLAPLVHB2LEGF6S53LCCE3ONNDNM5T
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6ZLAPLVHB2LEGF6S53LCCE3ONNDNM5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25. 02. 23 17:44, bumpelo@gmail.com wrote:
> I found this infinite loop while playing with the test/latency.c function. When I specify too small of a minimum latency (in my case -m 256 or smaller) it winds up:
> 
> at line line 2337:
> 	params->boundary = pcm->buffer_size;
> 	while (params->boundary * 2 <= LONG_MAX - pcm->buffer_size)
> 		params->boundary *= 2;
> 	return 0;
> 
> but when pcm->buffer_size is zero this is an infinite loop. It does this *after* setting the scheduling to round-robin which makes the infinite loop so much more painful.

The buffer_size should not be zero after pcm->ops->hw_params() call - an error 
should be returned there, so something bad is in the driver or used plugin in 
the chain.

Which driver do you test? Or do you have a special alsa-lib configuration?

The loop fix in alsa-lib: 
https://github.com/alsa-project/alsa-lib/commit/a8afb0449c6a898180982369f543b50393bb90b6 
. But as I noted, it's not a fix for the broken code.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

