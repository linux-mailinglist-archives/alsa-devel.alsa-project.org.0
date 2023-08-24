Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C0787B8F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E570836;
	Fri, 25 Aug 2023 00:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E570836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916720;
	bh=qfO43KuY9H4FZIv5b2C4WjeQJ8C9kmFK9DgPZV/NQD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhVQ2+GpSMlBOOeHtKtA+WONCtDYU3QTQD6yiC4sJAjFErBeBYuLnIu9WXcndu2mW
	 DyA/9yiry4t3CZOVOY/QM4FUktZueCo2vzvT8IVFxgR40aH+y4Utajsbi6HVy6MZe0
	 3MgrgMCECuv7V8ErwiLmX8oRnO++YtdBxKVVV4qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 010FBF804DA; Thu, 24 Aug 2023 23:19:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D8B4F800F5;
	Thu, 24 Aug 2023 23:19:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4288F80158; Thu, 24 Aug 2023 23:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C1CF800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C1CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=T72ehi/8
Received: from [192.168.1.90] (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8B6D6607273;
	Thu, 24 Aug 2023 22:19:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692911977;
	bh=qfO43KuY9H4FZIv5b2C4WjeQJ8C9kmFK9DgPZV/NQD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T72ehi/8b7imqbsQe/GvyYm6S0FEWEJuHY/frQC5n0Q3vL2qZ3w0Lvw7nJnvxh8aJ
	 dFsTuWStzmmMDPGOsfVyk/ORGDsfgN0+Q3susU7avvBRP5kuj+W8lwsRCXXkMVh28r
	 q8L5q2X35Xt1Dyt1fdzY7qQUFRiAi1QzwLiX/QanzM4WwQSGI5c5Bd1eU+b8IjoLgk
	 1VA4KvsqUOLYF7ZTEs+JSqIxH41IDMJ2hTgaJn3XwHaIMcl9QMBmykKSkf5HMP+HzT
	 2QbLQeKJ17ipR5urei0Ya69IvC0rep7YwfGktfWGi3CyT75s82lW0if9FiqwXswwU6
	 4pMvpqehKLO7w==
Message-ID: <405e420d-ba17-4a20-9cec-11e821b73bbf@collabora.com>
Date: Fri, 25 Aug 2023 00:19:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core.c: Do not error if a DAI link component is
 not found
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
 <ZOe36EyxNQuz08qt@finisterre.sirena.org.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ZOe36EyxNQuz08qt@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YWXNVTZKXNQZ7YN5IWMCSAFL5BAJ3OWT
X-Message-ID-Hash: YWXNVTZKXNQZ7YN5IWMCSAFL5BAJ3OWT
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWXNVTZKXNQZ7YN5IWMCSAFL5BAJ3OWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/24/23 23:04, Mark Brown wrote:
> On Thu, Aug 24, 2023 at 10:38:37PM +0300, Cristian Ciocaltea wrote:
>> A recent cleanup of soc_dai_link_sanity_check() is responsible for
>> generating lots of confusing errors before returning -EPROBE_DEFER:
>>
>>   acp5x_mach acp5x_mach.0: ASoC: Component acp5x_i2s_dma.0 not found for link acp5x-8821-play
>>   [...]
>>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:00 not found for link acp5x-CS35L41-Stereo
>>   [...]
>>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:01 not found for link acp5x-CS35L41-Stereo
>>
>> Switch back to the initial behaviour of logging those messages on
>> KERN_DEBUG level instead of KERN_ERR.
>>
>> While at it, use the correct form of the verb in 'component_not_find'
>> label.
> 
> Don't include random extra stuff in patches unless there is substantial
> overlap, send one change per patch.

I submitted v2 with the unrelated changes moved to a separate patch:

https://lore.kernel.org/all/20230824211241.388201-1-cristian.ciocaltea@collabora.com/

Thanks,
Cristian
