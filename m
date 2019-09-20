Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CFBB90A5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CB31675;
	Fri, 20 Sep 2019 15:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CB31675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568986118;
	bh=fHtEpMjtR/kWvsD+M0TlSyeZzPESY7vzKOk52ijbI5M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FvjTrtCagzf/EVAq2KcOv7khulNWXpB4Mycjh4Bn38Ms/fbyFYG1FljDf8sO3JOYi
	 +134hwLlWlPb1jS10RkoeLORM5Q56fLNe+SN1SHJfiSxIbPzbCazBP/LTJKX0qfIS3
	 65NoF3sYxEBVQOYIkGzXdLBpA4PeehxT7VIbbSyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9302FF80519;
	Fri, 20 Sep 2019 15:26:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D249BF80506; Fri, 20 Sep 2019 15:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B6DBF80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6DBF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dJwu4kjg"
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3E5A20644;
 Fri, 20 Sep 2019 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568986006;
 bh=l6trHkVRVi4Jtoy88rMW6wbwgrdI8cPoidRU+a4Nsio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dJwu4kjg0I7EPoOxOCF9/xh8sTyrXKV0lUmPsvj4kB1vxJH9xuOBzn7f5vgJn8R4L
 gqF/dYYJPT7E+azdmsMGSglPJ61pl62C7tlTsYKAo70ctR53+WA7M71176sFajIWYB
 PNy0rNBhWw1Zo0iZRd4Gi9Ks4zX+ZGxEL7VfK0Ho=
Date: Fri, 20 Sep 2019 08:26:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20190920132644.GA226476@google.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <20190909114129.GT103977@google.com>
 <CAAd53p4mc0tgCBiwfZRowr4os_bqDP+7Ko=d+do8OW2aH1Whzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAd53p4mc0tgCBiwfZRowr4os_bqDP+7Ko=d+do8OW2aH1Whzg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux PCI <linux-pci@vger.kernel.org>, alsa-devel@alsa-project.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, tiwai@suse.com,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] PCI: Add a helper to check Power
 Resource Requirements _PR3 existence
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

[+cc Rafael]

On Fri, Sep 20, 2019 at 01:23:20PM +0200, Kai-Heng Feng wrote:
> On Mon, Sep 9, 2019 at 1:41 PM Bjorn Helgaas <helgaas@kernel.org> wrote:

> > > +bool pci_pr3_present(struct pci_dev *pdev)
> > > +{
> > > +     struct pci_dev *parent_pdev = pci_upstream_bridge(pdev);
> > > +     struct acpi_device *parent_adev;
> > > +
> > > +     if (acpi_disabled)
> > > +             return false;
> > > +
> > > +     if (!parent_pdev)
> > > +             return false;
> > > +
> > > +     parent_adev = ACPI_COMPANION(&parent_pdev->dev);
> > > +     if (!parent_adev)
> > > +             return false;
> > > +
> > > +     return parent_adev->power.flags.power_resources &&
> > > +             acpi_has_method(parent_adev->handle, "_PR3");
> >
> > I think this is generally OK, but it doesn't actually check whether
> > *pdev* has a _PR3; it checks whether pdev's *parent* does.  So does
> > that mean this is dependent on the GPU topology, i.e., does it assume
> > that there is an upstream bridge and that power for everything under
> > that bridge can be managed together?
> 
> Yes, the power resource is managed by its upstream port.
> 
> > I'm wondering whether the "parent_pdev = pci_upstream_bridge()" part
> > should be in the caller rather than in pci_pr3_present()?
> 
> This will make the function more align to its name, but needs more
> work from caller side.
> How about rename the function to pci_upstream_pr3_present()?

I cc'd Rafael because he knows all about how this stuff works, and I
don't.

_PR3 is defined in terms of the device itself and the doc (ACPI v6.3,
sec 7.3.11) doesn't mention any hierarchy.  I assume it would be legal
for firmware to supply a _PR3 for "pdev" as well as for "parent_pdev"?

If that is legal, I think it would be appropriate for the caller to
look up the upstream bridge.  That way this interface could be used
for both "pdev" and an upstream bridge.  If we look up the bridge
internally, we would have to add a second interface if we actually
want to know about _PR3 for the device itself.

> > I can't connect any of the dots from _PR3 through to
> > "need_eld_notify_link" (whatever "eld" is :)) and the uses of
> > hda_intel.need_eld_notify_link (and needs_eld_notify_link()).
> >
> > But that's beyond the scope of *this* patch and it makes sense that
> > you do want to discover the _PR3 existence, so I'm fine with this once
> > we figure out the pdev vs parent question.
> 
> Thanks for your review.
> 
> Kai-Heng
> 
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(pci_pr3_present);
> > > +
> > >  /**
> > >   * pci_add_dma_alias - Add a DMA devfn alias for a device
> > >   * @dev: the PCI device for which alias is added
> > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > index 82e4cd1b7ac3..9b6f7b67fac9 100644
> > > --- a/include/linux/pci.h
> > > +++ b/include/linux/pci.h
> > > @@ -2348,9 +2348,11 @@ struct irq_domain *pci_host_bridge_acpi_msi_domain(struct pci_bus *bus);
> > >
> > >  void
> > >  pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct device *));
> > > +bool pci_pr3_present(struct pci_dev *pdev);
> > >  #else
> > >  static inline struct irq_domain *
> > >  pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
> > > +static bool pci_pr3_present(struct pci_dev *pdev) { return false; }
> > >  #endif
> > >
> > >  #ifdef CONFIG_EEH
> > > --
> > > 2.17.1
> > >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
