Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFB4E605F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343BC17BC;
	Thu, 24 Mar 2022 09:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343BC17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648110805;
	bh=1PYX7RVaDZHNEfu+LnaQqMTtbG6CsOpb6IVsMKlDkw4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMT93Uk2ZPynQoUfrhW2OlGtoh+3WuVN/kff/rK/hOvQ4VUVXUuGOWt9eViWJOziB
	 qvHJETVbH+HFuOIjdZWFdqISDjk4bbAHIs/RVRHMU0ROC1W9X4m2XHR3Higq4KVs9g
	 Mr5dAhx1BUtxTan5FaYnJQmLckn7mUeiWuuEmDqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7AAF801EC;
	Thu, 24 Mar 2022 09:32:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62270F80165; Thu, 24 Mar 2022 09:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58E7EF80154
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 09:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E7EF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="iFk+7ObO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C7AD6174D;
 Thu, 24 Mar 2022 08:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47DCC340EC;
 Thu, 24 Mar 2022 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648110730;
 bh=1PYX7RVaDZHNEfu+LnaQqMTtbG6CsOpb6IVsMKlDkw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFk+7ObOuXWfJ4q8uX+THXAAmRdgFtUejNssCFZiD1IPz8cvy5LQYo+kBh535bl0J
 YXVNX7ym5woMJHaWatSmuhVZN94nW9vwh0Zzddg2lS+HMp17Buby3PjIi/4j2Yo8UF
 pbfdXcXalfdeH2Fw8cIh9NpvL5jrbwmYC8jGKG00=
Date: Thu, 24 Mar 2022 09:32:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oh Eomji <eomji.oh@samsung.com>
Subject: Re: [PATCH v1 1/3] sound: usb: Add vendor's hooking interface
Message-ID: <Yjwsh4N6dFKvWGav@kroah.com>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081212epcas2p4d2ed1f3a1bb020606cf65016efec085b@epcas2p4.samsung.com>
 <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
Cc: alsa-devel@alsa-project.org, JaeHun Jung <jh0801.jung@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On Thu, Mar 24, 2022 at 05:10:42PM +0900, Oh Eomji wrote:
> In mobile, a co-processor can be used with USB audio to improve power
> consumption.  To support this type of hardware, hooks need to be added
> to the USB audio subsystem to be able to call into the hardware when
> needed.
> 
> The main operation of the call-backs are:
>   - Initialize the co-processor by transmitting data when initializing.
>   - Change the co-processor setting value through the interface
>     function.
>   - Configure sampling rate
>   - pcm open/close
>   - other housekeeping
> 
> Known issues:
>   - This only supports one set of callback hooks, meaning that this only
>     works if there is one type of USB controller in the system.  This
>     should be changed to be a per-host-controller interface instead of
>     one global set of callbacks.

Sorry, but this limitation alone means that this is not going to be able
to be accepted.  Almost all real systems have multiple USB controllers
in the system and so, this will break in very bad ways on the majority
of devices in the world.

Please fix this up and make this per-USB-controller, as was requested
the last time this series was published.

thanks,

greg k-h
