Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED89ACA00
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 14:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DE085D;
	Wed, 23 Oct 2024 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DE085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729686225;
	bh=VQrpKREvli+uQgQBCCF3h70saTVIC9tipcVecmoLowE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M5lFvgFuWJOKQJdheo/uHyi+yqgokfygHXlYuccNRgSZ8iPrgqeUWwAGSpVYpXtus
	 OjtW2z7IYHXGN/BudFIj5P6406/O5/lXGcxXQH68OGihHgL5gxyCGTe6GlMZPJP4kn
	 kYoMAVKVJmiuK79qLNRVNS7YnBQoBFTMtVXHLAnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AA37F805B1; Wed, 23 Oct 2024 14:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 035D3F805AC;
	Wed, 23 Oct 2024 14:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B7BBF8016C; Wed, 23 Oct 2024 00:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C06F80104
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 00:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C06F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (4096-bit key,
 unprotected) header.d=prolan.hu header.i=@prolan.hu header.a=rsa-sha256
 header.s=mail header.b=BoaNCIs5
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain
 [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 29A1FA041A;
	Wed, 23 Oct 2024 00:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=o+6vI2iAgKwV5VmRn04r
	SP3ACb8gAm2vQTCmx1chAik=; b=BoaNCIs57WLzSNjaN7xZCnp7eLPFowP0lhHI
	gpCRAKZXPRuckip+Zd4PAOqzwHsmqjtG4H2fFD2qav4fmhRq7dVSyH5dDCSk4/8x
	aJ9kIcbDy3znhJMP6pMZFId4VXiN0rpfruigA1QFFacwvzgZ5bpRXPPU9cxEAhrB
	erbkMLR+41QoxlXhJymEReKtienr8fO1WZHxq9Fg3oYnTuSbrsuqKIkOPHB6eRaR
	wr04IJ5gI8R0wXXT4d+fyzeKPk05uDwnoXl3rF6GAwhKExRrnb85gAcmq1kfU2ct
	LxLrDauM3hvmYzxvux3g3rwVBNd5YG2muq8dyI2pJYnaWgPl15tiIDpRomvI1AMd
	9b7N3fqxU03kaQfaMVzzedeRCf7fNgpOP2UQkIiA2NjVE/nJJ4GPDOkkOysMV+ch
	jLe1YHJrLYSKNFL21LMPB8vr9aU5RHIVVLjAmT6d7BNHgH9i+oecT/05ceATdC2N
	HWWlTrNeFbQh4L/IqKWB64zzTu3okcNkMVCBfAjUBufsyfhb8h6I/Trj3Ph0LdW+
	h7X7nbo6RDyTFON0mb5gv7ALxMDWPsW76ZEQGO9AHJosIQLpOitrFyUAHh6VNmfU
	wZHMSUGzr7sCoeRPsLIyEr7jDXrqVlPqO4jGmXTOlaizEli8yOaPnYiocONuQR7e
	ZWnI2YI=
Message-ID: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
Date: Wed, 23 Oct 2024 00:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] Add support for DMA and audio codec of F1C100s
To: Mesih Kilinc <mesihkilinc@gmail.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sunxi@googlegroups.com>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
References: <cover.1543782328.git.mesihkilinc@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <cover.1543782328.git.mesihkilinc@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.253.1]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677163
X-MailFrom: Csokas.Bence@prolan.hu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5S3XG3TYW7GPNV5Q2ATL6IBQY73NUH6V
X-Message-ID-Hash: 5S3XG3TYW7GPNV5Q2ATL6IBQY73NUH6V
X-Mailman-Approved-At: Wed, 23 Oct 2024 12:23:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5S3XG3TYW7GPNV5Q2ATL6IBQY73NUH6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
I was trying to get audio on the F1C200s, but so far had no luck, and I 
came across this series.

On 2018. 12. 02. 22:23, Mesih Kilinc wrote:
> This is RFC patchset for Allwinner suniv F1C100s to support DMA and
> audio codec.
> 
> Allwinner F1C100s has a audio codec that has necessary digital and
> analog parts. It has r-l headphone output and microphone, line, r-l
> FM inputs. ADC can capture any inputs and also output channels via mux.
> Any input channels or DAC samples can feed output channels.
> 
> Add support for this audio codec.
> 
> F1C100s utilizes DMA channels to send and receive ADC-DAC samples. So
> DMA support needed. Patch 1~5 adds support for DMA. Suniv F1C100s has
> very similar DMA to sun4i. But there is some dissimilarities also.
> Suniv features a DMA reset bit in clock  control unit. It has smaller
> number of DMA channels. Several registers has different addresses.
> It's max burst size is 4 instead of 8. Also DMA endpoint numbers are
> different.
> 
> Patch 6 adds DMA max burst option to sun4i-codec.
> 
> Patch 7~8 Add support for suniv F1C100s audio codec.
> 
> Patch 9 adds audio codec to suniv-f1c100s.dtsi
> 
> Patch 10 adds audio codec support to Lichee Pi Nano board.
>   
> Thanks!
> 
> Mesih Kilinc (10):
>    dma-engine: sun4i: Add a quirk to support different chips
>    dma-engine: sun4i: Add has_reset option to quirk
>    dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
>    dma-engine: sun4i: Add support for Allwinner suniv F1C100s
>    ARM: dts: suniv: f1c100s: Add support for DMA
>    ASoC: sun4i-codec: Add DMA Max Burst field
>    dt-bindigs: sound: Add Allwinner suniv F1C100s Audio Codec
>    ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
>    ARM: dts: suniv: f1c100s: Add support for Audio Codec
>    ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
> 
>   .../devicetree/bindings/dma/sun4i-dma.txt          |   4 +-
>   .../devicetree/bindings/sound/sun4i-codec.txt      |   5 +
>   arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |   8 +
>   arch/arm/boot/dts/suniv-f1c100s.dtsi               |  25 ++
>   drivers/dma/Kconfig                                |   4 +-
>   drivers/dma/sun4i-dma.c                            | 221 ++++++++++--
>   sound/soc/sunxi/sun4i-codec.c                      | 371 ++++++++++++++++++++-
>   7 files changed, 601 insertions(+), 37 deletions(-)

What's the status of this series? I see that it was not merged, despite 
getting a few ACKs and only a few minor comments. Ripard's comments make 
me believe that the sun4i DMA driver should be able to handle the suniv 
family with minimal adjustments, have those not been added? Or is it 
that the DMA support is ready but the ALSA/ASoC support is missing?

Bence

