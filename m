Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B454729D
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jun 2022 09:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3AA1B11;
	Sat, 11 Jun 2022 09:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3AA1B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654932084;
	bh=9rveE22F5xtfV5P9xuvluHy5z6lSISxGcOGWCcJpfP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPB+zQtV4mf7Oo9oMlMQ1eb3UPEyHGBKPfev/M4jdGLZ2fS3vMc3F7D7pUG6NPLs7
	 kcD/JDI6xHDZjfFoRtgEwBn3mJxIyLweEnPrdQJADpUTdU6WxqeJ0EG6s7K0aLBscp
	 rAru7q99slmsKtVZ6VEufjRrRSNdrcE8zceqNvlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BFEF800E5;
	Sat, 11 Jun 2022 09:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D8FEF800EC; Sat, 11 Jun 2022 09:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DEF9F800EC
 for <alsa-devel@alsa-project.org>; Sat, 11 Jun 2022 09:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DEF9F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="e2BBEMwG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECF5BB838B8;
 Sat, 11 Jun 2022 07:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03364C34116;
 Sat, 11 Jun 2022 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654932014;
 bh=9rveE22F5xtfV5P9xuvluHy5z6lSISxGcOGWCcJpfP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2BBEMwG/Slx/3Y+9f8CMaHHZtSJuQ11M0fR95GxEJWiqa5Lsgg5TMOmbjVu05cvq
 TomIVygHEXnLG/EDx67fsyhd6Q4EiGjKLzeXGX+pN2AWUiwxbxDjnL+DTJWOypAucA
 YouYMAOtiuJPuptWL4BZ2wPXvaY9eSg0amijwOMM=
Date: Sat, 11 Jun 2022 09:20:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: intel: uniquify debug message
Message-ID: <YqRCKtLGYlRQQ+DU@kroah.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
 <YqLVwqx9/Pos8T06@kroah.com>
 <b86e6cbd-3488-a239-d765-cf01bf0d4f70@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b86e6cbd-3488-a239-d765-cf01bf0d4f70@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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

On Fri, Jun 10, 2022 at 10:06:58AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 6/10/22 00:25, Greg KH wrote:
> > On Fri, Jun 10, 2022 at 10:35:36AM +0800, Bard Liao wrote:
> >> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>
> >> The same debug message is replicated multiple time, add __func__ to
> >> figure out what link is ignored.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> ---
> >>  drivers/soundwire/intel.c | 28 ++++++++++++++--------------
> >>  1 file changed, 14 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> >> index 505c5ef061e3..808e2f320052 100644
> >> --- a/drivers/soundwire/intel.c
> >> +++ b/drivers/soundwire/intel.c
> >> @@ -1328,8 +1328,8 @@ int intel_link_startup(struct auxiliary_device *auxdev)
> >>  
> >>  	if (bus->prop.hw_disabled) {
> >>  		dev_info(dev,
> >> -			 "SoundWire master %d is disabled, ignoring\n",
> >> -			 sdw->instance);
> >> +			 "%s: SoundWire master %d is disabled, ignoring\n",
> >> +			 __func__, sdw->instance);
> > 
> > This is not a debug message, please make it such if you want to have
> > __func__  And even then, it's not needed as you can get that from the
> > kernel automatically.
> 
> Sorry, I don't understand the feedback at all.

dev_info() is not a way to send debug messages.

If you want this to be only for debugging, use dev_dbg().  And when you
use that, you get the __func__ location for free in the output already
if you want that.

> This message was added precisely to figure out why the expected
> programming sequence was not followed, only to discover that we have
> devices with spurious PCI wakes handled below. Without this added
> difference with __func__, we wouldn't know if the issue happened during
> the expected/regular programming sequence or not.

Perhaps make the text unique then?  Why would an informational message
need a function name.  Drivers should be quiet when all is going well.
If something is not going well, dev_info() is not the kernel log level
to be sending something out at.

> >>  		return 0;
> >>  	}
> >>  
> >> @@ -1489,8 +1489,8 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
> >>  	bus = &sdw->cdns.bus;
> >>  
> >>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
> >> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> >> -			bus->link_id);
> >> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
> >> +			__func__, bus->link_id);
> >>  		return 0;
> >>  	}
> >>  
> >> @@ -1549,8 +1549,8 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
> >>  	int ret;
> >>  
> >>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
> >> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> >> -			bus->link_id);
> >> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
> >> +			__func__, bus->link_id);
> > 
> > Not needed, it is provided automatically if you ask the kernel for this.
> > Same for all other instances in this patch.
> 
> provided how? Your comment is a bit cryptic here.

the dynamic debug code in the kernel already adds the function name
where the message was sent from, if you want to know this in userspace.
Please read the documentation for details (I think the key is the 'f'
flag to be enabled in userspace).

So adding __func__ to dev_dbg() calls are redundant and never needed.

thanks,

greg k-h
