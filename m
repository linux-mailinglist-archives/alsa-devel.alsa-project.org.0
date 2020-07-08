Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118A2188AD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91F591679;
	Wed,  8 Jul 2020 15:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91F591679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594214113;
	bh=5rANE8QL9bujIGIKTFmNAOGIjpnD1tbUYUW9Yy2zXf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXHV+AJWLx02/CJBWbsQvGtFpHPsesO0hJ0+8W20+vebhL97wGM0adRIJtit0Ol83
	 W7wJoPfnF9XKJyrfty1I2FZn12/h43a18IIVHjOFi/pcNvoURKXUOaE1Qwk6Ej78yt
	 XqZSwr0OhVVcgCMCfnfHZfjmDbB6BOxw2E6bPTQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19324F80115;
	Wed,  8 Jul 2020 15:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C41F8015A; Wed,  8 Jul 2020 15:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C458F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C458F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w4+SEDGL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1C5A20578;
 Wed,  8 Jul 2020 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594213993;
 bh=5rANE8QL9bujIGIKTFmNAOGIjpnD1tbUYUW9Yy2zXf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w4+SEDGLAoFA3Xs7h9v8fQ6kjHFgBMCaiT3W0AjRftyEAUzxY8jqwpkxq5zhH9xZt
 wtYwhEmYsxu46SnGP6wBSLJYjIGLURiBDW2NRIhmUssF2btzHI8xyypEtSGbpr+ssm
 cCvfO9iv4r43IHJhMNurq3k02mT6Si6QyK7oN968=
Date: Wed, 8 Jul 2020 14:13:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 03/11] ASoC: q6asm: make commands specific to streams
Message-ID: <20200708131307.GO4655@sirena.org.uk>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-4-srinivas.kandagatla@linaro.org>
 <9ff595b4-1093-36c8-f27f-f097e24657a0@linux.intel.com>
 <4eedae20-903f-77c6-c6e9-fbf3db209bcf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
Content-Disposition: inline
In-Reply-To: <4eedae20-903f-77c6-c6e9-fbf3db209bcf@linaro.org>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org
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


--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:44:19AM +0100, Srinivas Kandagatla wrote:
> On 07/07/2020 17:52, Pierre-Louis Bossart wrote:

> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (substream->stream =3D=3D SNDRV_PCM_ST=
REAM_PLAYBACK)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 q6asm_write_async(prtd->audio_clie=
nt,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 prtd->pcm_cou=
nt, 0, 0, NO_TIMESTAMP);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 q6asm_write_async(prtd->audio_clie=
nt, prtd->stream_id,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 prtd->pcm_cou=
nt, 0, 0, 0);

> > sound/soc/qcom/qdsp6/q6asm.h:#define NO_TIMESTAMP=A0=A0=A0 0xFF00

> > is the change on the previous line intentional?

> May be not!

> Plan is that the users of these apis will send flags directly instead of
> boiler plating this!

> This change should go as part of next patch("[PATCH 04/11] ASoC: q6asm: u=
se
> flags directly from asm-dai") which would make it much clear!

It should be in here.

Please be also consistent in your use of ASM, especially given that asm
is a widely used name in the kernel.

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FxmMACgkQJNaLcl1U
h9CkaAf9EYS1y3Rx8LG8HM3oH1Htsox8HmKMN+MFhUgtH+3ent6wb2eaYtZ+FcET
qwwYx6Vrs4F5lBh6UyKGFhUyznHP01JY2qGjtUfgEP+NRJc1IcSnSuAiD1Bu77Wl
0HSBK7HpF/feGrZZcUxov527kh7O1TCBEAu3/PNCLZ45SXwbNP/6rDMc2PQM1JlQ
/rjNJpWokFP+CnUaY4Yy653Jlh6s+7UTJyi0bKzXpejJyYhDICBq5XS8PmGA/EE2
8wU3ez4ZBwlr9ujK67WuSRuOFeGpnU+HtRdo1KTNs4msmNQZdjSlcjEYgWo5T883
EhcHgBqaHAPIPKdv77XiRIygaJm1GA==
=8rYY
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
