Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18F392BC
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 19:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FD81668;
	Fri,  7 Jun 2019 19:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FD81668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559927041;
	bh=CqM6bpvBWLGdYgWaah54W+ellcVJ7xIlhglxy6OCqpk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNjGe6yGRUdel1VRUhPeG/DtmkbcBBj5Jdv0ouXUgJ6dQKdptyW99AksTQCN/cSUl
	 51RGOiJPoAdRxA72ZUjGklC+8uJjDPMrAD6VB+q80D2kBBJmYzajUDRXZ/DXgeToAm
	 FDcNDHEXcmjKZnEbg4lSh2w+GG5rrBCQ1r8PU5QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76B4BF896ED;
	Fri,  7 Jun 2019 19:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6CBCF896DD; Fri,  7 Jun 2019 19:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09C06F8072A
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 19:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09C06F8072A
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 10:02:07 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 07 Jun 2019 10:02:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2019 20:02:04 +0300
Date: Fri, 7 Jun 2019 20:02:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Ser, Simon" <simon.ser@intel.com>
Message-ID: <20190607170204.GA5942@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nicholas.Kazlauskas@amd.com" <Nicholas.Kazlauskas@amd.com>,
 "Harry.Wentland@amd.com" <Harry.Wentland@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
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

On Thu, Jun 06, 2019 at 09:13:51AM +0000, Ser, Simon wrote:
> On Tue, 2019-06-04 at 17:15 +0200, Christian K=F6nig wrote:
> > Am 04.06.19 um 17:05 schrieb Ser, Simon:
> > > Hi,
> > > =

> > > I'm trying to link ALSA playback devices and DRM connectors. In other
> > > words, I'd like to be able to know which ALSA device I should open to
> > > play audio on a given connector.
> > > =

> > > Unfortunately, I haven't found a way to extract this information. I
> > > know /proc/asound/cardN/eld* expose the EDID-like data. However by
> > > looking at the ALSA API (also: aplay -l and -L) I can't find a way to
> > > figure out which PCM device maps to the ELD.
> > > =

> > > Am I missing something?
> > =

> > Is that actually fixed on all hardware? Or do we maybe have some =

> > hardware with only one audio codec and multiple connectors?
> > =

> > > If not, what would be the best way to expose this?
> > > =

> > > - A symlink to the ALSA audio PCM device in
> > >    /sys/class/drm/cardN-CONNECTOR?
> > > - A symlink to the DRM connector in /sys/class/sound/pcm*?
> > =

> > If it's fixed than those two options sound sane to me.
> > =

> > > - A DRM connector property?
> > =

> > If it's configurable than that sounds like a good option to me.
> =

> I'm still not sure whether this is fixed on all hardware or not.
> =

> Ville, on this old Intel hw, is the single connector that gets the
> audio configurable?

The force-audio property can be used for that. That is, you can force
audio off for all the connector where you don't want audio and then
it should get automagically routed to the remaining connector.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
