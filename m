Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38922D56F
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jul 2020 08:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3EBD1684;
	Sat, 25 Jul 2020 08:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3EBD1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595658154;
	bh=aB9zslYB9/2Zug7XW92hg+SH4Gw3jq74h7xUfY0Khjc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bUfzr4EHlS5yTxnRyxAmHwsYhggIisXpSubrxbX1v03eCcRD6vFlsh/Q3d0IvidM8
	 QhV8hNf6ZU126MzwV598kjdGL8fS3E9yTH/GMHblb7z9wXQ2Za7MJwUg3ZGWdN6GkV
	 t+bDmquVPa8ynBd/EXF58gIfYBCRKm69XL6qUKxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CF4F8011F;
	Sat, 25 Jul 2020 08:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D7ADF80212; Sat, 25 Jul 2020 08:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AB09F8011F
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 08:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AB09F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oGxWhl6p"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48B96206F6;
 Sat, 25 Jul 2020 06:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595658035;
 bh=aB9zslYB9/2Zug7XW92hg+SH4Gw3jq74h7xUfY0Khjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGxWhl6pX1redUPCtEPHGjscZjpVsQwwCNnS58+JVpKSRMPNC36Y5kelBLcG0GMrs
 +cH1yc2sVyTw7+s/ZgvAJ61jZxCaQ9MpzI3I7tOh8qguahi3TxJA3vCdBZTWYqgITv
 70Bgc9E2903GqWzVCzc3dvE0ob0y7By9zNVbQvI4=
Date: Sat, 25 Jul 2020 08:20:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b2t5rWp?= <penghao@uniontech.com>
Subject: Re: Re: [PATCH 14216/14216] ALSA: usb-audio: This patch for prevent
 autowakeup from s3 trig by usb disconnect signal from Lenovo
 ThinkcentreTI024Gen3  USB-audio.
Message-ID: <20200725062035.GB1051290@kroah.com>
References: <20200725040155.27648-1-penghao@uniontech.com>
 <20200725054844.GA1045868@kroah.com>
 <2108119032.587807.1595657354769.JavaMail.xmail@bj-wm-cp-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2108119032.587807.1595657354769.JavaMail.xmail@bj-wm-cp-2>
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 "penghao@deepin.com " <penghao@deepin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, tiwai <tiwai@suse.com>,
 phz0008 <phz0008@163.com>
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

On Sat, Jul 25, 2020 at 02:09:14PM +0800, 彭浩 wrote:
> This email message is intended only for the use of the individual or entity who
> /which is the intended recipient and may contain information that is privileged
> or confidential. If you are not the intended recipient, you are hereby notified
> that any use, dissemination, distribution or copying of, or taking any action
> in reliance on, this e-mail is strictly prohibited. If you have received this
> email in error, please notify UnionTech Software Technology  immediately by
> replying to this e-mail and immediately delete and discard all copies of the
> e-mail and the attachment thereto (if any). Thank you.

Please note that this email footer is not compatible with kernel
development, so I have now removed it from my system.

greg k-h
