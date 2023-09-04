Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05E79208B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C99BC0;
	Tue,  5 Sep 2023 08:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C99BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895187;
	bh=W48eUaigC/q/9Vh62BQ/O1KK4hWEE98Cu/B2HjHe9J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LugCnopqmZtibjArE0M3WWAAbAbWKOUwal+qJRjFhSkMRcRWHYFNtLsBHJVa+vcrx
	 jvmgoIYYgV1PwZBC/4su/BTEVEFqy6ksDpAvPcYB9qPDE3TGl1UN7Sd+MXhOZiqBh4
	 rHY3qH7JU7wvZOjSiR9B4gNHrCFphMCw2JFmoY6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A0CFF80571; Tue,  5 Sep 2023 08:24:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F32ABF8057F;
	Tue,  5 Sep 2023 08:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8694F8047D; Tue,  5 Sep 2023 01:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D522F80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 01:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D522F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sorrel.sh header.i=@sorrel.sh header.a=rsa-sha256
 header.s=mythic-beasts-k1 header.b=cmS9Biem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sorrel.sh;
	s=mythic-beasts-k1; h=From:To:Subject:Date;
	bh=5ya9GFvoiOZ3eDqN3x0kvIb4vIxMJkc0ruZbcotFYXY=; b=cmS9BiemwAm7N/Lyk7qvEy+eJh
	BRYeRg0934Q4e1Jg4CPP1wRuC27I29HAwtWG+JhV80LJ2qFGLhZhqfDiu9TWFYn4m80ai0aNqUIl+
	M7PjnnqedJ6+MPl1Xte7PoYWxRQ5+q6+sDRYDl37mmQl2qZoZKBoysiWT7WJLhv6S4mC7DK08STGh
	IFyUexOAuW1enhp+U/EfE26qxLhWpV7Ne7+D83BpPgaOaHtqiXUxl6yh1fkA6+t9hcIJqlXh7y8qk
	SD3Gtd6EfFepwOlWJ3me02ZwoJ1NHRRrvQtUR/SuK3rdO5RyiriBRMWVqZ4QH5RTYb0gkAAWCDGGS
	Ll8F2TWQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ash@sorrel.sh>)
	id 1qdIYH-002QxT-K8; Tue, 05 Sep 2023 00:00:13 +0100
Message-ID: <46e9cbcc-8fbc-4f58-9ec9-b17dfdf25a5f@sorrel.sh>
Date: Tue, 5 Sep 2023 00:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
 <87msy1ip6l.wl-tiwai@suse.de>
Content-Language: en-US
From: Ash Holland <ash@sorrel.sh>
In-Reply-To: <87msy1ip6l.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
X-MailFrom: ash@sorrel.sh
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O2PZ3XI2NJ2Z4QHEHRMIHZKNBEILADGT
X-Message-ID-Hash: O2PZ3XI2NJ2Z4QHEHRMIHZKNBEILADGT
X-Mailman-Approved-At: Tue, 05 Sep 2023 06:24:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2PZ3XI2NJ2Z4QHEHRMIHZKNBEILADGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/09/2023 22:49, Takashi Iwai wrote:
> Yes, that was a bad change.  Could you try the fix below?
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/core/seq/seq_memory.c
> +++ b/sound/core/seq/seq_memory.c
> @@ -187,8 +187,12 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
>   	err = expand_var_event(event, 0, len, buf, in_kernel);
>   	if (err < 0)
>   		return err;
> -	if (len != newlen)
> -		memset(buf + len, 0, newlen - len);
> +	if (len != newlen) {
> +		if (in_kernel)
> +			memset(buf + len, 0, newlen - len);
> +		else
> +			clear_user((__force void __user *)buf + len, newlen - len);
> +	}
>   	return newlen;
>   }
>   EXPORT_SYMBOL(snd_seq_expand_var_event);

That patch seems to work fine! Many thanks.

-- 
Ash Holland, she/her

