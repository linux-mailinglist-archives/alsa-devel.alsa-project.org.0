Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E977F994
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8F7491;
	Thu, 17 Aug 2023 16:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8F7491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692283659;
	bh=hUNZeAbkgLLdRzVfeVtLy1yEgn+EL+ZAxz96s8PM13Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i2QKRToWChYLX8YvZJ2gcTIeae2J6tIueGDyHrvyGmex5M1gTPhKTk9xEUSOfX2Wx
	 5ujE+jWiCTxvM7NeSt/vrfoUEsJi0j+gNhLXLddcMn5AqQKU4OpRZ4dSR+DFJo5Dmx
	 modRp0SG07B/c86dGYLdgU941HY2vUlvcwDcVE3c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80AA3F80290; Thu, 17 Aug 2023 16:46:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC80F8016A;
	Thu, 17 Aug 2023 16:46:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DA0F8016D; Thu, 17 Aug 2023 16:46:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08131F80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08131F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=24mMes57
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=8dLjl/f0oqc6iisdMk//W6ivYdiSooQ3OIVW7599Y8g=; b=24mMes57Zdeoj0El69VWAj+vsn
	waZxJXOHekNIkVRrf1dqICRVd9r3/UTQ3oDVEPMdMNobKzbh/uxqNbDXG7rgobV074XKmPuBQ0xF8
	Ge3Mj+EFa9aOMM4VNCeJSubQMnC3VgpSPTFYwkNd4z1TLoHbKrz0vjDC+Ba/Qk61uyHSILBynKGuR
	nR0cHFyytEh47+iutkaXu2HGGFzazWj8SvUTeUkwVRw8mAvzlqDqXCSw0Lwnt0tQkvu8UisCFlaOE
	JHBJ9kJpOA2ptENhBCFfvV269Xv9TS1/OmelmBhMZ5Ui7giEPBBaknvCHWTty9of7u0Q7kePUP4Ju
	eqTnlRAA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qWeGB-006aDF-1f;
	Thu, 17 Aug 2023 14:46:03 +0000
Message-ID: <779de02d-0fde-37dc-529b-3fe87b62455b@infradead.org>
Date: Thu, 17 Aug 2023 07:46:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 4/6] ASoC: mediatek: mt7986: add machine driver with
 wm8960
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230817101338.18782-1-maso.huang@mediatek.com>
 <20230817101338.18782-5-maso.huang@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817101338.18782-5-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HOXECYBTOQ5L3J6YOV5ASZVPOJFKOILF
X-Message-ID-Hash: HOXECYBTOQ5L3J6YOV5ASZVPOJFKOILF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOXECYBTOQ5L3J6YOV5ASZVPOJFKOILF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/17/23 03:13, Maso Huang wrote:
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 558827755a8d..8d1bc8814486 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -64,6 +64,16 @@ config SND_SOC_MT7986
>  	  Select Y if you have such device.
>  	  If unsure select "N".
>  
> +config SND_SOC_MT7986_WM8960
> +	tristate "ASoc Audio driver for MT7986 with WM8960 codec"

s/ASoc/ASoC/

> +	depends on SND_SOC_MT7986 && I2C
> +	select SND_SOC_WM8960
> +	help
> +	  This adds support for ASoC machine driver for MediaTek MT7986
> +	  boards with the WM8960 codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".

-- 
~Randy
