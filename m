Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF3280073
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F8D18C8;
	Thu,  1 Oct 2020 15:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F8D18C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560169;
	bh=9P9svooEFIB2L/pJlC/T9hKrD59osQaESF/N5Bc7kz0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uit2a+1GY3MRcBGd/4Ea88oyNvFfZTGvGaErBAmEfhTlKfYsn+Lag2lTUOMw4kPhu
	 Bz1fRKGWpptw1/sydjIVUmA91/QgcOJ9pMCUzKo0q8cQEC924EKFyoKuXGZwcXESGt
	 UKYCWCeHPbtxmxt+5LnRIXaMaHUbUZ2UzUq2uTzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C5BF80342;
	Thu,  1 Oct 2020 15:40:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE566F801F5; Thu,  1 Oct 2020 13:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB0EF80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 13:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB0EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="C+aq7iTf"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75c4150000>; Thu, 01 Oct 2020 04:57:09 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 11:58:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.57) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 11:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXgvsSz1yyhuFRReXAXfaRG5GSIGc0dUdWC/JswCPTH7ihUmFK+Qr0+bYz7GbfQreboZ0+kn+itGcL0rpLHZ111+CW9JhdqTaV6wpzXoXEPp8patmuia5OA05fnneg1OxzWYZL1jky87lN8yjPPLe6UjyKId1MDmttuFscrsOy/e26x4DzmirsNJMi699Y7pleDu/gOGfaKfyhMnAO8OxVG4HEEPf3grwEUoYOE9iTsOMuAOs5DpBSM3mHaNzgG0eq2rLSW3QGEEwx/0D+SDlYeZnvYGuJ5UQGiLcPeCm21l2DrtKEFdYmpMKqJT6o+OA0QRLzyKYD4RTUpiyW0QZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXZhhBwANg6NfwmStrCig2aBZSagQ2lvLVTxPfk/4HU=;
 b=YQXbrPjmvARe1ReLfJ2RAinpqJrZGWuk1h9bXyNroUjtbtx3m3QTEyD316+lpbrrjOpP0M9UzetX8AzBVR2xz5Ak0AsNaJhagxs4HKF6f7MAjL1fsboU7eOf2ifBvAxr6ZubSpU1MSlDyUouwhoXk7OdnO9vso6aIvFJRIh51928f7Q6T4sAjaCVy8y1fqGAeWOnXreEtVvjeSAyKslh6wExC/Sbd2V4TGDh7obtBeSVmKBMQT4PJe9dWeP8azlN6tvhb70C9XzPdkWV9OJE5HZb7fmjG55HrxwFTO7W+76F4nc1q3WMSNEPhUDuSpEnWNp8wqttticCEe2GzTTnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4498.namprd12.prod.outlook.com (2603:10b6:5:2a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 11:58:49 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 11:58:49 +0000
Date: Thu, 1 Oct 2020 08:58:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001115847.GY816047@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001110551.GD1939744@kroah.com>
X-ClientProxiedBy: BL1PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::19) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0164.namprd13.prod.outlook.com (2603:10b6:208:2bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 1 Oct 2020 11:58:48 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNxEV-004cvW-C8; Thu, 01 Oct 2020 08:58:47 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601553429; bh=WXZhhBwANg6NfwmStrCig2aBZSagQ2lvLVTxPfk/4HU=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=C+aq7iTfePIxHQUzkAnGM0j7+cj8VDuLLGugNNOJdgyhDN7E6lD93A8/fVWm44qnv
 FEAYQGS3U4JsXoDpMO7m+rmlnQQymdt9XodY4jei//W10TKyGLTk85poa6iLrR7tUJ
 J9RlQZxjJmNVKLNakcdv90AFgbzSwjC/qWvH8DEdZe9FYoPW2s3Pk3kBinaW5PuDli
 urL+P9mLTNP56I7+bxQ3dslDgiWL1ooLh5TBTUn4V/iz60argpK/w3a6bzhuFcrP3k
 xok+2K4P0RgQj213UrGXvR1fkhK1p5TDG1JKNO9hRHRyBwdEzabXzhHsbKYxUSqwcn
 9edPBor7ypnWA==
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

On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
 
> You have to be _VERY_ careful after calling
> ancillary_device_initialize(), as now you can not just free up the
> memory if something goes wrong before ancillary_device_add() is called,
> right?

I've looked at way too many versions of this patch and related. This
is the only one so far that I didn't find various bugs on the error
cases.

Jason
