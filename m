Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D2F277
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 11:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A6D16C4;
	Tue, 30 Apr 2019 11:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A6D16C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556615390;
	bh=ry7Mxbc5jHCzf6rdVPCla6BSxZxmAqzSgAo2TiNedH4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJgrVI21hwyK+YH6otEBkey3jw73ZNuNu+iEWbEfCVbEt1yarDdMLnW9nDh/IGzF5
	 QDzZWYfFqt/JLgyizgGY/e7AFgSv2g1AySJX/E74PSoM1pUx/JFXSzkWxIEQrvzqZK
	 N7i1O5zkVv6bmvCIL9+A96oZbD9XkYzWxBlzLUtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DF5F8971B;
	Tue, 30 Apr 2019 11:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F527F896AA; Tue, 30 Apr 2019 11:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4486F8962C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 11:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4486F8962C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qOonsrnI"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 226FE2080C;
 Tue, 30 Apr 2019 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556614323;
 bh=rx7gaafRLvVxPDqwUax0KvGsKin5v/LWnnrVHNAHdO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qOonsrnINOv2RpSPsRKwi6zuWmuX0krW/BpoIRz9cg/hunslBxHyOt5lRy2WD3xeE
 G+Mjm47KScEfQvJBqWA4JmtwApvmbu/STm9R4rgJ4o+W/35plnDKwH92gGB2DRXrCi
 pK8z5OmGazLXqXDxW4Ds/Iv17ebR9CN1yfzlfOUE=
Date: Tue, 30 Apr 2019 14:21:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190430085153.GS3845@vkoul-mobl.Dlink>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/5] soundwire: fix style issues
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

On 15-04-19, 08:09, Pierre-Louis Bossart wrote:
> 
> > > 
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   drivers/soundwire/Kconfig          |   2 +-
> > >   drivers/soundwire/bus.c            |  87 ++++++++--------
> > >   drivers/soundwire/bus.h            |  16 +--
> > >   drivers/soundwire/bus_type.c       |   4 +-
> > >   drivers/soundwire/cadence_master.c |  87 ++++++++--------
> > >   drivers/soundwire/cadence_master.h |  22 ++--
> > >   drivers/soundwire/intel.c          |  87 ++++++++--------
> > >   drivers/soundwire/intel.h          |   4 +-
> > >   drivers/soundwire/intel_init.c     |  12 +--
> > >   drivers/soundwire/mipi_disco.c     | 116 +++++++++++----------
> > >   drivers/soundwire/slave.c          |  10 +-
> > >   drivers/soundwire/stream.c         | 161 +++++++++++++++--------------
> > 
> > I would prefer this to be a patch per module. It doesnt help to have a
> > single patch for all the files!
> > 
> > It would be great to have cleanup done per logical group, for example
> > typos in a patch, aligns in another etc...
> 
> You've got to be kidding. I've never seen people ask for this sort of
> detail.

Nope this is the way it should be. A patch is patch and which
should do one thing! Even if it is a cleanup one.

I dislike a patch which touches everything, core, modules, so please
split up. As a said in review it takes guesswork to find why a change
was done, was it whitespace fix, indentation or not, so please split up
based on type of fixes.

> 
> > 
> > >   12 files changed, 313 insertions(+), 295 deletions(-)
> > > 
> > > diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> > > index 19c8efb9a5ee..84876a74874f 100644
> > > --- a/drivers/soundwire/Kconfig
> > > +++ b/drivers/soundwire/Kconfig
> > > @@ -4,7 +4,7 @@
> > >   menuconfig SOUNDWIRE
> > >   	bool "SoundWire support"
> > > -	---help---
> > > +	help
> > 
> > Not sure if this is a style issue, kernel seems to have 2990 instances
> > of this!
> 
> this is reported by checkpatch.pl --strict.
> 
> > 
> > >   	if (msg->page)
> > >   		sdw_reset_page(bus, msg->dev_num);
> > > @@ -243,7 +244,7 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
> > >    * Caller needs to hold the msg_lock lock while calling this
> > >    */
> > >   int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
> > > -				struct sdw_defer *defer)
> > > +		       struct sdw_defer *defer)
> > 
> > this does not seem aligned to me!
> 
> It is, I checked. 2 tabs and 7 spaces.
> 
> > 
> > >   int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
> > > -		u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf)
> > > +		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf)
> > 
> > this one too
> 
> 2 tabs and one space.
> 
> > 
> > > @@ -458,13 +458,13 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
> > >   		mutex_unlock(&slave->bus->bus_lock);
> > >   		if (dev_num < 0) {
> > >   			dev_err(slave->bus->dev, "Get dev_num failed: %d",
> > > -								dev_num);
> > > +				dev_num);
> > 
> > It might read better if we move the log to second line along with
> > dev_num...

?

> > 
> > >   int sdw_configure_dpn_intr(struct sdw_slave *slave,
> > > -			int port, bool enable, int mask)
> > > +			   int port, bool enable, int mask)
> > 
> > not aligned
> 
> it is in the code. It's a diff illusion.
> 
> > 
> > >   void sdw_extract_slave_id(struct sdw_bus *bus,
> > > -			u64 addr, struct sdw_slave_id *id);
> > > +			  u64 addr, struct sdw_slave_id *id);
> > 
> > Not aligned
> 
> it is in the code. It's a diff illusion.
> 
> > >   enum sdw_command_response
> > >   cdns_xfer_msg_defer(struct sdw_bus *bus,
> > > -		struct sdw_msg *msg, struct sdw_defer *defer)
> > > +		    struct sdw_msg *msg, struct sdw_defer *defer)
> > 
> > this one too..
> > 
> > >   static int cdns_port_params(struct sdw_bus *bus,
> > > -		struct sdw_port_params *p_params, unsigned int bank)
> > > +			    struct sdw_port_params *p_params, unsigned int bank)
> > 
> > here as well.. (and giving up on rest)
> 
> Please check for yourself that this is a diff illusion w/ tab space.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
