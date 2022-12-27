Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2317656B6C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 14:46:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C107442;
	Tue, 27 Dec 2022 14:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C107442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672148781;
	bh=rz3uMAjXUtgjTO4lgVlXOKO3ue1KZ7jGfnmeuq3J5Js=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iGVClUHKgwhXHBLDsaaANO1XmRP5pQ1ky9VA/NsfrIaRcaHpKXKUDJYAVG715g84i
	 MJbTZF6vc77l2OineLvhJDZLScECTn3itvgv+U/HNyAzUcDORT0Famx9SEdNYH+nlG
	 NFoMLknLyZ4b6VCaVYRVD6zB50bm5k/hidCX7Acs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B273BF8023B;
	Tue, 27 Dec 2022 14:45:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A58C6F804B4; Tue, 27 Dec 2022 14:45:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA74AF8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 14:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA74AF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=XapDBzzd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B440E6114A;
 Tue, 27 Dec 2022 13:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECE7C433D2;
 Tue, 27 Dec 2022 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672148716;
 bh=rz3uMAjXUtgjTO4lgVlXOKO3ue1KZ7jGfnmeuq3J5Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XapDBzzd/bZ8Mr9cF8NgX64eOKDfmSw6Y7ERRkuEXsBO/tp7dvnoLIqb9N/2kPSJc
 qT9nqMH3v+uDUffDXLsLvnW/Pz48nhnGeHVXohon9StxTJS5DYKaU719Vo61VE7/Hr
 bAyImdXoGvBG3/HEw82VNV5VHPD0AYBixeNBMbbY=
Date: Tue, 27 Dec 2022 14:45:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Message-ID: <Y6r26VfIfpE8zpPY@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
 <Y6bAQ8hDLkvrvjQQ@kroah.com> <Y6rtdy4NPfi/KOqd@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6rtdy4NPfi/KOqd@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 27, 2022 at 01:04:55PM +0000, Mark Brown wrote:
> On Sat, Dec 24, 2022 at 10:02:59AM +0100, Greg KH wrote:
> > On Fri, Dec 23, 2022 at 03:31:49PM -0800, Wesley Cheng wrote:
> 
> > > + * struct q6usb_offload
> > > + * @dev - dev handle to usb be
> 
> > "be"?  What is that?
> 
> Back end.  This is a concept in DPCM which should be reasonably
> discoverable to people working on the audio portions of this code.

Ok, then how is the reference counting logic handled here?  USB devices
can be removed from the system at any point in time...

> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> > All of the code in this patch series is older than 2022 as I know it has
> > been in shipping devices for many years.  Please use the proper
> > copyright year to make your lawyers happy...
> 
> Are you *positive* about this.  Based on some preparatory discussions
> the Qualcomm people had with Takashi and I it seemed like this was a new
> version of existing concepts.  I'm sure they had something already but
> it's not obvious to me that they're just posting the same code.

I thought that this same code has been shipping in devices for a few
years now in the last few Samsung phone models.  Is this not the same
code that is in those devices?

If not, why not, what happened to that codebase that makes it not worthy
of being submitted upstream?

> > > +static const struct snd_soc_dapm_route q6usb_dapm_routes[] = {
> > > +	{"USB Playback", NULL, "USB_RX_BE"},
> > > +};
> 
> > No terminating entry?  How does this not break?  Why do you need to
> > specify the size of the array, that feels like a design bug somewhere.
> 
> It's how the interface works, the number of entries is passed in when
> adding routes.

Ah, you all might want to change that to make it simpler :)

thanks,

greg k-h
