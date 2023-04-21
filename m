Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A729F6EA70B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 11:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC42E75;
	Fri, 21 Apr 2023 11:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC42E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682069681;
	bh=g8YYYbBsmTJfmthbCo5HF4kWPR1BPAD0tZ9bkdD2HMI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jZZFk+jjoE5oDARA7ySRIwgk3quZO+F1r0YQEyr+KCcSsSDHO5kl5JkyltQXCrXJ1
	 K0ZgJ7Mt/0nEKFBV+kROcFAD5dAwXMJogZZnzf2FZnIvntqn+drJ7C5JPM839RT+Hf
	 TdgLBtfDe1NZtoZfJo3pAODrnMWG3iFrhPdK8TSU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F62F800F8;
	Fri, 21 Apr 2023 11:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D645AF80155; Fri, 21 Apr 2023 11:33:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CE77F800D0
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 11:33:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2197611ED;
	Fri, 21 Apr 2023 11:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2197611ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682069619; bh=PJshznUYHiA5zIPxmmYVhSFbDtgEyv73TkKFJFwtZYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2DLvIeviKe2iAAJJlXhW3WQKnOWf/N6OtE8N4pzHRo4RqmQheUrc4XMC/XAx4Z3yS
	 y4u0Pco25GguqoVLx5d0LB7jssPAIqGoNwMfpg4xpPAXi+e/K2yYFVhH4xVbIZqKqS
	 LaQWRXl+ldr5FK2mgettLKu1kg2EUo0s9pLEPqhM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 21 Apr 2023 11:33:36 +0200 (CEST)
Message-ID: <6b7275c2-4f88-46ed-3b8b-076298c7562a@perex.cz>
Date: Fri, 21 Apr 2023 11:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
 <20230420113324.877164-2-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230420113324.877164-2-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EHZBC4PQRDU6BHHQDSVU5MCEYVOH3TIC
X-Message-ID-Hash: EHZBC4PQRDU6BHHQDSVU5MCEYVOH3TIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHZBC4PQRDU6BHHQDSVU5MCEYVOH3TIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20. 04. 23 13:33, Oswald Buddenhagen wrote:
> Draining will always playback somewhat beyond the end of the filled
> buffer. This would produce artifacts if the user did not set up the
> auto-silencing machinery, which is an extremely easy mistake to make, as
> the API strongly suggests convenient fire-and-forget semantics. This
> patch makes it work out of the box.

NACK. The initial implementation should be put to alsa-lib as discussed.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

