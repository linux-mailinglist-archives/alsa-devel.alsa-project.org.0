Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4F118B62
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F2D16A9;
	Tue, 10 Dec 2019 15:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F2D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575989140;
	bh=R+xbGQAgwuweIKB49TToNb3HlqbcyFzYkylRS+10+7s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUzH2os8anVes5x9cxBp+7Y4WEEn8Od9+DBJQ2SZAyrdC9+NKGRL0t80jIkGgOmne
	 VAwrG9bzgs2t6defi1eLtVdtZ25WzYwOuGEk4tjKsWOYDV4EF1nY/1xbSQFjcMjInM
	 QVQDt5u6I9qwE3jxOT7KcEpFxe/BJftogZZV/L6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F6CF80266;
	Tue, 10 Dec 2019 15:42:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB490F80264; Tue, 10 Dec 2019 15:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 171E9F8025E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 171E9F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QINYYuE1"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CD3720828;
 Tue, 10 Dec 2019 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575988950;
 bh=fo4Ig2GCo7sLhJYHhhz6hQKFMZeSD+SQc5ZCTQZ7Fn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QINYYuE12L3diIi6rGVdGnWyLYKBuPqFUs0uVK/eE9fFntivkXgtFqNJz79s/Amzo
 CP/k3h66us6DwLCAGXrdMFcLzNJRccUJEh/gm/Oqlu80FRmNIB7jVrVGh1LZbvZM4V
 E05DjsWMZiF+6Gcm61gok6fQPnYpSfyei6rLgvQc=
Date: Tue, 10 Dec 2019 15:42:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210144228.GA3937513@kroah.com>
References: <20191210141356.18074-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210141356.18074-1-tiwai@suse.de>
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [alsa-devel] [PATCH for-5.6 0/4] staging: ALSA PCM API updates
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

On Tue, Dec 10, 2019 at 03:13:52PM +0100, Takashi Iwai wrote:
> Hi,
> 
> this is a patch set to adapt the latest ALSA PCM API to staging
> drivers.  Basically these are merely cleanups, as shown in diffstat,
> and there should be no functional changes.
> 
> As the corresponding ALSA PCM API change is found in 5.5-rc1, please
> apply these on 5.5-rc1 or later.  Or if you prefer, I can merge them
> through sound tree, too.  Let me know.

Because of some future most driver changes that will be happening
(hopefully soon), I'll just take all of these in the staging tree now,
thanks!

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
