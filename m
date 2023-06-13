Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389472E7A0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 17:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F49BE92;
	Tue, 13 Jun 2023 17:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F49BE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686671470;
	bh=6y3uIMQHh3Xh+Bv9AjWdmW0QTyRI/YTcLq3CZoYBOqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EpVZE298quYwqBHWnYm7p87gCRTZox84yfcPn63BpHnEIGiYp0YwjEcvWdQjtrB2N
	 UN+uDlZ36qnd++n1cAMkob7OWKz/H39XVyCJ6oTvpOTe56KcOB3k1JLE/ZzQ8C05Vh
	 uQZlwoqRfpXLb7wElDfZqgB3PZxp3DgDeMV3aqtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5D15F80301; Tue, 13 Jun 2023 17:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CFFF80132;
	Tue, 13 Jun 2023 17:49:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40CCDF80149; Tue, 13 Jun 2023 17:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24C99F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 17:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C99F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q68y5fp5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FCCC62E97;
	Tue, 13 Jun 2023 15:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352E3C433D9;
	Tue, 13 Jun 2023 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686671386;
	bh=6y3uIMQHh3Xh+Bv9AjWdmW0QTyRI/YTcLq3CZoYBOqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q68y5fp56nvCLUE37GtkHpPEZ5BVQG0cIZYIrpnqql2r6klc+YmEyR0o6hF87p65/
	 8AuUjx2ZqVe2i5OLjmkKV01YvAPsuCpweiQPxdsM3K/LlucnOt33qpUIYCQT2nOPBM
	 FLXQI+jDdnzxo5y/OBc8/hDh7m7g+ufNWk7hHAh6y5qHUnnAbQAsYmg9uZBz9pixcO
	 tNxdLRl9YGRBslp1yAhIKHJFpoYstI/wrgT2Hpbbq5yk5tFeSm9bkaB4au25sIfnk9
	 K40luedlbhHg+NKp+I1emUfQ9XszuLT9gkc+ythM/UnkXi6eecOD1gnIuTfgkIhBPI
	 NzAgORb5gNQzw==
Date: Tue, 13 Jun 2023 16:49:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
Message-ID: <60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
 <87v8fua1qm.wl-tiwai@suse.de>
 <877cs7g6f1.wl-tiwai@suse.de>
 <e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
 <87v8frcueb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MFURhVHYtC0zxDNS"
Content-Disposition: inline
In-Reply-To: <87v8frcueb.wl-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: 2UU6DSZXISBQNQ4AYOM2SAC25WTXE7B5
X-Message-ID-Hash: 2UU6DSZXISBQNQ4AYOM2SAC25WTXE7B5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UU6DSZXISBQNQ4AYOM2SAC25WTXE7B5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MFURhVHYtC0zxDNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 04:24:28PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > BTW I was just looking at reg_raw_update_once() and I can't figure out
> > why it's trying to do what it's doing - it does a read to check if it's
> > seen the register before and then does an _update_bits() if the register
> > hasn't been cached yet, apparently trying suppress duplicate writes but
> > possibly deliberately discarding changes to multiple bitfields in the
> > same register.  That's not what the non-regmap path does, it'll only
> > discard noop changes to the same bitfield.

> Yes, it's a quite hackish way of optimization of the initialization.

> Since HD-audio codec has no known default values unlike normal codecs,
> it needs to initialize itself only at the first access, and this
> helper does it.

Ah, if it's just suppressing the write the code should just be removed.
regmap_update_bits() already suppresses noop writes so unless we might
write a different value to the register later the effect will be the
same.  I can send a patch.

--MFURhVHYtC0zxDNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIkBUACgkQJNaLcl1U
h9AT6gf8Dy9pHA3YE2wF963NjaOfpfoWJmQ8BzJnV72kAvR+CEl+SR0lmgOk8wqF
gS/B69Kd+VGjm0yQJF+ewRNM0j30penApfD1viKUEB+uIpcj4eTP8e9WVRNU+t+1
Uh1Nc/1G/szZFAtv4N/I+k3I/MJSLaKPiJuB6yXBtJStmKZjnxCEj8yJSA4Ei+sA
/o2oADTCY2HAggZknctLJt7Jpd6wMUtMYxwd1niKRlJ3gasQ8orSGivZS+919xW7
t3e9u4sX7t1lyKQToY+Eintx2Uo/ZdZpuCxQxkt7fd/Chy4SAoAR6o3zOC3OjD8p
TG/68NjIRFUmTYCNpFlFjblovjUZ7g==
=cAOZ
-----END PGP SIGNATURE-----

--MFURhVHYtC0zxDNS--
