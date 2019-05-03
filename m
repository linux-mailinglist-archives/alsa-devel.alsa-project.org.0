Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC97125F6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 03:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 685E81854;
	Fri,  3 May 2019 03:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 685E81854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556846459;
	bh=Z3hEU20Qk9Uu7UQtuQl/g8CfnQq1A6I6vuvG9sOERgs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUwkpEyxK+EDL+1zQBy3s+MXE70sXAa/HC2hrpcUB+GaxYBSnNqbCu6ctXnWXpyAq
	 xmsq3XUwk6GszkMI6skOSrNmpqU02uAzwZZuhVKtTnmY5wQwa0HyeIyGc2TM9aKMIB
	 werfNWbhoNfYTH+7fbJu6V0l35sHyY+fFXHaNfjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D23B7F896B6;
	Fri,  3 May 2019 03:19:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F15AF896B7; Fri,  3 May 2019 03:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB337F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 03:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB337F80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UthxIiQ1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tGXCdIHV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C7A598E7;
 Thu,  2 May 2019 21:19:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 02 May 2019 21:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sPDbUJmHaVq97y4GuG/FIKWkWKV
 tpZfVshd5q6sAmvk=; b=UthxIiQ1ntdc1HsURjtS8Up+4edtQxHwwGMSlVTIxQa
 M5z7BuNJLIvNcVu2H8/duSREUvclFw+gPg52jQBrHqGPUXThnlwTQC0oJyu1K4G6
 ptgXgOtQQCyYYut8UDJxiZrAuewJtbcdKlaApyQwyfr8h4hoaVcBD6DVSanDDK7z
 UvdumQqpZ8CqmOEpaIQp+KsDBhTQzbuk7UOZ96EAYs38rbFQRFOXPQ+hWL7sq4w6
 LpYRtsf+8ByUrsvHZ3M/qCJ41EflLCQIHm9stKYLDXxbVat7RvGyLDJRbmsF0K7w
 njny6nxiuIxHYRpPzRr3SYKhJMhKGhpHjkBR7wt2oLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sPDbUJ
 mHaVq97y4GuG/FIKWkWKVtpZfVshd5q6sAmvk=; b=tGXCdIHVNAUwKbdpPkj2ku
 YWF62ogALsBS+qCRu1CIURbjuRI6v2nLMrDmlv1IB3GCrwnGb9vnIn2NukUqf9qG
 PSJ8UJV6IaUguc3IBpBAM3T63kgYivBtFqmfAN3+8qMnIPVT4RA/9873mikB0ISn
 fpFvq9Jl3+8Bp1X4quiCMAORAyUE9lIIzMmITOnCbiZnRUn2e05jFJLx3INR9DIg
 THAbJ8wm0Zl2DNopXkzOBBHwAFDNoSisSZdG633IU89ODXG/nOCDyOfv7UAn90gQ
 qDl+Rjeojp8X3AmQU+4gJMS1frbuexXcQF1tlI5BzwqAN1SY4vxoz+YuXfLFLUSw
 ==
X-ME-Sender: <xms:BpfLXLkipxRY1xOmyt1Ojd3sIAZCFDpyodGmEOPJz0L-jvSMqK7LqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgrlhhsrgdqphhrohhjvggtthdr
 ohhrghenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomh
 epohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:BpfLXF7LeeYKYX79kzKoESKET-5AUUhoGQz-O4eqt5j_Zu7bzATvGg>
 <xmx:BpfLXJpTb9xeYoQMrRpiHjCOrZu6z5edpKz-zn_QZNLqiXh9mtSSYg>
 <xmx:BpfLXFQB2_6OgcLBYD3gkfqi-Kl7s3V4ARTRCtVOfiPUniBsVDhe6w>
 <xmx:B5fLXCaQufuO0eLQRkQfJCsZUW1UeY3_HcR3cxKRZGkLqmoTEi44SA>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB2001037C;
 Thu,  2 May 2019 21:18:59 -0400 (EDT)
Date: Fri, 3 May 2019 10:18:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Ross Zwisler <zwisler@chromium.org>
Message-ID: <20190503011855.GA30162@workstation>
Mail-Followup-To: Ross Zwisler <zwisler@chromium.org>,
 alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20190502172700.215737-1-zwisler@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502172700.215737-1-zwisler@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] MAINTAINERS: update git tree for sound
	entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Thu, May 02, 2019 at 11:27:00AM -0600, Ross Zwisler wrote:
> Several sound related entries in MAINTAINERS refer to the old git tree
> at "git://git.alsa-project.org/alsa-kernel.git".  This is no longer used
> for development, and Takashi Iwai's kernel.org tree is used instead.
> 
> Signed-off-by: Ross Zwisler <zwisler@google.com>
> ---
>  MAINTAINERS | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

This is a good catch.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e17ebf70b5480..d373d976a9317 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3351,7 +3351,7 @@ F:	include/uapi/linux/bsg.h
>  BT87X AUDIO DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	Documentation/sound/cards/bt87x.rst
>  F:	sound/pci/bt87x.c
> @@ -3404,7 +3404,7 @@ F:	drivers/scsi/FlashPoint.*
>  C-MEDIA CMI8788 DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/pci/oxygen/
>  
> @@ -5696,7 +5696,7 @@ F:	drivers/edac/qcom_edac.c
>  EDIROL UA-101/UA-1000 DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/usb/misc/ua101.c
>  
> @@ -6036,7 +6036,7 @@ F:	include/linux/f75375s.h
>  FIREWIRE AUDIO DRIVERS
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/firewire/
>  
> @@ -11593,7 +11593,7 @@ F:	Documentation/devicetree/bindings/opp/
>  OPL4 DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/drivers/opl4/
>  
> @@ -14490,7 +14490,6 @@ M:	Takashi Iwai <tiwai@suse.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  W:	http://www.alsa-project.org/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> -T:	git git://git.alsa-project.org/alsa-kernel.git
>  Q:	http://patchwork.kernel.org/project/alsa-devel/list/
>  S:	Maintained
>  F:	Documentation/sound/
> @@ -16100,7 +16099,7 @@ F:	drivers/usb/storage/
>  USB MIDI DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -T:	git git://git.alsa-project.org/alsa-kernel.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/usb/midi.*
>  
> -- 
> 2.21.0.593.g511ec345e18-goog

Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
