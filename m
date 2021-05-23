Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853E38DA95
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1917E166E;
	Sun, 23 May 2021 11:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1917E166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621760716;
	bh=j3WPODAFqyi8LrgqZPViTbAy3ezRdqr3hhR6BS2r9Uc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcE0FtJ+mPA3zY8+TS4gxPrfaCDjnXQ4uBZiXbubdWQcaB/U7fO8GWZuXyG8Lqoie
	 bVM1Fystw7bU7yBLpTjxnZk4rGBzCFFl5D+E5IoskkzFyQ+Vom8PRiBQasiPYmcpGd
	 BFcqdHZfWSPxqltT/cbpqt3yhzI7uQ7feaZPCvSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EE2F801F5;
	Sun, 23 May 2021 11:03:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9538F801EB; Sun, 23 May 2021 11:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB451F8016D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB451F8016D
Received: by m.b4.vu (Postfix, from userid 1000)
 id AC316612FB20; Sun, 23 May 2021 18:33:26 +0930 (ACST)
Date: Sun, 23 May 2021 18:33:26 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH sound] ALSA: usb-audio: scarlett2:
 snd_scarlett_gen2_controls_create() can be static
Message-ID: <20210523090326.GA121080@m.b4.vu>
References: <202105230212.9rlkrDHb-lkp@intel.com>
 <20210522180900.GA83915@f59a3af2f1d9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522180900.GA83915@f59a3af2f1d9>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

This patch seems legitimate to me (although I would adjust whitespace
so the second line doesn't go over 80 chars). Do you want to just
apply it as-is, or do you want me to send a second version of my patch
without this problem or send a new patch similar to this one?

Also sorry I don't know what the etiquette is in cc's for this message
:(. The message from kernel test robot was sent to a lot of people who
I don't think would be interested in this, so I trimmed the cc list
down.

Thanks,
Geoffrey.

On Sun, May 23, 2021 at 02:09:00AM +0800, kernel test robot wrote:
> sound/usb/mixer_scarlett_gen2.c:2000:5: warning: symbol 'snd_scarlett_gen2_controls_create' was not declared. Should it be static?
> 
> Fixes: 265d1a90e4fb ("ALSA: usb-audio: scarlett2: Improve driver startup messages")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> ---
>  mixer_scarlett_gen2.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 3ad8f61a2095f..4caf379d5b991 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -1997,8 +1997,8 @@ static int scarlett2_mixer_status_create(struct usb_mixer_interface *mixer)
>  	return usb_submit_urb(mixer->urb, GFP_KERNEL);
>  }
>  
> -int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
> -				      const struct scarlett2_device_info *info)
> +static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
> +					     const struct scarlett2_device_info *info)
>  {
>  	int err;
>  
