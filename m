Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D7733DF2
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 06:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5DA847;
	Sat, 17 Jun 2023 06:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5DA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686975253;
	bh=uCM+G7jkSf49cshI+9gQdtKywW0kscafJv3yANEqVqA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bsBUoY0P6Pylv3vhd1aJsYP2qGZAiFKLEtOqUV7qeKY8VuYDaBRXxCRTRQ5Vfb+zu
	 35k9khZxYYpEifa/BhoJdfb+1Fv7xKPXAAxRQfCtcd0lqQUugQsdpAhR3cU3uVYswP
	 PUTg/3WLJXL3J62MJA4cW+03VD8H3A1QMpU0Vbvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D555F80564; Sat, 17 Jun 2023 06:12:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24790F80544;
	Sat, 17 Jun 2023 06:12:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDE8EF80149; Sat, 17 Jun 2023 06:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7928F80130
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 06:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7928F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNfRb8qD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XjJTLM4M+2wpRQQRg7YsbZBRenTGvXDmTPhLi9n3Shc=; b=xNfRb8qDJ7cHQoKaUzsHjv1gZx
	S8w0p0SzP6AjkncxnMZ6xmecGrqsEeU8rUkmwXBj71ykL4syYeQSI5UuLKcEQP39HwmZ02QEGkT9Z
	lvup2S4DMmVhrF+Hrzz19UJUlHdKF3OO6WghnxmTtgXEm20VPww5rnGFmX5ZQuqmam96GpLSqtD/4
	0gsflKfdhlHFsyfxDNTFX/dikBIt5TY2c/M/J6TqEZqJEb3RyTv0JMx+4EJswtTAv7s+Juyc9yATa
	GBOsQ0s9PlFTHDwIczur2hof6i8wz2ea0MTsLaUdVK1ixwNm5F/92O2RgwESElXy85WxaHNvC8rFS
	G5B3kRdw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qANES-002fHE-1e;
	Sat, 17 Jun 2023 04:08:12 +0000
Message-ID: <bda1dd91-c0d0-dc24-bd8f-246a163f0fc7@infradead.org>
Date: Fri, 16 Jun 2023 21:08:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/4] ASoC: loongson: fix unused PM function warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230616090156.2347850-1-arnd@kernel.org>
 <20230616090156.2347850-2-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230616090156.2347850-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RCHOQ23AFNGJQNIE62OCUJTYI7Q7QERM
X-Message-ID-Hash: RCHOQ23AFNGJQNIE62OCUJTYI7Q7QERM
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCHOQ23AFNGJQNIE62OCUJTYI7Q7QERM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/16/23 02:00, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build testing without CONFIG_PM_SLEEP causes a warning:
> 
> sound/soc/loongson/loongson_i2s.c:246:12: error: unused function 'i2s_suspend' [-Werror,-Wunused-function]
> sound/soc/loongson/loongson_i2s.c:255:12: error: unused function 'i2s_resume' [-Werror,-Wunused-function]
> 
> Use the modern SYSTEM_SLEEP_PM_OPS() instead of the old one to avoid this.
> 
> Fixes: d24028606e764 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  sound/soc/loongson/loongson_i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
> index 35d34568be79e..f73b6d6f16c23 100644
> --- a/sound/soc/loongson/loongson_i2s.c
> +++ b/sound/soc/loongson/loongson_i2s.c
> @@ -265,5 +265,5 @@ static int i2s_resume(struct device *dev)
>  }
>  
>  const struct dev_pm_ops loongson_i2s_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(i2s_suspend, i2s_resume)
> +	SYSTEM_SLEEP_PM_OPS(i2s_suspend, i2s_resume)
>  };

-- 
~Randy
