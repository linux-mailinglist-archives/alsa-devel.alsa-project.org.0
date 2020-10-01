Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37D280635
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D579A1AA7;
	Thu,  1 Oct 2020 20:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D579A1AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601575606;
	bh=wYQz7nUFPYtWr1znyU6n8m0PQrty04uI2tg/XsbY7do=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCbMW6kufqyfr1UianlTgM2g6IkbyiO3l9bxsFdT/1pSvqUy/vI4w955aNiU8fQjN
	 IPx0RAW2YcsXrlJxnadUE2xgqo7O2KorV5S+58CfL2SzESMfVEMFnIHoOIAWVm+PwB
	 f/A9jJa5+5ADFKmRB2D+G2Zzd68+Knsmx1nN3IL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED758F8020C;
	Thu,  1 Oct 2020 20:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D67F801F5; Thu,  1 Oct 2020 20:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56781F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56781F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="VGiImhkS"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f761a100000>; Thu, 01 Oct 2020 11:04:00 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 18:04:51 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 18:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAwb7PJ8d7SSYdublF6M28d4KzCUA3cObcz2lBY8TFet/bi/YmDCXOaQhiwJVbLOAc2+0syjfJb0jBaaw8BrAQIrV7qvZ57e1oHVGju78nZlqvneNfnd1p6KkAItbhXfzzMIMvR0JSYPIanqk4fkgH3CpdzPjdOk/KtdL2NNvEJtylPuT2KkVcLpAHdxxmvaCo6PxImVV8kiip2mC3fWN4I8J6DZZSK55+KEeaZCAIaXXU8J2HZnxRo6uDufOdw4YyrPBgooyahcHi0E8PD6wQ5MYrhmhmW/nSTN1RJc19rGpDkoYc1g2DI7Zgt3HuA9KbPBP3gjTXe9iA2w5c24Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXPVbcChm1iH8eBjhJzi0CmN09X7Sj6fYwmj4OWF+R4=;
 b=VCnmrOSwSQA1xSOPH6zhzaIR2gwJzvWiJrGB8085IwSch5XJR6R92Bg5RONBUfC1r808PwXqOF6We9muqqG6qbIxKl8IqY8HFVjQibGKXp654YE7OAKu6yZuoZqrBO4pKXSqVtaV/fXbEElY08zPdwl6XAsodEmQQ4nqbcRtCYJW1+uyr/G7W1YhgOvLPMtaGpqrVVVl0OOlbe55uCUKpbiw3QurGv+XTstxcDOiCbZSs/RD5eCuw0+niMp5kpZZqbzlhB0TIZ3ud5K9a1LAL7gae2v8i47b2+SnFI59jeMrIy2LmoAiV2yzlZN7qm3edoYxTdCHjgjwG1jIy7DnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4810.namprd12.prod.outlook.com (2603:10b6:5:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 18:04:50 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 18:04:50 +0000
Date: Thu, 1 Oct 2020 15:04:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001180448.GB816047@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <20201001152450.GK6715@sirena.org.uk>
 <2ba29c19-205b-6d0a-3a28-f9d5cc32adfe@linux.intel.com>
 <20201001165137.GQ6715@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001165137.GQ6715@sirena.org.uk>
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR20CA0048.namprd20.prod.outlook.com (2603:10b6:208:235::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Thu, 1 Oct 2020 18:04:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kO2wi-004jID-CZ; Thu, 01 Oct 2020 15:04:48 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601575440; bh=lXPVbcChm1iH8eBjhJzi0CmN09X7Sj6fYwmj4OWF+R4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=VGiImhkScVSDdKAE83V3v39xML5lsKN221AK4ZCpNh24NfhQDGspd1iZ4Os289RyQ
 Dbm+hAu5p1KTfx7cHitx6yfpQcX9F9AxqqZiyrFBAIB/h37ZtH8Hduxgb2A1E0by2i
 wnUmspe89hwQqEUUS1WBgODCna/fmO9C3IpZWcmZAms3XtBdlHeOdkUD+NpuPYoFs6
 1Oq5Ootf34aaYM/GnhIkYLUcydpVGXI9DLxEK70tUvkD5skZeSqukRkLEBsnrkEoql
 eMpeYvs7bLvqhnof8XYvoCRq8gmurtitzRXYlQPb6aYhL8W2WAzHZ0unKmV79S+zUc
 Teev+bFwSW1xA==
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, parav@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 05:51:37PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 11:20:39AM -0500, Pierre-Louis Bossart wrote:
> 
> > I have nothing against MFD, but if this boils down to platform devices we
> > are back to the initial open "are platform devices suitable as children of
> > PCI devices"? I've heard Greg say no for the last year and a half - and he
> > just re-stated this earlier in this thread.
> 
> As you'll have seen from this thread and the prior version (which was
> the first time I became aware of this stuff) I'm not clear how that
> desire maps on to hardware, as soon as subdevices start needing to get
> regions and interrupts mapped then we're going to end up reinventing
> resources and regmaps AFAICT.

I think the truth is MFD and anciallary bus are solving almost the
same problem and could meet in the middle at some point.

Since Greg has completely NAK'd using pci_device inside MFD it looks
like this is the preference.

If people have a use case for regmaps/IRQs then they should add them
here. Right now the places I know of don't need this.

The target for this is queue-based devices where the sharing granule
is a queue. The actual thing being shared to the subsystem from the
PCI driver basically the ability to create a queue.

Jason
