Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA641B2AE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 17:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C410A16A5;
	Tue, 28 Sep 2021 17:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C410A16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632841950;
	bh=eDeH6QdApN+3eXN8ZlrWpKh7GCEOmiZnxABrGRFK4/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gu6rXDK9muH7WMTr5xwdV8AI0kfysLcVjdDji+Dr7rsmLkH+xTHX94xK10zXnFGXy
	 72m2ibaWnCBT0jyaXKrNZv+a9jamGELw1jl4FbzDKZz4sfsiIF80ZgUfT+JuSc7Aw+
	 Fq/qC+jOEfj2pZgAWwdLcFQOUN/sQlJ/YdR8YIjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE08F804BC;
	Tue, 28 Sep 2021 17:11:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F1F9F804AD; Tue, 28 Sep 2021 17:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 325F8F80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 17:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 325F8F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ju4dhP79"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78BE160E54;
 Tue, 28 Sep 2021 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632841862;
 bh=eDeH6QdApN+3eXN8ZlrWpKh7GCEOmiZnxABrGRFK4/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ju4dhP79Eq/OuNB8kfRciibs5XmCctKNNYAupfKjz/jlOc9mAZyo/WM+vZVbKxhUi
 2h/GWOEeLV9GOleyCLKNVg8J+lyCVkiYOPkXMTa0RaS/AbSFI7mmS0p3qf+DdI+iJA
 r8cKcocpeiGwdhMvV7fhDrQNggIMXH+DZcndnzdKIbBeWVN693pCfM+Uljgew9NiaS
 Abe9WWhFLQhPa2lTDf5uvpnjm1gm+46o+SL0N6d9+K54DOu+Y3QZ6yTvzJstXLehad
 MEhnr5jtUS9xDP2jf3Ylj7fmUA2EMqZQsN7WSQpgCmilZGImD0ZbW1l09zgl09HQ9M
 MhKq79a9L8oTw==
Date: Tue, 28 Sep 2021 16:10:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
Message-ID: <20210928151012.GA25932@sirena.org.uk>
References: <20210928082248.6081-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20210928082248.6081-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, rander.wang@intel.com
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


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 11:22:48AM +0300, Peter Ujfalusi wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The work-around enabled in hda-stream.c is only required on earlier
> versions of SOCs/PCH (Skylake, KabyLake, ApolloLake,
> GeminiLake). Before setting the format on the host DMA, it is required
> to couple the host and link DMA - which as a consequence shall use the
> same format.

This breaks the build for me:

/mnt/kernel/sound/soc/sof/intel/hda-stream.c: In function 'hda_dsp_stream_h=
w_params':
/mnt/kernel/sound/soc/sof/intel/hda-stream.c:436:42: error: implicit declar=
ation of function 'get_chip_info'; did you mean 'get_group_info'? [-Werror=
=3Dimplicit-function-declaration]

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFTMFMACgkQJNaLcl1U
h9AkwAf/TU5L1yUKluhQpZkkXnCFP8ds2ODfo1wifPyrNFEUd9H6O3kegvBEV154
/hXzzrLoJWrz7UmZNtSmSrTuGbE0nwcuG1b8kToYsMvTXEYzMSM0Kwb6Ymwt0+7T
P0eazsGdf/UX3e7h2rzyGd3NPEELNeaaElVB96HBSchZ6704TY40Co7IOGuWsT9e
QcHYDRK3iY7MUNbKRyVfvfHawlAPzI1a3bFi9ULxST9Hg6aMgRgu7Pcvlj3X403P
xAcV5RXwM7L1QVNmr2rUkD5VL7tXfoWgX5+sk+ECwVpCO4ylY4xUBplmHygP9N/C
nHGSeA1PmOfeNgurTsukftwddtV1vQ==
=304u
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
