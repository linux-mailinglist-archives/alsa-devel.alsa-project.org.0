Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0234D3C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 18:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9511691;
	Tue,  4 Jun 2019 18:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9511691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559665694;
	bh=beVeHibyIhKi99XsTq56pcsuT9lVGOV52Winbtc/nDI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osww3kas12WHaHkRfhtD3L40fGFEzq5OK+nLcPOce+GiGFbWm4OmyYlu8XiIdO94H
	 bk2FFpdk/9iylt+w7E9mAu8/NKHYcDGl/P5S5E0NgbgomcF/+wjkKXfhABEi/VB5qg
	 TkDSHkF/yM1Qrw9c2C6Y+ukcrVCBb4xkN27PBqIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97176F8972E;
	Tue,  4 Jun 2019 18:26:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4B2EF89718; Tue,  4 Jun 2019 18:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F82F896FE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 18:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F82F896FE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 09:25:56 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 04 Jun 2019 09:25:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Jun 2019 19:25:53 +0300
Date: Tue, 4 Jun 2019 19:25:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190604162553.GG5942@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Ser,
 Simon" <simon.ser@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [alsa-devel] Linking ALSA playback devices and DRM connectors
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jun 04, 2019 at 05:24:35PM +0200, Daniel Vetter wrote:
> On Tue, Jun 4, 2019 at 5:15 PM Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 04.06.19 um 17:05 schrieb Ser, Simon:
> > > Hi,
> > >
> > > I'm trying to link ALSA playback devices and DRM connectors. In other
> > > words, I'd like to be able to know which ALSA device I should open to
> > > play audio on a given connector.
> > >
> > > Unfortunately, I haven't found a way to extract this information. I
> > > know /proc/asound/cardN/eld* expose the EDID-like data. However by
> > > looking at the ALSA API (also: aplay -l and -L) I can't find a way to
> > > figure out which PCM device maps to the ELD.
> > >
> > > Am I missing something?
> >
> > Is that actually fixed on all hardware? Or do we maybe have some
> > hardware with only one audio codec and multiple connectors?

Certain old i915 hardware is like that. You can drive
multiple HDMI connectors at once but only one of them =

can get the audio. If you try to output audio to multiple
ports at once you get no audio whatsoever. ATM we don't
really handle that case properly.

> >
> > >
> > > If not, what would be the best way to expose this?
> > >
> > > - A symlink to the ALSA audio PCM device in
> > >    /sys/class/drm/cardN-CONNECTOR?
> > > - A symlink to the DRM connector in /sys/class/sound/pcm*?
> >
> > If it's fixed than those two options sound sane to me.
> >
> > > - A DRM connector property?
> >
> > If it's configurable than that sounds like a good option to me.
> >
> > Anyway added our DC team, stuff like that is their construction site.
> >
> > Regards,
> > Christian.
> >
> > > - Somehow expose the connector name via the ALSA API?
> > > - Expose the connector EDID via ALSA?
> > > - Other ideas?
> =

> I think on our MST hw you get a combination of CRTCs x CONNECTORs on
> the alsa side. I.e. for every pair of connector and crtc you get a
> separate alsa pin. This is because with mst, you could have up to
> num_crtcs streams on a single connector. Not sure how to model that.

IIRC the current i915 vs. alsa model is that for SST/HDMI you have
a 1:1 relationship between the port and the pcm device, but with MST
you nave a 1:1 relationship between the pipe and the pcm device.

I think the only way to have any kind of static connector<->pcm
relationship with MST would involve dynamically adding/removing
pcm devices when the correcponding drm connector is added/removed.
If we don't want to/can't add such pcm devices then we'd need to
dynamically change the symlinks/whatever whenever an MST stream
is started/stopped. And probably we should do the same for SST/HDMI
as well, if for no other reason than to make sure userspace is
prepared for it even if they didn't test with MST.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
