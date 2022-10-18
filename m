Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 578DC6033D4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 22:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E08A44A;
	Tue, 18 Oct 2022 22:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E08A44A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666124260;
	bh=tyT9toFcZE5hRYs5Y1ZRptFF/nZLwSzqUqiMLVM4KqY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MFcQpLNoOw0bZmjR8K8+ppvnDT1ZTjdx5NsbwuTfjm+4lTbplcq8xHciXBMP3E8RY
	 0VOcW+fncGQtyYAjl2HQYMDKZsP55WEsBG2ZGOm/MPabE+yWec8du1SMVPXV4Ou5gM
	 xdwu/5g+ffEk9GcqBYs78U8sZ0Rk1OE2Jp72bRbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39870F804C1;
	Tue, 18 Oct 2022 22:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D106F8024C; Tue, 18 Oct 2022 22:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA781F800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 22:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA781F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hlAsbXfa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 709B86158D;
 Tue, 18 Oct 2022 20:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D338C433C1;
 Tue, 18 Oct 2022 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666124197;
 bh=tyT9toFcZE5hRYs5Y1ZRptFF/nZLwSzqUqiMLVM4KqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlAsbXfami0qzihbsZqEpvTg8IODvF4tyEVIbch8Qa0ArWr/r57t9mnKUM/n4P+qc
 /CiP0J2hASvEercBTCvo8Y4Dw7TmllK3WkTXcqZmcYzSl4Xf5WggflwNVLpeTtebGH
 yeN5xLy/QIjnRX+qhhJrk/uK5LfuKOof3iJE/dPxrikOpftmHNWLWXNVwJ3qYON/uR
 sJ80zCTHyGDjOjTf9iAqVbkg8DwZBslBU4JH2j3ga2tli8Xa63O/v1iQ2ijTrDSZUo
 MvrFNwHrv6eVftK64ulpDz8S7D/IgLLzALOPC0GETlmjLZOvvn6eui81lg4khmXJV8
 YGmX0CcJ3lZMQ==
Date: Tue, 18 Oct 2022 21:16:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Message-ID: <Y08JoNisQUMadkIf@sirena.org.uk>
References: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7sY94sXLxZUiOD0W"
Content-Disposition: inline
In-Reply-To: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: May I ask a question?
Cc: tiwai@suse.de, Chao Song <chao.song@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--7sY94sXLxZUiOD0W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 03:41:31PM -0500, Pierre-Louis Bossart wrote:
> ADL-N uses a different signing key, which means we can't reuse the
> regular ADL descriptor used for ADL-P/M/S.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/sof/intel/pci-tgl.c:177:10: error: =E2=80=98co=
nst struct sof_dev_desc=E2=80=99 has no member named =E2=80=98default_lib_p=
ath=E2=80=99; did you mean =E2=80=98default_fw_path=E2=80=99?
  177 |         .default_lib_path =3D {
      |          ^~~~~~~~~~~~~~~~
      |          default_fw_path


--7sY94sXLxZUiOD0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNPCaAACgkQJNaLcl1U
h9APFQf/RItgEb9MsOh/ap7XEwKGsLuJ8laBzPbUXYNewF6n11fJDmEEUa0iEy/B
SkO5H7jLpe8yS5lmkJyuKaAgC+06/kwK61n3gGWcGSR+bvijEiMDIITH2Pl0qMbU
K/zT0fWa7ekL/GTaTR9jRnBYhSiSZAK3Jv7WEpQW0Ve7k+4QJD1tdnme0MJogXt0
rlPqd+M2bYcwceWFRQO8qjNirRyqO6uq++f4aQk1/cZYb9AjyWgIOQaUnRdUz6ck
vTkx2gZMLm0k+BS1E8SsX16x51pLIHVTGrkFo0tOR8Qph5ZBDWxvCGaTu1ZOSdCc
tEX2g8rMAr3lnDjJv4c2/N58tS9lnQ==
=PSCt
-----END PGP SIGNATURE-----

--7sY94sXLxZUiOD0W--
