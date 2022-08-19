Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55830599C17
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF06857;
	Fri, 19 Aug 2022 14:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF06857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660912908;
	bh=XTX10fFmZNQViZ26TXVc9mYyxOgKQdXkV9g4U768XU0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Io6kdWPhkFhImStlJFPZd6bLqEUaOBdy2I/bsD35guws6qOvEkYaEkWx5QEHXsZkJ
	 qxwKPwQn2ATn5F6KOkoSspjaqucICbggPGmkTEqCfC78Ejm8FZ7duL1mk2mqf/FMiW
	 jKsVtpi/RBTxvUoo1Z2JxSu7gktaCBj1vXSLg1lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4685EF800EE;
	Fri, 19 Aug 2022 14:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A59F801F7; Fri, 19 Aug 2022 14:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0016AF800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0016AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WLBOJ6pV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AD84B82779;
 Fri, 19 Aug 2022 12:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5F9C433D6;
 Fri, 19 Aug 2022 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660912842;
 bh=XTX10fFmZNQViZ26TXVc9mYyxOgKQdXkV9g4U768XU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WLBOJ6pVEAn1xUe0zNIF0RwuGJerQ6Mtw94WZ5Ptn1GjzsVTz7XBtEwTMsoLuHtGa
 O7bhxcZ9VB4h1bflDnyWEc9AqaHMsD/9w0sXvXpf4xfVm/DP+UKw5YNi0cDAr1qKp/
 Yb04uLqdwREM+DulGET/8wsdHntthNjR+Ll7Dg3PAO8w5FThyprfvF5ydQzeS55pDi
 Xc7jiSJz5WmIn5Ekog1erP50YmCYXQYwwdgi1nPL1BsxicSQfoeDNe8jWn3+qTMt9d
 tg0mccxFEu5OKljGFQXlnsasNn5GWFK6QH7FKuak2tND65DApxDcOdEqpuv1tbeNz1
 chexhC5QOuXdg==
Date: Fri, 19 Aug 2022 13:40:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Fix compilation when HDA_AUDIO_CODEC
 config is disabled
Message-ID: <Yv+ExTlqEz+8TaR1@sirena.org.uk>
References: <20220819124740.3564862-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RGyOBpdT3Qc3lF6q"
Content-Disposition: inline
In-Reply-To: <20220819124740.3564862-1-cezary.rojewski@intel.com>
X-Cookie: Price does not include taxes.
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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


--RGyOBpdT3Qc3lF6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 19, 2022 at 02:47:40PM +0200, Cezary Rojewski wrote:
> hda_codec_device_init() expects three parameters, not two.

Acked-by: Mark Brown <broonie@kernel.org>

--RGyOBpdT3Qc3lF6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL/hMQACgkQJNaLcl1U
h9Dzbgf+L6XxOpkXlE/vIdZjxZkXv+/Ah0Gf75IF+EXVxixPU96L6gh9zah9veud
lUXgBqSOkpL+cIc0BexFdjX9XYPmIsuOwAl9p5dDKFuF42XWjUT1BpcsUPxXXALu
jWkUaVHQfoHcy/vBkoFhhb8NDtQzcOz9rxX509PyVEAkGeGCuZCTsvZfiyhC1Ly+
+TpFz5+2CqxF6zb4XcqnQNKsAqyJod7XAo/oUXES+J+679xWifcZxyA2yHNgZDyT
rhAYASogJPLw+SLKrEzpfCtkfD9Ai8MU/omkYLutiE7ANFqro96P3jx2tk8Nih3Y
aKP5Txc7SV2bSpC0uUrrtO7dMB+YNw==
=g6Lz
-----END PGP SIGNATURE-----

--RGyOBpdT3Qc3lF6q--
