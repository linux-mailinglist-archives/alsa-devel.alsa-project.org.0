Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F525FC73
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D787179F;
	Mon,  7 Sep 2020 16:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D787179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490780;
	bh=CxyQpGP9n8TbvTWZlcMnPBvQvdoM8Roi6NJr/4wY+3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvaUPsoT02A5+avAFlOq4nV1TN92EWwonmLxfUhNcGqA1QtiOGBIJfW1Am628Dwin
	 IDjnhrA7eo/xyQCilY2JqY/fEyZ7OtRqKviY9j+XKsAAxQYmG+D0THvq4ExliWRF+H
	 42cciBcxE60fg/Hm4+EoF/aKEEvscoQWWKBH89y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EA84F80240;
	Mon,  7 Sep 2020 16:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 983D0F80227; Mon,  7 Sep 2020 16:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E678F800D3
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E678F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lLzcZLnJ"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 136EF21532;
 Mon,  7 Sep 2020 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599490589;
 bh=CxyQpGP9n8TbvTWZlcMnPBvQvdoM8Roi6NJr/4wY+3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLzcZLnJRYwJRZpj3pSMH+uuomTwjStzPuS6HLjLIR8uWd1c17Y4ebZXRr69gGDbk
 XzOwh+xBK4S0GODqAZ9+JB/lT9bmvkpwmYARCwsKMtJ5kSbtocsB4b0nmXhOEwQg8b
 HtSakIDPyMr4ieHYrnhthaO4x/1FviU5JovhMFEA=
Date: Mon, 7 Sep 2020 16:56:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 himadrispandya@gmail.com, dvyukov@google.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 03/11] USB: core: message.c: use
 usb_control_msg_send() in a few places
Message-ID: <20200907145644.GA3767938@kroah.com>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-4-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907145108.3766613-4-gregkh@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, johan.hedberg@gmail.com,
 marcel@holtmann.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
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

On Mon, Sep 07, 2020 at 04:51:00PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Oops, Andy, sorry, you gave me a Reviewed-by: Andy Shevchenko
<andriy.shevchenko@linux.intel.com> on the previous version of this,
I'll add it next round, or when it's queued up.

thanks,

greg k-h
