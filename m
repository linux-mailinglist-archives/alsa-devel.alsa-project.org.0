Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DC69F980
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 18:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E2B93A;
	Wed, 22 Feb 2023 18:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E2B93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677085491;
	bh=kQZvzsBkSmqP8Ai2uYwUTkSknxwuPv2sYdi3BDUdDvA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ETrjyZQNEqeKzYLuTo8HDMMCJ8GZHJvzggLr1bzGfFLXL1w/3PHgxILYZOm7jm3xk
	 Bh9Q32tok8qhccJ7FAXnwqNr8Wd3UijR2dgBLGrVBPuASoideoQMscfOcd15nhpFGK
	 Rb+LEFsnMj7YtjxEg9GojfyrPpQvKijF1Se+CmvM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A25E8F8025A;
	Wed, 22 Feb 2023 18:04:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83560F80266; Wed, 22 Feb 2023 18:03:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92BA0F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 18:03:50 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5459311C4;
	Wed, 22 Feb 2023 18:03:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5459311C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1677085429; bh=BMMOJwdwmEkFVjQd2v7dF22FPGRM2biB97ZKaOQRAQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i4unUemLdFYFHrFi411axRy7rVbfHrdK0wfeQNd9akvv/FzPm5GgxrTTn013UgRTC
	 cmK30bKFVzXIhI41F+9YDR/uNZRzdhctKq6EfQDvANmXAjdVQBInG5kCz1owEnOFdE
	 syO/yu7Vth0jTK4CP3fKMvO4gDyWV2icVCEGVjs4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 22 Feb 2023 18:03:46 +0100 (CET)
Message-ID: <663f6e7b-300b-502a-bdb7-8e89895b6e08@perex.cz>
Date: Wed, 22 Feb 2023 18:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ucm2: Rockchip: rk817: Add ALSA UCM support
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, alsa-devel@alsa-project.org
References: <20230222163826.73354-1-macroalpha82@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230222163826.73354-1-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y4MNJAWTAAXALAW75OZ4JCIWWSY4NI6N
X-Message-ID-Hash: Y4MNJAWTAAXALAW75OZ4JCIWWSY4NI6N
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Chris Morgan <macromorgan@hotmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4MNJAWTAAXALAW75OZ4JCIWWSY4NI6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22. 02. 23 17:38, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add ALSA-UCM support for the Rockchip RK817 audio codec. This codec
> is typically configured either with an internal or external amplifier
> as reflected by the longname. This configuration has been tested on
> the Anbernic RG353P (rk817_ext) and the Odroid Go Advance (rk817_int).

Thank you for your contribution.

> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   ucm2/Rockchip/rk817-sound/HiFi.conf        | 66 ++++++++++++++++++++++
>   ucm2/Rockchip/rk817-sound/rk817-sound.conf |  7 +++
>   ucm2/conf.d/simple-card/rk817_ext.conf     |  1 +
>   ucm2/conf.d/simple-card/rk817_int.conf     |  1 +
>   4 files changed, 75 insertions(+)
>   create mode 100644 ucm2/Rockchip/rk817-sound/HiFi.conf
>   create mode 100644 ucm2/Rockchip/rk817-sound/rk817-sound.conf
>   create mode 120000 ucm2/conf.d/simple-card/rk817_ext.conf
>   create mode 120000 ucm2/conf.d/simple-card/rk817_int.conf
> 
> diff --git a/ucm2/Rockchip/rk817-sound/HiFi.conf b/ucm2/Rockchip/rk817-sound/HiFi.conf
> new file mode 100644
> index 0000000..e285db7
> --- /dev/null
> +++ b/ucm2/Rockchip/rk817-sound/HiFi.conf
> @@ -0,0 +1,66 @@
> +If.1 {
> +	Condition {
> +		Type ControlExists
> +		Control "name='Internal Speakers Switch'"
> +	}
> +
> +	True {
> +		SectionDevice."Speaker".EnableSequence [
> +			cset "name='Playback Mux' HP"
> +			cset "name='Internal Speakers Switch' on"
> +		]

It would be better to use variable (Define) to set the "Playback Mux", because 
the [] arrays are stacked after evaluation in this case like:

SectionDevice."Speaker".EnableSequence [
	cset "name='Playback Mux' SPK"
	cset "name='Playback Mux' HP"
	cset "name='Internal Speakers Switch' on"
]

so

Define.pbk_mux "SPK"
.... If.1.True { Define.pbk_mux "HP" }
.... SectionDevice."Speaker".EnableSequence [
	cset "name='Playback Mux' ${var:pbk_mux}"
]

Otherwise a nice clean config.

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

