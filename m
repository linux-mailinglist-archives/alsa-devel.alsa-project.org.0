Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147BD6FE418
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 20:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1331025;
	Wed, 10 May 2023 20:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1331025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683743955;
	bh=tXSeQ8Rp1SAm6wZTy252KvGgKAjJSV65eN5tFpe6hH4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TzHdRqv6BW7Lsph3jQozFXHjReOoes5cyPRtV0dRdkYUyyMx+f1XNMFFyDILVf9TJ
	 jJc2EzZGPOUE6hhhV9R9np0chVfs9x2swbOjrqTf2apZauKrjE2PJ4sTKqD4WWn20y
	 sSUVwAmQEcdppCSrnGOfK2ZelXr/CKb7td8rk+WE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 549A2F80310;
	Wed, 10 May 2023 20:38:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F46F8032D; Wed, 10 May 2023 20:38:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 446B8F8014C;
	Wed, 10 May 2023 20:38:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4F44211EF;
	Wed, 10 May 2023 20:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4F44211EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683743889; bh=ri+SN1jwskogaFvGNQBSZMgmigDA6wN+C9KV2+8HeGQ=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=JTC3bjDgLZHsqazeco8KkBNw30fi/K8yoY6NnKrzpw5bDeZZMHvvzGaCH4KoA/EjF
	 qOVz6KjtmiOiw1eEn5cYdX23KdXqtxb+ECsuwTp4stTkm3cdUcetfPr6dmXgoU7pgz
	 1RNa2CeVt2H+/v21b34CLb+jGQeDFjFVLdv1DgJQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 10 May 2023 20:38:03 +0200 (CEST)
Message-ID: <ed0c96e3-386c-838b-2a21-b4a826222dad@perex.cz>
Date: Wed, 10 May 2023 20:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
References: <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
 <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
 <20230510-robert-diane-joe-846d41@meerkat>
 <41443193-1c4a-bfea-f81c-e6658b7addee@perex.cz>
 <20230510-raked-loft-bureau-1c87fb@meerkat>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <20230510-raked-loft-bureau-1c87fb@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AP7WYR5JTMTU6XVIPU2TCEWONPLLZ7BD
X-Message-ID-Hash: AP7WYR5JTMTU6XVIPU2TCEWONPLLZ7BD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AP7WYR5JTMTU6XVIPU2TCEWONPLLZ7BD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10. 05. 23 18:43, Konstantin Ryabitsev wrote:
> On Wed, May 10, 2023 at 06:19:15PM +0200, Jaroslav Kysela wrote:
>> On 10. 05. 23 17:34, Konstantin Ryabitsev wrote:
>>
>>> So, I'm just going to repeat this: operating a mailing list and remaining
>>> DMARC compliant is perfectly possible, provided:
>>>
>>> - the original message is DKIM-signed
>>> - all existing headers are unmodified
>>> - the message body is unmodified
>>
>> Example of e-mail which is rejected by google's mx servers:
>>
>> https://lore.kernel.org/alsa-devel/20230510142227.32945-1-vitalyr@opensource.cirrus.com/raw
> 
> Thank you for this example -- it plainly illustrates the problem, which is
> that Mailman 3 mangles messages.
> 
> If you compare the above message with the message that passed via vger, you
> will notice what went wrong:
> 
>      -CC:     <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
>      -        <linux-kernel@vger.kernel.org>,
>      -        Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>      +CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
>      + linux-kernel@vger.kernel.org, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> 
> For some bizarre reason Mailman-3 decided to make the CC header "more pretty"
> by stripping the angle brackets around addresses. Since it's a DKIM-signed
> header, this invalidates the signature and results in DMARC violations.
> 
> The answer, unfortunately, is to stop using Mailman-3. It's not usable for
> patch-based workflows.

Whoops. It seems that mm3 guys knows about it:

https://gitlab.com/mailman/mailman/-/merge_requests/1039

I tried to apply the noted workaround. Crossing fingers.

Thank you for your help.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

