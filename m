Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA699785
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8296AEBA;
	Thu, 16 Feb 2023 15:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8296AEBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676558103;
	bh=Mm/55tBjbgL/txSD+tzQKgwaOGSS47Ky6YzERePf0MQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ha+jJHlCDVhTfpUuEJUDAw03dg+saV3CMNaBNN9sZGXI7KO0vLzOogl7cE//7qKGA
	 WAt3blHefQus1BDXeT3brDHt/Bp4k2U9It7beV7N3D4qRJK+npDKc7WO2/D9sRR/Y8
	 VNVQo3FPHFQrp3gqKWM1yHu1phxcb8fRti4l0IL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA9EF800E4;
	Thu, 16 Feb 2023 15:34:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D686BF80496; Thu, 16 Feb 2023 15:34:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DC9F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:34:06 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DB8FF11C4;
	Thu, 16 Feb 2023 15:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DB8FF11C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676558045; bh=STj+elQBi5+b1Dfi/gRacExWxgA0mUac5rXDghAwbg8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JEfhyey/qLTdbyUjSQFKWrydj/UnieMbIhWHcYnXDgqOmD2bfDIAXCo6wVnSYcNqH
	 08opI2U1GqNWQDDHK9c8uM14OQFzq/U3tKHFCIqor3YV/x+maF7E0C5yh9SBjsXGn0
	 LHGKXUtWyxhU9X954H41dewi17PYQVjx01UTdDzk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 16 Feb 2023 15:34:02 +0100 (CET)
Message-ID: <fe94c35f-c03a-45df-a9ce-6e8fa4ddb373@perex.cz>
Date: Thu, 16 Feb 2023 15:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Fwd: [PATCH] pcm_rate: fix hw_ptr boundary wrapping issue
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
References: <20230105153546.468288-1-consult.awy@gmail.com>
 <877b4a88-a30a-751d-8f8a-1e1eab0295ec@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <877b4a88-a30a-751d-8f8a-1e1eab0295ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DU6T2ZGGY5DFEPQKIQHZNEQKMRNSI3WI
X-Message-ID-Hash: DU6T2ZGGY5DFEPQKIQHZNEQKMRNSI3WI
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU6T2ZGGY5DFEPQKIQHZNEQKMRNSI3WI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16. 02. 23 14:45, Alan Young wrote:
>     Hi, did this one slip past? I have not see any response. Alan.

I replied to the original e-mail. Usually, it's better to continue in a thread 
than to do a malformed forward.

				Jaroslav

> 
>     -------- Forwarded Message --------
>     Subject: [PATCH] pcm_rate: fix hw_ptr boundary wrapping issue
>     Date: Thu, 5 Jan 2023 15:35:46 +0000
>     From: Alan Young [1]<consult.awy@gmail.com>
>     To: [2]alsa-devel@alsa-project.org
>     CC: [3]tiwai@suse.de, [4]mahendran.kuppusamy@in.bosch.com, Alan Young
>     [5]<consult.awy@gmail.com>
>     Wrap the hw_ptr using the total position of the slave hw_ptr, including
>     boundary wraps. Otherwise, small errors can creep in due to residuals
>     (when boundary is not a multiple of period size) and which can
>     accumulate.
>     Signed-off-by: Alan Young [6]<consult.awy@gmail.com>
>     Fixes: 7570e5d7 ("pcm: rate: fix the hw_ptr update until the boundary
>     available")
>     ---
>     src/pcm/pcm_rate.c | 54 ++++++++++++++++++++++++++++++----------------
>     1 file changed, 36 insertions(+), 18 deletions(-)
>     diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c

...

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

