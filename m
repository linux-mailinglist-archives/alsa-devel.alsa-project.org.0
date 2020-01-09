Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545961356D4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 11:28:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1268176E;
	Thu,  9 Jan 2020 11:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1268176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578565689;
	bh=NvDZcxn2AGnAAlLeCQ/bJQX5NN5aU+TSdumP3LZqn38=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s71nd3OcWZYn2wdqEDR6kMf7PQql9KxeGck6nUOc7WStj8SrPft1xfgeb23vyT+XF
	 E1HyPKTWQFoWbG/h1owLJLQ5JVOBRYaJczgnBkKC8PaoqWH9kxFZbGg3YB+e6/cCyf
	 2FD7nffgEuBHa3LF2aIRFvdoftN5GEIXP1JLOOf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544B9F8014E;
	Thu,  9 Jan 2020 11:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96C87F8015B; Thu,  9 Jan 2020 11:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E6B7F80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 11:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6B7F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="hqrjw/g0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ifsgOFP9dRKENq6DPhFUqeIHFL0U53qJ5HRzpA7dSI=; b=hqrjw/g0cwe8zg/PeusiRfssO
 rNc9cLJq49GDY3RYGCJIwB5srXePzk9KQJWlC/qDMGDyhHX6RGH2zii6g4RraFsBCzZp8o0JxAv8L
 WwAu85KzjtlmPGlyGVdgoi3HqVg2ThgomIQ53QJDiJoL6Qc5LLDECTO68f3xxX6NGM0jPz7l4ZLBq
 dfP30aDiqZwjpDfKwzyrajz3YMD8fJX3ipxptlcY8RIZcGgbIjY6KM0T9nNn4XueNfqVQQHxGPHEM
 oR61cA0QqqFoY63jGYkiacRDr5gxgafRm+mv0E/o+B0SNXSClaByaE3d1/lAEHii3A1ctuO1dT9qM
 /kWZ2h14A==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:52586)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ipV0f-0004Ov-DU; Thu, 09 Jan 2020 10:25:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ipV0Z-0000QH-F2; Thu, 09 Jan 2020 10:25:43 +0000
Date: Thu, 9 Jan 2020 10:25:43 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200109102543.GN25745@shell.armlinux.org.uk>
References: <20191210154536.29819-1-tiwai@suse.de>
 <s5h8smhm1vy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h8smhm1vy.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [alsa-devel] [PATCH for-5.6 0/2] drm/bridge: dw-hdmi: PCM API
	updates
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

On Thu, Jan 09, 2020 at 10:10:09AM +0100, Takashi Iwai wrote:
> On Tue, 10 Dec 2019 16:45:34 +0100,
> Takashi Iwai wrote:
> > 
> > Hi,
> > 
> > this is a patch set for updating ALSA PCM API usages in dw-hdmi
> > driver.  I already tried to "fix" the driver some time ago but it was
> > utterly wrong.  So this is a combination of the revised patch and
> > another cleanup patch.
> > 
> > The first one is to change the buffer allocation mechanism in the
> > driver to the manual allocation of the h/w buffer and the automatic
> > allocation of PCM stream buffers via the new standard API.  The
> > significant change is that size of the h/w buffer isn't no longer
> > controlled via ALSA preallocation proc file but rather via the new
> > module option (if any).
> > 
> > The second one is a oneliner patch just to remove the superfluous PCM
> > ops.
> > 
> > Both need the ALSA PCM core changes in 5.5-rc1, so please apply them
> > on top of 5.5-rc1 or later.  Or, just let me know if I should apply
> > them through sound git tree.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > ===
> > 
> > Takashi Iwai (2):
> >   drm/bridge: dw-hdmi: Follow the standard ALSA memalloc way
> >   drm/bridge: dw-hdmi: Drop superfluous ioctl PCM ops
> 
> Any chance for reviewing these patches?
> 
> Since this driver is the only one who is still using the old ALSA
> vmalloc API, I'd like to change it and drop the old API in 5.6.

It isn't something I can even test at the moment; I have the platforms
but no TV to connect them to.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
