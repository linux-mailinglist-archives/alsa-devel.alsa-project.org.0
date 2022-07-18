Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C95578D32
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 00:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF66170F;
	Tue, 19 Jul 2022 00:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF66170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658181686;
	bh=2Ev2LyM9YnAhm4y0XObcEQZ9ad9QrBTelT09KfpIBcc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glReUPt+IK46ARcL0gGGiPotiCgJtmMCuJFHMIcVbwzmBI3m4Qy8WDbMB4pAAHT1p
	 rhlLafnDvuXY8bU9wM5yBZSdQVeIEZmgzmL6GFSUUjxaqKFuiEPMIBAuSYAbErh0rq
	 qT/9RaFppY72k60xtdmJ4/MxPt5GxM/4fn8uCm18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB90F8050F;
	Tue, 19 Jul 2022 00:00:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 105F3F80508; Tue, 19 Jul 2022 00:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47345F80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 00:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47345F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="leyACy2j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Smy+K5SsBoKu7R2Ez6Wknyaqr3gfX9BPVA5fVt2P8T0=; b=leyACy2j4DACa1kT6Gpoba8VOm
 VOcEfZL3PkIZgiPs8NmLAJaBh8ucD+6kAoUEzxAXkRiJhdoKUCC9eS2BxTrWrSU3Gqy8FGHCl0+Yf
 cnoOA2e2G7FTo7OqIQ+Jms+460wxBba1ZdXNg9IsZJuJ86ignpBqHcbMW+ipI2+RdNLMHKQbtEnSK
 yUQZmHoK4wSnrk6TsdqloQ/tkKm0+6MDqgVLg+haVl7nQ2yUnqoiirjvDUaegs24clTHejTLG5Nhf
 GrMHfUZ3Mq47NEGdmLxe/Y3iaYND/IDLOH/w41NkO0UbGqm0/y7Hu229QF2xyeGt/BSMoNktdIPyL
 BQ+qyY7Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1oDYmh-001q88-OL; Mon, 18 Jul 2022 22:00:11 +0000
Date: Mon, 18 Jul 2022 15:00:11 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
Message-ID: <YtXX604B2X8vdH9b@bombadil.infradead.org>
References: <20220718072144.2699487-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718072144.2699487-1-airlied@gmail.com>
Cc: alsa-devel@alsa-project.org, Paul Moore <paul@paul-moore.com>,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.sf.net, Casey Schaufler <casey@schaufler-ca.com>,
 Dave Airlie <airlied@redhat.com>, torvalds@linux-foundation.org,
 linux-media@vger.kernel.org
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

On Mon, Jul 18, 2022 at 05:21:44PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> A recent snafu where Intel ignored upstream feedback on a firmware
> change, led to a late rc6 fix being required. In order to avoid this
> in the future we should document some expectations around
> linux-firmware.
> 
> I was originally going to write this for drm, but it seems quite generic
> advice.
> 
> I'm cc'ing this quite widely to reach subsystems which use fw a lot.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Document well deserved to be written, thanks for making this happen.
Modulo all the silly spelling / bike-shedding issues folks might find,
in case you care to re-spin for a v2:

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

Now let's think about the impact of two corner cases which *do*
happen and so this poses security implications on enablement:

1) Devices which end up with a security issue which a vendor considers
   obsolete, and the only way to fix something is firmware. We're
   security-out-of-luck. For this I've previously sucessfully have put
   effort into organizations to open source the firmware. We were
   successful more than once:

     * https://github.com/qca/open-ath9k-htc-firmware
     * https://github.com/qca/ath6kl-firmware

   When these efforts fall short we have a slew of reverse engineering
   efforts which fortunately also have been sucessfull.

2) Vendor goes belly up

Both implicate the need to help persuade early on a strategy for open
source firmware, and I don't want to hear anyone tell me it is not
possible.

When that fails we can either reverse engineer and worst case, I am not
sure if we have a process for annotations or should. Perhaps a kconfig
symbol which drivers with buggy firmware can depend on, and only if you
enable that kconfig symbol would these drivers be available to be
enabled?

Are we aware of such device drivers? They must exist...

  Luis
