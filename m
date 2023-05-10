Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD46FE2CD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 18:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C811014;
	Wed, 10 May 2023 18:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C811014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683737760;
	bh=gdfDGCkAwLxnq7fj1R5C13I6V4pSD/DIKF1qCqMqIw8=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UV8kdf5DwomYkBXIxxleOtZ+4Ulpg5DnoqjfLoQUQWxSlFCPy8lwj/JIVQfLWPLgF
	 08ccPjAZb3ExALn1GXSZ0NtP8h4qiP4Z0LS9zOzpFL1rwznwI+tbvTmyxLVHs/VKC1
	 qaSWC8k4hLiRtGvmCGIhHds9unP/nUCvpchgLSlg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B02AAF80310;
	Wed, 10 May 2023 18:55:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20DD0F8032D; Wed, 10 May 2023 18:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BECCF80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 18:55:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8506511F7;
	Wed, 10 May 2023 18:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8506511F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683737701; bh=Xd+L7eTp5FVpb6D1pWVSz8ugqqmMP0C1GtW3qYGO8PM=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=D7cL/gghe0MMR5G4Y867+CvSAqKMiL1P7AYtYpqwxRxilfmZPzQkF+qylrGX9uwTU
	 qfyExSsYE8MUpeiYTFhdrNjWq62oPfHuDUEC9ya1S+0EybSCXK/adkkHl4fm0/fLFS
	 lxQOujO7Zo0Kp7Cz1PfAHTcAaAKWTND73FB0+K50=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 10 May 2023 18:54:58 +0200 (CEST)
Message-ID: <24e60af6-9585-289c-05e5-5b34370c6dba@perex.cz>
Date: Wed, 10 May 2023 18:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230510162924.3063817-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v3] ALSA: pcm: auto-fill buffer with silence when draining
 playback
In-Reply-To: <20230510162924.3063817-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3CGXNVGL3H77UOSJVKFX63YAVTJ7YSVS
X-Message-ID-Hash: 3CGXNVGL3H77UOSJVKFX63YAVTJ7YSVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CGXNVGL3H77UOSJVKFX63YAVTJ7YSVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10. 05. 23 18:29, Oswald Buddenhagen wrote:
> Draining will always playback somewhat beyond the end of the filled
> buffer. This would produce artifacts if the user did not set up the
> auto-silencing machinery, which is an extremely easy mistake to make, as
> the API strongly suggests convenient fire-and-forget semantics. This
> patch makes it work out of the box.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

NAK. Already implemented in alsa-lib which is enough for the first 
implementation. This patch also does not set the perfect drain flag nor 
handles the silence suppression for the user space (double fill) [1].

				Jaroslav

[1] https://lore.kernel.org/alsa-devel/20230502115536.986900-1-perex@perex.cz/

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

