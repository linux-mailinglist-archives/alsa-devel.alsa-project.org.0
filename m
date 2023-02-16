Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4DA699761
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:27:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F887EA4;
	Thu, 16 Feb 2023 15:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F887EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676557663;
	bh=QGvZZInL2BpcKu1YHpBQQptK8QhOhbYnLRMRoXrqPtg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBTDYBxlMw8nQcKKgcZ5oCpdu43y9a5I0vV5X8+KMVmFlTbRns0Hk1iiFmOWlULvB
	 qyWXXo816v1HrsWobzFu1zaUWf+/uh0uX6GNEgSjIUyYM8Tqx/h413PSv4XXT1+/Pb
	 lSZaRgHSzqbo3Fi+cRz65GAYIAbM/ihxoI6dfJkY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F9EF800E4;
	Thu, 16 Feb 2023 15:26:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B91BF80171; Thu, 16 Feb 2023 15:26:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 96F8BF800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:26:46 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 78B2511C5;
	Thu, 16 Feb 2023 15:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 78B2511C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676557605; bh=c9i8Zd3U6xXby1DshGBRPM9VYiUPhRqYbPl7ySqeNiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z4gMejHGzE3dtnVj6vofIYnSxI4VREmj3nx1xv3ZBzJhjiwblFKyKVKJLx6wRZa6+
	 eT6c5zEjMrAURr1r1qjkUoloP8kgGnMXU/iP1bliR6lpRP4OB2d2BPTRQDmO+NnySG
	 TB6Ag0xPUi0EZDGHqPhfU4yhOreDvFENc6DpSLZ8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 16 Feb 2023 15:26:41 +0100 (CET)
Message-ID: <6eb1bf02-fef2-c25a-9e04-ee78d33b2597@perex.cz>
Date: Thu, 16 Feb 2023 15:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] ALSA: pcm: generate default audio timestamp
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org
References: <20230216135928.1974403-1-consult.awy@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230216135928.1974403-1-consult.awy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JGOWZ2UPMAGS6RA3BRPB43RPV7GJDVYE
X-Message-ID-Hash: JGOWZ2UPMAGS6RA3BRPB43RPV7GJDVYE
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGOWZ2UPMAGS6RA3BRPB43RPV7GJDVYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16. 02. 23 14:59, Alan Young wrote:
> If there is no get_time_info() available or the requested audio
> timestamp type is AUDIO_TSTAMP_TYPE_DEFAULT then need to set
> audio_tstamp_report.actual_type = AUDIO_TSTAMP_TYPE_DEFAULT (in the
> else clause near the start of snd_pcm_update_hw_ptr0()) in order for
> update_audio_tstamp() to generate the audio timestamp from the number
> of frames.
> 
> Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
> Signed-off-by: consult.awy@gmail.com

It makes sense.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

