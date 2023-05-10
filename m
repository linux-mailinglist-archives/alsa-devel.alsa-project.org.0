Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0C6FE241
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 18:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 942761044;
	Wed, 10 May 2023 18:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 942761044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683735626;
	bh=rQhn3NwLPBBwHEi62lF5sP+tdL9nkrA5HSumQjyakjA=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cO+CM6jLdDqmT8dQvlvRcGh5Ms1+2R4p+Hg4Q3DVWdj/7k29GzdPigmxRgKVzMrA1
	 pwzrlTlHrUV7UAyHnCgiDY2bOzo8P8BY7QKMiCA7lhj2ZAYPL4A9LgUzVhH1OJSNfi
	 FnEyFXGIFNr+RmPoss3NiNSoejAqGvojBoH3tbHA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C93B8F80310;
	Wed, 10 May 2023 18:19:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BE76F8032D; Wed, 10 May 2023 18:19:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE4EF8014C;
	Wed, 10 May 2023 18:19:22 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C564A11F7;
	Wed, 10 May 2023 18:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C564A11F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683735561; bh=YJxXXmYujBSOFkyN+o12AQx4kabF5yyXLHiHkL2kR7k=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=OwpEMGd5o3IBKCS4iWzQxeR7/sKFlzH0LMM22DiyvkNPaSy3/YcRblr9bzGhE19WA
	 7Dcz6on54KV7x7Xhupc6o3VV/ZiQVlkL0JCU6C3zE7pVU1K+6de7uA58Avpdno39X3
	 kSYdvsJ44mq79YCXfQfaak6zcXKVC9revTtv3QaA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 10 May 2023 18:19:15 +0200 (CEST)
Message-ID: <41443193-1c4a-bfea-f81c-e6658b7addee@perex.cz>
Date: Wed, 10 May 2023 18:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
 <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
 <20230510-robert-diane-joe-846d41@meerkat>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <20230510-robert-diane-joe-846d41@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X7LXRMFDTM2RMGAW7FPE3MYXBNDVJTEB
X-Message-ID-Hash: X7LXRMFDTM2RMGAW7FPE3MYXBNDVJTEB
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7LXRMFDTM2RMGAW7FPE3MYXBNDVJTEB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10. 05. 23 17:34, Konstantin Ryabitsev wrote:

> So, I'm just going to repeat this: operating a mailing list and remaining
> DMARC compliant is perfectly possible, provided:
> 
> - the original message is DKIM-signed
> - all existing headers are unmodified
> - the message body is unmodified

Example of e-mail which is rejected by google's mx servers:

https://lore.kernel.org/alsa-devel/20230510142227.32945-1-vitalyr@opensource.cirrus.com/raw

 From the postfix e-mail queue:

https://gist.github.com/perexg/ac06eacd8b3a8f741ef5602ec748e0a8

SMTP error:

reason=host alt1.aspmx.l.google.com[142.251.9.27] said: 550-5.7.26 
Unauthenticated email from cirrus.com is not accepted due to domain's 
550-5.7.26 DMARC policy. Please contact the administrator of cirrus.com domain 
550-5.7.26 if this was a legitimate mail. Please visit 550-5.7.26 
https://support.google.com/mail/answer/2451690 to learn about the 450 4.7.26 
DMARC initiative. mz11-20020a1709071b8b00b009665976cbddsi3525670ejc.170 - 
gsmtp (in reply to end of DATA command)

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

