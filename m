Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1E14FFB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F133018F6;
	Mon,  6 May 2019 17:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F133018F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557156108;
	bh=ze5USX0jcDER3URvE1ziGH2bujBgZxHnXXSQbpVlOcQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CehgW48EIPS/cwhEhcznbmpu1kpSL/gDHgnRURRoGD81nySgHhpNyIgTZ7eN8hgCF
	 wMuLJKIyRRTjydb0/mE9etgXWw0fLAmhD2cIJORdzaW1H9cb9do+GD68M8s1IStLN7
	 JF+rH0QjbKOLIApwlhrLaspdKTC1uqLXLfjgKKb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A679EF896F0;
	Mon,  6 May 2019 17:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B4BF896F0; Mon,  6 May 2019 17:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A209F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A209F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o7BNpL7D"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C31C42053B;
 Mon,  6 May 2019 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557155996;
 bh=qjmx5CCEvPOYN+9XFMOjhWS/7gmlubDSJs+Xfcsz1HQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7BNpL7DyjFLGVMv7Juaj9HOoId2/EZ+35z4VYo7rSb8fjMuA5tNPuzy29ecaVrcD
 KMAw4jxnLysy5Ah4cFZ3aiXCxJRUULqvf0b6gdWNNe8zQ9b1C5yQ17DjpijYCg/wXM
 O68tSsU3MHwddeK1Vmo4hcyxJvbSBHxIC2wuguKg=
Date: Mon, 6 May 2019 17:19:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190506151953.GA13178@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
 <20190504065444.GC9770@kroah.com>
 <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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

On Mon, May 06, 2019 at 09:42:35AM -0500, Pierre-Louis Bossart wrote:
> > > +
> > > +int sdw_sysfs_slave_init(struct sdw_slave *slave)
> > > +{
> > > +	struct sdw_slave_sysfs *sysfs;
> > > +	unsigned int src_dpns, sink_dpns, i, j;
> > > +	int err;
> > > +
> > > +	if (slave->sysfs) {
> > > +		dev_err(&slave->dev, "SDW Slave sysfs is already initialized\n");
> > > +		err = -EIO;
> > > +		goto err_ret;
> > > +	}
> > > +
> > > +	sysfs = kzalloc(sizeof(*sysfs), GFP_KERNEL);
> > 
> > Same question as patch 1, why a new device?
> 
> yes it's the same open. In this case, the slave devices are defined at a
> different level so it's also confusing to create a device to represent the
> slave properties. The code works but I am not sure the initial directions
> are correct.

You can just make a subdir for your attributes by using the attribute
group name, if a subdirectory is needed just to keep things a bit more
organized.

Otherwise, you need to mess with having multiple "types" of struct
device all associated with the same bus.  It is possible, and not that
hard, but I don't think you are doing that here.

thnaks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
