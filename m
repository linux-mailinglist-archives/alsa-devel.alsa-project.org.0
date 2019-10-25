Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD231E4825
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4395517B6;
	Fri, 25 Oct 2019 12:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4395517B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998054;
	bh=cq/HxP7xl/wlS0ALJ/tjSVNYt7yuWI/enuD07eAdwbQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KO4InR6NtM83GjyzCa9koqIABNfnm7Qsm1IEM8P9QHoyCu30VpESCBmuz9RoVwk78
	 LhHp4+y7sQXNuI5MwTmB9Caa1iE472Ms6+ARfMrPQI5PiK3MgZ7eI+vj7kZuCbfveg
	 4nufqAEIvO/DaPkqTHZYhx83EYGmCDr73W3WFDcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB20F80368;
	Fri, 25 Oct 2019 12:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4955CF8036F; Fri, 25 Oct 2019 12:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC87F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC87F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y/nYImx2"
Received: from localhost (unknown [223.226.103.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03F6820663;
 Fri, 25 Oct 2019 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571997943;
 bh=LyGy1Df6SgnGqZFbao6lw02jNziFYC5d1k9+MFmAjO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y/nYImx2YeVb/tBgerOaKYSgts9/Twe+JOndc/zmALLbBdMYx7miA2VvqU/weeTY5
 cwJA6pkwF9unO4T6rLwd5bt81utYeFWv8bYM9jGOurYv2s1SK+QpELzR4CaD3nz2W1
 0uCiNVVZIeqr3uLpFTmXGIX6KcQeWTVZyjAKOMOY=
Date: Fri, 25 Oct 2019 15:35:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191025100539.GH2620@vkoul-mobl>
References: <20191009181356.GO2036@sirena.org.uk>
 <e6539727-429d-8cd0-af01-d23a4b8af89b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6539727-429d-8cd0-af01-d23a4b8af89b@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On 09-10-19, 14:16, Pierre-Louis Bossart wrote:
> 
> 
> On 10/9/19 1:13 PM, Mark Brown wrote:
> > Hi,
> > 
> > As in previous years we're going to have an audio miniconference so we can
> > get together and talk through issues, especially design decisions, face to
> > face.  This year's event will be held on October 31st in Lyon, France,
> > the day after ELC-E.  This will be held at the Lyon Convention Center (the
> > ELC-E venue) and will be free of charge to attend, generously
> > sponsored by Intel.
> > 
> > Thus far for the agenda we have:
> > 
> >   - Use case management enhancements (Curtis)
> >   - DSP framework integration (Liam?)
> >   - Soundwire status (Pierre?)
> 
> I am unfortunately not going to make it this year due to conflicts.
> 
> I will repost the 50-odd SoundWire patches we have when Vinod is back at his
> desk. For now we have most of the issues ironed out, with all known race
> conditions sorted out and with audio streaming to/from SoundWire links on
> CometLake, IceLake and TigerLake, with 4 different codecs from Realtek
> supported. We are trying to clean-up the last suspend/resume issues in
> collaboration with Realtek.

Apart from x86 world, on arm side support for QC controller is on it way
to upstream (core already supports DT) and we did a demo on Dragon Board
RB3  at Connect SAN19 which uses SoundWire to talk to codec. Srini has
posted codec driver as well as master driver on ML, hopefully we will
have that merged before next merge window.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
