Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94B6EA6CE
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 11:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7E6E78;
	Fri, 21 Apr 2023 11:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7E6E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682068907;
	bh=KJjaese+jQjsDmj7QvcjjSUjxDD4QZPkioQUVGlp3eE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3IEGQnYDp00qYv6cu2S4y/dLtrQZ3peHJohM5OO9OMj7Of/XIeFyaCTJb1MHfyxN
	 d0FOGkgTfoR0ApG8RxHgJ4hTgkHoIjHmxNO8r3QeXdoMkhqQAhzfBkDtQZEt579Wx8
	 v89rxeX1bcGwCw/JRIFYM22NCad6W1qH/JvyRfeM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5FC3F80149;
	Fri, 21 Apr 2023 11:20:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FDC4F80155; Fri, 21 Apr 2023 11:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23507F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 11:20:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1BA1E11CF;
	Fri, 21 Apr 2023 11:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1BA1E11CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682068851; bh=opqX3G8P4vWD7XC4xITarUVc55zTwG14enPWsvmfR60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TS1Xh2dw0N6I6ndQh3+TeF/UPbiagUr6h1bSKptdZHEiR+HjFXBb70NlTdBkKFzYP
	 IaigWf1HE7FYBd0E52bzz18imbNAiX5tvpSftJlWpJrh7/t64ngYOosxYO17La9Wae
	 0G1CH1DQmliIPIeU8HmOdNc6yqh6G6SKKEZB954Q=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 21 Apr 2023 11:20:48 +0200 (CEST)
Message-ID: <8ebae680-a41f-6ef3-c4d7-aa15fb6240ff@perex.cz>
Date: Fri, 21 Apr 2023 11:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HWUK36NMV6AO2WXWWYKIOZV35V7TAFE5
X-Message-ID-Hash: HWUK36NMV6AO2WXWWYKIOZV35V7TAFE5
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWUK36NMV6AO2WXWWYKIOZV35V7TAFE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20. 04. 23 13:33, Oswald Buddenhagen wrote:
> The auto-silencer supports two modes: "thresholded" to fill up "just
> enough", and "top-up" to fill up "as much as possible". The two modes
> used rather distinct code paths, which this patch unifies. The only
> remaining distinction is how much we actually want to fill.
> 
> This fixes a bug in thresholded mode, where we failed to use new_hw_ptr,
> resulting in under-fill.
> 
> Top-up mode is now more well-behaved and much easier to understand in
> corner cases.
> 
> This also updates comments in the proximity of silencing-related data
> structures.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Looks much better. Thanks.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

