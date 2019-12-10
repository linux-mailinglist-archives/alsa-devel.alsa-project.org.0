Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C3118D5D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 17:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128341674;
	Tue, 10 Dec 2019 17:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128341674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575994535;
	bh=Eoe0g+CZlvUOHt+51ALamy81fyo5nbnne7OX2gNTPPE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NS2aeBM4E1O4FQOZKSMPWjlzbWYZSPcvHeqXPbDHyEKIjH5vugzYT5WTpl8CgSiyE
	 EkUq0CEPUrv5XZXwYoNtpjfKPt5MKTVkMKc1n8CKgNygLdJ1vXt4ljOJlpyPLHWAae
	 wbR9gV7av6j0CS6nml0BxnYY19h6+3P1ps+VjVA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F19CF80248;
	Tue, 10 Dec 2019 17:13:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF0E1F800B4; Tue, 10 Dec 2019 17:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E5FF800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 17:13:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E5FF800B4
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1C60C28022E40;
 Tue, 10 Dec 2019 17:13:46 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id D7EF5CD0; Tue, 10 Dec 2019 17:13:45 +0100 (CET)
Date: Tue, 10 Dec 2019 17:13:45 +0100
From: Lukas Wunner <lukas@wunner.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Message-ID: <20191210161345.apz4aixgszcd6vco@wunner.de>
References: <PSXP216MB0438BFEAA0617283A834E11580580@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <77aa6c01aefe1ebc4004e87b0bc714f2759f15c4.1575985006.git.lukas@wunner.de>
 <MWHPR12MB1358AEEBD730A4EDA78894E6F75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
 <20191210154649.o3vsqzrtofhvcjrl@wunner.de>
 <MWHPR12MB1358449C677259C848AAB11EF75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR12MB1358449C677259C848AAB11EF75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On Tue, Dec 10, 2019 at 03:53:20PM +0000, Deucher, Alexander wrote:
> > On Tue, Dec 10, 2019 at 03:34:27PM +0000, Deucher, Alexander wrote:
> > > > Nicholas Johnson reports a null pointer deref as well as a refcount
> > > > underflow upon hot-removal of a Thunderbolt-attached AMD eGPU.
> > > > He's bisected the issue down to commit 586bc4aab878 ("ALSA: hda/hdmi
> > > > - fix vgaswitcheroo detection for AMD").
> > > >
> > > > The commit iterates over PCI devices using pci_get_class() and
> > > > unreferences each device found, even though pci_get_class()
> > > > subsequently unreferences the device as well.  Fix it.
> > >
> > > The pci_dev_put() a few lines above should probably be dropped as well.
> > 
> > That one looks fine to me.  The refcount is already increased in the caller
> > get_bound_vga() via pci_get_domain_bus_and_slot() and it's increased
> > again in atpx_present() via pci_get_class().  It needs to be decremented in
> > atpx_present() to avoid leaking a ref.
> 
> I'm not following.  This is part of the same loop as the one you removed.
> All we are doing is checking whether the ATPX method exists or not om the
> platform.  The pdev may not be the same one as the one in
> pci_get_domain_bus_and_slot().  The APTX method in the APU's ACPI namespace,
> not the dGPUs.

Okay.  Still, atpx_present() doesn't pass the found pci_dev back to the
caller, so it would be leaked if the ref isn't returned.

The situation is different for the pci_dev_put() I removed:  The ref is
returned by pci_get_class() on the next loop iteration.

Thanks,

Lukas

> > > > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > > > index 35b4526f0d28..b856b89378ac 100644
> > > > --- a/sound/pci/hda/hda_intel.c
> > > > +++ b/sound/pci/hda/hda_intel.c
> > > > @@ -1419,7 +1419,6 @@ static bool atpx_present(void)
> > > >  				return true;
> > > >  			}
> > > >  		}
> > > > -		pci_dev_put(pdev);
> > > >  	}
> > > >  	return false;
> > > >  }
> > > > --
> > > > 2.24.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
