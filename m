Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD1F3EB0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 05:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974691687;
	Fri,  8 Nov 2019 05:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974691687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573185992;
	bh=lX6uS1E7leIdRm9BwamNh0RUgTaZKvyeSPYNG2Wo1kA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vj+Gf1PUWc8tC9aQBasXLepRCTaFnw1uAoz5vkbtf/VB4ew5BAMeDCsk6AuH+spSc
	 rIZv+Jr/9hAM/WMahjjpbCKPWc7K7YpFPQbJOXRhmcluFr8HuloD5WSrIdjYSm+cBw
	 8wjA39s7s3c7bIhVRHH3er5hO+9s65zGiBP0OqY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBEEF800F3;
	Fri,  8 Nov 2019 05:04:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFC4F803D0; Fri,  8 Nov 2019 05:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC95F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 05:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC95F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nw6TiCjg"
Received: from localhost (unknown [106.200.194.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1743020679;
 Fri,  8 Nov 2019 04:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573185871;
 bh=SvuaRTCeiaXO1ulAR/hJt99i4giuW2xuFA2TDU0zp18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nw6TiCjgbXAYPw4/yuxeXN1VTfWQPOYCZ720Hd4sVm2Fjp2XqgmMEUPstd7kcpMD6
 iLyGR/e0RXRctA8Vq+e+0xmMB8ZVpHLcn7/khJVx/yhcVG38OrKvyvgUm8Wh5LQIyp
 P8lIM256KMJw7TLMZOFSsv7yYu72KxT6iAu3R99M=
Date: Fri, 8 Nov 2019 09:34:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191108040427.GT952516@vkoul-mobl>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-8-pierre-louis.bossart@linux.intel.com>
 <20191103063051.GJ2695@vkoul-mobl.Dlink>
 <9a8fb9ec-1ccb-4931-1ec6-bfae043e8c88@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a8fb9ec-1ccb-4931-1ec6-bfae043e8c88@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 07/14] soundwire: add initial definitions
 for sdw_master_device
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

On 04-11-19, 08:42, Pierre-Louis Bossart wrote:
> 
> 
> On 11/3/19 1:30 AM, Vinod Koul wrote:
> > On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
> > > Since we want an explicit support for the SoundWire Master device, add
> > > the definitions, following the Grey Bus example.
> > > 
> > > Open: do we need to set a variable when dealing with the master uevent?
> > 
> > I dont think we want that or we need that!
> 
> In GreyBus there are events and variables set, not sure what they were used
> for. The code works without setting an event, but we'd need to make a
> conscious design decision, and I am not too sure what usersace would use the
> informatio for.
> 
> > 
> > And to prevent that rather than adding a variable, can you please
> > modify the device_type and use separate ones for master_device and
> > slave_device
> 
> sorry, I don't get the comment. There is only already a different device
> type
> 
> 
> struct bus_type sdw_bus_type = {
> 	.name = "soundwire",
> 	.match = sdw_bus_match,
> 	.uevent = sdw_uevent,

We can remove this

> };
> 
> struct device_type sdw_slave_type = {
> 	.name =		"sdw_slave",
> 	.release =	sdw_slave_release,

Add here:

        uevent = sdw_uevent,

> };
> 
> struct device_type sdw_md_type = {
> 	.name =		"soundwire_master",
> 	.release =	sdw_md_release,
> };

And not have here!

Problem solved!

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
