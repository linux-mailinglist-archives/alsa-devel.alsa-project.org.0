Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAA2694BB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 20:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7401686;
	Mon, 14 Sep 2020 20:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7401686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600107764;
	bh=ASHVyTd8TtFYDpC6pmDd6P44NOvcvNc8/nWmL+ynLdw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fg1f/Hdr4MTAA2+vxOnFeriorK7rSCJ7HMd4FgCXFrq9iy0xR0J5BQpyPROCAJR5j
	 C5RFc2yqAQM9EbjJMpxkmWlz0u68fXxSseiAMkt1RfD9dx5vZLg8i6+VymS+Xp1WSO
	 FA9pw49beL69/vWVbjLNKqM8niyC/NW84W4vL8f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCC0F80150;
	Mon, 14 Sep 2020 20:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72149F8015A; Mon, 14 Sep 2020 20:16:35 +0200 (CEST)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 897F6F8015D
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 20:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897F6F8015D
Received: (qmail 972913 invoked by uid 1000); 14 Sep 2020 14:06:16 -0400
Date: Mon, 14 Sep 2020 14:06:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 04/11] USB: core: hub.c: use usb_control_msg_send() in
 a few places
Message-ID: <20200914180616.GB972479@rowland.harvard.edu>
References: <20200914153756.3412156-1-gregkh@linuxfoundation.org>
 <20200914153756.3412156-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914153756.3412156-5-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 linux-kernel@vger.kernel.org, marcel@holtmann.org, linux-usb@vger.kernel.org,
 tiwai@suse.com, stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org,
 dvyukov@google.com, himadrispandya@gmail.com
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

On Mon, Sep 14, 2020 at 05:37:49PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler and the code smaller.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v3:
>  - drop change in usb_enable_link_state() as it was not needed now
>    thanks to review from Alan
>  - minor changes requested by checkpatch.pl
> 
> v2:
>  - dropped changes to usb_req_set_sel() thanks to review from Alan
> 
>  drivers/usb/core/hub.c | 99 +++++++++++++++++-------------------------
>  1 file changed, 40 insertions(+), 59 deletions(-)

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
