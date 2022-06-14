Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3054B0A2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 14:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0741917C6;
	Tue, 14 Jun 2022 14:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0741917C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655209905;
	bh=FbHvPX1omkjQNrCrfgOen7F2jGFHA4+GCXf+XKiS6gc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRlOPsMnhLyGt29UB1nkAsBix5XBzfj0boGEfa/GuNWttbkQMS9bY5G/9JVbhfAeT
	 aHPpWV+veHs1tyFAqj3l5D7mgaO2c5FlltvAk1yLJTqWbTC0mDTYVJsqjw3FOgDW2q
	 Z8R/Gx5VQMg+xpRmvHMj5sYTSnXgvQavAC0tJSYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 832C0F80139;
	Tue, 14 Jun 2022 14:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9B94F80165; Tue, 14 Jun 2022 14:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12CD0F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 14:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12CD0F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mAj++dJs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UaCTTUtP"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C0045C0139;
 Tue, 14 Jun 2022 08:30:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 14 Jun 2022 08:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655209841; x=1655296241; bh=3W
 WdKPi3sbYWMPMvz2JjeEAhW9TDCuP3ySKbqmPRE9w=; b=mAj++dJszl2N9WpMsA
 Tx6EtwVRvCqQPsRIXhllt3IabYomh8sEJ8tsgKayuHUHg/DWLIWIyBagF77WuCc2
 9WlLUX7rEozG3OnT4LWTMQ09P/g2lP2QM2kAzAUHy9jbcshf8T+FIhWtB/bOOrC4
 QnJ27krX1uaNsIM6yWnP7+7i/tWz5P5iSLIl0qVlu9Q3WGV1qNxRuhVPXCvgHsBY
 rh8eIPK172nS8GXuouYe7c1UfpArUHHOZwh1RWhL1/5YBjrsGxXPokdj3wqYwUgS
 yT0ir7Deynbwx3daTF0gRVJOL45iAyvHZxF3c7NZldLm+QkiQDRNtlBZ8tqfprJR
 5zqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655209841; x=1655296241; bh=3WWdKPi3sbYWMPMvz2JjeEAhW9TD
 CuP3ySKbqmPRE9w=; b=UaCTTUtPi39yZr19Xmj4shHzrwjW8JQmFcyrCNWFIt8I
 oerlYcjEqStALSfqf0uRWJpBoZ+RXQy9GAFupKoiNtsc2eAdifE+UPY8Hxuatu/l
 RfFZfmOERkSLv1ci3c6nkWv1cWbaC4LK3xWHH/Waw+r/R7z+IkcG6qdnpMS2wpbY
 Y5WnV3IcfQiy0+m0YuT2CA4gdLrLviZmOuVywAbKu6AJAytZ+my4Nl0qsfKtOybL
 lYSPs2wQP/rx5Iqdv2it1sW15vBOXV6H91zqZx42Lko57xaEsmoIIlGgx0bNI2WZ
 JmDRfO2Oz5OPV+w40ugKgvJ43n1/ZXkj4vB8RgUFJA==
X-ME-Sender: <xms:cH-oYtaEdaDP2bTzV08Oy-AZpXrhOKstLAouCFLxlcdM3odu83kg2g>
 <xme:cH-oYkbvnzh87OvVyoqm3AsaHY-Sj1fvjO0lKOKhn4ZiN1h9hIUdV8dFCRosoeVzw
 LXy7WWFt14C2PKGdPY>
X-ME-Received: <xmr:cH-oYv8c-gxTxR2fdNBqt2Ig7sTb1tblE8Xr1GvIa98cSmB90sDJvj-EEjupqMERn9ShGlDCMMueSjxUynLnaumjgySXknN6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
 ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:cH-oYrregl5A_C5U3oc4TJeyvAC286B_APunC-F4mP3Pt3zz3pEiug>
 <xmx:cH-oYoq1j60bFBH_Qov-8sQb4yUQfvdAJn-redcpMJ7WYLZCC23Ujg>
 <xmx:cH-oYhTkaIsFPHtXYM-CWC2bUf-ooHZ1ZF9wEE7lCWW0_bWqn6wmVg>
 <xmx:cX-oYjU4umYVy3iiEnl9mOS-DCI64DwyXoDF4Cwop7rSKbCHhxLD2w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 08:30:39 -0400 (EDT)
Date: Tue, 14 Jun 2022 21:30:36 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de, stefanr@s5r6.in-berlin.de
Subject: Re: [PATCH] firewire: cdev: fix potential leak of kernel stack due
 to uninitialized value
Message-ID: <Yqh/bDB+Bvwcjjrh@workstation>
Mail-Followup-To: tiwai@suse.de, stefanr@s5r6.in-berlin.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220512112037.103142-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512112037.103142-1-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Hi Iwai-san,

I have a moderate request to you for the patch which fixes an issue
included in v5.19-rc1. If it's applicable and I can borrow your help
again, I'd like you to send the patch to mainline via your tree.

If possible, it's preferable to apply additional three patches I
respined[1], but it could be optional since not so critical.

[1] https://lore.kernel.org/alsa-devel/20220512111756.103008-1-o-takashi@sakamocchi.jp/

On Thu, May 12, 2022 at 08:20:37PM +0900, Takashi Sakamoto wrote:
> Recent change brings potential leak of value on kernel stack to userspace
> due to uninitialized value.
> 
> This commit fixes the bug.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: baa914cd81f ("firewire: add kernel API to access CYCLE_TIME register")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index 8e9670036e5c..032ee56c34a3 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -1211,7 +1211,7 @@ static int ioctl_get_cycle_timer2(struct client *client, union ioctl_arg *arg)
>  	struct fw_cdev_get_cycle_timer2 *a = &arg->get_cycle_timer2;
>  	struct fw_card *card = client->device->card;
>  	struct timespec64 ts = {0, 0};
> -	u32 cycle_time;
> +	u32 cycle_time = 0;
>  	int ret = 0;
>  
>  	local_irq_disable();
> -- 
> 2.34.1


Thanks

Takashi Sakamoto
