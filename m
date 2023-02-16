Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73969977C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF51FEA5;
	Thu, 16 Feb 2023 15:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF51FEA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676557941;
	bh=dqoBvTpk39VV6sxzwlZsme2/yh/18Scz/S2EDv3UyPc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QsmlSKc34lfKXchLtkVu+DWGgsQ0L55Gg/m2txTGQWrdJz2EJn5vBSR/2ydqzGxX7
	 d3WGkwSuEMiUJBOZXqfnCne5kxI7il5gJoZguWrqGOZIY1LkDxdcvkvyYaJjuFOeAm
	 bmFeK634xE1ciMCG4gx9IpiVdqiFMokughXCfe8M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D2AF800E4;
	Thu, 16 Feb 2023 15:31:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279B1F80171; Thu, 16 Feb 2023 15:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03D2EF800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:31:23 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A48BF11C1;
	Thu, 16 Feb 2023 15:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A48BF11C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676557882; bh=6dY1A0UFPWQuuapAlpdzCPQP9ob5MI/jkui2BedESi4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UTopnVZi5HSCVqSt31JgIR5PnidL/7A/LGggzsKoCGoBZrGktTJisAZh9Nrr3S9C6
	 HTs9KQtxF8vUC1+FN+p543Uiwb+2Dejp1CcpG/VQktkFLgZGlJVwFunKPYoiIqKzSG
	 c31PKFnaSBQ1pu3z6QzQ6UDgEFaUK2ujA6m13Pkc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 16 Feb 2023 15:31:18 +0100 (CET)
Message-ID: <ace4f06a-ecfd-000d-ec00-d3e70d797bb9@perex.cz>
Date: Thu, 16 Feb 2023 15:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] pcm_rate: fix hw_ptr boundary wrapping issue
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org
References: <20230105153546.468288-1-consult.awy@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230105153546.468288-1-consult.awy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 47ADTFVF2HH7GVY4WVL7EYW2QAU2XG6D
X-Message-ID-Hash: 47ADTFVF2HH7GVY4WVL7EYW2QAU2XG6D
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, mahendran.kuppusamy@in.bosch.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47ADTFVF2HH7GVY4WVL7EYW2QAU2XG6D/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 01. 23 16:35, Alan Young wrote:
> Wrap the hw_ptr using the total position of the slave hw_ptr, including
> boundary wraps. Otherwise, small errors can creep in due to residuals
> (when boundary is not a multiple of period size) and which can
> accumulate.
> 
> Signed-off-by: Alan Young <consult.awy@gmail.com>
> Fixes: 7570e5d7 ("pcm: rate: fix the hw_ptr update until the boundary available")
> ---
>   src/pcm/pcm_rate.c | 54 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
> index c8076859..a29fc5a9 100644
> --- a/src/pcm/pcm_rate.c
> +++ b/src/pcm/pcm_rate.c

...

> +	if (rate->slave_hw_ptr_wrap) {
> +		/*
> +		 * Restrict explicit 64-bit calculations to case where rate->slave_hw_ptr_wrap
> +		 * is non-zero, which will only happen in 32-bit environments.
> +		 */
> +		u_int64_t wrapped_slave_hw_ptr = slave_hw_ptr + rate->slave_hw_ptr_wrap;
> +		new_hw_ptr = ((wrapped_slave_hw_ptr / rate->gen.slave->period_size) * pcm->period_size) % pcm->boundary;
> +		slave_residual = wrapped_slave_hw_ptr % rate->gen.slave->period_size;

I don't think that this calculation is correct. If the boundary differs by 
more than buffer_size, the new_hw_ptr will be cropped (downsampling).

It will be probably much better to track only pointer diffs and let hw/appl 
ptrs updating independently like we do in other plugins.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

