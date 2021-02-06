Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF97311CC7
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 11:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A056815E4;
	Sat,  6 Feb 2021 11:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A056815E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612609060;
	bh=2GdKW92x7akKqY2lI2PdqMioaHsdvOCqTDFcdvVxuE8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TKw1blvqC9OnW5/Epa9dCZjbZcg5AnNdTjDSoKclO29FaUlLz+wu0k5Wh83fbtQcC
	 NLROD62eTqWKW5J1eRAfnnbZicbVDUMeGgHWuEXvzilNhQ1KcDFcxVByiEic89ugxU
	 0PtbWSgsa/CgRWjM56900DV5gt/JqgV4Q0xtbWng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C7DF80139;
	Sat,  6 Feb 2021 11:56:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B452F80171; Sat,  6 Feb 2021 11:56:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE970F80095
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 11:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE970F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hkC5OTYr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 196F664E10;
 Sat,  6 Feb 2021 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612608957;
 bh=2GdKW92x7akKqY2lI2PdqMioaHsdvOCqTDFcdvVxuE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hkC5OTYrStUD6wqhQcqcU+wwmXS2UeEH9TZzJkVM4ESWjsSJpbi8GIX5XBm+xgQ3C
 tkFcPvEZ1k/g0nu0rWThF+eiWroyhOzKwuME0/XaFJKk2gKtSTo1iQZxPu+Z5xuaJ/
 x6/Y0/EvlHP258eZHWv6JfcfCDyA9TNqRNffLjzh8ptBt/GdSeU5zjUnyhIAZ2CUsn
 o0c4KIFadimDZ3ZhOMAXNyNLRiMSlLJ7MfDDcjDDN40plLJJhTBmNJTeY82jSXzVDA
 CZyitNhU0qxQCKFuAnE5WVll6BIR27WmIqIdk6/zKL9+/ziQvb1x5/Y3VgG4Mx0kpE
 MVG5xJ++OpcoA==
Date: Sat, 6 Feb 2021 16:25:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: slave: introduce DMI quirks for HP
 Spectre x360 Convertible
Message-ID: <20210206105547.GP2656@vkoul-mobl.Dlink>
References: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
 <20210204204837.27876-2-pierre-louis.bossart@linux.intel.com>
 <20210205071621.GF2656@vkoul-mobl.Dlink>
 <46897c27-50ff-564c-5a44-b2c230d4d39b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46897c27-50ff-564c-5a44-b2c230d4d39b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

Hi Pierre,

On 05-02-21, 09:15, Pierre-Louis Bossart wrote:
> Thanks for the review Vinod.
> 
> > On 04-02-21, 14:48, Pierre-Louis Bossart wrote:
> > > HP Spectre x360 Convertible devices expose invalid _ADR fields in the
> > > DSDT, which prevents codec drivers from probing. A possible solution
> > > is to override the DSDT, but that's just too painful for users.
> > > 
> > > This patch suggests a simple DMI-based quirk to remap the existing
> > > invalid ADR information into valid ones.
> > 
> > While I agree with the approach, I do not like the implementation. The
> > quirks in firmware should not reside in core code. Drivers are the right
> > place, of course we need to add callbacks into driver for this.
> > 
> > So I did a quick hacking and added the below patch, I think you can add
> > the quirks in Intel driver based on DMI for this.
> 
> I thought about this, but the Intel driver is about the *master*
> configuration. It's not really about slave-related _ADR. If and when the IP
> configuration changes, it'll be problematic to have such quirks in the
> middle.

Okay, but ADR is not really a slave configuration either. I feel it is system
wide description..

> At the end of the day, the problem is an ACPI one, not an Intel master one,
> and I put the code where it's protected by CONFIG_ACPI.

Right, to be more specific it is a buggy firmware implementation and not
following of the specs by device vendors.

> I don't mind doing the change, but the notion of conflating Intel master and
> list of slave quirks isn't without its own problems.

Same is true for soundwire core (slave/slave-apci or whatever). The
issue I have is that this will sure become big, so I would like this to
be moved away from all soundwire core files. The right place IMO for
this is respective drivers, intel/codec/machine please do take your
pick. My attempt here was to move this to Intel driver here as I felt
that was the right place for platform issues here.. do feel free to move
any other place except core files...

> 
> An alternate solution would be to break the ACPI and OF slave initialization
> into two separate files (slave-acpi.c and slave-of.c), that way there is a
> cleaner split.
> 
> Or we put all those quirks in a dedicated slave-dmi-quirks.c and use your
> solution. That may be more manageable since the list of quirks is
> historically likely to grow.
> 
> It's really ugly in all cases.
> 
> I try to look at the positive side of things: if we have quirks to handle
> it's an indicator that more platforms are moving to SoundWire...
> 
> I hope though that it doesn't reach the level of Baytrail where most of the
> machine driver is a dictionary of quirks.

Hope that it wont, but having seen things, I think it may come to it!

-- 
~Vinod
