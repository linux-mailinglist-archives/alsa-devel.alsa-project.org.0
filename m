Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EDE27FE18
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 13:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103251833;
	Thu,  1 Oct 2020 13:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103251833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601550466;
	bh=3ECQoQwCVseXoEcUqFE1hyhxWsZULWEkHC2oSim//BQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TjvuPPMUmDkx9gn8E0A1B5IBOHxDk6h/VQCoyebc3XZ3eYwtzs8VpfQTFFc+NfUnX
	 e/6Zd0ATNnUbp3EEyo6wMGCeaUQhW1dgOllF5xxwBYioMFHkbYgZENxaBgZiUZ/1HT
	 9BX2KN86dj7lx8OyMulTwi7C3REheEgZoYHrsKAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 254A2F8020C;
	Thu,  1 Oct 2020 13:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF2EAF801F5; Thu,  1 Oct 2020 13:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60312F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 13:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60312F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jAHVes4e"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7E112087D;
 Thu,  1 Oct 2020 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601550350;
 bh=3ECQoQwCVseXoEcUqFE1hyhxWsZULWEkHC2oSim//BQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAHVes4eZ31oulaTus9df9E6PmWmEkV9KmGDdBLhmvac8icm77tVkNdMtMN1qkMRf
 BHa8Y5kuJ5Xsve20J5Cokg3A82kSbRSN61HdP4U5nZof7fkqSoQ9IoJt8Bp6bb9YW5
 rPSm3eov6izke5zDHy7n4JkFQkMlm3sxFnTaMndI=
Date: Thu, 1 Oct 2020 13:05:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001110551.GD1939744@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-2-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com, Dan Williams <dan.j.williams@intel.com>,
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

On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> +The parent device would then register the ancillary_device by calling
> +ancillary_device_initialize(), and then ancillary_device_add(), with the pointer
> +to the ancildev member of the above structure. The parent would provide a name
> +for the ancillary_device that, combined with the parent's KBUILD_MODNAME, will
> +create a match_name that will be used for matching and binding with a driver.

Why do you split this into two different calls?

You have to be _VERY_ careful after calling
ancillary_device_initialize(), as now you can not just free up the
memory if something goes wrong before ancillary_device_add() is called,
right?

You need to document the heck out of that, otherwise people will get it
wrong, and memory will leak.

greg k-h
