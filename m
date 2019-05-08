Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA417047
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 07:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E131815;
	Wed,  8 May 2019 07:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E131815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557292251;
	bh=QrurTvaOu5M/bKGl/xqBh7iwPOsyRAokqEo0lOuJfKo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEU6uOfg70+80Apyd0jJvPWF0VuEx6p14RUZOwiJRBaXnJbnqwv+WjNuFKhVDTdSg
	 mz7YnfWnpj+7+JFV51ZIe2jez4dwspP58mSJXmLdFWUE61jPBiKuz8lXG31Z1oc+wU
	 983K8Hsq3fNosuS/38OOrVn6av8T9fgIevKg1t9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2EDF807B5;
	Wed,  8 May 2019 07:09:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D54EF896F0; Wed,  8 May 2019 07:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2F2CF807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 07:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F2CF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sKaY6zZg"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31A7E21019;
 Wed,  8 May 2019 05:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557292138;
 bh=6EAUU0AUTC7X9iBEO1VIpBKIyIh1YXBLEZRE4PQyIxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKaY6zZgJM9LuNoTVrGvVCn/I8NTde29IIcjXwudmaRYRbcu5cBjraGl43uShA498
 uHrIJtsL50CoQuKuMppPSiLhmRGyFolhrv/EYGQ0hyTTDDHXSfpHhaIp+J6qGVnMcs
 2wNdQQVaWeWCT5f/AVaWmOiBsnR9ABgH43S0PSL8=
Date: Wed, 8 May 2019 10:38:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190508050853.GT16052@vkoul-mobl>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
 <20190507122651.GO16052@vkoul-mobl>
 <47fd3ca6-6910-f101-9b63-f653cd1443f9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47fd3ca6-6910-f101-9b63-f653cd1443f9@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/8] soundwire: intel: filter SoundWire
 controller device search
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

On 07-05-19, 09:43, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/19 7:26 AM, Vinod Koul wrote:
> > On 03-05-19, 19:29, Pierre-Louis Bossart wrote:
> > > The convention is that the SoundWire controller device is a child of
> > > the HDAudio controller. However there can be more than one child
> > > exposed in the DSDT table, and the current namespace walk returns the
> > > last device.
> > > 
> > > Add a filter and terminate early when a valid _ADR is provided,
> > > otherwise keep iterating to find the next child.
> > 
> > So what are the other devices in DSDT here..
> 
> this is what I see:
> 
> Scope (HDAS)
>         {
>             Device (IDA)
>             {
>                 Name (_ADR, 0x00020001)  // _ADR: Address
>             }
>         }
> 
> I thought this was nonsense but your question triggered me to look into the
> Intel SST ACPI specs (not public I am afraid but shared with the OS who
> shall not be named).
> Using the same source of information as below, I *believe* this is HDaudio
> related, bits 31..16 mean HDaudio with codec SDI 2, and NodeId 1 for the
> function group. This would make sense as I believe there are two codecs on
> the board that can be pin-strapped to boot either in HDaudio or SoundWire
> mode- but this is a conjecture only.
> 
> At any rate, we need a hardware rework and mutual exclusion between HDaudio
> and SoundWire, so we have to ignore this one when SoundWire is enabled.

That is how I was expecting it to be...

> > > +	/*
> > > +	 * On some Intel platforms, multiple children of the HDAS
> > > +	 * device can be found, but only one of them is the SoundWire
> > > +	 * controller. The SNDW device is always exposed with
> > > +	 * Name(_ADR, 0x40000000) so filter accordingly
> > > +	 */
> > > +	if (adr != 0x40000000)
> > 
> > I do not recall if 4 corresponds to the links you have or soundwire
> > device type, is this number documented somewhere is HDA specs?
> 
> I thought it was a magic number, but I did check and for once it's
> documented and the values match the spec :-)
> I see in the ACPI docs bits 31..28 set to 4 indicate a SoundWire Link Type
> and bits 3..0 indicate the SoundWire controller instance, the rest is
> reserved to zero.

So in that case we should mask with bits 31..28 and match, who knows you
may have multiple controller instances in future
I had a vague recollection that this was documented in the spec, glad
that in turned out to be the case.

Btw was the update to HDA spec made public?

> > Also it might good to create a define for this
> 
> I will respin this one to add the documentation above, and only filter on
> the 4 ms-bits. Thanks for forcing me to RTFM :-)

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
