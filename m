Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13F25FCB1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 17:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF8317CD;
	Mon,  7 Sep 2020 17:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF8317CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599491454;
	bh=CI/psgRtgDiLfQi7x/4AW7cQKGNocZjst2htanYguuw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVU5r+1Ml/55HmGgW/brxK/GLOOw+V3rAbjkI4XKLJJH+aqB0FmQ/4PC+0tNQ25jh
	 HN4JBqojIIot6flAM1a3K/xPapu0iqdPCRI0v4bYc5o90YaYUEIswCLZxgz4EBNsMx
	 wBKrRnzftwRQppuJtwU9MSzNY1qA7avWtktrw3nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29AE9F80240;
	Mon,  7 Sep 2020 17:09:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B908DF80227; Mon,  7 Sep 2020 17:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 5387DF800D3
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 17:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5387DF800D3
Received: (qmail 763212 invoked by uid 1000); 7 Sep 2020 11:08:58 -0400
Date: Mon, 7 Sep 2020 11:08:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 04/11] USB: core: hub.c: use usb_control_msg_send() in
 a few places
Message-ID: <20200907150858.GD762136@rowland.harvard.edu>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907145108.3766613-5-gregkh@linuxfoundation.org>
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

On Mon, Sep 07, 2020 at 04:51:01PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler and the code smaller.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2:
>  - dropped changes to usb_req_set_sel() thanks to review from Alan

> @@ -4056,7 +4035,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
>  	 * associated with the link state we're about to enable.
>  	 */
>  	ret = usb_req_set_sel(udev, state);
> -	if (ret < 0) {
> +	if (ret) {
>  		dev_warn(&udev->dev, "Set SEL for device-initiated %s failed.\n",
>  				usb3_lpm_names[state]);
>  		return;

Did this change survive by mistake?

Actually, it looks like usb_req_set_sel needs to check the value 
returned by usb_control_msg -- a perfect example of the sort of thing 
you were trying to fix in the first place!

Alan Stern
