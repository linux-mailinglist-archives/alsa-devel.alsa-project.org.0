Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2565A60E4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 12:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EA91695;
	Tue, 30 Aug 2022 12:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EA91695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661855819;
	bh=h/p8CkP/aG4Pv++LhDc39jGaCuRXKYaNdFRD1e3IZJU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xo2CgGAg9wwWXU/qcT8dBrhqmvI2Pqj21Ou/99cTEu8stEOtjT08NlzsCRPWOCShb
	 cSbURBaK67T0jCygVZb75Q+uGKJdEe/3xgU1BLnv3ksj4J+HG9O/cq3qra0TDuFh/W
	 XUTHaglvQp0S4rxx5wKIB/LskuOKHZhfEdI/wtUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8913EF8032B;
	Tue, 30 Aug 2022 12:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F5B3F8023A; Tue, 30 Aug 2022 12:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B64E2F8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 12:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64E2F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XTnXbVtt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7C06ECE14A0;
 Tue, 30 Aug 2022 10:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7FDC433C1;
 Tue, 30 Aug 2022 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661855750;
 bh=h/p8CkP/aG4Pv++LhDc39jGaCuRXKYaNdFRD1e3IZJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XTnXbVttAd9rtjC8u2D0G4KV6uEFDQQhlof1H/QvCSVGcFnfniKh8Eb1dxUdn8WLC
 cRGABJI0L5+CmvfpoKT691/symjxyFl8ICh3NiahqlnB0nCTncH1ol2U6BLBJMWSrF
 L6qSyFjwupR6GfCupmC2/DgSvmQqB3Zc2qezXLh0nC2rbM/q1dZUMEQVbC86wtGgZG
 /Iro9lq+KhxGscfp1pO+KQY/Utr9eeK2eey1rysqkllUe7AdHwjdHLYxCCi3ZPHYsW
 KQOsJN8gYNej2Xsrs/MPSGvypk8QOU6MX41iVAmp6eiuG88jptN3aKDNCPWmUeUmNA
 oh1uDnPvGQZwQ==
Date: Tue, 30 Aug 2022 11:35:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Message-ID: <Yw3oA6pVp3PMxfA3@sirena.org.uk>
References: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
 <YwkSi1IIRsW2Hc/u@sirena.org.uk>
 <a5266af6-af19-48f9-8bc6-94c171ba6d0c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mBZ+6BGhESv0Y/ua"
Content-Disposition: inline
In-Reply-To: <a5266af6-af19-48f9-8bc6-94c171ba6d0c@linaro.org>
X-Cookie: Necessity is a mother.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
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


--mBZ+6BGhESv0Y/ua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 27, 2022 at 12:02:39PM +0300, Krzysztof Kozlowski wrote:

> True, it's not the same build coverage need as subsystem/interface
> dependencies, but still:
> 1. Drivers can be built independently, so why not?
> 2. There is no drawback in allowing to building them independently
> (compile test).
> 3. The parent MFD device could also depend on something (RK817 and
> MFD_LOCHNAGAR depends on I2C and OF; CPCAP on SPI), so it's not always
> the case of just enabling parent. IOW, you can compile test codecs
> without I2C and SPI which is valuable itself.

> I find the last reason actually quite valid and applicable here. If you
> wish I can add it to the commit msg.

You've already found one case where there's a dependency being
pulled in by the parent, I suspect there's more.  There's a
tradeoff between getting coverage and having to deal with the
noise from randconfigs.

--mBZ+6BGhESv0Y/ua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMN6AMACgkQJNaLcl1U
h9Cu8Qf/ZIDsPUO4BiHjYSp+ClqV+hhegdcVQ+lZLxJPXQI+cdlRk/+WefY14xrp
x+giaFBvwkBStjyhOkUatiMFejftkHGHNDrFyzm1j+ZNIxMGfDOpxNWGPO5HN0sB
JphtJtLaDsAN/iZ+9YLJDMdMT4WdjQOKgZIOs0NTki05iZgPK0UaFdP39P53Oqba
ZhQ3s2Iamv+DrcqU3OwfNGHKXRsWItnKiwR/xoCyLzm1TKkjaLTFj5yQhDLymhJp
1wlkCNpHxwbkrT5GCz/ovqhmY8uqd1ZZF1lhqWOLJjhpqwd6GY4DTeJ4pS28drNh
BlSE1qT6x6zWT+BIOyqco3CCoTNPXg==
=t+iH
-----END PGP SIGNATURE-----

--mBZ+6BGhESv0Y/ua--
