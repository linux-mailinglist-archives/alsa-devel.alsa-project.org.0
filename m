Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424055811D
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 13:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5CF1731;
	Thu, 27 Jun 2019 13:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5CF1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561633520;
	bh=5GZIckkR64Jg4urxwYu7eyLibGVrafsPqyHU4VnMv9Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPgir0esD0+n0eMaEmw8c0VUC5UTklAs/IY9Yku/rxN4FExcq3W3SLwkShS1IFnWd
	 +0JktvXLq1dsAYl9TLy+mua3l9RLs5NEb8kYSuRd0hs7Ec81lbgSoZi4FHRwwYizcX
	 pgJ+t6scgGzmLg0gWl0H1pfqhtOcyTK2euDcybjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D061F89735;
	Thu, 27 Jun 2019 13:02:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A47F80C0B; Thu, 27 Jun 2019 13:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B00CF80C0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 13:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B00CF80C0B
Received: by mail-ot1-f65.google.com with SMTP id z23so1784493ote.13
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 04:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ka9BmbBZdApWBISzR7Jp5uBqbiDke9ZxmnXwtLFthGc=;
 b=ltls6pxJOXonDQzutm2wOLSbPSE/oSsVmrTr1MG+a4MSh7HzgKIt7kgVE4vpG9k8I4
 eNc+uI7nskULSyyut+tWmjNYP+NL/3lYfv5cQ2pl2sDMhz0yqYTQfRoz4R2pzlKM3zea
 hjUpwsfX9FSc3/7jrIedPctHPuomB7Nz3QSBSCDMvWJvZTTdmrypqW7WMIg7IPA8c7bi
 rMnvA8ppHIY8iKYVzrTN0PQj8RDY7Gip9J/Lc/kdX19olBVJHY0tDHZJfizi3w5450CM
 a6N4aWefEEqHXv5ZP3wZjZOhpNqIPnTbhV3Xba83nkaN6kBHiel/2VCePwuTVosywVUV
 nd5Q==
X-Gm-Message-State: APjAAAXhA7YiJBdqueifwWFuPAPMWbJEEvOBPx4imDq+pc+rITFKxOMg
 BW5wgm6VyVXm1ykPsx0gND1WX3QppxSgc+MgoxI=
X-Google-Smtp-Source: APXvYqxpyV2Hl/9a2xOZtEZcerx6CDLS/GgW2K8qgYeq9JMIG8AP62h5xwyk81Y8B62QZ1fHXnA4TfO28x/BKggNsqg=
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr2964690otn.266.1561633364454; 
 Thu, 27 Jun 2019 04:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
 <CAJZ5v0hvN=8YmF+v6wKx9mQ=DRosAtK7QU=EWYf5PXEDsn4FEQ@mail.gmail.com>
 <20190627102345.GG54126@ediswmail.ad.cirrus.com>
In-Reply-To: <20190627102345.GG54126@ediswmail.ad.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Jun 2019 13:02:32 +0200
Message-ID: <CAJZ5v0hmMW-3UvvJch+NuYgQ+0iGP-LMrxP8p9wkmaGm1zAQoQ@mail.gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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

On Thu, Jun 27, 2019 at 12:23 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Jun 27, 2019 at 11:39:10AM +0200, Rafael J. Wysocki wrote:
> > On Wed, Jun 26, 2019 at 5:36 PM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > +       n = device_property_read_u32_array(dev, propname, NULL, 0);
> > > +       if (n == -EINVAL) {
> > > +               return 0;       /* missing, ignore */
> >
> > Why can't the caller use the (scheduled for merging in the 5.3 cycle)
> > new device_property_count_u32() to get the size of the array?
> >
>
> I wasn't aware of it, am now.
>
> > > +       } else if (n < 0) {
> > > +               dev_warn(dev, "%s malformed (%d)\n", propname, n);
> >
> > Why dev_warn()?  Is there any reason real for anything higher-level
> > that dev_dbg() here?
> >
>
> Nice to know that your DT wasn't valid, but could be left to the
> caller I guess.

Right.  And only print the message when the caller really is going to fail.

> > > +               return n;
> > > +       } else if ((n % multiple) != 0) {
> >
> > I guess the reason why this matters is that the caller expects a
> > certain number of full "rows" and n values are read.  Why not to
> > discard the extra values instead of returning an error here?
> >
>
> No reason really why it couldn't. Although my expectation would
> generally be this helper is for reading a variable number of
> fixed size groups. As in each group represents a "whole" item but
> you don't know how many of those you have.

That really depends on how the property is defined and which is what
the caller knows.

> > > +               dev_warn(dev, "%s not a multiple of %d entries\n",
> > > +                        propname, multiple);
> > > +               return -EOVERFLOW;
> >
> > Why this error code?
> >
>
> As that is the error code all the device_property functions
> return when the size is not as expected.

To be precise, when there is a mismatch between the storage space
supplied by the caller and the property size.  That does not seem to
be the case here.  It is rather about the property format being not as
expected and that would be -EPROTO.

> > > +       if (n > nval)
> > > +               n = nval;
> > > +
> > > +       ret = device_property_read_u32_array(dev, propname, val, n);
> >
> > So this reads "copy at most nval values from the array property".
> >
> > If that's really what you need, it can be done in two lines of code in
> > prospective callers of this wrapper.
> >
>
> Indeed the helper here is basically exactly what would be done in
> the caller if no helper existed.
>
> > > +int device_property_read_u32_2darray(struct device *dev, const char *propname,
> > > +                                    u32 *val, size_t nval, int multiple);
> > >  int device_property_read_u64_array(struct device *dev, const char *propname,
> > >                                    u64 *val, size_t nval);
> > >  int device_property_read_string_array(struct device *dev, const char *propname,
> > > --
> >
> > I don't see much value in this change, sorry.
>
> That is fine, I don't have any problem with the helper living
> within our driver instead. Basically the issue from my side is I
> need to read 6 different device tree properties all of which
> require this behaviour, ie. read a variable number of fixed
> groups and check I have whole groups. Open coding this for each
> call is indeed only going to be 5-10 lines of code

Exactly two:

n = device_property_count_u32(dev, name);
ret = device_property_read_u32_array(dev, propname, val, n > nval ? nval : n);

And I would be fine with adding wrappers like this (and for the other
data types too for that matter).

It would take more lines if you wanted to complain about the format,
but as pointed out above, that would need to be done in the caller
anyway.

> for each one  but since there are 6 of them it makes sense to put those 5-10
> lines into a helper and have 5-10 lines not 30-60 lines. Seemed
> the helper might be generally more useful, but if it is not then
> it can go back into the driver.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
