Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A310285DD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 20:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A86166A;
	Thu, 23 May 2019 20:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A86166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558635855;
	bh=C4hYjfzH07y9lU32Kaf/ctWp5p1rj3XswV5E5XC9aLU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bl6pIeGX7sEhM58OMJxHd4GExM3E+Ynv27bUsUyVu5o5yY95GcRH/SJxcb4x6PXgD
	 XRmH+IfpXEtv91qUsRTyKFyveHatJ7gTw8pkdUgp4OewzypYWV3AmJDtLm5BRSX3hp
	 0gbfUWPrJAuP0gvBC6soffOKcbRYucnPOGhMI4D0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4ABFF89707;
	Thu, 23 May 2019 20:22:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAF4F89674; Thu, 23 May 2019 20:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DAE5F8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 20:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DAE5F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EFW+THoz"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB3062177E;
 Thu, 23 May 2019 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558633388;
 bh=e7KUMd6Qz9b5eaPnojS2yc1tJKWJ/Q91VqcSA/cXHbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EFW+THozn8RPDBpmFqkirP1+YtrxfcU3nMWjgImo7ALDSTxvfs1qv9Ns4N+pmcRoh
 7B8D5cTb5JkSljOsN39N0PQRwzPPaUDbRmVnUxiBL6w8D/m9VgTRchTx2U+Z68bvjP
 FRv6ueL0a74+JkjGX/yk8rff3o2juOumjqcwRZbI=
Date: Thu, 23 May 2019 19:43:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Message-ID: <20190523174305.GA29438@kroah.com>
References: <20190522172655.183977-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522172655.183977-1-surenb@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: mathias.payer@nebelwelt.net, tiwai@suse.de, kdeus@google.com,
 alsa-devel@alsa-project.org, stable@vger.kernel.org, benquike@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/1] ALSA: usb-audio: Fix UAF decrement if
 card has no live interfaces in card.c
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

On Wed, May 22, 2019 at 10:26:55AM -0700, Suren Baghdasaryan wrote:
> Commit 5f8cf712582617d523120df67d392059eaf2fc4b upstream.
> 
> This is a backport to stable 3.18.y. Implementation in 3.18 differs using
> chip->probing flag instead of chip->active atomic but it still has the UAF
> issue.
> 
> If a USB sound card reports 0 interfaces, an error condition is triggered
> and the function usb_audio_probe errors out. In the error path, there was a
> use-after-free vulnerability where the memory object of the card was first
> freed, followed by a decrement of the number of active chips. Moving the
> decrement above the atomic_dec fixes the UAF.
> 
> [ The original problem was introduced in 3.1 kernel, while it was
>   developed in a different form.  The Fixes tag below indicates the
>   original commit but it doesn't mean that the patch is applicable
>   cleanly. -- tiwai ]
> 
> Fixes: 362e4e49abe5 ("ALSA: usb-audio - clear chip->probing on error exit")
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> Signed-off-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> [surenb@google.com: resolve 3.18 differences]
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
> Analysis for 3.18 codebase:
> snd_usb_audio_create() sets card->device_data = chip
> snd_usb_audio_probe() calls snd_card_free() and then resets chip->probing
> snd_card_free() results in the following call chain:
>  snd_card_free_when_closed() which waits on release_completion
>  snd_card_do_free() calls snd_device_free_all() and signals release_completion
>  snd_card_do_free() calls __snd_device_free()
>  __snd_device_free() calls dev->ops->dev_free() == snd_usb_audio_dev_free()
>  snd_usb_audio_dev_free() calls snd_usb_audio_free(chip) and frees "chip"
> chip->probing = 0 results in UAF

Thanks for the backport.  I've added it to my "internal" 3.18 queue.  As
there is not going to be any more public kernel.org 3.18.y releases,
I'll just be doing updates in the android-common tree over time every
few weeks.  This will end up in the next batch that gets merged into
there, thanks!

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
