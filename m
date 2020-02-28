Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB51731D3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 08:34:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCC616DA;
	Fri, 28 Feb 2020 08:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCC616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582875259;
	bh=ukpzQuPACt86ecHriGB09MDbTJzAHcm8p3pyeHuvKPs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L50IVNToin6j+6uInq4T1gfPW1/BHdhmWSRFUOcTXsdEtzARlunUcsHeUARMIRNHS
	 RWB5yIuCbq/fcehEVD+/Ew5PziftpbkKKyw9U5jYcUUSb8vb8eo3x/M1/R0q1IlNHr
	 8s9I8KReZc1W4znRJrIUIi33mVUT/9er8sADc8fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 466C7F8014D;
	Fri, 28 Feb 2020 08:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9833FF8016F; Fri, 28 Feb 2020 08:32:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ED3BF8014D
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 08:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED3BF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0vxosIcJ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7FAB246A3;
 Fri, 28 Feb 2020 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582875150;
 bh=ukpzQuPACt86ecHriGB09MDbTJzAHcm8p3pyeHuvKPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0vxosIcJPXo2eYYCb2J3fg3pRmM5fuOsjosH8tiaM3cqRx5kOJip8SrNNohEcJOBa
 IuNa24L0q9XLQnKHHUJq8ASPltYSBAo4C0klNTqmBop234UBdumVNmmU8qwUoJYVL3
 WK6svDGEmppjv3ZWyNWPbRIjnJkDT7UTmm2asL1E=
Date: Fri, 28 Feb 2020 08:32:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Message-ID: <20200228073227.GA2898712@kroah.com>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

On Thu, Feb 27, 2020 at 04:31:59PM -0600, Pierre-Louis Bossart wrote:
> In the existing SoundWire code, Master Devices are not explicitly
> represented - only SoundWire Slave Devices are exposed (the use of
> capital letters follows the SoundWire specification conventions).
> 
> The SoundWire Master Device provides the clock, synchronization
> information and command/control channels. When multiple links are
> supported, a Controller may expose more than one Master Device; they
> are typically embedded inside a larger audio cluster (be it in an
> SOC/chipset or an external audio codec), and we need to describe it
> using the Linux device and driver model.  This will allow for
> configuration functions to account for external dependencies such as
> power rails, clock sources or wake-up mechanisms. This transition will
> also allow for better sysfs support without the reference count issues
> mentioned in the initial reviews.
> 
> In this patch, we convert the existing code to use an explicit
> sdw_slave_type, then define new objects (sdw_master_device and
> sdw_master_driver).
> 
> A parent (such as the Intel audio controller or its equivalent on
> Qualcomm devices) would use sdw_master_device_add() to create the
> device, passing a driver name as a parameter. The master device would
> be released when device_unregister() is invoked by the parent.
> 
> Note that since there is no standard for the Master host-facing
> interface, so the bus matching relies on a simple string matching (as
> previously done with platform devices).
> 
> The 'Master Device' driver exposes callbacks for
> probe/startup/shutdown/remove/process_wake. The startup and process
> wake need to be called by the parent directly (using wrappers), while
> the probe/shutdown/remove are handled by the SoundWire bus core upon
> device creation and release.
> 
> Additional callbacks will be added in the future for e.g. autonomous
> clock stop modes.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile         |   2 +-
>  drivers/soundwire/bus_type.c       | 141 +++++++++++++++++++++++++++--
>  drivers/soundwire/master.c         | 100 ++++++++++++++++++++
>  drivers/soundwire/slave.c          |   7 +-
>  include/linux/soundwire/sdw.h      |  76 ++++++++++++++++
>  include/linux/soundwire/sdw_type.h |  36 +++++++-
>  6 files changed, 351 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/soundwire/master.c

As you are adding new sysfs files here, is there a follow-on patch for
Documentation/ABI/ updates?

thanks,

greg k-h
