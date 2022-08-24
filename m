Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F359F38D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 08:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7A5C847;
	Wed, 24 Aug 2022 08:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7A5C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661321998;
	bh=xuOEfRn0BPqX1AVqOWxNeF9MJokEIlZnw9CPZ53hzOA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgMpGSLtc1ymJy6FzZ5bCixYPED2Fm6diMAi49p1lYTFSOaBSBZTH2/v3vVmgH5an
	 KiVuVOr3aNBOnbIQ1nNAuCP4a26DUlTHNQHtoiUWJ2jD3n9KvjLzlZkDE97EWSZwPX
	 QhybuGLPdc7MTt0inxDv8/InMpgsAzwrkljFKabE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BDE8F804C1;
	Wed, 24 Aug 2022 08:18:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D07F800C8; Wed, 24 Aug 2022 08:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31171F800C8
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 08:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31171F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Be/1mBwY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6FC16105C;
 Wed, 24 Aug 2022 06:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43A9C433C1;
 Wed, 24 Aug 2022 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661321928;
 bh=xuOEfRn0BPqX1AVqOWxNeF9MJokEIlZnw9CPZ53hzOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Be/1mBwYbAEN3+M04cd/EQ53zXBHkTrlGXOTdnHAs2pCkOF4a5YsvC01vDGRxM1hD
 8vg9KVrEJ12Onx9kZQNLYjOmDR4QnXy0qJsCfK8NkrNqi60yGClRnDE118F/LaDFe0
 3OGGnmVwTPacdjHGS0HGYWC36mUWFlIfDWiRmJyA=
Date: Wed, 24 Aug 2022 08:18:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/5] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Message-ID: <YwXCxZuaiumS/Am5@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <YwT5gqOihDYK73aF@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwT5gqOihDYK73aF@matsya>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

On Tue, Aug 23, 2022 at 09:30:02PM +0530, Vinod Koul wrote:
> On 29-07-22, 15:50, Greg Kroah-Hartman wrote:
> > The sysfs logic already creates a list of groups for the device, so add
> > the sdw_slave_dev_attr_group group to that list instead of having to do
> > a two-step process of adding a group list and then an individual group.
> > 
> > This is a step on the way to moving all of the sysfs attribute handling
> > into the default driver core attribute group logic so that the soundwire
> > core does not have to do any of it manually.
> 
> Hey Greg,
> 
> DO you have a v2 for this, or if you are too busy I can update the
> patchset...

Oh wait, I did rebase it, I'll send it out this afternoon, thanks for
the reminder...

greg k-h
