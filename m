Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C728007E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F0D18F4;
	Thu,  1 Oct 2020 15:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F0D18F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560294;
	bh=MRhX5W6nlP6//2W1nx/bTaOhWGnQRaEdgeCRV41u0J4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nO7z6SfEsdq9IkUNQjB43T79ll7T/ZqVWl4/MpCteltwBzbx61vyaXFgimJCFOTqa
	 h0loSFoSpuCpCFb1LZno4wO1LfBCpD++JKzXLaevexOFDak/cg5gNFXi0x7z50iCuo
	 rQUy9H9x7FO3mAr8dQP4b1P3QKlZMUeKwpGthqXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A564F80273;
	Thu,  1 Oct 2020 15:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38CD6F8022D; Thu,  1 Oct 2020 15:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD44F8020C
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD44F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Vi+hbFor"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75dc610000>; Thu, 01 Oct 2020 06:40:49 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 13:42:28 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.58) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 13:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYyNo3fAs10hj5BihUJW7thBS4CLKGxIJYLZ/6AExhw70zB5TgNTKFHyjhUpYZfYS7EWcXeOfyVIwZ/VUzFMbI8pV7uZD58ttVTa6C9DKArkEC2EpjKjrnOtSf4h9aUxg5tVApmY5wel7eMh0UhiWHp1h6ovsSXhw+R+jp/29UjPZVeAM9xwr4yqcG56KLPC3G1gdKHCLyUIdephBHxEMDA+uR0BbkRWHRno68Tr+8fGk2g6eyAlCY42/SfdZ2ZiD/AcrEc6ILWKS99F8RT8rDEbkY6c9xksLjPdgPDAgZ0BL+U3xpNfBj0CHS3BQzuGPfJj43LG6GyuxuwuUGTLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRhX5W6nlP6//2W1nx/bTaOhWGnQRaEdgeCRV41u0J4=;
 b=hcA5gYmGjD+k3b2bxBcAPNzhdRf0Uj/1P1FwipxKq+zt/0ipJLY8WLyxPf9SOnUcrTEpS1BIdP7pX4sRmEkzagPggWS3jQfaaEj63m516RkKqC6ll+kPgiDnn6xmeQaePbV+/EDRF70wf1f9pu4RQSCoNYuc4TSK6UW91Yrr6PqWAXSQ4SsPAmo2mC4v2W/OI9r8g/U6eqf79LgaSiX4NtvW5CfCkdVrhuCpVMF3D60FjwnehCDCCyM/o2Ru9QhbRWkVFCsmFTjbn576eFlplkPqE/KYLP3rbHlAIu4LsXLftPVTLXfQMiRd/iTJ5+A2NTndE9/EkW1wRxhvNboYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4546.namprd12.prod.outlook.com (2603:10b6:5:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 13:42:27 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 13:42:27 +0000
Date: Thu, 1 Oct 2020 10:42:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001134225.GB1107577@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk> <20201001131252.GA2382269@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001131252.GA2382269@kroah.com>
X-ClientProxiedBy: MN2PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:208:238::27) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR22CA0022.namprd22.prod.outlook.com (2603:10b6:208:238::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 13:42:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNyqn-004f0B-Vq; Thu, 01 Oct 2020 10:42:25 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601559649; bh=MRhX5W6nlP6//2W1nx/bTaOhWGnQRaEdgeCRV41u0J4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=Vi+hbForCpBqLHjWsCUXJlOFANt4c0kcZGRb+zrP+KDPJJOXtIC9i54wLiR3jtWOu
 34PRDhoYnuhU6K0MwENloJS//OTTgezCodEMZ0Hjw4A6BdupA87j8s9RC6suOd2OKG
 SP257u8lTerv5uCgpFhRaVMe+IPprv4jsNbHs18z5bCe0j6eTpKfz8V0u2aO+O7tKM
 VLEwkhO24jVHo65jGA5ufp4a769ohJhcWxiUDYOYSKpzfqB+tDx5UrHLZgtPVAqHUg
 DBi7DS46fLlvvmUFQcL6L68WRwN45+bepxYRJ4l6Pgkk2I20SZ2xMB0f9v7zpeFUqt
 JlJarFpUgYvRg==
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 parav@nvidia.com, Dave Ertman <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 03:12:52PM +0200, Greg KH wrote:

> Again, I could have this totally wrong, if so, someone needs to point
> out my errors in reviewing this.

I agree with your assessment

Jason
