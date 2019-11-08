Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411BF5496
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 20:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF7C82B;
	Fri,  8 Nov 2019 20:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF7C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573241170;
	bh=Vyg6rV++BELoRbUk/vvckUnJ7o06aK6OinQSRZwe1lQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryyRzOIZwiW6mRsevopuzZnXTPopzhH6pAUbKLh9YTglQQDOrl5B/9ZA5qpHjjOu6
	 GVTbkbB1yJ7UTMwh2SNswn+T8gEGDX8EmgZu3h9ZKls7Qrh/S42vBfh6/rz5v2TR0c
	 42jrUlEc0He7b3BuE0xZy1K2Q0V7oYHC0RXiua34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC4DF8045F;
	Fri,  8 Nov 2019 20:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A388F803D0; Fri,  8 Nov 2019 20:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 368EBF80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 20:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 368EBF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="PgK/JGZ6"
Received: by mail-qk1-x741.google.com with SMTP id z16so6283397qkg.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 11:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CcplzS+Qr/k6cNheo/dlS9IutQvmAmj3JsEpq3iLK7A=;
 b=PgK/JGZ6Io1Y/IwWgZ+u5UBcfspAQ7QFtLq8kQIYjjmcOBIRm5F8QwCZsf1NJUwtFt
 eEpJmedQi6YZw/73/McEO/Dk+zKKz5kPK3PXr+/eKMjv2Qo5zFDYVlvlCMD8Y86PHqkM
 n41oHftkp130mc1o3J25FpznWmJ8fjd0fsGOXWIY03jGBOrLNLJA6W23jWXNP38C4mTO
 5Izvmjg5MNS7aWZ90u+6WgMtOGz6i56bRA3leV7c8B1uA8crtvDQGnblCNbRKkhbnKNr
 wT9RfSeIdHmaOXb4t5ZYCODIYMrExaRrVjdDM/eMYGqO7xnewxIPVj0XxZUE+Mgxdmv4
 l6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CcplzS+Qr/k6cNheo/dlS9IutQvmAmj3JsEpq3iLK7A=;
 b=d0SIqfzp1urYW3fT1uc/9qkSowBhD4OfEjwW84WU9ji4BhJs0YFHDV0QQgq69mPADl
 3ibUiIcIJegbC3Q7Z2WA3qFqia5kYKbXlysp+POHYRBl8q8dXi+f/xGz8Z63AVJyJNkE
 bgEqMbmNZYf4OPqzR4CMSZOJv0bqv+DDA0mhiyCdWOMjahQa8mfdTvX/VA7yIgcBWHK+
 qFwZBF3n2Z0efL37/zNpo7BrWBIiE0+nEXpDcNN3IC9hIdQ1UNuwsLomOEwf0N3ZRnaY
 SHuNEq3bXkLPslbxL8D8QyPiEHCeH3O5pQ7ktxgPHtLjXzYucy/FnQ6oCA7GIHXfAJkO
 gmNQ==
X-Gm-Message-State: APjAAAXFRoJGWNZs9A2GtK96ikB+sbttNtsxzUeqXbMvxHRITFu+USwf
 Qa3HvaMuU72LVP7MgxCjO3aSDbvn7lNMH9cUff0NEw==
X-Google-Smtp-Source: APXvYqz3OLbfiRdOYec1YLAjVPZkQV0JD+u1jV3L01hcqeZMweCS1dzOd+urC+iBLOb0mTnKrb9wPXaDJUVmHh7xg0M=
X-Received: by 2002:a37:8806:: with SMTP id k6mr10221777qkd.127.1573241057517; 
 Fri, 08 Nov 2019 11:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
 <20191101173045.27099-4-pierre-louis.bossart@linux.intel.com>
 <123e11ae-d22c-a54e-283f-a3b4e002c0c7@intel.com>
 <5930ecb1-5651-abd7-d031-a010f788100e@linux.intel.com>
 <a03b1823-c390-3480-c45b-793ee3dab453@intel.com>
In-Reply-To: <a03b1823-c390-3480-c45b-793ee3dab453@intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 8 Nov 2019 11:24:06 -0800
Message-ID: <CAOReqxih-bDe=JZcrkCffUP1M_Tsjr_4_KiP_M1NfP+67tF-3g@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 03/11] ASoC: Intel: add mutual exclusion
 between SOF and legacy Baytrail driver
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

On Fri, Nov 8, 2019 at 9:45 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2019-11-04 22:52, Pierre-Louis Bossart wrote:
> >
> >
> > On 11/4/19 2:18 PM, Cezary Rojewski wrote:
> >> On 2019-11-01 18:30, Pierre-Louis Bossart wrote:
> >>> This legacy driver is already deprecated, let's make sure there is no
> >>> conflict with SOF.
> >>>
> >>> Signed-off-by: Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.intel.com>
> >>
> >> Pierre, with SOF replacing /atom and /baytrail for BYT platforms, is
> >> /baytrail (legacy) used on any of the setups officially? While @ IGK
> >> I'm playing with anything from HSW up to TGL and above, /baytrail gets
> >> skipped entirely, even here.
> >
> > The legacy Baytrail driver is still used by Baytrail Chromebooks, and
> > that choice is not something we control. If Google transition to SOF for
> > Baytrail, then we can remove this driver altogether.
> > The Atom Baytrail driver is enabled by default (default ACPI). Only when
> > we have support for Baytrail-CR can we deprecate Baytrail/Atom.
> > Does this answer to your question?
> > -Pierre
>
> Thanks for explanation, Pierre. Indeed it does.
> I hoped Baytrails are getting updated together with Cherrytrails, oh well.
Should I get the chance, I fully intended to promote baytrail to SOF,
unfortunately I also have a lot of other projects I am balancing.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
