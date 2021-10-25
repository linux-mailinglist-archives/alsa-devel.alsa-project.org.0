Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19206439AD4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 17:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D8516D6;
	Mon, 25 Oct 2021 17:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D8516D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635177053;
	bh=T2GFghtcHNLOa+MHlF+E5+QAYjJCxcjLCfKLLCipAH4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LP/yAz8riqO72eEZ2aZriIFm6WBJ3URukhd/muR13wMeFs7zRb5RZOQct1UoOvhXZ
	 M0qhYILmKLAcz43TM6t5beqkRf4lAmYLed+agazsQmPDQcIrWjdaEm2RvtDo41wk4h
	 /b6F+mRGypUUdx/TsZI1VZLSST8Q62VYWf7Z0Xt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A75E8F80271;
	Mon, 25 Oct 2021 17:50:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E96FDF8025A; Mon, 25 Oct 2021 17:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA56DF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 17:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA56DF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mFuQs7jL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A0C660720;
 Mon, 25 Oct 2021 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635176992;
 bh=T2GFghtcHNLOa+MHlF+E5+QAYjJCxcjLCfKLLCipAH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFuQs7jLqq/WU6egj7Y2jXE6PJKp2mLT6hEHQiLsOUunNc6GH0IpXADIMVhMIhXEA
 PORFkUAzEWvvQ+6AHX1ZJoHcXD7CBuwtmTgBxtv7/BMJsfmCTODQepJ1fIoQPTLxWD
 f62rtPJbG636u2DCT0pYorjBjoLw3ZATtShC6fxXp8Nm45hD+QiGAX5vhcbGD23XaA
 6tVnRdao1SJJdnLmg4fGXZtaCuOA1sUUEunD8K/2peIa7MJ3OqSNnfvQRwk5c8pkZR
 xvoIrGT3pRJe+tOEuYpi1g+FWx/KsUNjq9LyhdbT1FEOLepe+2GizdMYCUDz6p7krB
 8fvw39vCtjE2w==
Date: Mon, 25 Oct 2021 16:49:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
Message-ID: <YXbSHubt3Rivh9xp@sirena.org.uk>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="murvvOThzU63xl3q"
Content-Disposition: inline
In-Reply-To: <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
X-Cookie: Eschew obfuscation.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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


--murvvOThzU63xl3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 12:39:45PM +0100, Srinivas Kandagatla wrote:
> Now that all the code for audioreach and q6apm are in at this point to be
> able to compile, start adding Kconfig and Makefile changes.

This doesn't compile with current code for arm64 defconfig:

/mnt/kernel/sound/soc/qcom/qdsp6/q6apm.c: In function 'q6apm_audio_remove':
/mnt/kernel/sound/soc/qcom/qdsp6/q6apm.c:703:2: error: too few arguments to function 'snd_soc_tplg_component_remove'
  703 |  snd_soc_tplg_component_remove(component);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /mnt/kernel/include/sound/soc-dapm.h:15,
                 from /mnt/kernel/include/sound/soc.h:386,
                 from /mnt/kernel/sound/soc/qcom/qdsp6/q6apm.c:15:
/mnt/kernel/include/sound/soc-topology.h:191:19: note: declared here
  191 | static inline int snd_soc_tplg_component_remove(struct snd_soc_component *comp,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This will be with the stub for !SND_SOC_TOPOLOGY, the index argument has
been removed for the actual implementation but not for the stub, the fix
is in the header.

--murvvOThzU63xl3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF20h0ACgkQJNaLcl1U
h9D++wf+JwyFgodfzmfQ+BPTjdLIw7DMvXZX2Je/xIfWADZ8tSg9r1D+LIflPdDP
zYuCt2kQ28Zq2H7SIfG+W2crSSpAlG3cOjfkkevaclL8u0hDDFc2c2nJRYDBjtrz
aph7S2rLmIt9H0LOPM3VghyS+eOxZRNecdVImbyjM0yOELoFVsGyfrXvLCaziSyz
+7L2ouU7TNStXvT9AFmsG8Q3YJJTiEAqf/ZRtQUz2ksRwZKzGgIr8bBaolFdH0d7
figc2AXRChTMyj760seY86rHfUQjZ7SpmXwk3w6QvFpOMMh8FUHUYCLDbHTmegAM
WANHyQqNwcoTsExew6Yl4NA8A7KQcw==
=amHX
-----END PGP SIGNATURE-----

--murvvOThzU63xl3q--
