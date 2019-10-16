Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74791D9C5F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 23:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBEE9F6;
	Wed, 16 Oct 2019 23:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBEE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571260733;
	bh=Dief/WfbKXpFBAMtigLiRq3RegYR82CeOUMksP1I3E8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scnPRI7pcbaRRl8CstOWOR117SPJlUEOxkz5tZUz7hA2925hukHZ5bv1oaYCy3u8M
	 M6bqcgtn8L8S2Hlnprg/N2ezBX+YYp6UUVQr78NNuqe+pSOu7SYYYzEvxSv7D1HJYv
	 VNSBMk75FQipuUhmzwUb64XdVTIMcCBqIyJUQP/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDE3F80323;
	Wed, 16 Oct 2019 23:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88814F80362; Wed, 16 Oct 2019 23:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06071F80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 23:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06071F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="crNv5j1k"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e74ZIf2b"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A5FBB721C;
 Wed, 16 Oct 2019 17:16:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 16 Oct 2019 17:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TDIuhUqyETt+wUzSenxW4gSfVzI
 J3N49EH7vP3P1UPw=; b=crNv5j1k2SsRQS5f3cUQ7HdTBDG9uyu6KGfumMMf8sY
 QhcJ8T/vsPywtbJyLI6LJ9+lkZCX+RnrDr5JJ7fSpzV2gVAVAN2ou9WKGsTqW1kd
 6PDH4Y/s15dI+UHZ18MVIaKU+WBKcUbgN6XTKRZxg4hRLZmBOBCyFEK5HP0Ia1Ht
 HWldOZQRiNWk+V5vxEcADntiSkqHPW2/a/atQvMr9ECXqxkdam28dbrLSS0NPoyf
 eIVLBC8RkZcm3lB7jLwzJsw0GBWq2bon4Mv7+dlGFEAcNRvv69WxBkDb20yJFsC8
 kXotq9zNaeBAG/khmhggLIAY9+YeBy8ZmNCi/8WyRdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TDIuhU
 qyETt+wUzSenxW4gSfVzIJ3N49EH7vP3P1UPw=; b=e74ZIf2bn1B7OgTPPafrLu
 j7JMRX4NTZVdbpL6bIchqZhpptR3p1WOEDkEKmSfqD6d0anip+aEipGyiyW2fqIy
 GtGVu4+9KdOG4RhE0CrnJn8VWMF0IdGgy0RB/xAkG0cbU2YZnDhEh5eRmjkEGr0g
 EXnxUDfKHYw+vUKWn/Siqse7uSjFs4e1papPgp/87zIrpZjHL2YGZELC4zFuK+sk
 9cU6caTi77OXbigCyEDrtj5d8yUKvNv1xS3NF13D4WYiC6k6wtnh92JwUPqrymae
 j+0U12zsrIL5oVf+/4pq3sweO6DaQe+hQtj9iSuYg+ZDhMKdPzDNJ8Wgw8bywxXA
 ==
X-ME-Sender: <xms:yoinXfuzRqRkM5zUeUHD_u8JNS8eqrWBSsCKr4L4UKqAL1GnI5avEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeehgdduiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghenucfkphepudejvddruddtgedrvdegkedrgeegnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:yoinXUwPyqot8LUwlkCVowN-Yi6X4gfRrFStBg9sPtuxTIijnf3JMw>
 <xmx:yoinXR5-ax-XZ5wdOUGlhcZ7jQ1YkA5fsw5fTUCBrC8t-lsD_0E17Q>
 <xmx:yoinXWWeje0aVM_vhnZLzW8lX4RrC1FUWZ-cYd1pxGnhe29gNTKOdQ>
 <xmx:y4inXQnwQ-D5thTWP5pf2YvGFNuRrkktvovmLzbyB65svFqHWtAl-w>
Received: from localhost (li1825-44.members.linode.com [172.104.248.44])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3DADFD60063;
 Wed, 16 Oct 2019 17:16:57 -0400 (EDT)
Date: Wed, 16 Oct 2019 14:16:54 -0700
From: Greg KH <greg@kroah.com>
To: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <20191016211654.GB856391@kroah.com>
References: <20191016091304.15870-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016091304.15870-1-richard.leitner@skidata.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stable@vger.kernel.org,
 lgirdwood@gmail.com, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, broonie@kernel.org,
 festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH v5.3] ASoC: sgtl5000: add ADC mute control
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

On Wed, Oct 16, 2019 at 11:13:04AM +0200, Richard Leitner wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> Upstream commit 631bc8f0134a ("ASoC: sgtl5000: Fix of unmute outputs on
> probe"), which is e9f621efaebd in v5.3 replaced snd_soc_component_write
> with snd_soc_component_update_bits and therefore no longer cleared the
> MUTE_ADC flag. This caused the ADC to stay muted and recording doesn't
> work any longer. This patch fixes this problem by adding a Switch control
> for MUTE_ADC.
> 
> commit 694b14554d75 ("ASoC: sgtl5000: add ADC mute control") upstream
> 
> This control mute/unmute the ADC input of SGTL5000
> using its CHIP_ANA_CTRL register.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Link: https://lore.kernel.org/r/20190719100524.23300-5-oleksandr.suvorov@toradex.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Fixes: e9f621efaebd ("ASoC: sgtl5000: Fix of unmute outputs on probe")
> ---
>  sound/soc/codecs/sgtl5000.c | 1 +
>  1 file changed, 1 insertion(+)

Now applied, thanks.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
