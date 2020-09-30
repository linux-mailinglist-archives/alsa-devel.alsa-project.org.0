Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749ED28006E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B07218BD;
	Thu,  1 Oct 2020 15:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B07218BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560089;
	bh=3PTR5Cl17e07ofLBsEZgJk3tVo9FqSiuxjok+mOTxWE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tC7TI6XasOizdQjsLUAWk9s2Fcl8wu9z9Dp6Famyrm5syT/oSMfXPPgA0+EUpDxSM
	 o5Noa1QBlQkWhk/BVxYzo2DWJnRHaSGftnzWSJfHkoikPrtNk+1Ukt/qvp7+/c1QtZ
	 RYkVSYU6tZ8T4xzWTxMeMOqVhvZ2mSiG88YkZVa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 222CAF80339;
	Thu,  1 Oct 2020 15:40:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A80F801ED; Thu,  1 Oct 2020 01:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 URIBL_SBL,URIBL_SBL_A autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C459F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 01:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C459F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="dLdnSeB2"
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f750f530000>; Thu, 01 Oct 2020 07:05:55 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 23:05:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 30 Sep 2020 23:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz/J6LugsruFoe7t+SQ0RUGSM5UXxlp+DGX90sqot8sC1dZTaW3Qf4q6DxVUeTuKXSCIDSdX/se1nVdYyuJ/edvvzmyYUycFSmVON5d+3N3RJRHgvseuMXjyZsMg/t/qHqKobzARRrpwDVlCRj1uujHlhs8baqm6wwMuhnBkrmWCB/ny3umLWK12/nFV5OuJkXMm1aVit6xrFCecYU8mF6pBihgUOzzDh8dcegI3GvQEhT0bSkPCDbCgagtYEDyKMrZFE6GSxutCbf2du3FpUO2SSj+4EP968lONQYeIE2673J0DMErPt595g2SO53niOB8yApl23d5/FKKLBPynng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg/LzaO98vU8dRVkCRSzVgLEsC4bs2EWN/VtPzNeveI=;
 b=KemyJidU2wvEoUNWiLeRVoHh+l5PzWFmN2sakKWt9A8PXNTiTBhsoRjnyVpubCyAfmhQ82qio3RpJ6QDW1kCbmzT1bEuMUl6Zk6ZclzMLXZ4ZlgK7usaFsM+rCFmIjyQLVzFAlfU5MIUvDc2G523z/KbMeIKHuHVFIlSfw1po3QgM8vjJF/qrQLEp0g+vcW1hrPMxWEDUyzNzZDxK9YX+7okFSDHzpUPy2TuKglRMYdnzkFAvv5r4X1BtSQqg6C0+TIpMcAp4upEpqZ0uD/c4vY3F0PZWIDDB2OfjXTDv5ojzJxJO4dYvEqVXTiE/+Go/BXtLySSWGxxHZbUhM3OZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Wed, 30 Sep
 2020 23:05:52 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 23:05:52 +0000
Date: Wed, 30 Sep 2020 20:05:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20200930230551.GW816047@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-2-david.m.ertman@intel.com>
X-ClientProxiedBy: MN2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:208:e8::16) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR20CA0003.namprd20.prod.outlook.com (2603:10b6:208:e8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 23:05:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNlAV-004Oqf-8S; Wed, 30 Sep 2020 20:05:51 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601507155; bh=eg/LzaO98vU8dRVkCRSzVgLEsC4bs2EWN/VtPzNeveI=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=dLdnSeB2iwTWIvNfRFXe0Svsf3cCeh/rqyC6Jm562hKi2HbnfkE3LsqkE88jKW9cN
 yinJuqUijliu0g6/zQvZHI7/SOabrxlG+w+Zso+4RLTJBQzXp7XaBYf1TCCR2yKnHy
 oM5Tdd36kZJJCnRnaJO8+yRVQOTGUxQahv5St1JL9V+Vrz8Rx14MNfjMu5zJx7D33j
 e3SLz2xPqSu6VYrXx8f51eVd1a7B7x8SI1yJdoAO8GOdvVbUEW4PaH5UA1LJ1nKq/n
 WRd5oJIX+oTIpMGZSXv5iccnoWRrHw97xSaQiSm0ZIeKwM4nw84/6Ms4wTA8xN0yZ/
 qiuXn3IghA9jA==
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:08 +0200
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
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

On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> Add support for the Ancillary Bus, ancillary_device and ancillary_driver.
> It enables drivers to create an ancillary_device and bind an
> ancillary_driver to it.
> 
> The bus supports probe/remove shutdown and suspend/resume callbacks.
> Each ancillary_device has a unique string based id; driver binds to
> an ancillary_device based on this id through the bus.
> 
> Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> ---
>  Documentation/driver-api/ancillary_bus.rst | 230 +++++++++++++++++++++
>  Documentation/driver-api/index.rst         |   1 +
>  drivers/bus/Kconfig                        |   3 +
>  drivers/bus/Makefile                       |   3 +
>  drivers/bus/ancillary.c                    | 191 +++++++++++++++++
>  include/linux/ancillary_bus.h              |  58 ++++++
>  include/linux/mod_devicetable.h            |   8 +
>  scripts/mod/devicetable-offsets.c          |   3 +
>  scripts/mod/file2alias.c                   |   8 +
>  9 files changed, 505 insertions(+)
>  create mode 100644 Documentation/driver-api/ancillary_bus.rst
>  create mode 100644 drivers/bus/ancillary.c
>  create mode 100644 include/linux/ancillary_bus.h

I think you need to send this patch to a lot more mailing lists,
netdev, rdma and linux-kernel at least

The Intel IDXD team also needs this

Jason
