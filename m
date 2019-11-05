Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D762AF0233
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 17:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4904B16E2;
	Tue,  5 Nov 2019 17:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4904B16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572969875;
	bh=ftAerVbtTtffl+VhNYG+Sw26MAmN2mIXYuWp2/ukFLc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PK1C3V+GYm05Un3ys2VpQnlHW9Ajo/LsjCnXu/F7VsGXd8riw0M6xB3xSpN1FJBx9
	 2lOXFY9qQUSSkV+Z7lY7jCu/vXRuvgIMqh03JIZ0Sz+7E0Cyf6Eh4C+TxAmRDWHyQM
	 kpLOpUjSZiKCPCyVFz7AeNdh/4dH5Vw09w/CduoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF56F8049B;
	Tue,  5 Nov 2019 17:02:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75AE8F8049B; Tue,  5 Nov 2019 17:02:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00765F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 17:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00765F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="fWKglK2C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3A67beG499Qjnu8L2mluta/n+EQVRnQ+d0RfOYtLWSQ=; b=fWKglK2Cdl8Drdn2SBn1a4HLG
 mg+AK8OzXfftlF45ImFOPHxl81fMFRixPvUJvWX1DRI/XDdLb1rFMYNFd7yjz8LuCNNM01rl7GeGr
 sciB9RDPFuhQyEdTAVVpkeqrakWOo857paPha5QFDbfsQT/tWSFD0gMPVNzghC/3tedCR9MJKFek9
 DLM+NbKXsuzR0dHDCRx+VpbIZYo0GsVC6iZ46QOybTFPyelIoRRXDX9Lp9hLpA2XuuJVo4zMxPNBW
 sNqF5kiAXbUh7TTgoYdJWLc/BbAuqauS6v5kwEFdfYUvd5M1g0SCdxGjyzV89ZRlHcj+zIGkbbq0q
 lpoYV3zgg==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59712)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iS1Hj-0007L3-Gb; Tue, 05 Nov 2019 16:02:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iS1Hb-0003Bt-Et; Tue, 05 Nov 2019 16:02:15 +0000
Date: Tue, 5 Nov 2019 16:02:15 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <20191105160215.GQ25745@shell.armlinux.org.uk>
References: <s5heeymbvva.wl-tiwai@suse.de>
 <6ad19121-c0e3-d278-2943-ff93ef80353b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad19121-c0e3-d278-2943-ff93ef80353b@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [alsa-devel] Incorrect buffer handling in dw-hdmi bridge audio
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

On Tue, Nov 05, 2019 at 09:07:43AM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 05/11/2019 08:55, Takashi Iwai wrote:
> > Hi,
> > 
> > while recently working on the ALSA memory allocator API cleanup, I
> > noticed that dw-hdmi bridge driver seems doing weird about the buffer
> > management.  It pre-allocates the usual device buffers fully at the
> > probe time, while each stream allocates the buffer via the vmalloc
> > helpers and replaces with it at each open.
> > 
> > I guess it's no expected behavior?  It's basically a full waste of
> > resources, and the vmalloc buffer isn't guaranteed to work well for
> > mmap on every architecture.
> > 
> > Below is the patch to address it.  Can anyone check whether this still
> > works?
> 
> I don't have the setup to check, but this has been pushed by Russell I Added in CC.
> 
> I also added the imx maintainer since it's (AFAIK) only used on iMX SoCs.
> 
> Neil
> 
> > 
> > Since I have a cleanup series and this is involved, I'd like to take
> > the fix through my tree once after it's confirmed (and get ACK if
> > possible).
> > 
> > 
> > Thanks!
> > 
> > Takashi
> > 
> > -- 8< --
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] drm/bridge: dw-hdmi: Fix the incorrect buffer allocations
> > 
> > The driver sets up the buffer preallocation with SNDRV_DMA_TYPE_DEV,
> > while it re-allocates and releases vmalloc pages.  This is not only a
> > lot of waste resources but also causes the mmap malfunction.
> > 
> > Change / drop the vmalloc-related code and use the standard buffer
> > allocation / release code instead.

I think getting rid of the vmalloc code here is a mistake - I seem to
remember using the standard buffer allocation causes failures, due to
memory fragmentation.  Since the hardware is limited to DMA from at
most one page, there is no reason for this driver to require contiguous
pages, hence why it's using - and should use - vmalloc pages.  vmalloc
is way kinder to the MM subsystem than trying to request large order
contiguous pages.

So, NAK on this patch.

> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> > index 2b7539701b42..8fe7a6e8ff94 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> > @@ -384,15 +384,14 @@ static int dw_hdmi_close(struct snd_pcm_substream *substream)
> >  
> >  static int dw_hdmi_hw_free(struct snd_pcm_substream *substream)
> >  {
> > -	return snd_pcm_lib_free_vmalloc_buffer(substream);
> > +	return snd_pcm_lib_free_pages(substream);
> >  }
> >  
> >  static int dw_hdmi_hw_params(struct snd_pcm_substream *substream,
> >  	struct snd_pcm_hw_params *params)
> >  {
> >  	/* Allocate the PCM runtime buffer, which is exposed to userspace. */
> > -	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
> > -						params_buffer_bytes(params));
> > +	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
> >  }
> >  
> >  static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
> > @@ -511,7 +510,6 @@ static const struct snd_pcm_ops snd_dw_hdmi_ops = {
> >  	.prepare = dw_hdmi_prepare,
> >  	.trigger = dw_hdmi_trigger,
> >  	.pointer = dw_hdmi_pointer,
> > -	.page = snd_pcm_lib_get_vmalloc_page,
> >  };
> >  
> >  static int snd_dw_hdmi_probe(struct platform_device *pdev)
> > 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
