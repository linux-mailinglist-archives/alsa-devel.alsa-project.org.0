Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57023ECFA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42891607;
	Fri,  7 Aug 2020 13:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42891607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596801389;
	bh=ZtA3NUxNT+VUCjbXoK3nwC7HwEhIkp1OwgDmyeuzGSo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dftF1qiNrZrpuwhz9R9BE26HU7AxU8ty0jqmUr/y8x19CkmW2ikrtoJqAtBBNQDQs
	 5RQIEnuk8vfXhfkwjYlZOfECm4BRHk4OfsdgrV5OJjuGWNzwwxEm9dHw7R9YH2vUol
	 xwlpx++ocHzb2G4YSl0eVUNgBt2SAOkE9YTIri8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E10F80234;
	Fri,  7 Aug 2020 13:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6950F80218; Fri,  7 Aug 2020 13:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB8C2F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8C2F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SLO03/FO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB2B02075D;
 Fri,  7 Aug 2020 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596801279;
 bh=ZtA3NUxNT+VUCjbXoK3nwC7HwEhIkp1OwgDmyeuzGSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLO03/FOcrfNQ+qPTkxU1dgQGEhJFM2Ul9fpJa3e1SEXb3rQ+sKtvBXRHbjiseWu3
 1M4zGkfTAnUAIgaFLhVHAHs+Jg70ApN+OXLpv3F8ZDZtcmJ1X6x9iqRPL6ivYYqiSA
 ZGu8A2dvW5JwdJDq7Pe0y77lWF6FVtAvxNeYErRM=
Date: Fri, 7 Aug 2020 12:54:14 +0100
From: Mark Brown <broonie@kernel.org>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Message-ID: <20200807115414.GI5435@sirena.org.uk>
References: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200806112831.GA6442@sirena.org.uk>
 <BY5PR12MB429286C315F66F7E2E5EA501E7490@BY5PR12MB4292.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mhOzvPhkurUs4vA9"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB429286C315F66F7E2E5EA501E7490@BY5PR12MB4292.namprd12.prod.outlook.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--mhOzvPhkurUs4vA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 08:36:25AM +0000, RAVULAPATI, VISHNU VARDHAN RAO wr=
ote:
> On Thu, Aug 06, 2020 at 03:44:12PM +0530, Ravulapati Vishnu vardhan rao w=
rote:

> > Replacing string compare with codec_dai->name instead of comparing=20
> > with codec_dai->component->name in hw_params.

> >Why?

> Here the component name for codec RT1015 is "i2c-10EC1015:00" and will ne=
ver be "rt1015-aif1"
> As it is codec-dai->name so the strcmp always compares and fails to set t=
he sysclk,pll,bratio of expected codec-dai

This should be in the changelog so people can understand why the change
was made.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--mhOzvPhkurUs4vA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tQOUACgkQJNaLcl1U
h9AMEwf9EjG0TW7IazqtWGPRye237mVP6Pc8k9MNOPeSCB+0NwICOZWMa+bT2dr9
YAUGqvVRrbSFzqgPXlUvSP9WQoYXbnx9vyu/eNYinHy1P5ij0JMafTb79TekTqbW
QlaRNBdesjDQPuoFnHncAQZY8hddYW9OwKQ/dEGA3uvM9q86dGLgH5LrOhl9sRXp
zywg8qYT1oQkfj1gvfj3OgqjJHo6g65l6Ei7QQ1oNXk7lq+cxJGebjpTOVcVW6pA
pxwbi4r/fyemXLhJ/YvF62wZ6YVarLh2zWAn6sKBTRY+1owvQ/nOKpRAC/Ie+2WF
P8ojsr5EIog/QduiVBCAs2MV7ModLg==
=ml31
-----END PGP SIGNATURE-----

--mhOzvPhkurUs4vA9--
