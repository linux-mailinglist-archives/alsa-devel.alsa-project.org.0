Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F454F48F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 11:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8A11A96;
	Fri, 17 Jun 2022 11:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8A11A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655459163;
	bh=lr8VjaulRZk5BwhRfwyN3PMh4UpXZJ5h1CS+LG92sv8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Giqyixe6YmMmtA/1WGYqe0wTyfhN7T2yzgynAxAVUloWx5AU5gliiyN4LhGa1Y0B4
	 +aIqx/T/jC0y/PY/bcGnw3ZPZWqbuD/Nhhfz7jmLQnrwstxCz39yn71Zf/bR1w3Y5i
	 4VWisQcdz72kJJ8bFuzmlJtNJZ18TyflL7XHwUK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0926BF8019D;
	Fri, 17 Jun 2022 11:45:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2657DF800B9; Fri, 17 Jun 2022 11:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5225F800B9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 11:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5225F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sR/DkFFm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40D1461ACF;
 Fri, 17 Jun 2022 09:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147FC3411B;
 Fri, 17 Jun 2022 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655459095;
 bh=lr8VjaulRZk5BwhRfwyN3PMh4UpXZJ5h1CS+LG92sv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sR/DkFFmpCT5t/x/auAM3c1CK2AGQl84VxJ4svGSr/yV/eEqQ99waN6Yo6z58CFAc
 J1JKCcHbMzh2HG0/qFVeSRYos+52GPQHKnFlC09dmd7bG6DTioTVjjKNExxaxplVNI
 dxOjlsYTNaoLGHeCA0qN5JMb13YXgFU5NDtolEL/wKBAoDOLVJgen63KHOyx7UcQNp
 VP8awHjzkqqtFOJ6uqRlvk+A+VAYrV+ydwxPIg4oTWGofw4rrEbT36Dwopdf9nyOaE
 2HVoSc9DInDGjlmGZ4biqIA9K0ZsGEUwR9XOfNY0Ozzz8OguaFsVJAj9lWz9YpESzC
 ohJCiMWKctAqw==
Date: Fri, 17 Jun 2022 10:44:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Message-ID: <YqxNEjG19K/RbbFM@sirena.org.uk>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
 <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="twPLZlzb/Sm2TRQf"
Content-Disposition: inline
In-Reply-To: <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--twPLZlzb/Sm2TRQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 16, 2022 at 04:08:25PM -0500, Pierre-Louis Bossart wrote:

> Make sure that the bus and codecs are pm_runtime active when the card
> is registered/created. This avoid timeouts when accessing registers.

> +static int max98373_sdw_probe(struct snd_soc_component *component)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_resume(component->dev);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;

I'm not clear what the issue is here.  Is something that's accessing the
registers forgetting to do a pm_runtime_get(), or doing that rather than
using pm_runtime_get_sync()?  This doesn't feel safe or robust.

--twPLZlzb/Sm2TRQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsTREACgkQJNaLcl1U
h9AOFwf+JSSozwuh2OhFDjmn81Vt4Tdwfp7RF4wSQswqOC7O70MXp57RUsTBCEh6
H4VgglN+Y/k5oySrxeP51B+WLzmo51rs3WrqOFhPfHbZjr5w+UB574lJCN6+kzyt
cvoDNMfrAguYEq+1VydSXdxEv4Fbmf0jxRoQD+6MqSq+U0trPgz0K3ewB2a3ElhR
ak9LyuigqgjagMyXSudevRNPpYl8KVMxldq64trFBonPib59Y6O9wLKRE2+7H+DW
KmrZbd5lWInmft5pYEK7GoD1bgFm13ps/3qUcS51Zpt71ruvMaoEUsOz5D8AKcRy
bWmXfMtKxBCrMk1zT3yIPfwEokMzvA==
=W01a
-----END PGP SIGNATURE-----

--twPLZlzb/Sm2TRQf--
