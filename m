Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC591D641
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 04:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5648822AF;
	Mon,  1 Jul 2024 04:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5648822AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719802036;
	bh=T+3QnOE1arN4m86oKGlpqiNveo+rq531LTN9zwAwCYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m9dAH3TYSbGHRfZ+PzjeESZftdEHcjuOwedY0Uev2N8ph6nrzC818zZuAyMCdnF6H
	 t041XscProHi8K4LMsM8xfxyrsfFVc0Z8PLnyP15qvIkW24c7/JICPKE4a4CxlshKE
	 70DaQNc8Y5IYptb8zJwBeQo6biFCTKPLy86QM9kY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8302F805AE; Mon,  1 Jul 2024 04:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26556F805AF;
	Mon,  1 Jul 2024 04:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20154F8042F; Mon,  1 Jul 2024 04:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66489F80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 04:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66489F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=Mam3VS2P
Received: by m.b4.vu (Postfix, from userid 1000)
	id F0BFF60076C6; Mon,  1 Jul 2024 12:15:41 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu F0BFF60076C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1719801941; bh=XPGvHpTa6O0lJhx0PEo3ZlDgLpN7Ol9w+Fc3Zy2w1mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mam3VS2Pq9+neyJXeKQiIF7TP611434uXKT2cZwZ6oAKFWPjLCyNEvItuRXpxdN2t
	 13s3RgXDmDdn8d5HhllTlKru770jbLWZG6jE7JO6ZVcggsyJ/sVWF8xMactv+ovuDF
	 cgmGgf/m4D+lp1Sgxrx+X42LInWo/KVvZe+bV1twgI4gJCzUAhyuq8kY7yO5pxPECU
	 g4LwF74+3HunndMqALrLoJ93Ox6Ht2HUXynufouhLWjdAs2zjWMtJqvTpM6Xl/vsM0
	 U/g7JcfeR0qSiHMx6aAuhM8JE2aw7qo65rpvc8BNxxwQB5RsfauQ8292OC7AxAZDTj
	 bc9fAhsETPKFw==
Date: Mon, 1 Jul 2024 12:15:41 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Asahi Lina <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Message-ID: <ZoIYVVB+zDP78Apd@m.b4.vu>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Message-ID-Hash: XKYKH6MJS3GVKAEIMESLR5EAQFUJOOV6
X-Message-ID-Hash: XKYKH6MJS3GVKAEIMESLR5EAQFUJOOV6
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKYKH6MJS3GVKAEIMESLR5EAQFUJOOV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lina,

On Mon, Jul 01, 2024 at 01:04:41AM +0900, Asahi Lina wrote:
> Hi,
> 
> I'm reverse engineering and implementing support for the RME Digiface
> USB, which is an ADAT interface with a non-class-compliant interface
> (probably similar to other RME interfaces like the MADIface, but I don't
> have any others to test). The basic audio streaming works fine with an
> entry in quirks-table.h and a format quirk to set the system sample rate
> in quirks.c. Now I need to figure out how to implement the mixer controls.
> 
> Currently I have the snd-usb-audio driver claiming only interface #0
> (streaming) and I use a Python script to control the mixer/settings
> directly with libusb (control transfers and interface #1). This works
> fine and there's some prior art for this in the firewire world (for
> example, snd-dice doesn't do any mixer control stuff and you have to use
> ffado-mixer to control everything from userspace) but I assume it's not
> really the best way to go?

I'm the developer of the Scarlett2 driver. Doing as much as possible
through ALSA mixer controls has worked well in my experience; as you
say, being able to do save/restore with alsactl is useful.

> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.

Note that mixer controls may have more than one value. So I think you
could have 66 controls with 34 values or 34 controls with 66 values or
1 control with 2244 values.

> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.

I handle the VU meter feedback in the Scarlett2 driver with a
read-only volatile control that contains multiple values (see
scarlett2_meter_ctl).

Regards,
Geoffrey.

> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.
> 
> System settings/general status/output faders go via control transfers,
> while interface #1 has an interrupt IN endpoint (streaming state
> feedback, not very useful) and two bulk endpoints (matrix mixer control
> out, VU meter data in). There's another pair of bulk endpoints in
> interface #2 which I'm guessing are for firmware updates (I haven't
> looked at that part). So in principle it's not crazy to expose all the
> system controls/output faders as mixer controls in ALSA and leave
> interface #1 entirely unclaimed so a userspace program can directly
> configure the matrix mixer and access VU meter levels. There is a global
> mixer enable bit (controlled via ctl transfer), so if that is exposed as
> an ALSA control and disabled by default the interface will operate as a
> 1:1 in/out interface without needing any custom userspace to configure
> the mixer.
> 
> There's one other quirky thing: it also needs a way to set the sample
> rate as a mixer control, because you need to be able to configure the
> rate even when the PCM device is not open (since that affects
> stand-alone mixer operation). I imagine the right logic here would be to
> have a selector control for the system sample rate, and automatically
> change it and lock it when the PCM is opened with a given rate?
> 
> Any thoughts welcome ^^
> 
> ~~ Lina
