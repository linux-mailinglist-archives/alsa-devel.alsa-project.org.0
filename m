Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACD7AEFBB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 17:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DBB99F6;
	Tue, 26 Sep 2023 17:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DBB99F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695742262;
	bh=2Jb5MLyd3rbl26MU5nCagQLymqLt7wlawNMs49LT7rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UPC+6xFXjo2GSoGW8dmeUC8ZDtffZc0F5iKLIzyKV7YEV3eGdgGtnwzO6hC3BHWI+
	 PdXPDcFzdEaXe38i/rgUsibjyiVPzmYIHxiLvnKJ2SwSCdBpixUCvkiPkLizQtz7tu
	 ZCjNpRT0aVLzqSAS378BqaGM7XTyhGzfvx2hfsMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4374F8047D; Tue, 26 Sep 2023 17:30:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FD3F80166;
	Tue, 26 Sep 2023 17:30:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9823CF8016A; Tue, 26 Sep 2023 17:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08106F800AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 17:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08106F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YPv2l6Cm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0664860EFB;
	Tue, 26 Sep 2023 15:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DE6C433C7;
	Tue, 26 Sep 2023 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695742194;
	bh=2Jb5MLyd3rbl26MU5nCagQLymqLt7wlawNMs49LT7rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPv2l6CmyXtOpZKvmlX3hnmQgZI02mFgNMblM4VNp5DGcjOWSr/Z1FFHYry1x1IQP
	 gAoPZgMnU8ok2hNXLppK+yxVTUlEgp1u00lfge0/PK58756w97rHlc9Ox+RYgVs/Ov
	 fvTGVgFcIQuAGlJ8y/A2EodbFqywbMNQ60G7IAaILh3vzx+PxE9qE9GU9Dw0JJ1wCH
	 0SwHPkzMWD035vXJ3fJjm17gAjb5+wsYp3oMgi4cyFWLsgbcjm0m8Je6THVMaHyx8A
	 b3mAV0IZqedbNjz0jLcQTOKgYV2h8BnPqhJal44jlDlnSrhUNSWQedDRFRlGtwGt44
	 6vKCxrNWov0+g==
Date: Tue, 26 Sep 2023 17:29:52 +0200
From: Mark Brown <broonie@kernel.org>
To: Matthias Reichl <hias@horus.com>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix broken channel map reporting
Message-ID: <ZRL48HIeZz2JgGoD@finisterre.sirena.org.uk>
References: <20230909114633.3193-1-hias@horus.com>
 <ZPxo8qKMDkmBqGxw@finisterre.sirena.org.uk>
 <ZP2zKg88n4MaD53z@camel3.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9c4iZsXD5UAc16dA"
Content-Disposition: inline
In-Reply-To: <ZP2zKg88n4MaD53z@camel3.lan>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: QOAEAHW44VM4MP3O377JPXWJNQAQJSWL
X-Message-ID-Hash: QOAEAHW44VM4MP3O377JPXWJNQAQJSWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOAEAHW44VM4MP3O377JPXWJNQAQJSWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9c4iZsXD5UAc16dA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 10, 2023 at 02:14:34PM +0200, Matthias Reichl wrote:

> An alternative would be to set chmap_idx to HDMI_CODEC_CHMAP_IDX_UNKNOWN
> in the non-PCM case so the channel map control will return UNKNOWN for
> all channels. i.e. use this code instead:

>         if (pcm_audio)
>                 hcp->chmap_idx = ca_id;
>         else
>                 hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;

> Any input on that topic is highly appreciated.

Can you send this version as a real patch please?

--9c4iZsXD5UAc16dA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUS+O8ACgkQJNaLcl1U
h9A+Ggf8D95e3bYetQKg0SqfXVsjiEUJZaJn0cpgHJtSSGHQK1Dl6Yz3Y2gBHIf8
z2nwBWe1ogjIrrBDuMI0EsWpV9n/OgHKNv5PngqVrwCyr07UFgeP75jgaqlxuQ8o
guZzAIen5LH9yK3dx6vURzPoLdzWz4ImOdesqS/AQY8HMSnVoghpqOK6smnBBBa0
ALpWMZKUxVi6NJbNZGDsSKKsmK8b9CmOZqSNNQ17N0crPdM/VOgSOB2iqk77anUi
GGnWnuPoHLx12JaNsSyxT+xSb/NtS3NXDD+0XJXCfyoKx1t+Hg4lrpL27EXnDsDc
5vFu/VQB75762KXK018DAG+eBR0x6w==
=NS5o
-----END PGP SIGNATURE-----

--9c4iZsXD5UAc16dA--
