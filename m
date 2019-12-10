Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B273118D1A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:55:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4114B16A1;
	Tue, 10 Dec 2019 16:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4114B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575993316;
	bh=01aVdAkydy3JjHd7lAfO3Vr5v9dM1mYom9bMemhVXf4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVe1Kso50PjUv9LPLFcF9a2yIZYT8+Vq7E/AYpFypP9/ASDO1AVd9bWCHagzBXmiC
	 fJbWQm1yRTkKoO3GIApGcLdoBvW0b7h07Cem5CbRJvgXjXNNEmNg12APHikPrYeH5I
	 hgBZMhmDfFIvpysPZbB8xTYWR4U2v3xpq7dcyhUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C90F80248;
	Tue, 10 Dec 2019 16:53:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 061B3F8020C; Tue, 10 Dec 2019 16:53:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 956F9F800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 956F9F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="C5hQ6y5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THWWVtIH3YWxOOincLaeQXvsogzVRiYoNaTE/2KWtH8Dd7vUByafjVHGaFWFQtEfu79SF5mF/829kWkeJ9CUpvaxnB5FbCkwwKQMZ5S8zNf2YrtsKSDjk932UfiblYmAuu1zW6csNyKjknwYtsxIFtsD1DHSS1KUaNZv11dei9vz9KLATLqDzm61lNIBO9UKhP8jvgZlBAFhapTWy+QLglHyBSAgacsWs0mw4X0FEWKG2sbUtrdJZLTxXR/kaUvqN1D4Fvr3AvBnIhfRvLEDV1GUf0HCDLI/xeeLy8B/Y+z/OrN+ZZl/r+7jOdV7+clJQCkwwtxEV2Wky3xHYWy/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYaJdbkcvHB2W8uSfv2vPhWxewGLVvQle2RfCr3tf5I=;
 b=BoM4Ml89jTsjTj+GeVDLtzYushXEItjj3bqq1BtRcD3J0IeUZXZeyH7MhL8EPDKYVzFfs3J/69gLtVz/NI0NNHQCaZka27U7ByW2gDNQp6YaE2HyKO3MJOuZU1R/guCU/xfz4gnHHUlohLMFFGaYHX/kcaTzsLRz8a7KdL9jmoWLKvQIcgm82oXPu+57KXSwZ0wsk2F/ZWbT8VOSI//MmaxzkUAgkeRtvQmLzMZ/3BRYNEQHZfCj8B1sPZQ8nFE5QsHcWxG6vubDbjkF4N71iiXKH8zTHkRWL+6b+yRE20soSRXXNxWmNf+PkN09uxXouI4bSOvV0kbJpcANOA4VLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYaJdbkcvHB2W8uSfv2vPhWxewGLVvQle2RfCr3tf5I=;
 b=C5hQ6y5k6o0sBxYH8GLxKP251BUiOhOYkC/IZ1hDgI8Whsq7Iz45cWIZC+VkHMV9QVHi4yJTbmHBg/W7Y4uYN9NIGvyAhKLPNB6oWENvfezhr9SBMK+I/GP6a2pTIW9pRHCrfO/+KgWNsBTdmTfbqzIHbG4YUw6P2Tq3NX/rvRk=
Received: from MWHPR12MB1358.namprd12.prod.outlook.com (10.169.203.148) by
 MWHPR12MB1456.namprd12.prod.outlook.com (10.172.55.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 15:53:21 +0000
Received: from MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f]) by MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 15:53:21 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Lukas Wunner <lukas@wunner.de>
Thread-Topic: [PATCH] ALSA: hda/hdmi - Fix duplicate unref of pci_dev
Thread-Index: AQHVr19R5YQIlg2NqEC5WtHx1mfv7qezf2rggAAD6ICAAADTMA==
Date: Tue, 10 Dec 2019 15:53:20 +0000
Message-ID: <MWHPR12MB1358449C677259C848AAB11EF75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
References: <PSXP216MB0438BFEAA0617283A834E11580580@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <77aa6c01aefe1ebc4004e87b0bc714f2759f15c4.1575985006.git.lukas@wunner.de>
 <MWHPR12MB1358AEEBD730A4EDA78894E6F75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
 <20191210154649.o3vsqzrtofhvcjrl@wunner.de>
In-Reply-To: <20191210154649.o3vsqzrtofhvcjrl@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 17cb588d-a833-4fd9-2376-08d77d8914e4
x-ms-traffictypediagnostic: MWHPR12MB1456:
x-microsoft-antispam-prvs: <MWHPR12MB14561B747520CDACD6E589B7F75B0@MWHPR12MB1456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(189003)(13464003)(199004)(8676002)(8936002)(55016002)(186003)(81156014)(478600001)(6916009)(86362001)(6506007)(53546011)(26005)(54906003)(2906002)(71200400001)(4326008)(7696005)(9686003)(45080400002)(66446008)(66946007)(76116006)(64756008)(66556008)(66476007)(81166006)(5660300002)(33656002)(316002)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1456;
 H:MWHPR12MB1358.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gUk4NuWTIar0MSOnTe8yaO5BDjL44eIxfQmP1Ge6yDjmNzJfcKlTLSFOMM34pKlvdRG3SPVpNPBobCbGrVwonG3lOl6ax2bofp71mersWUIelxmrOTougk3T2/NktFXr7EoORLBphWDEEAZQjQVl+fxOP7RfR4HmX60/GND1BLgfLZiJ7FGlHvNATFChIoPrv373MXTzaWPIgxL41RbB/OXrJNa+QJYXj8020/AQgLDIgrj0EABquL5eXBaDfgVOfUnub0+OFASoRtcYmaS2YE5wrdvvNfAfxFgiJyqmbGgJIkRpj6H0nkHDRXP40LFFikn5EUfz0m5i8NS3FVS1l01yRr2f0v8TYOmwlUHS/aURo93pl53jXXqPw28Fsmu1H/rjRtmE4mPMAPI4mjKtC1P/8ilGLROoj1LLPa/dc0kA4KJ7dtNxJd131m8sqodLrq2PNPa/9lAbVTByrhvsbVt/Itx/F9L/dI8NEloWbMLE2R53nFZHURTOpJEfVWqC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cb588d-a833-4fd9-2376-08d77d8914e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 15:53:20.9482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qR1RGfD024+kNEbAM00XfTdSQRxl1r791b0wEJLRc6gUCohs/jEcUy9hYZvQyqdrpQYhEgbS6/Cf6BUVDeSg2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/hdmi - Fix duplicate unref of
	pci_dev
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

> -----Original Message-----
> From: Lukas Wunner <lukas@wunner.de>
> Sent: Tuesday, December 10, 2019 10:47 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Takashi Iwai <tiwai@suse.de>; Jaroslav Kysela <perex@perex.cz>; Mika
> Westerberg <mika.westerberg@linux.intel.com>; Bjorn Helgaas
> <helgaas@kernel.org>; Nicholas Johnson <nicholas.johnson-
> opensource@outlook.com.au>; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; linux-pci@vger.kernel.org
> Subject: Re: [PATCH] ALSA: hda/hdmi - Fix duplicate unref of pci_dev
> 
> On Tue, Dec 10, 2019 at 03:34:27PM +0000, Deucher, Alexander wrote:
> > > Nicholas Johnson reports a null pointer deref as well as a refcount
> > > underflow upon hot-removal of a Thunderbolt-attached AMD eGPU.
> > > He's bisected the issue down to commit 586bc4aab878 ("ALSA: hda/hdmi
> > > - fix vgaswitcheroo detection for AMD").
> > >
> > > The commit iterates over PCI devices using pci_get_class() and
> > > unreferences each device found, even though pci_get_class()
> > > subsequently unreferences the device as well.  Fix it.
> >
> > The pci_dev_put() a few lines above should probably be dropped as well.
> 
> That one looks fine to me.  The refcount is already increased in the caller
> get_bound_vga() via pci_get_domain_bus_and_slot() and it's increased
> again in atpx_present() via pci_get_class().  It needs to be decremented in
> atpx_present() to avoid leaking a ref.

I'm not following.  This is part of the same loop as the one you removed.  All we are doing is checking whether the ATPX method exists or not om the platform.  The pdev may not be the same one as the one in pci_get_domain_bus_and_slot().  The APTX method in the APU's ACPI namespace, not the dGPUs.

Alex

> 
> Thanks,
> 
> Lukas
> 
> > > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > > index 35b4526f0d28..b856b89378ac 100644
> > > --- a/sound/pci/hda/hda_intel.c
> > > +++ b/sound/pci/hda/hda_intel.c
> > > @@ -1419,7 +1419,6 @@ static bool atpx_present(void)
> > >  				return true;
> > >  			}
> > >  		}
> > > -		pci_dev_put(pdev);
> > >  	}
> > >  	return false;
> > >  }
> > > --
> > > 2.24.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
