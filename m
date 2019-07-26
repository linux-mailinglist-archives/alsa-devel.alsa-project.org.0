Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE976B40
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4624D206E;
	Fri, 26 Jul 2019 16:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4624D206E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564150434;
	bh=uM6PVbFQ9ZVlPtITCCHLNwtkimgiy78y1kOPIMhX+A0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+ksjHAjmpB6qzpGBTJiBadTID8He15pPSYoB8/CzLHBLZVq3bm6A8CFcBdFKa8xO
	 8i5tsW5wrBXDTotALLI1ic0F/4mdL5/0bBt9I0XxfCjPS/yXFs+RbFgpfTSRKBUkQa
	 gAx2cmRCUtiAoLHbBC1dTe7I4dmcxuOGU1Po/nT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4315DF80481;
	Fri, 26 Jul 2019 16:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F16D1F803D7; Fri, 26 Jul 2019 16:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B83EBF803D1
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B83EBF803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DrFGCFGe"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93652218D3;
 Fri, 26 Jul 2019 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564150287;
 bh=hF4P0NSUt1UMtwss/k6Y5M453YUX4ips7z7TFzgxoWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DrFGCFGe3nGdvNVEPC5e3DkB9dB6UtwpR8gwlmRgYlQ3ZWfmuMCk9mxghyq8A3IuD
 I+lFzw7xoDMMoRuMIlLkEoJKHdOqXl9EWqnvXCI7PBH46iBa1g8M8eKMio/QnVBXK+
 fz2UijrKpVM0sQUlhZmxdnZUOSIGSbQjVFO2SK/Q=
Date: Fri, 26 Jul 2019 16:11:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726141124.GA4253@kroah.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-5-pierre-louis.bossart@linux.intel.com>
 <9d5bc940-eadd-4f82-0bac-6a731369436d@intel.com>
 <d231f6b0-555a-8c45-1a9a-215c73171923@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d231f6b0-555a-8c45-1a9a-215c73171923@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 04/40] soundwire: intel: add debugfs
 register dump
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 26, 2019 at 09:00:28AM -0500, Pierre-Louis Bossart wrote:
> =

> =

> On 7/26/19 4:35 AM, Cezary Rojewski wrote:
> > On 2019-07-26 01:39, Pierre-Louis Bossart wrote:
> > > +static void intel_debugfs_init(struct sdw_intel *sdw)
> > > +{
> > > +=A0=A0=A0 struct dentry *root =3D sdw->cdns.bus.debugfs;
> > > +
> > > +=A0=A0=A0 if (!root)
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +
> > > +=A0=A0=A0 sdw->fs =3D debugfs_create_dir("intel-sdw", root);
> > > +=A0=A0=A0 if (IS_ERR_OR_NULL(sdw->fs)) {
> > > +=A0=A0=A0=A0=A0=A0=A0 dev_err(sdw->cdns.dev, "debugfs root creation =
failed\n");
> > > +=A0=A0=A0=A0=A0=A0=A0 sdw->fs =3D NULL;
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 debugfs_create_file("intel-registers", 0400, sdw->fs, sdw,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &intel_reg_fops);
> > > +
> > > +=A0=A0=A0 sdw_cdns_debugfs_init(&sdw->cdns, sdw->fs);
> > > +}
> > =

> > I believe there should be dummy equivalent of _init and _exit if debugfs
> > is not enabled (if these are defined already and I've missed it, please
> > ignore).
> =

> I think the direction is just to keep going if there is an error or debufs
> is not enabled.

You should not care either way :)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
