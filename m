Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FE2A8812
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 21:27:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43511684;
	Thu,  5 Nov 2020 21:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43511684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604608035;
	bh=vsXTEvJrcFb5sxUzDGjlUNGpq2HS2pXtZS2NznV7uDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Slmp449XQ6kHWJvPYY2k+tfnfu/B59ZgYiEnQSV7B/zS+3BmVIvJJbCRTZoQkR0GS
	 o4Ft5wOT6MP6GBMFiHPSHwk8nmjTevdDf8mcVJSw1g2AScQIQiD6LF+z8TptaX6Qkp
	 t0PI6ZpJjSML+pMJkTbJuJKEb+/KiycYesL7+ziQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92BF7F80245;
	Thu,  5 Nov 2020 21:26:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B15F80272; Thu,  5 Nov 2020 21:26:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7EFF80162
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7EFF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ErZLZUBe"
Received: by mail-ej1-x642.google.com with SMTP id w13so4502793eju.13
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 12:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ElB/rrPxCKnXR5px8y5SyvZ9UfH3zJvG6zS/OQ+aa24=;
 b=ErZLZUBe+5C6NSiNMqIo5UgF39YypMZidWcizu6bHEdkOO+DrfY6zfclQDJcK+rvLF
 HZDRGBB9K0Zde2XPVSCZEZ9mBa4VuYO63KCeKx0l6J/UEFamr2GHa8ZSFPaa+iJ+B7Fy
 XJtzsHBD3yDKVHRtOTSQ+O1IAExokiNCyI1If+tR9MXH+rn+AMxXk8Ushw91ELhDnd6K
 kXzJZL4I8dwisUTNONoPoQj5feVRVi84c9hmRQnT5w7szohcp1r3hU5eRBd5GN9OygRm
 qpo0NuFIU1irs4jDeLH8gYxr+CNm7oWBvFfY/N91TkgyAdPfmdp6D5HRcaJOope9vCVe
 Juag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElB/rrPxCKnXR5px8y5SyvZ9UfH3zJvG6zS/OQ+aa24=;
 b=BDOBzFrX3VopZOn7sstYk2yxuH8HODuhay73CdswAqK4c4b9FKrvL7xKcC+kESfryJ
 i02lR7ANovsFpFuNypNxFwwVIZhWr9S6YWXVM+NvTe+2vsF3bvCSIBx+NJQ/VLb9LnMn
 DJsjBqAGLC54gkEE6KEJn1dHRMhsbnLSvOcvomYgSPdsCXTI/LSdWdG5k+rNIoLMAPwx
 S4S+SdUMqZgtHrBk34FXIEfYAL+Gok9IRZtf317XgZH7l+HpniletUwtWgZufou4TTwT
 rhmijdlRK2dec5qvzBH2grU9G3kyBUx6RvCVAv0oPiqSUB0Htp1dXEyVYufirb1mNaxN
 yQtA==
X-Gm-Message-State: AOAM530LkbTKTkLuYeU8oOjBC0mOs0XUhDugUJLLu+hR8wfniU5jEneB
 AREUgZnUYZq6425g9JCFhYrnWjDPAYLITJMBEZtPgg==
X-Google-Smtp-Source: ABdhPJzqBNoVTeYN8+fPRiK4rwFU6h5BHef17j5dFRZ5eF3FqBCbrAbUQXxKzQoJ0Ost2YWcFgbyrXrclIZGpF61MFA=
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr4009626ejk.323.1604607973094; 
 Thu, 05 Nov 2020 12:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <BY5PR12MB43228923300FDE8B087DC4E9DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB43228923300FDE8B087DC4E9DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 5 Nov 2020 12:26:02 -0800
Message-ID: <CAPcyv4h1LH+ojRGqvh_R6mfuBbsibGa8DNMG5M1sN5G1BgwiHw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Parav Pandit <parav@mellanox.com>, Greg KH <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Thu, Nov 5, 2020 at 11:40 AM Parav Pandit <parav@nvidia.com> wrote:
>
>
>
> > From: Ertman, David M <david.m.ertman@intel.com>
> > Sent: Friday, November 6, 2020 12:58 AM
> > Subject: RE: [PATCH v3 01/10] Add auxiliary bus support
> >
> > > -----Original Message-----
> > > From: Dan Williams <dan.j.williams@intel.com>
> > > Sent: Thursday, November 5, 2020 1:19 AM
> > >
>
> [..]
> > > > +
> > > > +Another use case is for the PCI device to be split out into
> > > > +multiple sub functions.  For each sub function an auxiliary_device
> > > > +will be created.  A PCI sub function driver will bind to such
> > > > +devices that will create its own one or more class devices.  A PCI
> > > > +sub function auxiliary device will likely be contained in a struct
> > > > +with additional attributes such as user defined sub function number
> > > > +and optional attributes such as resources and a link to
> > > the
> > > > +parent device.  These attributes could be used by systemd/udev; and
> > > hence should
> > > > +be initialized before a driver binds to an auxiliary_device.
> > >
> > > This does not read like an explicit example like the previous 2. Did
> > > you have something specific in mind?
> > >
> >
> > This was added by request of Parav.
> >
> This example describes the mlx5 PCI subfunction use case.
> I didn't follow your question about 'explicit example'.
> What part is missing to identify it as explicit example?

Specifically listing "mlx5" so if someone reading this document thinks
to themselves "hey mlx5 sounds like my use case" they can go grep for
that.
