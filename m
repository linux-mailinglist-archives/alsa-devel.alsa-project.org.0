Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF517FC73
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 16:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBCB5175E;
	Fri,  2 Aug 2019 16:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBCB5175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564756955;
	bh=6UQ/iq5rj5enfJaN68WBnNS75QXCVHGo4CaN+H8FsGU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yva2m6p7E9dPVZKn9SxtDEjUtSGpWVQ2gsZ/aNpOt1E5O47HmVcTHKCAFtVu8fYry
	 GyQ0E2bysCCR0x9nuOJ/OFe4iIPjt8vhHUgOOe/ohyyEt9kJmAITGQNJt0u9qAA68w
	 pRkBCj3qEFADMmEayla4SEdc+miFMl5RHW0W2nkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD6EF8049B;
	Fri,  2 Aug 2019 16:40:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20502F8048F; Fri,  2 Aug 2019 16:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76D3F800F3;
 Fri,  2 Aug 2019 16:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76D3F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 07:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="174937762"
Received: from aratajew-mobl.ger.corp.intel.com ([10.251.82.93])
 by fmsmga007.fm.intel.com with ESMTP; 02 Aug 2019 07:40:38 -0700
Message-ID: <e59de17f39d65f0cef1249517ef1fdd374f399dd.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Date: Fri, 02 Aug 2019 15:40:38 +0100
In-Reply-To: <b7fae370-de17-f73c-c2a4-852acf6b31bc@perex.cz>
References: <CAD8Lp45Bp1xVC7NjuNaANA7kAEN2Edshw+cViaTF3tRZEumgZA@mail.gmail.com>
 <cc9fa5b52138daffb09dc5b66ea9248379c9f60e.camel@linux.intel.com>
 <CAD8Lp46GW8n8K7ttOeSje_au06BsyvCp4seVwj2wNbipei5ssA@mail.gmail.com>
 <a4b17a75-d4e0-fc6b-a286-aa6b7b281b7d@linux.intel.com>
 <CAD8Lp444soO1i8mWF73eucT16yAhy2js1byWJCTV5fn=TikHBg@mail.gmail.com>
 <9e8b667f1aa2333dbcc34b5253372d1a8667551e.camel@linux.intel.com>
 <ee34f820-0753-dfbe-09c0-7147cf229cc0@perex.cz>
 <6493f195-eb5a-1a6d-2c31-e3a4123b2ad1@linux.intel.com>
 <7c940d90-297e-19c0-2f74-1843439d5ccf@perex.cz>
 <d41b02286db2a827648d1c1ec793bbd0a55e99c1.camel@linux.intel.com>
 <8dceb60b-35a5-93e9-ce01-1eb852e93f44@perex.cz>
 <0059ed8e8f2fbd7ffbc258ca53ce5efbf1885c5b.camel@linux.intel.com>
 <1718d316-4c65-a39d-53dd-7f40f0e49e28@perex.cz>
 <1e7adedf-e12a-d409-12cf-9087cf6dbf30@linux.intel.com>
 <b7fae370-de17-f73c-c2a4-852acf6b31bc@perex.cz>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [Sound-open-firmware] Signed firmware availability
 for kbl/cnl
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

On Fri, 2019-08-02 at 10:21 +0200, Jaroslav Kysela wrote:
> Dne 31. 07. 19 v 20:14 Pierre-Louis Bossart napsal(a):
> > On 7/31/19 12:29 PM, Jaroslav Kysela wrote:
> > > Dne 31. 07. 19 v 15:23 Liam Girdwood napsal(a):
> > > > + Mengdong
> > > > 
> > > > On Wed, 2019-07-24 at 18:23 +0200, Jaroslav Kysela wrote:
> > > > > > Yeah, been thinking about this atm. It may be better to
> > > > > > package the
> > > > > > binaries (firmware and topologies) as part of Linux
> > > > > > firmware repo
> > > > > > (since the driver expects to load them all from
> > > > > > lib/firmware) and
> > > > > > package the sources (firmware and topology) via sof tarball
> > > > > > ?
> > > > > 
> > > > > It looks good in my eyes, because topology files are another
> > > > > pieces
> > > > > of the
> > > > > driver from the user space perspective. The unanswered
> > > > > question is
> > > > > the UCM
> > > > > configuration which is linked to the topology configuration
> > > > > (if I
> > > > > understand
> > > > > this correctly). I proposed to place an unique
> > > > > identifier/version to
> > > > > the
> > > > > topology file and propagate this identifier to the user
> > > > > space, so the
> > > > > alsa-lib
> > > > > can pick the right UCM configuration when topology changes.
> > > > > The
> > > > > component
> > > > > string (snd_component_add function / struct snd_ctl_card_info
> > > > > ->
> > > > > components)
> > > > > can be used for this identification.
> > > > 
> > > > Apologizes for the delay, Pierre and I have been discussing
> > > > this
> > > > internally as we have to synchronise the deployment of the
> > > > topologies
> > > > and UCMs alongside the FW.
> > > 
> > > My strong point is that the driver with the different firmware
> > > and the
> > > topology file behaves differently from the user space
> > > perspective. It seems
> > > that there is no way to propagate the firmware (and topology?)
> > > version to the
> > > user space at the moment.
> > 
> > The topology may not be enough, e.g. for all Baytrail devices we
> > use the 
> > same simple topology. To pick the right UCM file you really need
> > the 
> > card information which may include the DMI info or some quirks 
> > (mono-speaker, analog mics). The topology is quite static and
> > doesn't 
> > expose anything that is board-specific or may vary between skews.
> 
> Yes, thus we need to use another UCM file (or make some parts
> conditional in
> the UCM config) depending on this and I would like to pass the exact
> hardware/firmware/topology identification which may affect the UCM,
> through
> the ALSA API to the user space level (UCM parser). Think from the
> packaging
> (Linux distributions) perspective. We have to handle all those
> situations, so
> all the configs, pieces to support all hardware variations must be
> prepared in
> the packages.

I think the UCM parser will currently only bail on cdev naming
differences, so I agree maybe something at the top level UCM "machine
global" level that can be used to check FW, topology (+anything else)
so we could bail earlier or warn and attempt to continue.

> 
> Also, the blind fw / topology / UCM relationship without any
> compatibility
> checks might cause issues when the user upgrades only some parts. The
> binary
> topology files might be packaged with the UCM files as proposed, but
> if an
> incompatible DSP firmware will be loaded (it's placed in the another
> package -
> linux-firmware), it should be reported to the user, too.
> 
> > > > Current thinking has changed from shipping FW + tplg via linux-
> > > > firmware
> > > > repo to only shipping FW binaries in the FW repo and using
> > > > alsa-ucm-
> > > > conf.git for UCMs + topologies (since the coupling between UCM
> > > > and
> > > > topology is tighter than the FW coupling).
> > > 
> > > This is fine, but I think that we should have a check
> > > (compatibility
> > > verification) in the user space level, too. More precisely, each
> > > level should
> > > do a verification if it's compatible with the tied level (driver
> > > -> firmware
> > > -> topology -> ucm).
> > 
> > The SOF driver checks if its supported ABI level is compatible
> > with 
> > firmware and topology levels (both files embed the information,
> > which 
> > doesn't have to be identical).
> 
> Ok, but if you add another functionality to the firmware or remove
> some, it
> might break the compatibility with the topology (different ALSA
> controls for
> example), right? I'm not sure if ABI checks are sufficient. It's more
> about
> the overall sound hardware abstraction for the user space (managed
> ALSA controls).
> 
> > I don't see how UCM would be checked since there's no direct
> > interaction 
> > with the driver, e.g. it's used by PulseAudio or CRAS and the only 
> > interaction is through the control and PCM APIs. Likewise UCM has
> > no> knowledge about topology or firmware.
> 
> The UCM parser code in alsa-lib (not applications) can do the check /
> configuration selection. This is exactly what I am proposing to do.
> Actually,
> for example, the UCM parser looks for sof-skl_hda_card.conf file
> without any
> other checks or conditions. You will agree that we cannot support all
> hardware
> variants with this, because some vendors might use other GPIOs etc..
> 
> So my proposal is to pass all necessary information throught the ALSA
> control
> API (struct snd_ctl_card_info -> components) so the UCM parser can
> pick the
> right config file based on the complete identification. It might
> fallback to
> sof-skl_hda_card.conf, but if new hardware variant exist, the file
> name might
> look like 'sof-skl_hda_card-TOPOLOGYID-VENDORID-PRODUCTID.conf' etc,
> etc....
> 

How would we get topology or FW version from the above identification ?

Would we also use semantic versioning to align the UCM with the
topology and FW ? Currently we use semantic versioning for topology and
FW.

Thanks

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
