Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E73348C1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 21:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101DB1709;
	Wed, 10 Mar 2021 21:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101DB1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615407568;
	bh=22tESQIORWwnjVfGnwjn+fBTqJ+OKmI3PPmG59IpzFc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=va79wAEh4xSXEQc5tMGCS6ZiVK+D5VkjSAE3IrAREf5nJanU33hkqEKruz55WSSia
	 xCMotFdeh22RX8Pqk9btftBjiHKrzRTvk+Utm511p50Juv/ANgjOrjr+ShjFdrNviR
	 MrU8DcsneIGz8WY8aa6G1fNB55/HGAS7U1fnJ5wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 662E4F8016C;
	Wed, 10 Mar 2021 21:17:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68C0F801D8; Wed, 10 Mar 2021 21:17:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CA1DF8014E
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 21:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA1DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L57vt6Er"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E735F64FB3;
 Wed, 10 Mar 2021 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615407454;
 bh=22tESQIORWwnjVfGnwjn+fBTqJ+OKmI3PPmG59IpzFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L57vt6Er2TEZ7xI53hKEVh/9U3//HFqey7UDMI/eaSqhjvvU/3JXz8hF4E4E/0gRW
 dTVDBfq8ofbwGNvXfOvW5yMhI2mRUoCOQO3c0uz+3dJdWGWQ8TN6qU8l6WZptSBuVc
 KTPo3IaUcfU4gKFKAA4NYn3NRibSG5B053rzNrL+VAbYfKkFb4I12uHFynn8uzGqEQ
 tJ63O0TXO5Xh1dXMK3bY8u+XEYRyJ9WS0OtQzbXrmUfsm6it9joAAR6fa3wmFswQE6
 wKPyAsHd7RG8qRT6tb2aplCB1vwoH64mscEWrMuPiTVS3xgaPgb64jgtF+lL5V2OF1
 MHJTXrpiKp9bg==
Date: Wed, 10 Mar 2021 20:16:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310201622.GF28564@sirena.org.uk>
References: <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
 <20210310181611.GE28564@sirena.org.uk>
 <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
 <9020a65c-b8b8-ac1e-d0f8-a12e507322b8@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline
In-Reply-To: <9020a65c-b8b8-ac1e-d0f8-a12e507322b8@nvidia.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 07:17:13PM +0000, Jon Hunter wrote:
> On 10/03/2021 18:37, Pierre-Louis Bossart wrote:

> > +EXPORT_SYMBOL_GPL(dmi_available);

> > -=A0=A0=A0=A0=A0=A0 if (!is_acpi_device_node(card->dev->fwnode))
> > +=A0=A0=A0=A0=A0=A0 if (!dmi_available)

> Sounds good to me. I would have done the same if I had known that the
> current solution would have caused this regression.

Yes, this looks good.

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBJKRUACgkQJNaLcl1U
h9Do/Qf9GmQSmIRRH5Rx5BD9lm0loP+WMo4oztmA5BvnLrrnSgf2K+wOlWAG9Kgz
kya+OGtjauw1NImpC086m07bV39/APPw/ag4ZC8neDY8u1BCdebYNGxoLNd61OSS
W6EnONmDY0axTAwTnNwt3CCp/Q4hiXtuuQvYy1o91mF7RJv9hwAs8rpFjId/yZ/1
AmOiaklO+mRU3Cyysmz/wuYoHXO/j82Ftuhn4XgBKn/vl2kpRQ5pbnCJl0e3X4MA
NB+Ks0DefrXiHfRocACmQLUcCxXCd07KnM/3T9oPdURYRQrklqUjbyiAdqrjbQYR
PV/F+VNwl+q08hwHT31LEW3nY1+xCA==
=atzH
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
