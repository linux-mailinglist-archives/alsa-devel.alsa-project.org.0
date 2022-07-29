Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73904585158
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 16:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49541631;
	Fri, 29 Jul 2022 16:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49541631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659104015;
	bh=pYLu+/XtQC5jDjQKiAKoXPu334NKExW5okhxadAJE0c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BIxQZq6QToHLngNLb3n75Af1NmnilYuJuwGF/+fJ3vgIUducRhB00cRf71qWiaO+h
	 G5ANqN7Rju+nOEjmNN+bdv0vJMyMQBXUQpBfhbLGMlo2OxNTAmvtUFRBA96h3XcIEm
	 2fTFrlCbJ1hNcF1hmA/R94n0EfrvQ/umuuw/ohB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 109E2F804B1;
	Fri, 29 Jul 2022 16:12:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D327BF8049C; Fri, 29 Jul 2022 16:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90012F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90012F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GIa9EHuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659103952; x=1690639952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pYLu+/XtQC5jDjQKiAKoXPu334NKExW5okhxadAJE0c=;
 b=GIa9EHujrBxMSyHGElbEwmM3/QniFwiu3qJpXz474nrWCU2pEjWgnsjy
 X8aUKatyPb76g+ki7hC4djUlV2f/g15K2SZW4z1o01jiJFVMxW5q5QnkS
 nWQ0eoV8OqndMsWujml8fFAwFcQPMDyW1sIab8+6z4uyOE8Z/zrrhZO6T
 cv/A4Nz/ofRzBwPkmcQ3HOExfoe+oE9UFPKWt4YF2OgeLdIbOlWjEd7vn
 Hg0S+Ys+fYF81Dm4KejhkBf/rEiPQj9Dp/8XQjj+x8m1p9Bw8SFFqjxtv
 7Y8h7PvWe4cK7A3T3h6CUGzgmQJOFULRTka+vPXiM5fEQ6ELkwkfQEoND g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="268537496"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="268537496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 07:12:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="660249430"
Received: from kaholo-mobl.amr.corp.intel.com (HELO [10.212.97.86])
 ([10.212.97.86])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 07:12:17 -0700
Message-ID: <be630e3a-3b3b-48cf-d61c-840ab04f1140@linux.intel.com>
Date: Fri, 29 Jul 2022 09:12:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] soundwire: sysfs: have the driver core handle the
 creation of the device groups
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-3-gregkh@linuxfoundation.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220729135041.2285908-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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


> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 893296f3fe39..81c77e6ddbad 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -193,6 +193,7 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
>  
>  	drv->driver.owner = owner;
>  	drv->driver.probe = sdw_drv_probe;
> +	drv->driver.dev_groups = sdw_attr_groups;
>  
>  	if (drv->remove)
>  		drv->driver.remove = sdw_drv_remove;

Minor rebase issue: this version of the bus_type.c code is no longer
up-to-date, this patch creates a conflict with "soundwire: bus_type: fix
remove and shutdown support" merged by Vinod - should be in your
char-misc tree as well for 5.20.

++<<<<<<< HEAD

 +      drv->driver.remove = sdw_drv_remove;

 +      drv->driver.shutdown = sdw_drv_shutdown;

++=======

+       drv->driver.dev_groups = sdw_attr_groups;

+

+       if (drv->remove)

+               drv->driver.remove = sdw_drv_remove;

+

+       if (drv->shutdown)

+               drv->driver.shutdown = sdw_drv_shutdown;

++>>>>>>> soundwire: sysfs: have the driver core handle the creation of
the device groups


Fixing it locally and testing.

