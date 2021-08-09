Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF03E4082
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 08:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545201683;
	Mon,  9 Aug 2021 08:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545201683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628491966;
	bh=+3F4VLZk28CW4xNEkYnAwylww1bs9viWiI/OfHLdWGE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIxDA4BJ6sZDVJ85RLVkHo/BeHm2F7dUTTltLOZ3NoW8bLck1yr3i6GvVQNWc9p0R
	 D5nlL3+LBVVwoZaXzjGP+EXwH4wUOcxvvSTwouQQ8nQC12I2TOIrerCnt0QVVRr48d
	 W0GA45c1shT2CUCPCzMA+pqtc2Y70+wbSIkved50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1877F800FD;
	Mon,  9 Aug 2021 08:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500A9F802D2; Mon,  9 Aug 2021 08:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 300F8F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 08:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 300F8F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Drn3woxg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2188D60234;
 Mon,  9 Aug 2021 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628491869;
 bh=+3F4VLZk28CW4xNEkYnAwylww1bs9viWiI/OfHLdWGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Drn3woxgZlzwh8B06RVozdF+7tnNaXZ+hSWiu0vF1n959vJvoS4HAq+RNsUNUOJhr
 3vjkln4UFzkrWG7B01WIFD4x0F3j4dvXT76imnANdnQqHTbPbfFDWKVzbawlEicMl3
 bCBEy0a5XK/YGY7MDrLkpEUYxv6erxCJsZqMXwhQ=
Date: Mon, 9 Aug 2021 08:50:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Woods <jwoods@fnordco.com>
Subject: Re: Kernel 5.13.6 breaks mmap with snd-hdsp module
Message-ID: <YRDQU7hrctUAdRci@kroah.com>
References: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
 <YQ5Bb+mPgPivLqvX@kroah.com> <s5htuk1ppvb.wl-tiwai@suse.de>
 <17b22d08355.f21da1f938057.6900412371441404465@fnordco.com>
 <s5him0gpghv.wl-tiwai@suse.de>
 <17b272bac81.10ac3bd0570099.4091761174182420511@fnordco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b272bac81.10ac3bd0570099.4091761174182420511@fnordco.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel <alsa-devel@alsa-project.org>,
 regressions <regressions@lists.linux.dev>, stable <stable@vger.kernel.org>
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

On Sun, Aug 08, 2021 at 12:09:38PM -0700, Jeff Woods wrote:
> 
> For future reference, if I am reporting an issue with stable and I know the
> commit that caused it, should I contact the committer directly *and* cc the
> stable and regressions list?

Yes, that would be great to do.

thanks,

greg k-h
