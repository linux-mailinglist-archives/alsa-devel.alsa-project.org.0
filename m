Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE590485286
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 13:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771DE18D9;
	Wed,  5 Jan 2022 13:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771DE18D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641386109;
	bh=ehS9Wp4klxNh6imSS80ubyOMxmVlzZk1ZeiNIm5nyzI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thXO7ff6Xo5bm72lweVeLdfgHmDzSRZ/1uA/QVm+ssKpvlHxiZB4CbX+iVN86imuK
	 FwIn2MtlRv3CBMz0idRcO+knxtjoguk3a568izGKmR9LdJsbyVs3KuSnzWpkUtwLuW
	 Y7HPpUWDcsu1384fsXTlB0rP5PqGElwA/UVVzzW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7356F8020C;
	Wed,  5 Jan 2022 13:34:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4146F80089; Wed,  5 Jan 2022 13:34:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A12F80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 13:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A12F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="nEVBmKp/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D78EB81A88;
 Wed,  5 Jan 2022 12:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFCDC36AEB;
 Wed,  5 Jan 2022 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641386031;
 bh=ehS9Wp4klxNh6imSS80ubyOMxmVlzZk1ZeiNIm5nyzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEVBmKp/xF2RVPedxZZvilxaYXiDqhT3DrhbW83UTQyahfZyJsZaN+lJM51WfrAk6
 j0PiHLXuJiAeyXdA0apXnG2LkU2s5cr6u4uKuWlrKCrtpULjI4k2xM57MPV+8dXxeq
 Zd20bPOyU6nd/wdgEhje87Elak00dlFhn8wA6kQ0=
Date: Wed, 5 Jan 2022 13:33:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Baole Fang <fbl718@163.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
Message-ID: <YdWQLOtV8Tz8ArrH@kroah.com>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de> <YdV5MNWOwgrtH2UC@kroah.com>
 <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com>
 <YdWElRjkZ0lybrMJ@kroah.com>
 <6bf35d26-73d4-ba14-f931-8d379c623482@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bf35d26-73d4-ba14-f931-8d379c623482@163.com>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Elia Devito <eliadevito@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>
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

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Jan 05, 2022 at 08:29:26PM +0800, Baole Fang wrote:
> Thank you for your explanation! I shouldn't have written that line and I
> supposed it can be ignored. Is there anything else I could do?

We can not just "ignore" it, you need to fix your change up and resend
it in a proper format so that it can be applied.

As-is, it is not acceptable, sorry.

thanks,

greg k-h
