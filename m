Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA261FC4F6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 06:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42A921679;
	Wed, 17 Jun 2020 06:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42A921679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592366687;
	bh=gqw/gxd2jlYiXwS6qm8O6TeItCn7uaZgUsxMJ5M9xNw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSgXj/g7aw8YbVElm5ShchH/NU9/QtDWPEtGLa40SgP7hXOB5D+2c9TygA3on50mC
	 s2MqK9eD709EM/bV+qd708kezFuSo8Grzzn00RLbr6hLa7NhLMwZ9zvkSskukgl7A1
	 9JKBjIIupPY5+ZQMkMKIj3xU17/bH7PTcP5xNhFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB7CF80116;
	Wed, 17 Jun 2020 06:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B7D7F80171; Wed, 17 Jun 2020 06:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A8EF80101
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 06:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A8EF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tMv/lU6r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iFTBANDe"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AE115C0050;
 Wed, 17 Jun 2020 00:02:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 00:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=YYfJzkXxS3bKe9mypfnLuAbDv5C
 wQbW2dSJq5UHVJgA=; b=tMv/lU6rziRX8vMJK0RP3UNwwkzQPkkASC1azokuB7o
 JzwZ/OAYXqJXmhqWWR8tFbguPhMBHC3+lsxBafWgCG5Z2RdvVOivcsR7nLfZenyX
 9QdJj+qRHgEkklK1NfaGTRNPKlHH5k4h3WqNZZ7UWWEIXtOxrGrhF/C9TPWnlcT4
 NBrOlSFHu0C802isDcUEV7ObyZXVAlGEDM4z1BA+i6EUoXSO41EtAtOTKL63nbz2
 4HS6JTzZxiWFABZ2PUcxH3WOZG5Z8aS3xhIVAplV9rNdLqaTapFGQoi4xGq6ToBw
 0v5zcsDcp5sUcJ9jggEX/ll/ULeZXy6taXIV4R/8OFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YYfJzk
 XxS3bKe9mypfnLuAbDv5CwQbW2dSJq5UHVJgA=; b=iFTBANDef1uVZIASdwZtlV
 KUMAApAWapczbvCdtT46CSwFOm70VvUCkHbVvOt5Uf0bCLqeozPIjDro9wjR0fq/
 8iPQ9g622IKVwnnhaFZUnGTlVtZwm2G6smbmIsQI+lnEMq0f/IM36uRd9Lhs3iKZ
 crHRBeQJhrTx3XOaS1z589gKDNtbfGQVGiscqmRS6WKMrRwN+iQ1TW+ZI3vmkAdJ
 3uDus4PBJ9agxmvZ5uOikpv4S17G+bw3vDBgDiG9XLki6qseXjj6jborQaxsuu0U
 4U81j6Oqko3QU+WPvjcl4CMPqN5M4s8LSg5WZr6aCUn/g1nu/8INdMwkmfyICZZQ
 ==
X-ME-Sender: <xms:65XpXhmyZslBjYMgPVcjxboYZt0CUejcs2VInyJ-fEMT9j22HPp0Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejuddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:65XpXs1mvilYNFFOcQtaq9yll2Tg90qliADAccjqNEYx3hihwMFDDA>
 <xmx:65XpXnpLyljMgiaa4NQrPfCULRiHbwVjjzhnVVYFLBjTrWRsDOZBEw>
 <xmx:65XpXhkrTTNZGkQY4OZDLUe9k_lXfp4t_X2iOE2Zsg4JIk75PlLHEw>
 <xmx:7JXpXs-d4-1Pbnj-rTDLcUs9hCTiz1FPvDJEgNauHyqVZwV5dALKIA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id BAE9D3280060;
 Wed, 17 Jun 2020 00:02:50 -0400 (EDT)
Date: Wed, 17 Jun 2020 13:02:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: JaeHun Jung <jh0801.jung@samsung.com>
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Message-ID: <20200617040248.GA245386@workstation>
Mail-Followup-To: JaeHun Jung <jh0801.jung@samsung.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <CGME20200617022554epcas2p214a49f03a15e504d8faa28148e06e796@epcas2p2.samsung.com>
 <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, Jun 17, 2020 at 11:18:24AM +0900, JaeHun Jung wrote:
> In mobile, a co-processor is used when using USB audio
> to improve power consumption.
> hooking is required for sync-up when operating
> the co-processor. So register call-back function.
> The main operation of the call-back function is as follows:
> - Initialize the co-processor by transmitting data
>   when initializing.
> - Change the co-processor setting value through
>   the interface function.
> - Configure sampling rate
> - pcm open/close
> 
> Bug: 156315379
> 
> Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
> Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> ---
>  sound/usb/card.c     | 16 ++++++++++++++++
>  sound/usb/card.h     |  1 +
>  sound/usb/clock.c    |  5 +++++
>  sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
>  sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
>  5 files changed, 85 insertions(+)

> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index fd6fd17..2f3fa14 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +struct snd_usb_audio_vendor_ops *usb_audio_ops;
>  
>  /*
>   * disconnect streams
> @@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
>  	return 0;
>  }
>  
> +void snd_set_vender_interface(struct snd_usb_audio_vendor_ops *vendor_ops)
> +{
> +	usb_audio_ops = vendor_ops;
> +}
> +EXPORT_SYMBOL_GPL(snd_set_vender_interface);

I think the symbol name has typo; 'vender' against 'vendor'.

Anyway, this feature is not widely used at present. I suggest to add
kernel configuration for the feature at kernel compilation time, IMO.


Regards

Takashi Sakamoto
