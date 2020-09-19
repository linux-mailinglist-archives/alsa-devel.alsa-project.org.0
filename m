Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E89270D8F
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 13:21:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4481216A8;
	Sat, 19 Sep 2020 13:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4481216A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600514465;
	bh=IT2ne0SjjgFpnx3UEgWv/Q7vVvCeyE83s3LUez6XYe8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0lPpbACIbyZUNpHXeWP/exXsQDHIfSTF6x7QYHHEemr7Y5aSFEGLyQprmyV6BDB2
	 1M/oiN5t0oz7V+SOtHb3vuszTuRK9kInikld9KgQ+BLNl/JJj2sAQri9+O+q3+Sh30
	 amjORR+NovLUOeGJcjkPx/FSz4Gw0PoBA5Y0/GRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEBEF8025E;
	Sat, 19 Sep 2020 13:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54BE5F80212; Sat, 19 Sep 2020 13:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72BA7F8012D
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 13:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72BA7F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L5wLmMlR"
Received: from localhost (unknown [171.48.27.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B70C21481;
 Sat, 19 Sep 2020 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600514357;
 bh=IT2ne0SjjgFpnx3UEgWv/Q7vVvCeyE83s3LUez6XYe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5wLmMlRjvHb1RL+LjeAx3BQHX3DIarTIOMtlof5Ca8xbYcjq5UhulG9C5pQ9udGm
 PXbby0oK52F1CvWgZmK6/pzHj+zRhKOKR0r92sX/KJSoOZgDXkAUd8Pe7vH+cjZXsZ
 ldkAEQkKa8XJ4HgGR1i7/3aPx6pjLhSvvQSCc3G0=
Date: Sat, 19 Sep 2020 16:49:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
Message-ID: <20200919111911.GW2968@vkoul-mobl>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
 <20200918121614.GS2968@vkoul-mobl>
 <c8729c1d-6d36-ad34-34c3-899ba0f5366d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8729c1d-6d36-ad34-34c3-899ba0f5366d@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 18-09-20, 09:21, Pierre-Louis Bossart wrote:
> 
> 
> 
> > >    * Base file is device
> > >    *	|---- modalias
> > > + *	|---- dev-status
> > > + *		|---- status
> > > + *		|---- device_number
> > 
> > Any reason why we want this under dev-status.
> > 
> > Both the status and device_number belong to the device, so we can
> > put them under device and use device properties
> 
> We already use directories for device-level and port-level properties, I
> just thought it be cleaner to continue this model. We might also expand the
> information later on, e.g. provide interrupt status.

Right now we have directories for N ports (needs a dir due to nature of
N ports) and 'properties' derived from Disco/firmware.
So Nport and properties makes sense. But for generic device level stuff
like device number, status and future interrupt or anything should be at
device level.

> I don't mind if we remove the directory and move everything up one level,
> but it wouldn't be consistent with the previous work.

Just because we had directory for a reason, adding a directory to
conform to that does make it better. IMO device files should be at
device directory

> 
> > > +static ssize_t device_number_show(struct device *dev,
> > > +				  struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> > > +
> > > +	if (slave->status == SDW_SLAVE_UNATTACHED)
> > > +		return sprintf(buf, "%s", "N/A");
> > 
> > Do we really want N/A here, 0 should imply UNATTACHED and then the
> > status_show would tell UNATTACHED.
> 
> Actually no. If you look at the standard, 'Unattached' is an 'internal state
> of a Slave that indicates that it is not synchronized with to the Frame
> boundaries within the Bitstream'. A Slave device can only become attached
> and report it's presence as Device0 in a PING frame once it's ATTACHED -
> which in turn means the device has been able to sync for 15 frames. A device
> number of zero means the device is able to respond to command but has not
> yet been enumerated, or was enumerated previously but lost sync or went
> through a reset sequence and reattached. A device number of zero does not
> mean the device is unattached, the logic is as follow:
> 
> Attached -> Device 0 or 1..11
> Unattached -> No concept of device number (or not an observable value).
> 
> We should not overload what 'Device0' means and instead follow the standard
> to the letter. We also don't want the attribute to come and go dynamically,
> so N/A (Not Applicable) is IMHO the only way to convey this meaning.
> 
> Does this help?

Ok lets retain this.

-- 
~Vinod
