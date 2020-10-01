Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FF28018E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 16:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167F218DE;
	Thu,  1 Oct 2020 16:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167F218DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601563519;
	bh=uy+2rX02uoztB5+RXblGcUyRIdIJJk5TokT0f77jF3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9P1/Qf6iuALh5HhWk0Gkq8o7z/4jvVwQODWLTATFWshGYPFP3K55UD5qlAOfZ+IT
	 TrLeLRBs9Z8AFl4qPAgkJOrgk0ZNX5WvyCY+wr4UxFDhmLJ26bZN6cqlG5s3xKe/r4
	 Rb5A4sPFpE9W2Ej/gO7UTL1kXoPLbMCPE0P0uglU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49347F80105;
	Thu,  1 Oct 2020 16:43:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1308AF80105; Thu,  1 Oct 2020 16:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CECF80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CECF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LtCdyJl5"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1E9820780;
 Thu,  1 Oct 2020 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601563408;
 bh=uy+2rX02uoztB5+RXblGcUyRIdIJJk5TokT0f77jF3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LtCdyJl5aHgXH4xqBfkoPABYne67ljwDJVZXXOleB1YXDKWwDeuvb35URs+D5WkUg
 sdYkzN5eS8OeCW7mDuIt1VvH2p1VogtJs7OUAHr0r9qEpjohsbMoltjobLAUyv/1WP
 wMihtdjxSEAMH2M5nar5+ZGtiWASgjBSTiZT3x3s=
Date: Thu, 1 Oct 2020 16:43:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001144329.GA2399339@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com>
 <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com>
 <20201001143334.GA1103926@nvidia.com>
 <BY5PR12MB4322699D73AABCA62ED07BECDC300@BY5PR12MB4322.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB4322699D73AABCA62ED07BECDC300@BY5PR12MB4322.namprd12.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kiran Patil <kiran.patil@intel.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "ranjani.sridharan@intel.com" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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

On Thu, Oct 01, 2020 at 02:39:06PM +0000, Parav Pandit wrote:
> > > Why is this two-step process even needed here?
> > > Without this documented, you will have problems.
> 
> And it is also documented in "Ancillary device" section in the Documentation/driver-api/ancillary_bus.rst
> Below is the snippet from the patch.
> 
> It is likely worth to add this part of the documentation using standard kernel kdoc format where export function definition of initialize() and add() resides, so that it cannot be missed out.

That is what I asked for...

