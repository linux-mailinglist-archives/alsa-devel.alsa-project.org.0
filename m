Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CE68EA11
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 09:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57CA20B;
	Wed,  8 Feb 2023 09:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57CA20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675845668;
	bh=jgKGBqvsz9bore/aZiEN3bkFndMKrCRmMAmNABWydr0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwZ7Ru58z+iWROzkRK67i7I5vTBq8/657q0rrKUnQ1nsazmj+s3prijVZB2/6fGq3
	 9sI3Ec+9eGHWIfGKpDVN+n2EaHXEd//mWZXzNbEgrnN7oU2JquphnbsnTsRziNaMM9
	 C/5eNuCbLLCI3VFesmY+HtxGMSa3FlW+lJSvQ7WA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A59F800E2;
	Wed,  8 Feb 2023 09:40:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449D3F80095; Wed,  8 Feb 2023 09:40:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8EB4F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 09:40:08 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0D9C411C6;
	Wed,  8 Feb 2023 09:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0D9C411C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1675845607; bh=sIWx84wjVedBalx3G6+LpCIVD21PqPaz8xE7PwJql8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1mxnHyyPGwnXqK7JnEnHKmaGGaagS1qrgtLVrvArptHnK/6E72JKa3I6trY+Z7RL+
	 JRoljUKbeoiROUzbg42OZugGhhrDfrc+4q1teOQIByi1yCv3uGOl53/0MDwog7hunN
	 1RrCoS2iZHR8TwlqySW/JlCQ3808VN9tJTHutu2s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  8 Feb 2023 09:39:54 +0100 (CET)
Message-ID: <ae3efa77-0dde-4681-d68d-1f483ebd5d9e@perex.cz>
Date: Wed, 8 Feb 2023 09:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XRK6CVUDZBZNT25I47PFQCE2L3KRR5UH
X-Message-ID-Hash: XRK6CVUDZBZNT25I47PFQCE2L3KRR5UH
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRK6CVUDZBZNT25I47PFQCE2L3KRR5UH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07. 02. 23 20:19, Uwe Kleine-König wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>    ALSA: core: Make snd_card_disconnect() return void
>    ALSA: core: Make snd_card_free_when_closed() return void
>    ALSA: core: Make snd_card_free() return void
> 
>   include/sound/core.h      |  6 +++---
>   sound/core/init.c         | 40 ++++++++++++++-------------------------
>   sound/pci/hda/hda_tegra.c |  6 ++----
>   sound/ppc/snd_ps3.c       |  4 +---
>   4 files changed, 20 insertions(+), 36 deletions(-)

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

