Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7972E8B3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9533BEAA;
	Tue, 13 Jun 2023 18:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9533BEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686674540;
	bh=v8zZHGVC82PBfUYoSB6keV2P14ZvTtaoalbMHZyNcMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DOLZlYCI+v8XTvlHVKpg+ffo+wEpEBF8kBGHXPU+zttQ3XbxFWadFQMbTbzcPEtYQ
	 RzKVtVPE6BMyU1/GxCHQO40iK1HRqYq2JD8l1gQV4KGPCAYc+VjWGVQa/+LbDNcXjS
	 R26+z38A+Bi23aJmYpQi2TdnwSciQwg0Usdiqth8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD870F80549; Tue, 13 Jun 2023 18:41:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB2EF80149;
	Tue, 13 Jun 2023 18:41:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B88AF80155; Tue, 13 Jun 2023 18:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32CDBF80132
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32CDBF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hjoex1jA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8966C62323;
	Tue, 13 Jun 2023 16:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ABFC433D9;
	Tue, 13 Jun 2023 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686674480;
	bh=v8zZHGVC82PBfUYoSB6keV2P14ZvTtaoalbMHZyNcMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hjoex1jAVU2+UpyM65EDyOPodF8LaEw21LLINKzgj70i7ayz4V7rcce0M1XfzV8/K
	 XRefFqnlb0LA4dswZyXhS/agMa+9sbnev5BD4untQ3k4+BxubCniGGSmf6HUfN1Nvr
	 rAvDUAm5O3rnNNe+41OC7gzrvQtCLUcG6XZ/vNG9XVxXoGyKndTAgmGnSQFcaOKXtV
	 /UX1eMSNL2GHIZEq2TfnhH6mhxmoQjmr/NddWNu8jNXj5Dtvu3veGgYthhW3NzWe9i
	 +Skvwbk9SLqJuQiAmPSOSoGG5HiqQDDPDSBIM/Ldpgzlva5ECZ3uHfc82UuDCUb70n
	 okTZHPasd2RgQ==
Date: Tue, 13 Jun 2023 17:41:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
Message-ID: <18bcfcba-a6ce-4595-bd2b-4d4ba761fd58@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
 <87v8fua1qm.wl-tiwai@suse.de>
 <877cs7g6f1.wl-tiwai@suse.de>
 <e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
 <87v8frcueb.wl-tiwai@suse.de>
 <60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
 <87a5x3cp9r.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DL3D8ElAXVMbfhcB"
Content-Disposition: inline
In-Reply-To: <87a5x3cp9r.wl-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: WI763IEOTJPP3LJTOLN7XNGW5MACBJVD
X-Message-ID-Hash: WI763IEOTJPP3LJTOLN7XNGW5MACBJVD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI763IEOTJPP3LJTOLN7XNGW5MACBJVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DL3D8ElAXVMbfhcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 06:15:12PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Tue, Jun 13, 2023 at 04:24:28PM +0200, Takashi Iwai wrote:

> > > Since HD-audio codec has no known default values unlike normal codecs,
> > > it needs to initialize itself only at the first access, and this
> > > helper does it.

> > Ah, if it's just suppressing the write the code should just be removed.
> > regmap_update_bits() already suppresses noop writes so unless we might
> > write a different value to the register later the effect will be the
> > same.  I can send a patch.

> Oh, I'm afraid that we're seeing different things.  The code there is
> rather to *set* some initial value for each amp register (but only
> once), and it's not about optimization for writing a same value
> again.

> That is, the function helps to set an initial (mute) value on each amp
> when the driver parses the topology and finds an amp.  But if the
> driver already has parsed this amp beforehand by other paths, it skips
> the initialization, as the other path may have already unmuted the
> amp.

> Or I might have misunderstood what you mean about _update_bits()...

So it is possible that we might set two distinct values during setup
then and we're doing this intentionally?  It's not obvious that this
might happen.  A comment wouldn't hurt, and a big part of this is
confusing is that in the non-regmap case all we're doing is suppressing
duplicate writes, in that path it's just checking for changes in the
register value.

None of this is what the non-regmap path does, it just suppresses noop
writes to the hardware.

--DL3D8ElAXVMbfhcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSInCoACgkQJNaLcl1U
h9Cupgf/fCfGNrjBuCwi0HFbU+sF01lqVpZ/K8KgOXR1+Vm4SY74+qskM1B8pGMt
vjQIXMHy0tJaNBTGguZKFwXyk437A8lyZz0PncVJ77AX979DzQedxVowx+42NWBc
iJ5/qEEaWkwPloOow10gbRYN0GQqTvEEnf3Sr3JCqOmpMX/wIT8WVgkHMF7QZyNT
T7rl9SQATqxTiHvbRdZnLsP5q+XokcC58usEhgWy51KIzJbcbfWXdLWKB76L8/vw
GxAg+TKnyYO3/DWY6bBtxw7jLLGmJsdnNM8osURlW9SbEwVp4nKsz9f1iOyiNVmX
2H8vNN4PpZaoz4DjBpPjzuc2YG3Z2w==
=8X4L
-----END PGP SIGNATURE-----

--DL3D8ElAXVMbfhcB--
