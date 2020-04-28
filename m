Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02701BB707
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 08:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EFFB168C;
	Tue, 28 Apr 2020 08:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EFFB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588056708;
	bh=fxHe2iijiSX4RUxeMIFUBkO8/lPNIwZYjBa2OpC513U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ErG4q5TFNibH2RbdAc9bIpck3tuHuKTIFO4YJr16goYEr9Gb7UeZVhTN3Pah3ZIfc
	 Qi6xE141+nb9lnbMnb7B3F5VQ7wYqODohR3y10klYoEk8VfcZiQCXww09SnPa9XVii
	 sxMrEdpcvZEYw0N9P1CFpyA833JeEeTZpbfsichU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D35BF800B8;
	Tue, 28 Apr 2020 08:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF73CF80136; Tue, 28 Apr 2020 08:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E19BAF800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 08:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19BAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ykf8YCje"
Received: from localhost (unknown [106.51.110.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C9E1206B8;
 Tue, 28 Apr 2020 06:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588056596;
 bh=fxHe2iijiSX4RUxeMIFUBkO8/lPNIwZYjBa2OpC513U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ykf8YCjeuJhlAs0v/lXtsGJmb0M2yCS9qGj3oLTFJQS0JRJFpmEt2e0DbrhXVXKhg
 JI9CD1EsvzZwsRUFlhdy/W8NOq7Qh+n4X+J7EjweAG09dvETazDpiSQujAiU8mpQCI
 7xy+AaelGx4PuKwdbOsmgjCfDQDa0xFzCvwxEQ8Y=
Date: Tue, 28 Apr 2020 12:19:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200428064951.GA56386@vkoul-mobl.Dlink>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
 <20200420072631.GW72691@vkoul-mobl>
 <20200423142451.GA4181720@kroah.com>
 <20200428043144.GU56386@vkoul-mobl.Dlink>
 <20200428063736.GB990431@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428063736.GB990431@kroah.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, mengdong.lin@intel.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com
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

On 28-04-20, 08:37, Greg KH wrote:
> On Tue, Apr 28, 2020 at 10:01:44AM +0530, Vinod Koul wrote:
> > > > That is not true for everyone, it is only true for Intel, pls call that
> > > > out as well...
> > > 
> > > Why is it not true for everyone?  How else do you get the pm stuff back
> > > to your hardware?
> > 
> > The rest of the world would do using the real controller device. For
> > example the soundwire controller on Qualcomm devices is enumerated as a
> > DT device and is using these...
> > 
> > If Intel had a standalone controller or enumerated as individual
> > functions, it would have been a PCI device and would manage as such
> 
> If it is not a standalone controller, what exactly is it?  I thought it
> was an acpi device, am I mistaken?
> 
> What is the device that the proper soundwire controller driver binds to
> on an Intel-based system?

The HDA controller which is a PCI device. The device represent HDA
function, DSP and Soundwire controller instances (yes it is typically
more than one instance)

Thanks
-- 
~Vinod
