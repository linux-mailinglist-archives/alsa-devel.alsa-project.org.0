Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465247562DB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10BE6DE5;
	Mon, 17 Jul 2023 14:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10BE6DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689597365;
	bh=4hcz589/4rjVjZd+XNBxyGWSm9oIwDca+sZmTL0ACzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qJuvo8G+q427ClnX0LQOdKjZFhirdI6JHYOcr9wjpDj+LOvs53b1FumlsWn7uw19S
	 JQWPMSX6CxjF4Xot2bBZO5gUdvqKK8JwlwBRFfZDImaS/HHCrPOHEwib5NrUSuN9P8
	 sF7NGqYzu6v2xFsTc9Hq24iPeE4635qcdv9r84oA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B01EF8032D; Mon, 17 Jul 2023 14:35:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14BCEF8032D;
	Mon, 17 Jul 2023 14:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B6DBF8047D; Mon, 17 Jul 2023 14:35:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA44DF8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 14:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA44DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mo5YxrLe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uI/9G3G7T4f36YRNHmjqAGhqu8fowy7O9r6FIhnzxuA=; b=mo5YxrLeBOo1QV0FDIAUKzpPLZ
	rmSg1KnJOHE0l1uFKy+rgilUqy/Uo5D1FP5CYLWS5tw5LLV8/VJs/xibJvXFMVvRh/pOGIkU76dV8
	A0zBQ8i93aH4clGMMVqOjml0jHT5YLYYcBI7DUBwkJN+P93lMlSGQn7YpGNmXWDRq+oQiVLbTsDUR
	vfIGe5YrsIxbm+lZoawQ1tiXiycRd8Paj784jQrlpgk5i6m3hxtFYLD85qEbZD2PseckDhgoCAiqt
	zRnK4gT/aVAdxYA7WINAB1/yRD4L3A5dh6qOIMr6vScXAT5S140+GzQ19p6FtMJ2rhbM+4mNQB1x1
	EVQidmTQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNQG-004059-2o;
	Mon, 17 Jul 2023 12:34:27 +0000
Message-ID: <94068cfc-186a-1cac-0f76-77b3b46a85bd@infradead.org>
Date: Mon, 17 Jul 2023 05:33:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V1 4/5] ASoC: codecs: aw88261 chip register file, data
 type file and Kconfig Makefile
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.co,
 shumingf@realtek.com, herve.codina@bootlin.com, flatmax@flatmax.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 pierre-louis.bossart@linux.intel.com, kiseok.jo@irondevice.com,
 liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com, zhangjianming@awinic.com
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
 <20230717115845.297991-5-wangweidong.a@awinic.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230717115845.297991-5-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4H3UJ42SD47GSNKP3PRKLUIAF7XE43ZX
X-Message-ID-Hash: 4H3UJ42SD47GSNKP3PRKLUIAF7XE43ZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4H3UJ42SD47GSNKP3PRKLUIAF7XE43ZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/17/23 04:58, wangweidong.a@awinic.com wrote:
> +config SND_SOC_AW88261
> +	tristate "Soc Audio for awinic aw88261"

	                        Awininc
(as below)

> +	depends on I2C
> +	select CRC8
> +	select REGMAP_I2C
> +	select GPIOLIB
> +	select SND_SOC_AW88261_LIB
> +	help
> +	  this option enables support for aw88261 Smart PA.

	  This

> +	  The Awinic AW88261 is an I2S/TDM input, high efficiency
> +	  digital Smart K audio amplifier with an integrated 10.25V
> +		smart boost convert.

Less indentation on the last line (align it with the previous line).

-- 
~Randy
