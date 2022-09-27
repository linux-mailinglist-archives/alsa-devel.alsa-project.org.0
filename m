Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6715EB88B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 05:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9891822;
	Tue, 27 Sep 2022 05:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9891822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664248645;
	bh=9Ee6uuUkVHd7TcoLu0Fw/ihLN0YlMN/TdTxx9kkN9oI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrMi+fA4bdXiukITKWVe8Blv3d180tg40PlB4ybFjdW6AxSEfTDWzvbrM6mZuDLNI
	 Yizs4Do6VkPE51q81qXvyGR6oNcqppstnaLxYq19+kadW6cO34LCXF9cWYueJ/WXsw
	 OdVQ+t289AIdoj3GDUlzChdyEYjrINFP7kg33/KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A9BF80496;
	Tue, 27 Sep 2022 05:16:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 405B0F8025E; Tue, 27 Sep 2022 05:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2814F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 05:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2814F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ys70lYwi"
Received: by mail-pg1-x52b.google.com with SMTP id r62so4417490pgr.12
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 20:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=cQ6zVkpqugLa9891w98RVMCjnbNxIhz4C6HrHMJZK8I=;
 b=Ys70lYwi0UuItAyKdztaa/QvN/zNeHvK+DYTxNBDjsJxCxH44M11cP9jPnxzHQPNjb
 igvguKL8YyFJNtFEBrZ5W6daU3oui1F9DXIVaw4aE/szAfv+15cUzVL5WS2GxWMW7Yt8
 IPCeEYWTOOuxdVg8giuH8nTC6Yhi4Ev8pRtpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=cQ6zVkpqugLa9891w98RVMCjnbNxIhz4C6HrHMJZK8I=;
 b=Z01MwBFcfkMWMQaQU4zt4PxFbkFlZ8/CKWa3ri2+N/SGMgaexrEVLpTGBx/ClhSKmT
 Ivlp00N0ZMt6N7KLJAkSoBvRU0RRHZEP2948q3rqBESKzL9/Xtev10YEGjp1gpbLr9Q3
 hJ8zsqWQmK3dpxfAXgfLlAudx+plTBVfYtt6S/Imb1v133xkaafdexyqCpbnexrsb5WV
 M/lorNWPucZskAe/RYUyD2wAMUi6XcV1MO3SmR0Jjwk0IFNy61Mgr7FwXlthD0aWQ8I7
 vAPBLxnUSabUtcKhS2JLIlHsbgbg3xr6FiE9FcmNiYtRAOrBNOiXv0KzIo2gSdXEW1Vy
 Ww7g==
X-Gm-Message-State: ACrzQf1QogOQtnqxWybLoMuvcQFSY+CN1AEHxrcqF/DvJA3HqF0Oqvgc
 ZbfVt7VDDDV+2h12iaZPjQ5znpfbmVyt7w==
X-Google-Smtp-Source: AMsMyM4aPQZJmufIlgB90yFaVfoE50JmAVMSvaBvUb81fg56HsalOTyKUNoRqQO6/X3VOyQ7j9y52w==
X-Received: by 2002:a05:6a00:c89:b0:543:edb9:9dbc with SMTP id
 a9-20020a056a000c8900b00543edb99dbcmr27379913pfv.50.1664248577744; 
 Mon, 26 Sep 2022 20:16:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621955000000b0053812f35a41sm269573pfz.194.2022.09.26.20.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 20:16:17 -0700 (PDT)
Date: Mon, 26 Sep 2022 20:16:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <202209262009.D1377D0C3@keescook>
References: <YzIcZ11k8RiQtS2T@work> <YzIj6tdtDe9YrX+I@sirena.org.uk>
 <81af0106-a732-ce45-bb1c-c45db9e1aeb9@embeddedor.com>
 <YzIqNqhTIuaWZrOl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIqNqhTIuaWZrOl@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org
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

On Mon, Sep 26, 2022 at 11:39:50PM +0100, Mark Brown wrote:
> On Mon, Sep 26, 2022 at 05:27:41PM -0500, Gustavo A. R. Silva wrote:
> > On 9/26/22 17:12, Mark Brown wrote:
> > > On Mon, Sep 26, 2022 at 04:40:55PM -0500, Gustavo A. R. Silva wrote:
> 
> > > As documented in submitting-patches.rst please send patches to the
> > > maintainers for the code you would like to change.  The normal kernel
> > > workflow is that people apply patches from their inboxes, if they aren't
> > > copied they are likely to not see the patch at all and it is much more
> > > difficult to apply patches.
> 
> > That's exactly what I intended to do:
> > 
> > $ scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/sound/sof/control.h
> > Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
> > Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
> > alsa-devel@alsa-project.org (moderated list:SOUND)
> > linux-kernel@vger.kernel.org (open list)
> > 
> > Did you see anything wrong with this or something...?
> 
> Yes, you should've also included me and the SOF maintainers.  It looks
> like the MAINTAINERS patterns aren't entirely up to date there
> unfortunately.  Though that said given that you'd picked up on the
> subject line I'd have expected the signoffs on the commits to also be
> pointing at the right tree as well.

Subject line heuristics look at X-many commits, but it looks like
get_maintainers stops looking at git history by default after 1 year,
which seems kind of odd. I had to work at it to get it to emit your
name. :)

scripts/get_maintainer.pl --git --git-since=3-years-ago

Seems like it's worth getting the MAINTAINERS regex updated? Is this
right?

diff --git a/MAINTAINERS b/MAINTAINERS
index a34ec41fbf7a..2560dded0e3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19261,6 +19261,7 @@ F:	Documentation/devicetree/bindings/sound/
 F:	Documentation/sound/soc/
 F:	include/dt-bindings/sound/
 F:	include/sound/soc*
+F:	include/sound/sof/
 F:	sound/soc/
 
 SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS
@@ -19275,6 +19276,7 @@ L:	sound-open-firmware@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 W:	https://github.com/thesofproject/linux/
 F:	sound/soc/sof/
+F:	include/sound/sof/
 
 SOUNDWIRE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>

-- 
Kees Cook
