Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FBE588B62
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 13:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1E3844;
	Wed,  3 Aug 2022 13:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1E3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659526490;
	bh=UuC8t1XbxVc7Rt5F5aq9a2luz/J8OSnn12GRcik7TNY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=km9pbp2VSK2r7N2XwOoP+B2LteNBW6lnhReQ/++zqiajf8gchj1bPj2T3PG7hxTSc
	 brI2HZYjL/Fcu37O+/VAPAHmcPqw0a3fDUgxljIIi4nA7yMXw+7cOJK6cxKb1fRhZF
	 hLesPUWXeOkwgltXWYqmagq6AEY+8GSrvRsuo284=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA90F8025E;
	Wed,  3 Aug 2022 13:33:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8541DF80134; Wed,  3 Aug 2022 13:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D62F80134
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 13:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D62F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SCK6oyzz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3FB8B82188;
 Wed,  3 Aug 2022 11:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E25C433C1;
 Wed,  3 Aug 2022 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659526425;
 bh=UuC8t1XbxVc7Rt5F5aq9a2luz/J8OSnn12GRcik7TNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCK6oyzzY+t/Cu7RXiQsdewruNE3+q80OoTvMFJXOMcZBsNSPnz7lahX8F344S61R
 Abqm5MnsO2BdmEJAvuEEEUDsDXhjX1Vq22b3LP60NVGKvbjJrDK6Yj5tZDRk/jhsgO
 z/W1jJXUAJkxFAO3SHvHWno+KQ98Ny94AbZMG/To3jHE6/UuP0TF+ZHF1p+KiTum9D
 CdfvnQ7ssZeSCTIVGTheU0v8inq+K8zaqbDbiSYyLjTSkW2Ps/o7YtpVj+eWm1ZhTT
 EgeQ/GF2X94bNiXoINEpJM1Dqg9/1pLW5TLx0XRh8qX5uGO2KUKKxJmbbHfSPMkJHg
 +wDZ664RQ31uA==
Date: Wed, 3 Aug 2022 17:03:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] soundwire: sysfs: remove sdw_slave_sysfs_init()
Message-ID: <YupdFRvw9IKwp6z9@matsya>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-4-gregkh@linuxfoundation.org>
 <95dcb89d-bfc7-7bc4-5ec5-04537bc0758d@linux.intel.com>
 <YuP5K2/egiL/l9yk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuP5K2/egiL/l9yk@kroah.com>
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

On 29-07-22, 17:13, Greg Kroah-Hartman wrote:
> On Fri, Jul 29, 2022 at 10:00:42AM -0500, Pierre-Louis Bossart wrote:
> > 
> > 
> > > diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
> > > index c4b6543c09fd..a3fb380ee519 100644
> > > --- a/drivers/soundwire/sysfs_slave_dpn.c
> > > +++ b/drivers/soundwire/sysfs_slave_dpn.c
> > > @@ -283,6 +283,9 @@ int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
> > >  	int ret;
> > >  	int i;
> > >  
> > > +	if (!slave->prop.source_ports && !slave->prop.sink_ports)
> > > +		return 0;
> > > +
> > >  	mask = slave->prop.source_ports;
> > >  	for_each_set_bit(i, &mask, 32) {
> > >  		ret = add_all_attributes(&slave->dev, i, 1);
> > 
> > I am struggling with this one since the driver is still adding
> > attributes manually. You mentioned in the other thread that
> > 
> > "
> > That's what the is_visible() callback is for in the groups structure,
> > you determine if the attribute is visable or not at runtime, you don't
> > rely on the driver itself to add/remove attributes, that does not scale
> > and again, is racy.
> > "
> > 
> > I interpret that as "there's still a race here", no?
> 
> Yes, there is, BUT as you are creating all of these attributes "on the
> fly" for now, I don't see a simple conversion to fix that up.  Let me do
> these, the easy ones first.  Your dynamic attribute allocations are the
> harder things to do, let me think about those after I've fixed the rest
> of the tree up with the trivial ones :)

Sounds good to me.. Yes the dynamic ones are the one that need
attention. How do you propose to handle these?

-- 
~Vinod
