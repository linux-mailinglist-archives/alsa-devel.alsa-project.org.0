Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB594CB95
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 09:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AFC114E1;
	Fri,  9 Aug 2024 09:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AFC114E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723189411;
	bh=1QQ6IERaVvmQgZYfk/xYBeo9a86+7mGsf8Ey/jbzXQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MsdtUNBhYWXSPCLIDKhFfIn/nQWb46+nNElPmkeOJqOfNHhCLt7XZ83XRCUZof/6H
	 E9EqSyWWcQ4oWZSFVlhvTbl/niGzNCNh+uDbAweL0/ecov8ctjcagEAozV0xKIP+Yq
	 bC1XK47uybTQzCoq3rvVSCPILqzB617ySlV8SmH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B8DF805DF; Fri,  9 Aug 2024 09:42:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8443F805FD;
	Fri,  9 Aug 2024 09:42:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FBD4F80448; Fri,  9 Aug 2024 09:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33326F800B0;
	Fri,  9 Aug 2024 09:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33326F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ANIuIKC4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35CEE61626;
	Fri,  9 Aug 2024 07:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F67C32782;
	Fri,  9 Aug 2024 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723188948;
	bh=1QQ6IERaVvmQgZYfk/xYBeo9a86+7mGsf8Ey/jbzXQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANIuIKC44kb6rGZ2+BWwRs1fobAope6oTe2TR7eZVrvbX7dln1qyRVxRQKEsfbkrh
	 uwriJwOtabpfS9B0tJrWQn1FcHKN3ttkKaRVh+2mSZ4kSB6X7kuvbEMSai2CkabR62
	 ux2cXvV/DaG8/+vCDJu3qff1flOWYJSyBe7B7/RYUrZYCFJQogCIIqMxhXRkTg7CL0
	 Xcujy+YV88lBR3Q1z6YyEykvS/oTBx7dBPTqFFmW8iBYtNnB5CKSok2KZ3RfzIQjTc
	 fXg4+nWPdLP7tHpV3f/ATUGx985XAwj7U+f0fDwbpN7iaoTPgIDTyHQRZ596jTYLRr
	 KbbiBQT9dnY/w==
Date: Fri, 9 Aug 2024 08:35:42 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Message-ID: <ZrXGzmhgyIJ9ID6I@finisterre.sirena.org.uk>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
 <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
 <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
 <a6a0c975-728b-4379-b074-b88ac928c58b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oZGvFgiQ7XPpJzCg"
Content-Disposition: inline
In-Reply-To: <a6a0c975-728b-4379-b074-b88ac928c58b@amd.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: QW2C3SSLQLM7W7U5MMHS6B3KGW5S6MAR
X-Message-ID-Hash: QW2C3SSLQLM7W7U5MMHS6B3KGW5S6MAR
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW2C3SSLQLM7W7U5MMHS6B3KGW5S6MAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oZGvFgiQ7XPpJzCg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 07:30:54AM +0530, Mukunda,Vijendar wrote:
> On 09/08/24 01:02, Mark Brown wrote:

> > /build/stage/linux/sound/soc/sof/amd/acp.c: In function =E2=80=98acp_ir=
q_handler=E2=80=99:
> > /build/stage/linux/sound/soc/sof/amd/acp.c:407:26: error: =E2=80=98stru=
ct acp_dev_data=E2=80=99 h
> > as no member named =E2=80=98pci_rev=E2=80=99
> >   407 |                 if (adata->pci_rev >=3D ACP_RMB_PCI_ID)
> >       |                          ^~

> This patch is part of https://github.com/thesofproject/linux/pull/5103
> which got successfully merged into sof github without any build errors.
> This patch is dependent on
> Link: https://patch.msgid.link/20240801111821.18076-10-Vijendar.Mukunda@a=
md.com
> which got already merged in to ASoC tree for-next base.
> It shouldn't cause build error if the dependent patch already merged.

Are the patches it depends on actually before it in the patch series?
We want the resulting git tree to be bisectable, that means testing each
commit not just the final result.

--oZGvFgiQ7XPpJzCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma1xs0ACgkQJNaLcl1U
h9D8Awf+Idi79Uow4rDHeevyxUJtVFJXMcuUJIjmkUD4+D/O9De7gvSHEszmIGbL
J8DQrDQ6PJhXBSEcdGojOFP4EB5zXiX3f4pt3rY+Fi2D7ek4A+kjdG8UFrpeX4qQ
WBQP1ycUxZSV0JI7+a0pBVoo+Zr0tAcn4Rar29VXRKFH4ZD1JCUIKsRf6Db1JZRt
hgJf41uLg5siRcgrouiVrJeqiL0SvsK2IWbINNbbJ4xc52YDjLs0H8+ux0MCh+/E
h2Hd3q7THZibHlVEuBO+v6h6e86dR6k+X05Ou5uPgGeygR88Mm+3NQb47SXIj28K
l56vUzz42Bjtmk0dQLonssYugDtOyg==
=iQRN
-----END PGP SIGNATURE-----

--oZGvFgiQ7XPpJzCg--
