Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FF1B0AC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 09:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B1F16D5;
	Mon, 13 May 2019 09:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B1F16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557730940;
	bh=kNbu1+JOiiQVEo0QRT1spsH/JwqSWIDWp+VrR9qnftU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APzw9CVjJ2fDH/If+wno3ZHCBtYZ6K/qgXRaS4q8lEKEVZF/5qx/WxV1Mrc4Ic1nR
	 TkOHZ+tyqeW2vNbjaDKnYt3nINqERPa1bT1zQYtZoNqAkyG7sDmTWu6ZwO5BSCGXNN
	 OlDKq1sWVDrR7pEi5qJDAfKIrcIckgPiTSWR2TMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E70F89633;
	Mon, 13 May 2019 09:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 978A7F89684; Mon, 13 May 2019 09:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD4DF80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 09:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD4DF80733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="gDL7Mqp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYMxlTU42U8IEHuaefeXBUDbrbbRBESKyCojAVqw4Hs=;
 b=gDL7Mqp4cjHd9tnfv2Oc1qnpYT4Fac8j07kqzHoMV4t4fblqqvc/VaI9b3eW64VcLXIB/IIy6eJ2zPrMIPgV3ZayvIayU+ziMWE4G1SNhTClihPWWYWJfxAonZzDgMbLjip70cWFf6cVkIyteBkWBVFGb865vhK+yAGxY5lk4K0=
Received: from BY5PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:1e0::39)
 by CY1PR03MB2265.namprd03.prod.outlook.com (2603:10b6:600:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Mon, 13 May
 2019 07:00:23 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by BY5PR03CA0029.outlook.office365.com
 (2603:10b6:a03:1e0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 07:00:22 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Mon, 13 May 2019 07:00:20 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x4D70JiL017961
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 13 May 2019 00:00:19 -0700
Received: from NWD2MBX7.ad.analog.com ([fe80::190e:f9c1:9a22:9663]) by
 NWD2HUBCAS7.ad.analog.com ([fe80::595b:ced1:cc03:539d%12]) with mapi id
 14.03.0415.000; Mon, 13 May 2019 03:00:19 -0400
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Thread-Topic: [PATCH 03/16] lib,treewide: add new match_string() helper/macro
Thread-Index: AQHVBZFQXT7pBvOEwE+osXNwuBSvQKZhdwMAgAACFgCAAADdAIAC38WAgABZCYCABDgygA==
Date: Mon, 13 May 2019 07:00:18 +0000
Message-ID: <146ba7b61998d1e26cf2312fdaa01525d7c7d8de.camel@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-5-alexandru.ardelean@analog.com>
 <20190508131128.GL9224@smile.fi.intel.com>
 <20190508131856.GB10138@kroah.com>
 <b2440bc9485456a7a90a488c528997587b22088b.camel@analog.com>
 <4df165bc4247e60aa4952fd55cb0c77e60712767.camel@analog.com>
 <20190510143407.GA9224@smile.fi.intel.com>
In-Reply-To: <20190510143407.GA9224@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.244]
x-adiroutedonprem: True
Content-ID: <FDDE4955D460DC40AB641BB9139D6ABF@analog.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(189003)(199004)(51914003)(426003)(446003)(50466002)(436003)(126002)(2616005)(6246003)(2906002)(11346002)(336012)(8936002)(476003)(2351001)(246002)(186003)(356004)(26005)(316002)(86362001)(23676004)(5660300002)(305945005)(7636002)(5640700003)(70206006)(14444005)(4326008)(229853002)(106002)(2501003)(47776003)(2486003)(76176011)(14454004)(118296001)(54906003)(7736002)(3846002)(6916009)(8676002)(486006)(36756003)(6116002)(70586007)(478600001)(7696005)(102836004)(7416002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB2265; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d843ba-2114-4365-1750-08d6d770ab01
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328)(7193020);
 SRVR:CY1PR03MB2265; 
X-MS-TrafficTypeDiagnostic: CY1PR03MB2265:
X-Microsoft-Antispam-PRVS: <CY1PR03MB2265347D2D5A29BD38B4EABBF90F0@CY1PR03MB2265.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pqGW1MWQ3Zq088ZBBnRq58UtaiOWWrFuHBJi7VQpoJbSlJTml7IN0ZB79LgwW/q3coszuClL9TMb8LD8oKaWG7L67xaWLTLo4Dl5yXSxaYpBmG+Xog6/FxwkOZuU2IjOucWlNzpAFux6Mwb2L0fj7gBrNwwieeRaYqhwSdf06t/SMvTJASTiiAUu2AW4N7x6Xc6ahiqNZGT2RZlVmczozENjmdjvtvndvf2Dx+mGlM4/aQJY0WTqVMlcWs8jrF4ba/XFXGMyWvyAyH4V58N9E72j8+HxTQe7Yc0mkFuxWNDA0N0r9OC/7KnwHUj3pg1+Gx6dW22M8zWeA2xQJm1BF3xnZkV9zf9qWppJGAC5RZM2IO73HRpNW7spE2HNsspgIzH/VtLuyUQIVg7MbQ0TJO0gxLjUaCUyPM4+5bVRGLE=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 07:00:20.8904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d843ba-2114-4365-1750-08d6d770ab01
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2265
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH 03/16] lib,
	treewide: add new match_string() helper/macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2019-05-10 at 17:34 +0300, andriy.shevchenko@linux.intel.com wrote:
> [External]
> 
> 
> On Fri, May 10, 2019 at 09:15:27AM +0000, Ardelean, Alexandru wrote:
> > On Wed, 2019-05-08 at 16:22 +0300, Alexandru Ardelean wrote:
> > > On Wed, 2019-05-08 at 15:18 +0200, Greg KH wrote:
> > > > On Wed, May 08, 2019 at 04:11:28PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, May 08, 2019 at 02:28:29PM +0300, Alexandru Ardelean
> > > > > wrote:
> > > > > Can you split include/linux/ change from the rest?
> > > > 
> > > > That would break the build, why do you want it split out?  This
> > > > makes
> > > > sense all as a single patch to me.
> > > > 
> > > 
> > > Not really.
> > > It would be just be the new match_string() helper/macro in a new
> > > commit.
> > > And the conversions of the simple users of match_string() (the ones
> > > using
> > > ARRAY_SIZE()) in another commit.
> > > 
> > 
> > I should have asked in my previous reply.
> > Leave this as-is or re-formulate in 2 patches ?
> 
> Depends on on what you would like to spend your time: collecting Acks for
> all
> pieces in treewide patch or send new API first followed up by per driver
> /
> module update in next cycle.

I actually would have preferred new API first, with the current
`match_string()` -> `__match_string()` rename from the start, but I wasn't
sure. I am still navigating through how feedbacks are working in this
realm.

I'll send a V2 with the API change-first/only; should be a smaller list.
Then see about follow-ups/changes per subsystems.

> 
> I also have no strong preference.
> And I think it's good to add Heikki Krogerus to Cc list for both patch
> series,
> since he is the author of sysfs variant and may have something to comment
> on
> the rest.

Thanks for the reference.

> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
