Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A7280071
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE7F18E8;
	Thu,  1 Oct 2020 15:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE7F18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560130;
	bh=TS0vBFnENXfs3T3syn6MKMgHuDtc+OPqspw0e3j1Lwc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8GlHqh90l6tDNVVrf5gDxUiwhBPSKuW9ujM47AqsGJcFC/ZbOqDR4M//NGMuBHKn
	 Z0lb2OAbOpSnQm4w2nXPksDjR71npthB3FPxujiNSHubld03GB7MljRhr17dCeeTIW
	 JvIo5osVWf4ZlKKARC0Gejl+FgumUqJtmiqQgoms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C57B3F80341;
	Thu,  1 Oct 2020 15:40:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 129D3F801F5; Thu,  1 Oct 2020 13:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 738BCF80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 13:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 738BCF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="AXVQZrQc"
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75c18a0000>; Thu, 01 Oct 2020 19:46:18 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 11:46:13 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 11:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRHwgi0hka8SfSI54NC+akbqbdUUJwb5mxYWk1FcW/6Em0tlCk60ntLAnwdXByM1k0ck1R1SqX59UWH9R/wwtfxaU2HjCWtzGYMhM+TgXohrxGXBc3cMtzveGJVTEfrB4eJG1CL6NHYswE7hlVAZVlad4W5qAW9EZUMGK5gT4iAGwGxSHl16gvH6w+MwgFSWeB4xLwi4ksF8YZNYASVvotMeQX7ChIPCsoGGRKAiYrmhVMDUSaApL2ww11Y2u1Kq7WqAnuzAq54mdd1GeYrhnmnf7wxyhSB+zhwugI9MC3t4ob5ptq5zq2oZ9vaiTzV7XKjpTfitUHmeJFXWJLjnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bWxLUdGAjj09r/COm/SLU7TOyiSNlBAAE1GHBIt/q8=;
 b=UEPqFC1H8pCmO/hx+Wt1LhDwKxx4DhvSO51yK3fMPioo9IYRDClcCgooYJWu8IvBH6swUpb4NR6W+LPEa4GMGjoEEFVlG1WEyReeQHZve3r0wbT6QiVYdcZdPWB24r6+nTnnKceAUE1LPgJVV5F8sayE3zVNbyH+IIIW9XwUotc2YkC15NWQZUcdDY/N3eomiHDPiaQcxMoGqVvBSt84saVLBPEhOLt9MYr9r3mo7opo2+gxA1Q+xqEMPNsk3ItcLBjCwQjgl5DR8fDD4+GM98PSdTfmVTjNl6ThrKS42+eJwiM4B9I17Z56O+az8szGqSM1CgneXSVsVi96k4zMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3516.namprd12.prod.outlook.com (2603:10b6:5:18b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 11:46:10 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 11:46:10 +0000
Date: Thu, 1 Oct 2020 08:46:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001114608.GX816047@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110120.GB1939744@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001110120.GB1939744@kroah.com>
X-ClientProxiedBy: BL0PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:207:3c::32) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0019.namprd02.prod.outlook.com (2603:10b6:207:3c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Thu, 1 Oct 2020 11:46:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNx2G-004ci4-GP; Thu, 01 Oct 2020 08:46:08 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601552778; bh=3bWxLUdGAjj09r/COm/SLU7TOyiSNlBAAE1GHBIt/q8=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=AXVQZrQcFXDPfKvGhdkK+QsP9OeXPnhiHMwiMTg2X0Vr1gpBLt+015fxe4Tm3OjvO
 kmM0h37V7jcXkwfL5FeOSA21LRhH9NRiz5NVxQh5FZM6yhlv/CzA13HKuBFM5yzExm
 7zbNS2iL3pZIbPNdX6zM3APZRefCqSu43xBbI2XM8dE+arMjN9Fp2FkK0oCiA9/66Q
 BJdNFgps4aXlueUvObKRE0tk/8uNMkK90CRMOx9Obn/pXVlf5QYtx95BY+hAIgPggy
 Vh9fDvtbCsbfdGSsi8INNRlDqBWgQJFwzJ4Y8CA1a/hscUQ4eni/bjlx6/bcCuM3zs
 9PG3Se3ncBZ4Q==
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:08 +0200
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>,
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

On Thu, Oct 01, 2020 at 01:01:20PM +0200, Greg KH wrote:
> On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> > +int ancillary_device_initialize(struct ancillary_device *ancildev)
> > +{
> > +	struct device *dev = &ancildev->dev;
> > +
> > +	dev->bus = &ancillary_bus_type;
> > +
> > +	if (WARN_ON(!dev->parent) || WARN_ON(!ancildev->name) ||
> > +	    WARN_ON(!(dev->type && dev->type->release) && !dev->release))
> > +		return -EINVAL;
> 
> You have a lot of WARN_ON() calls in this patch.  That blows up anyone
> who runs with panic-on-warn, right?

AFAIK this is the standard pattern to code a "can't happen"
assertion. Linus has been clear not to use BUG_ON, but to try and
recover. The WARN_ON directly points to the faulty driver so it can be
fixed. 

panic-on-warn is a good thing because it causes fuzzers to report a
"can't happen" condition as a failure.

In a real production system if any of these trigger it means the
kernel has detected an internal integrity problem (corrupted memory,
code, ROP attempt, etc). People using panic-on-warn absolutely want
their kernel to stop of it is not functioning properly to protect
data-integrity.

Jason
