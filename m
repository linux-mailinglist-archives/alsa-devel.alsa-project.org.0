Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306362864C3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD09A16C6;
	Wed,  7 Oct 2020 18:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD09A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602089035;
	bh=r7FYylGKk1odf5CJNOIcYSm2aww+t26b5bjaul/nDv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMIQ15qaFk6pjghSIBusnhM+vOG//OhVWvo25ArqMSnJf3wFrhq/vEw7DENuIo4Yl
	 Z7uFxhjOiLrGsj2yotSaJgIM+ni3zbmCQXbVUQ9+NVoKlNsk0hYFyvYwNoumeYxw9v
	 S38G+2W0ewJSebtA8pe1jCIWev+B4+VHrDPdumok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FC3F8016A;
	Wed,  7 Oct 2020 18:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF1C1F80128; Wed,  7 Oct 2020 18:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08DD1F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 18:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08DD1F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="s7kegCSk"
Received: by mail-ej1-x641.google.com with SMTP id md26so3885416ejb.10
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7FYylGKk1odf5CJNOIcYSm2aww+t26b5bjaul/nDv4=;
 b=s7kegCSkfyMI8sYh7v4IFa9j0KlrsHhv4ss2kEmO9a5H4/HvvOdxq0lzhatA4YxiD5
 ts2WWeJSEpZhDG2zBBeIjfl5o37nF5D1uQ9q3rZV2q++M2RT1zubLRvrn7eW9gY7GzOL
 +JxU0zz9rP71BrB0PTJvfbwuUSHrxFGmudg2sT0m4jTisiWaHl2ExQA9LcO4kfIoyOeB
 QICw/yp9Sp6IybmJx2fcVOO7UACFid83lf2MuNbg8GnFVSblFETbvARJCN+k26cIXQR0
 ad0wX43gcMK1sfcb7+1TMx1qmngPMUdkhjCisBbW2z6d+7IFR5kZ4F0doII8zW1e4ee8
 pMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7FYylGKk1odf5CJNOIcYSm2aww+t26b5bjaul/nDv4=;
 b=cQUh2c+PWwCnOef6kLxsIsrw8fyAxzqE4m1PGvk9MKYlECdSXB9qq3YpMb6pKu0HqN
 GbHGRP6aQ8WwJ/02QBjJVfd5Id+sgFGQDCVilLMI7aSev9CcOxHecTnikFvksxiHB3P4
 ZUnCt1CARhy4VkTRP3MhVpv8B/RrYyDovtC1lpZesBbVqCb1/HlXZjJYmayyiwAcrxFB
 fJ16SJPoqG3HaC+sDeMPNPc2WpiPdu9S5jAimqyQMZsfNkzfZmqDMBfQu2YOKk96DMl/
 QQ3SA0pyTQmZFLAMOl1hMvASm9bouMo0189rqu9xRy3FQ8wzofTHnNlLl+2wmSJdyPKK
 83Kw==
X-Gm-Message-State: AOAM530eRiLv39NndvNGVbj3uteqDAXiJwtBsX5/k/d/SJkF0KR6bFWj
 8RQ+HFdE2t6ItpI1LVwe2ELMXUUHa2zy9MREwboi/A==
X-Google-Smtp-Source: ABdhPJzXqF2d9nI2fOil1Vvbx99EwbfXlYC7BuOgWQ8Vza2MjwN0nVyZP+fqy+TLmTS5BfLtpd0hCLLPxxNBIFGQd28=
X-Received: by 2002:a17:906:7f82:: with SMTP id
 f2mr4068995ejr.264.1602088923033; 
 Wed, 07 Oct 2020 09:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
 <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
 <20201007091443.GA822254@kroah.com>
 <CAPcyv4hLVF4AdRLq2mTGJ9NBwRHm=_ANerUu0OuUPKk2XBSu_w@mail.gmail.com>
 <20201007162251.GB5030@sirena.org.uk>
In-Reply-To: <20201007162251.GB5030@sirena.org.uk>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 09:41:52 -0700
Message-ID: <CAPcyv4iiENPzY5VZN31MtWL5Y4iHVP+4NeFzLdS5WABR0J_iOQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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

On Wed, Oct 7, 2020 at 9:23 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Oct 07, 2020 at 09:19:32AM -0700, Dan Williams wrote:
> > On Wed, Oct 7, 2020 at 2:14 AM gregkh@linuxfoundation.org
>
> > > "virtual" here means "not real" :)
>
> > Which of these aux device use cases is not a real device? One of my
> > planned usages for this facility is for the NPEM (Native PCIE
> > Enclosure Management) mechanism that can appear on any PCIE
> > bridge/endpoint. While it is true that the NPEM register set does not
> > get its own PCI-b:d:f address on the host bus, it is still
> > discoverable by a standard enumeration scheme. It is real auxiliary
> > device functionality that can appear on any PCIE device where the
> > kernel can now have one common NPEM driver for all instances in the
> > topology.
>
> Some if not all of the SOF cases are entirely software defined by the
> firmware downloaded to the audio DSPs.

"Software-defined" in the kernel context to me means software Linux
kernel developers have control over, so device-mapper devices, other
things that show up under /sys/devices/virtual, or
/sys/devices/system/memory/. Firmware changing device functionality is
more like just-in-time hardware than software-defined. In other words
kernel software is not involved in constructing the device
functionality.
