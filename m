Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61D98BC33
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3796CD8;
	Tue,  1 Oct 2024 14:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3796CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786231;
	bh=gmYT3Xhb1sy7FpiYtJile2lqEnWT1QUgxCz2yd0yloI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aSZX9FhcsEsi1o4BU4gNdex1uC2JiqSI9SoJ4DA58LfTkqfV8jbq1DlDPF/W8bJQh
	 ito8wnVylo44a9DBya/21qIYnZKUydGCLAEOdnLb5SRqpxQTiwkBnnpg1m2rQjaClD
	 KJHtITALgPfeGayWvRHut8T3f9bUZdhCWrbGYibU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DED51F806AA; Tue,  1 Oct 2024 14:35:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 368F4F806AA;
	Tue,  1 Oct 2024 14:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8022F802DB; Wed, 25 Sep 2024 02:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC220F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 02:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC220F80107
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 48P0mAe2019775
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Sep 2024 20:48:15 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.18.1/8.15.2/Submit) id 48P0m5gn019774;
	Tue, 24 Sep 2024 17:48:05 -0700 (PDT)
	(envelope-from ehem)
Date: Tue, 24 Sep 2024 17:48:05 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Ariadne Conill <ariadne@ariadne.space>,
 xen-devel@lists.xenproject.org,
        alsa-devel@alsa-project.org, stable@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZvNdxXCNu4Uc5gc_@mattapan.m5p.com>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <Zt9UQJcYT58LtuRV@mattapan.m5p.com>
 <8734m77o7k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734m77o7k.wl-tiwai@suse.de>
X-MailFrom: ehem@m5p.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SIITHW743D3YR74PNLMHUM6OPKXJN43O
X-Message-ID-Hash: SIITHW743D3YR74PNLMHUM6OPKXJN43O
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIITHW743D3YR74PNLMHUM6OPKXJN43O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 10, 2024 at 01:17:03PM +0200, Takashi Iwai wrote:
> On Mon, 09 Sep 2024 22:02:08 +0200,
> Elliott Mitchell wrote:
> > 
> > On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> > > 
> > > Individual subsystems ought not to know or care about XENPV; it's a
> > > layering violation.
> > > 
> > > If the main APIs don't behave properly, then it probably means we've got
> > > a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> > > which is probably affecting other subsystems too.
> > 
> > This is a big problem.  Debian bug #988477 (https://bugs.debian.org/988477)
> > showed up in May 2021.  While some characteristics are quite different,
> > the time when it was first reported is similar to the above and it is
> > also likely a DMA bug with Xen.
> 
> Yes, some incompatible behavior has been seen on Xen wrt DMA buffer
> handling, as it seems.  But note that, in the case of above, it was
> triggered by the change in the sound driver side, hence we needed a
> quick workaround there.  The result was to move back to the old method
> for Xen in the end.
> 
> As already mentioned in another mail, the whole code was changed for
> 6.12, and the revert isn't applicable in anyway.
> 
> So I'm going to submit another patch to drop this Xen PV-specific
> workaround for 6.12.  The new code should work without the workaround
> (famous last words).  If the problem happens there, I'd rather leave
> it to Xen people ;)

I've seen that patch, but haven't seen any other activity related to
this sound problem.  I'm wondering whether the problem got fixed by
something else, there is activity on different lists I don't see, versus
no activity until Qubes OS discovers it is again broken.


An overview of the other bug which may or may not be the same as this
sound card bug:

Both reproductions of the RAID1 bug have been on systems with AMD
processors.  This may indicate this is distinct, but could also mean only
people who get AMD processors are wary enough of flash to bother with
RAID1 on flash devices.  Presently I suspect it is the latter, but not
very many people are bothering with RAID1 with flash.

Only systems with IOMMUv2 (full IOMMU, not merely GART) are effected.

Samsung SATA devices are severely effected.

Crucial/Micron NVMe devices are mildly effected.

Crucial/Micron SATA devices are uneffected.


Specifications for Samsung SATA and Crucial/Micron SATA devices are
fairly similar.  Similar IOps, similar bandwith capabilities.

Crucial/Micron NVMe devices have massively superior specifications to
the Samsung SATA devices.  Yet the Crucial/Micron NVMe devices are less
severely effected than the Samsung SATA devices.


This seems likely to be a latency issue.  Could be when commands are sent
to the Samsung SATA devices, they are fast enough to start executing them
before the IOMMU is ready.

This could match with the sound driver issue.  Since the sound hardware
is able to execute its first command with minimal latency, that is when
the problem occurs.  If the first command gets through, the second
command is likely executed with some delay and the IOMMU is reliably
ready.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445


