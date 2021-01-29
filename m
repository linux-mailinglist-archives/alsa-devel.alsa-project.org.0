Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C03089D8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:23:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48F182C;
	Fri, 29 Jan 2021 16:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48F182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933821;
	bh=oL6ba7KWG9+2C5z8wWWJZg48xBVRHFXOdQKph/IkTLA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwzFjhX9sMqJ8ait32dRkjb94RV4Fe41NTHqil8KDqelHfcN5aI/d20tYtmbJ6m6h
	 i0kWHi7jaq26uQdEj9EemIZMk4cFjidMyrDaCZ/rjVmmkp3uBC2Jv9MvRO9Rd4tffi
	 5dvPi6QZdHe3Y4RKiXZw/23TmnhmAIRgqKytTLF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A321F800E9;
	Fri, 29 Jan 2021 16:22:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB050F80259; Fri, 29 Jan 2021 16:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D01BF800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 16:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D01BF800E9
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id c4826065
 for <alsa-devel@alsa-project.org>;
 Fri, 29 Jan 2021 15:22:02 +0000 (UTC)
Received: from baphomet.hell (localhost.hell [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id 36fced15
 for <alsa-devel@alsa-project.org>;
 Fri, 29 Jan 2021 15:22:01 +0000 (GMT)
Received: from base.nu ([192.168.178.2]) by baphomet.hell with ESMTPSA
 id XhNCHBkoFGA8VQEAnQSWfg (envelope-from <livvy@base.nu>)
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 15:21:56 +0000
Date: Fri, 29 Jan 2021 15:21:48 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Message-ID: <20210129152043.toc3rxiu37ormrac@base.nu>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
 <3031135.XsSY7s2paC@artex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3031135.XsSY7s2paC@artex>
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

Hi Fabian,

On Fri, Jan 29, 2021 at 03:09:11PM +0100, Fabian Lesniak wrote:
> Hi Olivia,
> 
> perfect time for this patch since I'm currently working on similar quirks for
> the DJM-900NXS2 model. I will stick to your method for now. I do have some
> minor comments below.
> 
> In general, I'm wondering whether it is a good way to implement more and more
> Pioneer devices in such a hard coded way. mixer_quirks.c already has >3k LOC,
> and the 900NXS2 support will add at least 100 more if written in the same
> scheme. It may be good to either dynamically create controls depending on the
> model or move pioneer support to an extra file. I'd like to hear what Takashi
> thinks about that.

I also wish to reduce the amount of device-specific configuration and do
have a (different) patch that aims to do this however it is incomplete.
The current lifecycle for creating, updating, getting option info and so
on made this challenging and so it needs futher thought. In particular,
the choices are enumerated by index (see the  ..._controls_info()
function) meaning it makes it hard to have canonical values.

Ideally, we should direct ..._controls_create to a flat structure that
only contains the input types for each channel. The wValues and wIndexes
can be derrived.

> Cheers
> Fabian
> 
> > +static const struct snd_pioneer_djm_device snd_pioneer_djm_devices[] = {
> > +	{ .name = "DJM-250Mk2", .controls = snd_pioneer_djm250mk2_option_groups, .ncontrols = 7},
> > +	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5}
> > +};
> These fixed values for ncontrols can easily be overlooked, consider ARRAY_SIZE
> instead. Maybe introduce a macro similar to snd_pioneer_djm_option_group_item.

This was a concern, I will change this.

> > +	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
> This makes a local copy, which can be avoided by using a pointer instead:
> const struct snd_pioneer_djm_device *device = &snd_pioneer_djm_devices[device_idx];

Thank you.

> > usb_mixer_interface *mixer, u1 err = snd_usb_ctl_msg(
> >  		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
> >  		USB_REQ_SET_FEATURE,
> > -		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> > -		snd_pioneer_djm_option_groups[group].options[value].wValue,
> > -		snd_pioneer_djm_option_groups[group].options[value].wIndex,
> > +		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> > device.controls[group].options[value].wValue,
> > +		device.controls[group].options[value].wIndex,
> >  		NULL, 0);
> Rather keep these arguments aligned.

Yes.

> > -		err = snd_pioneer_djm_controls_create(mixer);
> > +		err = snd_pioneer_djm_controls_create(mixer, 0x00);
> > +		break;
> > +	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
> > +		err = snd_pioneer_djm_controls_create(mixer, 0x01);
> >  		break;
> I'd introduce defines for the different models instead of raw values.

I agree, this currently may create the potential for dereferenced
NULL pointer if the index points to a non-existant item in
`...control_devices[]`. 

Thank you for your comments Fabian.

Kindest regards,
Olivia


