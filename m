Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88994AF627
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 17:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFD918DB;
	Wed,  9 Feb 2022 17:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFD918DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644423077;
	bh=5nzAqPwBH84omUc0AIW6FL5cJDjIdsWfCrgfze7zbUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Agp3BeCxQejxY4jlLeeVjNVPdmDdRRoVKMUgBYXV4XpTr/eEqvg3z+xp7+17hXQLl
	 j0ko/CRd+1scwkIEMS7jE5744otO2uxZp7HVt33K//sNV/ibP1rwkPJEgB0UG6JnWK
	 wIIUL4vKeczBMPqMM0YCtuPc+KiGCNFmK28caqIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E14EF8016B;
	Wed,  9 Feb 2022 17:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE4DF800A7; Wed,  9 Feb 2022 17:10:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00C22F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 17:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C22F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mi9s8rv/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3A4CB80E49;
 Wed,  9 Feb 2022 16:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ECBC340F0;
 Wed,  9 Feb 2022 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644423002;
 bh=5nzAqPwBH84omUc0AIW6FL5cJDjIdsWfCrgfze7zbUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mi9s8rv/4/h4NILE2YwLOY9uaVZjrV7XIrlRDngQlVJ7PP8zztsrvKeksKgwMdIxi
 XE+NAHH2dQI7oZtjIo3EmI3uHpUBE0JyDtAXp3V8io98yD+wo6EQMiChd36x3Di5L5
 rKGoluQXbh4syjYu4l1IWz1tqrivRrVf+D37Hqu6Y0b5gmkfr6CEUixYGxt+uPxtyu
 9SWi5tlcaioi7/pXU9JTvOw2zrO3mY+lm4t/54+BdfDMsYcTaqu2oNgsciAuijQMA7
 JSFOsywDOtZ0pu/k8f2M26fHtWDD67QXzpzenGnBDQ+Ia0oyCDyU1xO2PM6UCNjQkB
 vYIqy7cO7o+MA==
Date: Wed, 9 Feb 2022 16:09:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [RESEND v8 3/3] ASoC: qcom: SC7280: Add machine driver
Message-ID: <YgPnU5FyBCoRbeJn@sirena.org.uk>
References: <1644413181-26358-1-git-send-email-quic_srivasam@quicinc.com>
 <1644413181-26358-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g65DA8fS0KcKTr33"
Content-Disposition: inline
In-Reply-To: <1644413181-26358-4-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: Disc space -- the final frontier!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


--g65DA8fS0KcKTr33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 06:56:21PM +0530, Srinivasa Rao Mandadapu wrote:
> Add new machine driver to register sound card on sc7280 based targets and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S and soundwire interfaces.
> Add support for audio jack detection, soundwire init and MBHC.

This breaks an x86 allmodconfig build:

/mnt/kernel/sound/soc/qcom/sc7280.c: In function 'sc7280_snd_hw_params':
/mnt/kernel/sound/soc/qcom/sc7280.c:151:15: error: implicit declaration of function 'snd_soc_dai_get_sdw_stream'; did you mean 'snd_soc_dai_get_pcm_stream'? [-Werror=implicit-function-declaration]
  151 |    sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |               snd_soc_dai_get_pcm_stream
/mnt/kernel/sound/soc/qcom/sc7280.c:151:13: error: assignment to 'struct sdw_stream_runtime *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
  151 |    sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
      |             ^

--g65DA8fS0KcKTr33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmID51MACgkQJNaLcl1U
h9DS4gf+L0cOXgst1DdnBnb2JFSFrCKPgpHBMo8eofDL6SXXGaIUcPLNvzLc8uBy
X7Z6cYbejzsLGdX+HfOoInYVNP+WBxT/3pAzDpcE6L1m1mAsDYGjDuR4//WPdyLB
e3nBRZhE7rWi0p+3mvck4FKdNcMyweg2gh+fhuUU66JVjw2/fffnKK6/GJ1xRDEL
ETO4wFphMMd5qO+S12Z0V5NM/OsUEsANCbVCBPAmhnse9KBOm8BLHVXzd/du9fbM
mA15l7zrGMpJ9u+KkNSsUJAtfFuC8dmz2YPqWlsylvN+Aw2ut53O3MKay7o3bRT9
JOBRMZAbW4EfADIyZEo64LutfFiAOg==
=PdJe
-----END PGP SIGNATURE-----

--g65DA8fS0KcKTr33--
