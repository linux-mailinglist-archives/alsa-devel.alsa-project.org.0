Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798866B41
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3D71692;
	Fri, 12 Jul 2019 12:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3D71692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562929140;
	bh=iv9noblDk1eikq8OdfQZQutgcy/NKPK1NDGp7NHQFnE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3QcKYM170dw4C4wTJWtDXIekAzM6NmEEGsoqElWrceen0/aozWEywBsUMg+RGz/v
	 YbGoPhCG1JEHSQ+Zh41hu7geXmDb3gCErXyzYcu7JzQeEGfk0xN2PWKwy6pfOez90B
	 4UFyaMgDwhNlIkdA6BTnwV/9RVuzatMQke0wTq7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43FC5F802BD;
	Fri, 12 Jul 2019 12:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5BCF802A2; Fri, 12 Jul 2019 12:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A6AAF800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A6AAF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="Eyr0dtWh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9dynlJ3OM9MALiJSBcSG7FKkftfyq54pHYRnzPQTFA=; b=Eyr0dtWhsmlK2Q6BhgmXpUOL/
 qymgs31El0emqh8IFE4WI3vF53WCcBAaX6vLcGPJDEh30I33KI7G6wSoN0u+M/D/BCSA1udbJvErH
 nIDPBlSdgUpnsnRPshqdgvBlwZh+rqeIGCWGpUc+DhpBYN0jaKp9LJpI4PlEv5yRZ/CSfY7Z8HyYq
 tBBBAz5DaPhve6iZyWd/UAkz7y6uKCCXVnCCXr3uYXQZrhzPLLkpOn95j/IOhrviJVxEXV07j5CsA
 RFU80czsdSVH3CRpvfIGSrY4m2mqkYq99uWagRqbIE8jqCXlSABqwIIgCGdgiZ7x8M2xRsZ2I9Q0c
 8ZwvU8lPQ==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59462)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hltFN-0001Mc-4Y; Fri, 12 Jul 2019 11:57:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hltFJ-0005c2-Nx; Fri, 12 Jul 2019 11:57:45 +0100
Date: Fri, 12 Jul 2019 11:57:45 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712100443.221322-2-cychiang@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
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

On Fri, Jul 12, 2019 at 06:04:39PM +0800, Cheng-Yi Chiang wrote:
> Add an op in hdmi_codec_ops so codec driver can register callback
> function to handle plug event.
> 
> Driver in DRM can use this callback function to report connector status.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  include/sound/hdmi-codec.h    | 16 +++++++++++++
>  sound/soc/codecs/hdmi-codec.c | 45 +++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 7fea496f1f34..9a8661680256 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -47,6 +47,9 @@ struct hdmi_codec_params {
>  	int channels;
>  };
>  
> +typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
> +				      bool plugged);
> +

I'd like to pose a question for people to think about.

Firstly, typedefs are generally shunned in the kernel.  However, for
these cases it seems to make sense.

However, should the "pointer"-ness be part of the typedef or not?  To
see what I mean, consider:

	typedef void (*hdmi_foo)(void);

	int register_foo(hdmi_foo foo);

vs

	typedef void hdmi_foo(void);

	int register_foo(hdmi_foo *foo);

which is more in keeping with how we code non-typedef'd code - it's
obvious that foo is a pointer while reading the code.

It seems to me that the latter better matches what is in the kernel's
coding style, which states:

  In general, a pointer, or a struct that has elements that can
  reasonably be directly accessed should **never** be a typedef.

or maybe Documentation/process/coding-style.rst needs updating?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
