Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546552C06A2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 13:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3980167F;
	Mon, 23 Nov 2020 13:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3980167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606135390;
	bh=vy6emlWziRVHVf8/lXoIbveEmX9svFQ4dtOhPa+MxxA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trgzPdJ+o1MtpPLVRlD1z1nmaXDinSXl7QbYapgazhC4QrLNdjFIQ+2JdSkAQ2zJB
	 7n3skza1PJtM69KBVAvMtpSP76fDyKN/P2PAu2r4dVP+VUSdk3YWccBxQvcQh447BU
	 AG6HMgNTt9GiGZ63Bk5cli/RuHvhshByah3b5t/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68280F80268;
	Mon, 23 Nov 2020 13:41:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CDFF80255; Mon, 23 Nov 2020 13:41:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98047F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 13:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98047F80113
Received: by mail-ej1-f68.google.com with SMTP id f23so23096121ejk.2
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 04:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GPrtMY6OwrhTMTFZ3taFyOwaPYmLyv2VpU7rochRReg=;
 b=SM/PKiGSw42bpPe2O9QTvwocbJguek1g6bWwT5Xpj6fQRswIJasHCq0zk69/61lgXf
 8wfQIxH0yQ3yJacuHB+WS+j4Rn25s97U/CPRujnIBPXnGj/dtMXLjSg4p2WLpPskJVER
 WTqCdR8zs8tgn60+uw4MlJ8VYynZHBjHU4SenBhRNkha3sJbT/bDtgIpwIhSE5gjt+gZ
 ShgwcLkxdfMPoFr8tzdj/529I733zzg77JVGQ2nQiz3Voyad+XMhinwESvifhFNaT2dM
 ItXg4UFiTzXzP17m3k7UuMcYpZcKTc8Jth4RfJScNN8iRugZRmKRwS2DSjSyHJN/3xTz
 Dadg==
X-Gm-Message-State: AOAM531Hvdc0G1io1XbLFyZckbMYbLC1iLZzR/CuXVYvv3Q+XnsSzM7m
 /CIrGfKaiCuXyhAgnF5awkk=
X-Google-Smtp-Source: ABdhPJweTjHhkqFH1VFPyqJ/7+x5kCjNmVPNdbpMvAkswnuUiZsYEq13Ali5w0h7nyDPSgAbrxkeog==
X-Received: by 2002:a17:906:f8c5:: with SMTP id
 lh5mr46230675ejb.77.1606135291740; 
 Mon, 23 Nov 2020 04:41:31 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id y15sm4946855eds.56.2020.11.23.04.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 04:41:30 -0800 (PST)
Date: Mon, 23 Nov 2020 13:41:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123124129.GA170000@kozik-lap>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
 <20201123123731.GA6322@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201123123731.GA6322@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Mon, Nov 23, 2020 at 12:37:31PM +0000, Mark Brown wrote:
> On Mon, Nov 23, 2020 at 12:48:32PM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 22, 2020 at 11:59:20AM +0100, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 20, 2020 at 08:04:29PM +0000, Mark Brown wrote:
> 
> > > > Surely if that's the desired outcome the fix is to change the definition
> > > > of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
> > > > perhaps hidden behind a config option for PRP0001?  That seems better
> > > > than going through the entire tree like this.
> 
> > > That could be indeed an easier way to achieve this.
> 
> > ...easier and wrong in my opinion. Not all drivers need that.
> > What the point to touch it in the driver which is OF-only?
> > (For IP which will quite unlikely to be present in ACPI world)
> > Or if the device will get the correct ACPI ID?
> 
> That feels like something that should be done with Kconfig dependencies
> like a direct OF dependency (possibly a !PRP0001 dependency?) for the
> driver or possibly with having a variant of_match_ptr() for things that
> really don't want to support PRP0001.  Just removing all the use of
> of_match_ptr() is both noisy and confusing in that it looks like it's
> creating issues to fix, it makes it hard to understand when and why one
> should use the macro.

For the OF-only drivers (without other ID table), there is no point to
use the macro. Driver can bind only with DT, so what is the point of
of_match_ptr? To skip the OF table when building without OF? Driver
won't be usable at all in such case. So maybe for compile testing?
There is no need to remove OF table for simple build tests.

Best regards,
Krzysztof

