Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07CEA26C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 18:23:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340E0231F;
	Wed, 30 Oct 2019 18:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340E0231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572456223;
	bh=atVtgUtxTIf4pbginD0qlCViD5DktuO+zCndyCb9kUY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJqUH7U8olNz3Iv+dvfCnw/YeTt9QNggftldALcvKUE8sYtHnhiQV2DXcqz4A8qOC
	 hW0YCG2IESWK0eK4d88HWGySqLetJY4RC/LxKick+0JAVeh2/xEq3ScJkSoInQ5APr
	 FejZXoRjiN0WqQC8SXcYhb7F3vqgN4BK8SrTZbbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60800F802A0;
	Wed, 30 Oct 2019 18:21:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61717F80361; Wed, 30 Oct 2019 18:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64F69F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 18:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F69F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=accosted-net.20150623.gappssmtp.com
 header.i=@accosted-net.20150623.gappssmtp.com header.b="kTgvWwA2"
Received: by mail-lf1-x141.google.com with SMTP id q28so2187248lfa.5
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=accosted-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDNnS+0qNNC57KL5eLCpislrpVs43y0/efHawMCYN8Y=;
 b=kTgvWwA2pnCjzaqM3xsJ79iZ//ASTpYiEHxt+SSvdPaGLPohHdEMr0+yBh/LJrdzyM
 YfDJvDJMYxkEp6kyIRZ76ccBbK0H7AFOoPZot0aggepK8nfGlquReQfIFHOSv579y+dF
 Uh5TDPvUt8xjipUVJcFTZALGHNGxRK8YEubQmo7JLwl20SY8deo5VCeUF/IOOBKfdYcu
 kb5aynzRvc9fid6vMedq4rPbVhZ3hPk8ufXa6vN+AuzyV6VCpZ5LgVxB6o23lNp7/0yP
 k4dtJUI/JpH75KUHUfnxjf7+ufxAMSLCM+9aHmfD1Jeo4nFFA0oZ3v5kUfu0qGhU7OuI
 1/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDNnS+0qNNC57KL5eLCpislrpVs43y0/efHawMCYN8Y=;
 b=cX+PIJbS8elMKEX+R/B25+nG0JVj8pVsdUwoeT4BNt/DzXuomfPqaSH2sHqzzXFG+x
 VOhr15Wzn55qvYV8m6tSY/rphZPvGsjO0tpV+vCLwmPRA/19hET3HiLgzip9PFyac/gL
 /jC23DV8zkblRBD9MpOO6Qi0g65H5C5AtxLkCrlVJXjNFgUSrP3IJWD3j9bSlBPBTlC0
 U9VsoTsmhnBpqPIXJIUKC4F28D2GsT0c2Md6JVMtu3pm681DnyEsZhOQmnSLNtzg6kGu
 y5Db00f9dHAgCNPjlABtNrYdSvrRdDzy+QJJt5zq/ccNwXb3cag1jVEmTMv4Rkj8GfHB
 Ba3g==
X-Gm-Message-State: APjAAAVSkh5DKUmLeTPJtJ7Yv2h9u7KqSTjvbGKtFBN7xzST8vxLSKNB
 EDnOT20WWsl66X883LZEVIJK1t9HuNUlX3FqWPfXrg==
X-Google-Smtp-Source: APXvYqzLi+F0aRTfQfkZekDVcFk+o55sXq0soTHBSmYpxtDm3Cvrkp2l95KBISouApmgP5RB9q/rpS+cgO/80f5rfck=
X-Received: by 2002:a19:9146:: with SMTP id y6mr145258lfj.11.1572456109964;
 Wed, 30 Oct 2019 10:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191030122124.GA7218@sirena.co.uk>
In-Reply-To: <20191030122124.GA7218@sirena.co.uk>
From: Arun Raghavan <arun@accosted.net>
Date: Wed, 30 Oct 2019 18:21:37 +0100
Message-ID: <CACuU-+jRNgQbdhvQfqikkhGYiAOyeBkzZyDsBtb=uwA95JEe7g@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [ANNOUNCE] Schedule for 2019 Linux Audio
	miniconference
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

On Wed, 30 Oct, 2019, 1:22 pm Mark Brown, <broonie@kernel.org> wrote:

> Hi,
>
> As in previous years we're going to have an audio miniconference so we can
> get together and talk through issues, especially design decisions, face to
> face.  This year's event will be held on October 31st in Lyon, France,
> the day after ELC-E.  This will be held at the Lyon Convention Center (the
> ELC-E venue) and will be free of charge to attend, generously
> sponsored by Intel.
>
> The plan is to gather at 9am and start once enough people are there and
> ready.  I look forward to seeing you all tomorrow!
>
> The agenda is looking pretty full now, what we've got so far is:
>
>  - Introductions (me)
>  - Use case management enhancements (Curtis)
>  - DSP framework integration (Liam)
>   - SOF integration with ACPI and DT (Daniel)
>   - SOF support for non-modular drivers (Daniel)
>    - Gapless compressed playback (Patrick)
>   - Soundwire status (Liam?)
>    - Multi-CPU support
>    - Mixing with HDA/I2S in a single system
>   - PCM issues (Patrick)
>    - PCM device volume control
>    - Attaching timestamps to buffers
>   - kcontrol issues (Takashi)
>    - Standardization
>    - Confirmance testing
>   - Virtualization (Liam)
>   - User experiences (Jerome)
>   - Unified graph (Patrick)
>   - Componentisation status/plans (Me)
>

Unfortunately my talk at GstConf (on compressed offload with
PulseAudio/GStreamer!) is tomorrow, so as much as I'd like to be there for
practcially every topic, I will likely miss a bunch of stuff. Hope were
able to capture detailed minutes like the previous years.

Cheers,
Arun

>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
