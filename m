Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA158522A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 17:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09377857;
	Fri, 29 Jul 2022 17:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09377857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659107698;
	bh=yXwKBem/pIh5VcizuE/JJL37vzadKBIwU9OceZYtNwI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BYsNJKtZiQU1z+n9h4KRksXmx+zckzqZAL6WkM6dpKFRQl/rr2MoX+XVGo6SOsbmF
	 m07n8M7MRhpBok6aUfRQn3lE1PahIQUbsa4nNU262GrnBgGI+jDaZFliCAt0Yulj9j
	 X18A3H2OdgLFSFvFnEAwWiJnUUuwISOcsRKS3m+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558A5F804B1;
	Fri, 29 Jul 2022 17:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48643F8049C; Fri, 29 Jul 2022 17:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1FD8F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 17:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1FD8F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="YhXSlkk8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D81FB61B86;
 Fri, 29 Jul 2022 15:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AAFC433D6;
 Fri, 29 Jul 2022 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659107630;
 bh=yXwKBem/pIh5VcizuE/JJL37vzadKBIwU9OceZYtNwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YhXSlkk8SXs2rVej5JJoT/xtkxn8M0yyI2WG3XtIHH+06+gfFP9DX750bb5wftqgZ
 oR+4hHTDOl79Z4wHMHmKfxunmKAxqOXgbSRclQ8DId2wl01hpBVs13h234voxLRXuk
 0D6G4Ow4XBs71JHb+M5oK7G7Awbrj8c6dhFSV8S0=
Date: Fri, 29 Jul 2022 17:13:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/5] soundwire: sysfs: remove sdw_slave_sysfs_init()
Message-ID: <YuP5K2/egiL/l9yk@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-4-gregkh@linuxfoundation.org>
 <95dcb89d-bfc7-7bc4-5ec5-04537bc0758d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95dcb89d-bfc7-7bc4-5ec5-04537bc0758d@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
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

On Fri, Jul 29, 2022 at 10:00:42AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> > diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
> > index c4b6543c09fd..a3fb380ee519 100644
> > --- a/drivers/soundwire/sysfs_slave_dpn.c
> > +++ b/drivers/soundwire/sysfs_slave_dpn.c
> > @@ -283,6 +283,9 @@ int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
> >  	int ret;
> >  	int i;
> >  
> > +	if (!slave->prop.source_ports && !slave->prop.sink_ports)
> > +		return 0;
> > +
> >  	mask = slave->prop.source_ports;
> >  	for_each_set_bit(i, &mask, 32) {
> >  		ret = add_all_attributes(&slave->dev, i, 1);
> 
> I am struggling with this one since the driver is still adding
> attributes manually. You mentioned in the other thread that
> 
> "
> That's what the is_visible() callback is for in the groups structure,
> you determine if the attribute is visable or not at runtime, you don't
> rely on the driver itself to add/remove attributes, that does not scale
> and again, is racy.
> "
> 
> I interpret that as "there's still a race here", no?

Yes, there is, BUT as you are creating all of these attributes "on the
fly" for now, I don't see a simple conversion to fix that up.  Let me do
these, the easy ones first.  Your dynamic attribute allocations are the
harder things to do, let me think about those after I've fixed the rest
of the tree up with the trivial ones :)

thanks,

greg k-h
