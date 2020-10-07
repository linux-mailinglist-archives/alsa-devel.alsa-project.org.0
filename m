Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03302867E4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 20:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F61B16B6;
	Wed,  7 Oct 2020 20:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F61B16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602097080;
	bh=yfiJ5nD/cUmyiqlzNZewJWZjW4mmc4Boj3zx3Rxdevw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uikSxtQ7dxhnSBJoZZ92vKUfSvRWxLtqOC8i5tTTeI9VpWA+EVqvcRVns/1q7goJh
	 2o0+ptvv0dWS87oePtG6sR7kM+v3/cNxKWq0rEtelEeU1nMP9f44D5JxoEpxC9pvW8
	 0l//JjMMmZlqwWSAGY6zprc1OmAB3szXJvvzXed4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9848F8016A;
	Wed,  7 Oct 2020 20:56:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0139F80128; Wed,  7 Oct 2020 20:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77296F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 20:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77296F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="F89nKzkh"
Received: by mail-ej1-x642.google.com with SMTP id lw21so4491842ejb.6
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfiJ5nD/cUmyiqlzNZewJWZjW4mmc4Boj3zx3Rxdevw=;
 b=F89nKzkhVw+pwSxd4I+Ro29bXc2Yy4aOTB0aRdedpGp4Xf5mIKcUUeC4WmcHJUQJhT
 UmyJ5u0llCJiofg5m/aBddvUXcqKgw19yZWf2cFnhojQASzzrRtifWjlVLdkVTE2uFt0
 f3r2Gr1CFfl4iERMNNQNTk+RiZo68CSSTSeHrj3xhWY6hGPtSy+eN0gPGg9at54tggYn
 Xxd1PwlQsNUZMa5HsqCTBWAfgRGNsYKdj9jkf+QR8E28eeYFJZRGgn2VW/7oY5PJ/sjZ
 vAb5jAvQBmIVvqj93TjfKNqcJNJ2OOqcgAgufr6IGab7ZF182lxt3MbvDJknrgJcxDId
 ZXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfiJ5nD/cUmyiqlzNZewJWZjW4mmc4Boj3zx3Rxdevw=;
 b=YcTQ9Fd0LEYpW9+eyspdkIo52NwKWxSGHbyj3ymnL4KqM7CCKOwNdGnPFwxTNyH+na
 XIiq5xG1/kZnf2IouG2A5/ukzmYMM4RO/1sYAudvqnPZf1BSbrTiAMEzEhk2CTD1cF5V
 edkUhJQ5CUOjFNiyzmZ1Ng/QpkhwxvSk6b4VgRpA8UzwW4DcTjh/+6Fg3tI+/7fMIGwF
 JnZdUckV8gGmj+ARh2P4lSVXr//PvKYFHtfttWgkbitlHzhjjmNGwPk/hL1SfOWYs7dX
 EyG4IJlf2Gk+go4vtpGuZffs1sAHihK0xeZ8hGQHtK9vor6amPhdxqO0C62sZQ1tQFyW
 LwAA==
X-Gm-Message-State: AOAM5307rm0PteX98i1D/EkzMSPF/Bwvgo0joe7+kBc4KF3tINJ+UrTb
 MFHfdCB1R8NZ7y2PgAyBXzTHc0SGcl5TR6nGDG/pzg==
X-Google-Smtp-Source: ABdhPJyNpzrYFZKJNGR3LOKY++IvBFmX8qfeS5JqUyOBjoxQwDjRp/d7m0uUE6VIQpOeEI+tD7+gLGvhR+0lRO7kp6k=
X-Received: by 2002:a17:906:1a0b:: with SMTP id
 i11mr4831823ejf.472.1602096965738; 
 Wed, 07 Oct 2020 11:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <BY5PR12MB43228E8DAA0B56BCF43AF3EFDC0D0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20201006172650.GO1874917@unreal> <3ff1445d86564ef3aae28d1d1a9a19ea@intel.com>
 <20201006192036.GQ1874917@unreal>
 <CAPcyv4iC_KGOx7Jwax-GWxFJbfUM-2+ymSuf4zkCxG=Yob5KnQ@mail.gmail.com>
 <cd80aad674ee48faaaedc8698c9b23e2@intel.com> <20201007133633.GB3964015@unreal>
In-Reply-To: <20201007133633.GB3964015@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 11:55:53 -0700
Message-ID: <CAPcyv4j1VrPkX_=61S7pdCPdDGy+xFGMkHHNnR-FT+TXXvbOWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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

On Wed, Oct 7, 2020 at 6:37 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Wed, Oct 07, 2020 at 01:09:55PM +0000, Saleem, Shiraz wrote:
> > > Subject: Re: [PATCH v2 1/6] Add ancillary bus support
> > >
> > > On Tue, Oct 6, 2020 at 12:21 PM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > On Tue, Oct 06, 2020 at 05:41:00PM +0000, Saleem, Shiraz wrote:
> > > > > > Subject: Re: [PATCH v2 1/6] Add ancillary bus support
> > > > > >
> > > > > > On Tue, Oct 06, 2020 at 05:09:09PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Leon Romanovsky <leon@kernel.org>
> > > > > > > > Sent: Tuesday, October 6, 2020 10:33 PM
> > > > > > > >
> > > > > > > > On Tue, Oct 06, 2020 at 10:18:07AM -0500, Pierre-Louis Bossart wrote:
> > > > > > > > > Thanks for the review Leon.
> > > > > > > > >
> > > > > > > > > > > Add support for the Ancillary Bus, ancillary_device and
> > > ancillary_driver.
> > > > > > > > > > > It enables drivers to create an ancillary_device and
> > > > > > > > > > > bind an ancillary_driver to it.
> > > > > > > > > >
> > > > > > > > > > I was under impression that this name is going to be changed.
> > > > > > > > >
> > > > > > > > > It's part of the opens stated in the cover letter.
> > > > > > > >
> > > > > > > > ok, so what are the variants?
> > > > > > > > system bus (sysbus), sbsystem bus (subbus), crossbus ?
> > > > > > > Since the intended use of this bus is to
> > > > > > > (a) create sub devices that represent 'functional separation'
> > > > > > > and
> > > > > > > (b) second use case for subfunctions from a pci device,
> > > > > > >
> > > > > > > I proposed below names in v1 of this patchset.
> > > > > >
> > > > > > > (a) subdev_bus
> > > > > >
> > > > > > It sounds good, just can we avoid "_" in the name and call it subdev?
> > > > > >
> > > > >
> > > > > What is wrong with naming the bus 'ancillary bus'? I feel it's a fitting name.
> > > > > An ancillary software bus for ancillary devices carved off a parent device
> > > registered on a primary bus.
> > > >
> > > > Greg summarized it very well, every internal conversation about this
> > > > patch with my colleagues (non-english speakers) starts with the question:
> > > > "What does ancillary mean?"
> > > > https://lore.kernel.org/alsa-devel/20201001071403.GC31191@kroah.com/
> > > >
> > > > "For non-native english speakers this is going to be rough, given that
> > > > I as a native english speaker had to go look up the word in a
> > > > dictionary to fully understand what you are trying to do with that
> > > > name."
> > >
> > > I suggested "auxiliary" in another splintered thread on this question.
> > > In terms of what the kernel is already using:
> > >
> > > $ git grep auxiliary | wc -l
> > > 507
> > > $ git grep ancillary | wc -l
> > > 153
> > >
> > > Empirically, "auxiliary" is more common and closely matches the intended function
> > > of these devices relative to their parent device.
> >
> > auxiliary bus is a befitting name as well.
>
> Let's share all options and decide later.
> I don't want to find us bikeshedding about it.

Too late we are deep into bikeshedding at this point... it continued
over here [1] for a bit, but let's try to bring the discussion back to
this thread.

[1]: http://lore.kernel.org/r/10048d4d-038c-c2b7-2ed7-fd4ca87d104a@linux.intel.com
