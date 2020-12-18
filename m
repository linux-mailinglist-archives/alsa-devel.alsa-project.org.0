Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE642DE373
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 14:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2001788;
	Fri, 18 Dec 2020 14:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2001788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608299275;
	bh=SsPzs1d15tKvn31FOztMFrSDP8UWAr47AjjcdKdfs0w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9lcrQfouog2WUI4k6Rw89Tg8ATzCsVWjEQKc1c8rc2Upq16C5tGrU3sGxmvRQRri
	 LOHmxt0nA1smhpXsRa+cqlnnNurZI5j7+P/jk8O4IyGbeW4vM6+CgjGJ+sKWuAPXDa
	 w03Qfe1hbdm2g6Yoagt5oaO7npntouNTGZb3vGO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA41F80103;
	Fri, 18 Dec 2020 14:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B398F801F7; Fri, 18 Dec 2020 14:46:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC9C6F80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 14:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC9C6F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D86dpjGa"
Received: by mail-wr1-x434.google.com with SMTP id c5so2211769wrp.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 05:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ka1x3IgXnDKEVbUNgJSUcPN8PzFVanlFrtTuT6E8rts=;
 b=D86dpjGakhZl+5XAKRbJimghynE7rov8qUJl/t75gAK4y/Fp5ssvHO49HPwJtIaWW7
 X0ZJnoyYSQEoJHAhiXySsnJJYjhmZB45KowbpkHybNPtkPHbDggsC/oXZOIjNV0OxfIP
 JtLk8ioNSYQNcBqUgcvb8hGzTjMFok0Z5d20D9TGp+gj3yAWd0tBwAcawAEAoclM3CeV
 hlVaCtzhQlhb3gLpgfbarf5Mch5uuBb3PuxZXm6+Qk42SmEjVCjqSdKkAl+v/+V8XpWa
 kzHRKLbBkT4RUsGzpF0vZVjKR15UffhOdqNzvt5OEAGmcdsDkI4BoE2RGEi1CeWWnZHq
 NPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ka1x3IgXnDKEVbUNgJSUcPN8PzFVanlFrtTuT6E8rts=;
 b=mkIZCAFvgxrmMbJpp2NSdvZOOvBbRCqPN2tMOGUuExtK+fnWIza9Q9X5kk4VyUgCDe
 v9GG8b9JI+KU+UQvJ1hOpfO5mjgfqbW+/Plr+yrblEaFxtgSr5JpB98vE0q0JqSyG2+0
 RzrGuijJ9ZP5A4AAV3curmsU99DW1wAw/SvdE5o7lLQuKDZLqyXpF0oXcYOLipBHfxZo
 +Blmkqu/E9ZXH1H+tcSon8UWZ29Zre1+fgctr6SbRKw2fGv1C0W5xS4vIybHq4az6CFU
 Wgz8ifEi34onEOAM6XZS3RJqx1Lt5dbb1lSJ9Sj4DaOn6VmVdLO6WhnbZmzRFvf9B36z
 ybZw==
X-Gm-Message-State: AOAM533ZixqetyBd4Ab/zE7FqDrtlBjIcJSYu+Il/z1Yhj/fM7Nu3lsX
 9aA6tVkmNq9UM7LNG9+uSB8LAw==
X-Google-Smtp-Source: ABdhPJzuzueQDnbBnCkvc22NOc11UsjLlpycV2v2yPaJ9/Pn3FrNYBjDBsPM3Sqix1VPGW3J6EwCWQ==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr4590809wrv.255.1608299166077; 
 Fri, 18 Dec 2020 05:46:06 -0800 (PST)
Received: from dell ([91.110.221.216])
 by smtp.gmail.com with ESMTPSA id l1sm14124574wrq.64.2020.12.18.05.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 05:46:05 -0800 (PST)
Date: Fri, 18 Dec 2020 13:46:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218134603.GS207743@dell>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201218131709.GA5333@sirena.org.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

On Fri, 18 Dec 2020, Mark Brown wrote:

> On Fri, Dec 18, 2020 at 08:10:51AM +0100, Greg KH wrote:
> > On Thu, Dec 17, 2020 at 10:19:37PM +0100, Alexandre Belloni wrote:
> 
> > > There is something I don't get from the documentation and it is what is
> > > this introducing that couldn't already be done using platform drivers
> > > and platform devices?
> 
> > Because platform drivers and devices should ONLY be for actual platform
> > devices.  Do NOT use that interface to fake up a non-platform device
> > (i.e. something that is NOT connected to a cpu through a memory-mapped
> > or direct-firmware interface).
> 
> > Do not abuse the platform code anymore than it currently is, it's bad
> > enough what has been done to it over time, let's not make it any worse.
> 
> I am not clear on why you're giving direct-firmware devices (which I
> assume means things like ARM SCMI where we're talking directly to some
> firmware?) a pass here but not for example a GPIO controlled devices.
> If this is mainly about improving abstractions it seems like the
> boundary here isn't great.  Or perhaps I'm just missing what
> direct-firmware is supposed to mean?
> 
> In any case, to be clear part of what you're saying here is that all
> I2C and SPI MFDs should be rewritten to use this new bus - I've just
> copied Lee in again since he keeps getting missed from these threads.
> As previously discussed this will need the auxilliary bus extending to
> support at least interrupts and possibly also general resources.

Thanks Mark.

Not entirely sure why this needed an entirely new subsystem to handle
non-MMIO Multi-Functional Devices (MFD).  Or why I was not approached
by any of the developers during the process.

Having 2 entirely separate subsystems where MFDs can now be registered
sounds confusing and convoluted at best.  Why not simply extend actual
MFD to be capable of registering non-pure platform devices via other
means?  By doing so you keep things bound to a central location
resulting in less chance of misuse.

I turn away MFD implementation abuses all the time.  Seeing as the 2
subsystems are totally disjoint, this just unwittingly opened up
another back-channel opportunity for those abuses to make it into the
mainline kernel.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
