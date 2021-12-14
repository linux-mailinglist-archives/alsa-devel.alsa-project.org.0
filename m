Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449A4743D2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:48:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E520F1B15;
	Tue, 14 Dec 2021 14:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E520F1B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639489723;
	bh=JwhJuFAM42vOdloILusvkHUTcWrMLKPvkc4iARM3qMM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7kyhTmKleL6w2ssrUWHRJU7j+AQpIEEdZxR72baf36fc9eB8X+iiHTGqi7guoEH/
	 TGTTD4DOKNLQQ46bmrcel+23gl/YPxIYgWvzYezy3x1kR5ift1h8ziJ9cvZiBoYtAn
	 6Zy0YZFvSt1zqt9Kbr2WoZouiArk6p1b6a1WmptQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32CDBF80249;
	Tue, 14 Dec 2021 14:47:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F15FF80246; Tue, 14 Dec 2021 14:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FFEF8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 14:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FFEF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="apP8Sai+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 636A56142D;
 Tue, 14 Dec 2021 13:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9BEC34601;
 Tue, 14 Dec 2021 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639489646;
 bh=JwhJuFAM42vOdloILusvkHUTcWrMLKPvkc4iARM3qMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=apP8Sai+uw6orF0J8Pdag1y0oCVskMkaL82ePR5nwcTtpFgTSnat28j7m9XPP6Dl5
 BAAs1W8v3gC+5rF0JYAm+G0D83jysqezGg1Zhf6PjGYSvbFOgjacmFR2z2pS04isTd
 duMRkBNiiS5KBAfQCwKasbWyX/zXaCUD9jyFrjKsumPPVqAJ7uqhU/PwGv16NRl0st
 yWymDcubn4TM3nojw1l/+RlacNQA9fXBMtXPwueUhtZCAndW9gPnp7LajG+DgygF1a
 eZ0qT5yMltwpPARDaCHPWdfLqV+eTF8W7bdS9CnT0QKIfOgt5JwAuN6dkXwrjnAno5
 uu/K+FyqlPmzQ==
Date: Tue, 14 Dec 2021 13:47:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-ID: <YbigaFWiLzi/4Ljv@sirena.org.uk>
References: <20211214022509.1288245-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PMc1jF/EEbgjBUTX"
Content-Disposition: inline
In-Reply-To: <20211214022509.1288245-1-judyhsiao@chromium.org>
X-Cookie: No solicitors.
Cc: judyhsiao@google.com, Banajit Goswami <bgoswami@codeaurora.org>,
 cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, yuhsuan@chromium.org
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


--PMc1jF/EEbgjBUTX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2021 at 10:25:09AM +0800, Judy Hsiao wrote:
> Distinguish which headset codec is on the board by codec_dai->name
> instead of card->name.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--PMc1jF/EEbgjBUTX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG4oGgACgkQJNaLcl1U
h9AkBAf/dut9BUz9jbak9a35YO2OSGoVSscO2+hGoFIOS6RNh6DYvQbq7ldY/A8+
OBkfvWnBkatZzkcf4yeKwUmCWD/JAMzqiq7JYRF+B+ziNyqCmv28d727fR5uvhAY
tW+TmcaZnIHZ58vTa5UdrKctv6cbwuZOoT/oFEcFnq2aJ+kKlrJ87cm2QWE4i22V
yZggCd67+9zFGErXbL1y/9q5Ca3zboCPQhySFUL0QxSWV2tKesT7H+PagX96m33k
mjN50juAOlpQ990xRNBmUrhahEkJ3sbHauTHUISq7eQhRRF5zszyjdMPB/v+kfWz
zOc+UmOjPyYI+URxH/5wZZM5IVrVNg==
=DvSY
-----END PGP SIGNATURE-----

--PMc1jF/EEbgjBUTX--
