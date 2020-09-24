Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50096276F3B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 13:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A02A17BA;
	Thu, 24 Sep 2020 13:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A02A17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600945354;
	bh=RCxHBE9X2KZ+55CTd1qLEdHD5TDMxFbwfTKYkPN3vWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FE15CfFWh4th5IZvBK3uV8qlldYXOhUB89HdWBUaHGAQKffDXwAQ0GbV5Td2i7FfH
	 MovlLNhVVJV4JuVno/PQLDCS+v8uTFZ6UbV8UCI/iNQHE0dq8M/zd7BLmBZ9qCnfua
	 OVZ/raxvWKSI6s9LBjCuKLPbsP/Zu1yye4X+cWw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD46F80229;
	Thu, 24 Sep 2020 13:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2D62F80232; Thu, 24 Sep 2020 13:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC2AF8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 13:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC2AF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eHfvx8/g"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 841AA2396E;
 Thu, 24 Sep 2020 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600945241;
 bh=RCxHBE9X2KZ+55CTd1qLEdHD5TDMxFbwfTKYkPN3vWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eHfvx8/gn3Fkn5GSoRdXkJQYcv7QfWRpROlDJ0nfMfOSmiB8l/IGCC6UDmcMy4/hv
 L500XpemRMRcdF7uMH+/qvu2Iti3sDTMt6TMn+InGaA9H8SdU2jAaqSXEfCc1Nw+Ln
 Ozjyf0FnVcgyiLkzEh0eQ8CLgy/rJqEoOEPKSlxM=
Date: Thu, 24 Sep 2020 13:00:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
Message-ID: <20200924110057.GA319713@kroah.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924102039.43895-3-coiby.xu@gmail.com>
Cc: devel@driverdev.osuosl.org,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Greer <mgreer@animalcreek.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Johan Hovold <johan@kernel.org>
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

On Thu, Sep 24, 2020 at 06:20:39PM +0800, Coiby Xu wrote:
> Use __8 to replace int and remove the unnecessary __bitwise type attribute.
> 
> Found by sparse,
> 
> $ make C=2 drivers/staging/greybus/
> drivers/staging/greybus/audio_topology.c:185:24: warning: cast to restricted snd_ctl_elem_type_t
> drivers/staging/greybus/audio_topology.c:679:14: warning: restricted snd_ctl_elem_iface_t degrades to integer
> drivers/staging/greybus/audio_topology.c:906:14: warning: restricted snd_ctl_elem_iface_t degrades to integer
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 2 +-
>  include/uapi/sound/asound.h              | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 56bf1a4f95ad..f6023ff390c2 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -182,7 +182,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
>  	/* update uinfo */
>  	uinfo->access = data->access;
>  	uinfo->count = data->vcount;
> -	uinfo->type = (snd_ctl_elem_type_t)info->type;
> +	uinfo->type = info->type;
>  
>  	switch (info->type) {
>  	case GB_AUDIO_CTL_ELEM_TYPE_BOOLEAN:
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 535a7229e1d9..8e71a95644ab 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -950,7 +950,7 @@ struct snd_ctl_card_info {
>  	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
>  };
>  
> -typedef int __bitwise snd_ctl_elem_type_t;
> +typedef __u8 snd_ctl_elem_type_t;
>  #define	SNDRV_CTL_ELEM_TYPE_NONE	((__force snd_ctl_elem_type_t) 0) /* invalid */
>  #define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	((__force snd_ctl_elem_type_t) 1) /* boolean type */
>  #define	SNDRV_CTL_ELEM_TYPE_INTEGER	((__force snd_ctl_elem_type_t) 2) /* integer type */
> @@ -960,7 +960,7 @@ typedef int __bitwise snd_ctl_elem_type_t;
>  #define	SNDRV_CTL_ELEM_TYPE_INTEGER64	((__force snd_ctl_elem_type_t) 6) /* 64-bit integer type */
>  #define	SNDRV_CTL_ELEM_TYPE_LAST	SNDRV_CTL_ELEM_TYPE_INTEGER64
>  
> -typedef int __bitwise snd_ctl_elem_iface_t;
> +typedef __u8 snd_ctl_elem_iface_t;
>  #define	SNDRV_CTL_ELEM_IFACE_CARD	((__force snd_ctl_elem_iface_t) 0) /* global control */
>  #define	SNDRV_CTL_ELEM_IFACE_HWDEP	((__force snd_ctl_elem_iface_t) 1) /* hardware dependent device */
>  #define	SNDRV_CTL_ELEM_IFACE_MIXER	((__force snd_ctl_elem_iface_t) 2) /* virtual mixer device */

I can't take a uapi sound header file patch along with a driver change,
these need to be independant.

And this is a userspace api, you just changed the size of an externally
facing variable, are you _SURE_ that is ok to do?

thanks,

greg k-h
