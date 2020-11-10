Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0412AD1D6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 09:51:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA2916E0;
	Tue, 10 Nov 2020 09:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA2916E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604998298;
	bh=kJYTq1SuZB6OOxJIBHZxneFZrtU226pI8x/ShbnyM/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPtjY9km9L4//27l9mw3TZFi7eqe5OFvjr6OgnDiz0owPzwALFUe1JKrTG6Jvv7Gc
	 0mkpL5poorRKKgGqNh8kgM1vbicNf4h7LAFNBtLZSE9NNQLXE2B9fmnGklhOf79iUY
	 CLrX8yrMAFKzsw6o/mXrWeJyA5T1yZH/1yvScQKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E154F80161;
	Tue, 10 Nov 2020 09:50:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B48DBF801D5; Tue, 10 Nov 2020 09:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78DDFF800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 09:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DDFF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="sTP4mDFQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iD9hVFzR"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2E8685803CF;
 Tue, 10 Nov 2020 03:49:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Nov 2020 03:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9s3HXA62aXEwuhDqThUDrB2tZR/
 QFmCSXDsh87Vt2VQ=; b=sTP4mDFQaTuABEN3HT4ghPaXmUs+3q36wIKNgmenbJC
 Thrv4yv9IBEmZSJ/GO1JXJ721q6Jq0Uhh63X151o/t7sulK4RmbrAs2jebzvHr96
 zwn0wuYRNIbkh8MLkJIpfLRs8P05bz7vGmNNp1fvqV7OjZvo8ecStqAPSCYWC6Kf
 4rkw1/5Y36NTJyoDeaurHSl7P2Lw3npS9zeuvAJ3j7NaXTfSdcIaQ9F0+rwrn9k6
 UGDZlUJ6j/fEN5663LqKqKLGQPP8Q3JkRlIv9s/YmxnrYzsanyCnj0F0ZMGcXs/n
 0y2wBAYvaAHD9AdUsHqVZ+7wWR88TScAiggD78Dvp6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9s3HXA
 62aXEwuhDqThUDrB2tZR/QFmCSXDsh87Vt2VQ=; b=iD9hVFzRap+aS8KMlgoNbq
 6YTx0nZBuZ3vn7lC+1uOzxq2tEweH8CUoBkGFiMNJsI4LmLeE/FmcEsPnkcYXNZj
 wCcjGT8TSWrVBQbbYwYblOAQiPDUzy3ZvL9LOu7GNXrWNhDyLhP5WQPF56ne6G8J
 S0qA/8mM2A0JPpg7ZM/QVqSpyOxnJzGXbiZR6SDhUZIAWrOwRI9QGjuYZQses3y2
 VoforsK0qqCFYAno3aRB1FxGrXQYdonw6GqHVUGSCgZxSXG1xD1s3DKX6q1SajC6
 Tt2xDT/LuEwm8zE3oOEGGEfoO+mcfZ91NIlc3pGdZroBa7rvWGao+K8ANKo32rzg
 ==
X-ME-Sender: <xms:MVSqX1XaQGH6eE-Mp7CA-6tXEILG5jMedm8iQ-RkxrSr6LYgwMb5Gg>
 <xme:MVSqX1lwF_FyIBlwBTjkQO4Q93lBSdRh1r2ux7pxJbAk1Gz0kTKuV7XOLT6v0tunl
 cHWMtiNXyvkLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduiedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhephfduhe
 ffteefjeekvdffffevveelfeehhfeutedtgfeigeetvdfhvedvfefhjeeknecuffhomhgr
 ihhnpegthhgvtghkphgrthgthhdrphhlnecukfhppeekfedrkeeirdejgedrieegnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehk
 rhhorghhrdgtohhm
X-ME-Proxy: <xmx:MVSqXxYkV21P3H_SEpIh6oy7Bcz5rLphVsz76W69qlEDIiToY0R-1g>
 <xmx:MVSqX4WNsXWWrDiwvgISWbyXvuCU-s-D1wIzEalQcKjTEaCAa-dflg>
 <xmx:MVSqX_mDnqpPPnY_2u9RKSRaHPJG40wMtWmBaoA_hUrlAxZcPTDRtw>
 <xmx:M1SqXx0OiBo8aUsWe5OqJZDqDQIuum2sW_gtC_Tszc5CO-BDkMuycA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CD553063081;
 Tue, 10 Nov 2020 03:49:53 -0500 (EST)
Date: Tue, 10 Nov 2020 09:50:49 +0100
From: Greg KH <greg@kroah.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: disable 96khz support for HUAWEI
 USB-C HEADSET
Message-ID: <X6pUaatZ7aML4sKq@kroah.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
 <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Alexander Tsoy <alexander@tsoy.me>,
 linux-mediatek@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>
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

On Tue, Nov 10, 2020 at 04:42:54PM +0800, Macpaul Lin wrote:
> The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> 96khz. However there will be some random issue under 96khz.
> Not sure if there is any alternate setting could be applied.
> Hence 48khz is suggested to be applied at this moment.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Fix build error.
>   - Add Cc: stable@vger.kernel.org
> 
>  sound/usb/format.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 1b28d01..7a4837b 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -202,6 +202,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
>  		fp->rate_min = fp->rate_max = 0;
>  		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
>  			unsigned int rate = combine_triple(&fmt[idx]);
> +			struct usb_device *udev = chip->dev;
>  			if (!rate)
>  				continue;
>  			/* C-Media CM6501 mislabels its 96 kHz altsetting */

Did you run this patch through checkpatch.pl?

