Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD92863A0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5063016A0;
	Wed,  7 Oct 2020 18:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5063016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602087694;
	bh=YyxxBJ18GPCGMVQdelc/ngDBfP1eQ6osytlbbOH+gVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4hpISs7LEfb+ac7N2UWvfG6e8kEC8CGBmFcdkHmZDO5ibYriRHSggrRxKYVPPJru
	 GbaPZGdCS+dVg1kbe8BRY7QjbkOYa9yM58JdNfFS+eM7Xr2xQPeLNfxmBt227KEk2D
	 bsnDptZ3aI/ah5ZrzTx6/lYdpsPPOjimGKbzV35Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07DC3F8016A;
	Wed,  7 Oct 2020 18:19:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC03F80128; Wed,  7 Oct 2020 18:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FDECF80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 18:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDECF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Nze46O7r"
Received: by mail-ej1-x644.google.com with SMTP id lw21so3802124ejb.6
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbCWv4wYryp2lEl66gAtA6txsM+jpf8eKR4IeclDVr8=;
 b=Nze46O7rIL4hYRz3Bi0l9nQArHGDRfykHGuM/JBq91dsiCiJGvIOpxwtHBMdQ+HPRO
 jcL0u6tVV0j7bEWL+/ikuMRbESUeOnAoZQxi2bIBF6WlpqdSGqY5UPVAh+oNk91QYuYw
 qwMd1Du/Rz/kCtLwNXLa0RxC08QXKAHsUcwlPieHXMf0MgPMm8LWo/B7lXZB84HNRtW1
 E5GmBVa41WkoEW3f4OSqCcLROVpl2Eis6Ak/hIZYb6bEcP2R/VTCXrVLax/fdDXV3dHC
 p0TSfXN9IWXYuBJLoFRf0AWRglPQUCxDB8/KDEGyZkhS8ak2ZUVGRzub5dRStNgEErfr
 qgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbCWv4wYryp2lEl66gAtA6txsM+jpf8eKR4IeclDVr8=;
 b=n0RR5NA9ZM1XiM/n3pKl/b+x0BDL1JPU3jWJkQoqb4jFwFEWNi1CwrTsfHmjj0Y3fJ
 kLdZ33qcSWUS9/RuaY7TAWpo86+155WOeFXwquQKMxwF6pFPE+UITkHxialUqppDOoRa
 f0CwiMPkY1TdkgdlDSnbYEKOrlfslnj35cKu6a1GhMHXjcdHJDlIVplF8xFZosJGa2ir
 BvzQuzy82WEF6ZARAsT+Kwt9lWWNTo+LUWg+ZSIaL1ZV3IGz9CTUgbUfG5VY5K23Oi8o
 X9orZLEFFw5LGLKK5Uf1FJyKJ42lZdM388gLYa6Q73rK/vhxxDnteurrMzw0jzAHhhuV
 1bjg==
X-Gm-Message-State: AOAM532xRPEBwdmxXF7+EUSvwnIYOlsfUzt7vJ5I9oWZfKuSHrLcwnLh
 qnX0XvGdmJXF87DvX5kTg/g4YWnunQ9s4onyJPceEX3KHtw=
X-Google-Smtp-Source: ABdhPJycOkGtzUAQ6yXWgLIloQv8APmSbM5CCwwpf0sPfyB8kzjp0Bj7I5OGAiW4An8OD4GVjHUVpqffRHQjILb+zyU=
X-Received: by 2002:a17:906:4306:: with SMTP id
 j6mr4288958ejm.523.1602087582734; 
 Wed, 07 Oct 2020 09:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
 <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
 <20201007091443.GA822254@kroah.com>
In-Reply-To: <20201007091443.GA822254@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 09:19:32 -0700
Message-ID: <CAPcyv4hLVF4AdRLq2mTGJ9NBwRHm=_ANerUu0OuUPKk2XBSu_w@mail.gmail.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

On Wed, Oct 7, 2020 at 2:14 AM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 06, 2020 at 03:40:58PM -0700, Dan Williams wrote:
> > On Mon, Oct 5, 2020 at 4:25 AM gregkh@linuxfoundation.org
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Oct 04, 2020 at 11:45:41PM +0000, Williams, Dan J wrote:
> > > > [ Ugh, as other have lameneted, I was not copied on this thread so I
> > > > could not respond in real time. Let me be another to say, please copy
> > > > all impacted lists and stakeholders on patches. ]
> > > >
> > > > On Sat, 2020-10-03 at 11:08 +0200, Greg KH wrote:
> > > > [..]
> > > > >
> > > > > > Several names were suggested (like peer bus, which was shot down
> > > > > > because in
> > > > > > parts on the English speaking world the peerage means nobility),
> > > > > > finally
> > > > > > "ancillary bus" was arrived at by consensus of not hating it.
> > > > >
> > > > > "not hating it", while sometimes is a good thing, for something that
> > > > > I
> > > > > am going to have to tell everyone to go use, I would like to at least
> > > > > "like it".  And right now I don't like it...
> > > > >
> > > > > I think we should go back to "virtual" for now, or, if the people who
> > > > > didn't like it on your "internal" reviews wish to participate here
> > > > > and
> > > > > defend their choice, I would be glad to listen to that reasoning.
> > > >
> > > > I came out strongly against "virtual" because there is nothing virtual
> > > > about these devices, they are functional partitions of the parent
> > > > device. Also, /sys/devices/virtual is already the land of unparented  /
> > > > software-defined devices. Having /sys/devices/virtual alongside that is
> > > >  not quite a namespace collision, but it's certainly namespace
> > > > confusion in my view.
> > > >
> > > > I proposed other names, the team came back with "ancillary" which was
> > > > not my first choice, but perfectly suitable. In deference to the people
> > > > doing the work I let their choice stand.
> > > >
> > > > It is an uncomfortable position being a middle tier reviewer of pre-
> > > > release patch sets when the patch set can still be de-railed by
> > > > preference nits. A lack of deference makes it a difficult job to
> > > > convince people "hey my internal review will save you some time
> > > > upstream", when in practice they can see the opposite is true.
> > >
> > > I will publically state that without those middle-tier reviews, this
> > > would have been a worse submission, which is why I am _REQUIRING_ them
> > > from Intel at the moment.
> > >
> > > So your review did not happen in vain, and if developers complain about
> > > this, send them to me please.
> > >
> > > As for the name, why is everyone ignoring the fact that we have had
> > > /sys/devices/virtual/ for decades now, with no one being confused about
> > > that name usage?  I see this as an extension of that existing code
> > > pattern, is everyone missing that?
> >
> > Oh, I was specifically reacting to /sys/devices/virtual being a place
> > where un-parented devices land. Things like raid composite devices and
> > other devices that just do not fit cleanly in the parent device
> > hierarchy, each of them has independent lifetime rules, some do not
> > attach to drivers they just exist in an "unbound" state when active...
> > it's an anything goes catch all space. This bus is the opposite, all
> > devices have a maximum lifetime tied to their parent device bind
> > lifetime, and they are not active without drivers. Placing them under
> > /sys/bus/virtual/devices confuses what the "virtual" term means to
> > sysfs.
>
> "virtual" here means "not real" :)

Which of these aux device use cases is not a real device? One of my
planned usages for this facility is for the NPEM (Native PCIE
Enclosure Management) mechanism that can appear on any PCIE
bridge/endpoint. While it is true that the NPEM register set does not
get its own PCI-b:d:f address on the host bus, it is still
discoverable by a standard enumeration scheme. It is real auxiliary
device functionality that can appear on any PCIE device where the
kernel can now have one common NPEM driver for all instances in the
topology.

>
> > "ancillary" devices and drivers has meaning to me, in a way that
> > "virtual" devices and drivers does not. If "ancillary" does not hit
> > the right tone what about "aux" for "auxiliary"
> > (/sys/bus/aux/devices)?
>
> "aux" is nice, I'll think about that.  simple is good, and naming is
> hard...

I have a soft spot for functional three letter abbreviations.
Certainly "aux" is clearer than "ancil", and less overloaded than
"virt".
