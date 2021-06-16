Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF33A9760
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 12:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57BF1676;
	Wed, 16 Jun 2021 12:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57BF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623839537;
	bh=mqqLnnrtOe1x+IQER3v/M1RZ1eEvzy87JkFegkes+cc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1/43YIHDlarQjYc5athlXCUlCJy6A9tlZacokGB7Jh3ddfMKkXxR2oR6YDp0tdG8
	 0kAbDUaxQDsgdKj2CBSChAkbz3peAt+E5jXGqSWnaofJRI/I++J0+B26s63PFseLBH
	 +jdMP2FhVwuAd8VmAsgZzwVDNkQ4deh+939AFmAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3CEF8028B;
	Wed, 16 Jun 2021 12:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DAE3F80423; Wed, 16 Jun 2021 12:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71644F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 12:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71644F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="OnWsBphA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D3F460FE6;
 Wed, 16 Jun 2021 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623839432;
 bh=mqqLnnrtOe1x+IQER3v/M1RZ1eEvzy87JkFegkes+cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OnWsBphAHVb2rg/ju/6Hmsj9CKJESH5L8S3YyKZMowlYIITokBtAacamo6ne6B4RJ
 xkyDkVC44/qaGqBTWAXtH/TaV1e/lcQ7RNlplQvYzisJOz4p/Dw9LrtsbDA8TOBvmH
 UBpffBaFYiJKlt50hNCdpZBmpU/RzF4RFEi/LMWg=
Date: Wed, 16 Jun 2021 12:30:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daehwan Jung <dh10.jung@samsung.com>
Subject: Re: ALSA: usb-audio: fix rate on Ozone Z90 USB headset
Message-ID: <YMnSxQx15C8xAq98@kroah.com>
References: <CGME20210616094912epcas2p38028df32b89b7cc79ba16c0215f8f664@epcas2p3.samsung.com>
 <1623836097-61918-1-git-send-email-dh10.jung@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623836097-61918-1-git-send-email-dh10.jung@samsung.com>
Cc: Lukasz Halman <lukasz.halman@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Wed, Jun 16, 2021 at 06:34:55PM +0900, Daehwan Jung wrote:
> It mislabels its 96 kHz altsetting and that's why it causes some noise
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't care about this.  But the stable tree probably does, please
read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

thanks,

greg k-h
