Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223DD1ADC1B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 13:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FFB1665;
	Fri, 17 Apr 2020 13:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FFB1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587122811;
	bh=PtfGQ6y34BdAO1ERtwRvNpJQ+pWBqxwze8gj9eRBAuY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XPwwqte6e4rbXfi3GqJXXovbzXfQIrfahVOVJJa8BgEDbUNBvy3IhF0wcBop/fCfn
	 KVSnlP+oHWelH4SrsrEwvCwtRszgI1cEmVN4dCS10DY9q3zhkXaabJ2GVlGcdnbcyS
	 9S/j1MLZ9J8J3vXIQT7vtdBef0NbPgd16c4Xe2Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF97F800DE;
	Fri, 17 Apr 2020 13:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4027F80245; Fri, 17 Apr 2020 13:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18CC4F800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 13:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CC4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="l/mbfKlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587122702;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=PL8NP1zjYSBNJ+7M2gB6mpIwxdDNW486VMAFOgdOofM=;
 b=l/mbfKlkhg/rLIxBQXyx3MOH27DjfANneSDuJdH0VZjA4Li7aTFcC2WgdkZ4ylfSg9
 /15BB03o6C7OeRZRdklqTgvssujxmnAjK/3AYmUMLD3isjHWu1MeRvrIgD9WT8HkXnn7
 IARRmQhlzWHDEdwcso9scCtk0/akGa/+qnX/eNjqmuUVfS9C4db4WUXhSZy/L2FCWXS/
 8uPfA0dAXMUBYKpC1QL07tj5y46KZTM4RJ35h0bz5EcBKg81enOz8u7qIpT10aTRM7ve
 WOYo13tLrxbzTmkZ3jUiU8NKteCdyPFqwuHRu6GMdMIB1eaTgBnWCi5SQAFwWfbFRaDq
 qAag==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id I0a766w3HBP11Vr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 13:25:01 +0200 (CEST)
Date: Fri, 17 Apr 2020 13:24:55 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qdsp6: fix default FE dais and routings.
Message-ID: <20200417112455.GA7558@gerhold.net>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

Hi Srini,

On Wed, Mar 11, 2020 at 06:04:20PM +0000, Srinivas Kandagatla wrote:
> QDSP6 Frontend dais can be configured to work in rx or tx or both rx/tx mode,
> however the default routing do not honour this DT configuration making sound
> card fail to probe. FE dais are also not fully honouring device tree configuration.
> Fix both of them.
> 

I discovered this patch set when QDSP6 audio stopped working after
upgrading to Linux 5.7-rc1. As far as I understand, device tree bindings
should attempt to be backwards compatible wherever possible.
This isn't the case here, although this is not the reason for my mail.
(I don't mind updating my device tree, especially since it is not
upstream yet...)

I have a general question about the design here.

I understand the original motivation for this patch set: Attempting to
configure a TX/RX-only DAI was not possible due to the default routing.
In my opinion this is only relevant for the compressed DAI case.

If we ignore the compressed DAIs for a moment (which can be
unidirectional only), I think we shouldn't care how userspace uses the
available FE/MultiMedia DAIs. We have this huge routing matrix in q6routing,
with 800+ mixers that can be configured in any way possible from userspace.

In "ASoC: qdsp6: q6asm-dai: only enable dais from device tree" you mention:

> This can lead to un-necessary dais in the system which will never be
> used. So honour whats specfied in device tree.

but IMO the FE DAIs are a negligible overhead compared to the routing 
matrix and the many BE DAIs that are really never going to be used
(because nothing is physically connected to the ports).

Even if you restrict FE DAIs to RX/TX only, or disable them entirely,
all the routing mixers still exist for them. They will just result in
configurations that are not usable in any way. IMO the only thing we
gain by restricting the FE DAIs is that the available mixers no longer
match possible configurations.

Before this patch set I used a slightly different approach in my device
tree for MSM8916: I kept all FE DAIs bi-directional, and added DAI links
for all of them. This means that I actually had 8 bi-directional PCM
devices in userspace.

I didn't use all of them - my ALSA UCM configuration only uses
MultiMedia1 for playback and MultiMedia2 for capture.
However, some other userspace (let's say Android) could have chosen
different FE DAIs for whatever reason. We have the overhead for the
routing matrix anyway, so we might as well expose it in my opinion.

My question is: In what way are the FE DAIs really board-specific?

If we expose only some FE DAIs with intended usage per board,
e.g. MultiMedia1 for HDMI, MultiMedia2 for slimbus playback,
     MultiMedia3 for slimbus capture,
I could almost argue that we don't need DPCM at all.
The FE DAIs are always going to be used for the same backend anyway.

This is a bit exaggerated - for example if you have a single compress
DAI per board you probably intend to use it for both HDMI/slimbus.
But this is the feeling I get if we configure the FE DAIs separately
for each board.

I wonder if we should leave configuration of the FE DAIs up to userspace
(e.g. ALSA UCM), and expose the same full set of FE DAIs for each board.

I think this is mostly a matter of convention for configuring FE DAIs
in the device tree - I have some ideas how to make that work
with the existing device tree bindings and for compressed DAIs.
But this mail is already long enough as-is. ;)

I also don't mind if we keep everything as-is
- I just wanted to share what I have been thinking about.

What do you think?

Thanks for reading! ;)
Stephan

> Originally  issue was reported by Vinod Koul
> 
> Srinivas Kandagatla (2):
>   ASoC: qdsp6: q6asm-dai: only enable dais from device tree
>   ASoC: qdsp6: q6routing: remove default routing
> 
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
>  sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
>  2 files changed, 23 insertions(+), 26 deletions(-)
> 
> -- 
> 2.21.0
> 
