Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06D8FB189
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 13:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BEF7F1;
	Tue,  4 Jun 2024 13:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BEF7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717502212;
	bh=tXhLaowrcYMXzmicpuj4T6jEZTq866kBwfpJR7KjHYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vYScPZZsb9aFtEAL5LYDoqux3mnMog8kOzYMTRgWcgstynceC7xxzmbMxFkOtNkPE
	 i6dNjNvfRY6VnRWQOmuXTsrjQgI66T6AGfITmkvkF7o1iS5KJjL2CCss7foha/PfyZ
	 PFsN1JsEDRJe5zZRJaNnniU2cc9236Hax4HSjEX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99968F805E3; Tue,  4 Jun 2024 13:56:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39EC8F805AA;
	Tue,  4 Jun 2024 13:56:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11857F802DB; Tue,  4 Jun 2024 13:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA1DBF800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 13:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1DBF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dgYh7/YR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A04FCE10BD;
	Tue,  4 Jun 2024 11:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E591C4AF08;
	Tue,  4 Jun 2024 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717502174;
	bh=tXhLaowrcYMXzmicpuj4T6jEZTq866kBwfpJR7KjHYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgYh7/YRAhKIjwsFQx2Yz+cbECMwgft3/F98XxETZRu4tkigfPDgdpb1Zqzo5wWfO
	 91p0Qofhs1+TJT3TaZ7vnos/RbQEgcOAv3xdN0ZcGQkANtWaYR5bVJPwlB1EMlWA3G
	 xjzZ/pl+BYxugx6nwsQKw7hT6789Mfa2DG+oQeSlErvJfCyt1chADHod/anBD/W/cH
	 u4BUqhHUMeO5xdDxpkD6Vg+ptIeJ6pKeZTXeFiujIBFN8LmR2UtJ+49F8iALj4IzCE
	 N0T5PLrZaHmdy9IxX3axhsfuxENX0Qp1U/fg62ScSWH+m1lj+bzrWss6DIRi41W5Cf
	 k2ZoKfOCDSreg==
Date: Tue, 4 Jun 2024 12:56:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Message-ID: <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SHcC+f3LwF29Fsqc"
Content-Disposition: inline
In-Reply-To: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: ZJNEUCUMRQSXYFFFZEH4MK3BI5ZKD6KV
X-Message-ID-Hash: ZJNEUCUMRQSXYFFFZEH4MK3BI5ZKD6KV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJNEUCUMRQSXYFFFZEH4MK3BI5ZKD6KV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SHcC+f3LwF29Fsqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2024 at 05:16:07PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-sdw.o

Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
just seems like a huge amount of noise and I'm having trouble thinking
of a use case.

--SHcC+f3LwF29Fsqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZfANgACgkQJNaLcl1U
h9DD7Qf/Wbjd2t6/LWhnHPaYr8UDzVQzgJXS+fzgQ9Lou2WkHI9D2KV19uaMUqmV
ACLaw7+m3lBGyG+FkxREZCucSN1wLhS7mPM2+41IaRAQ6/bj1LLQovR1vrwOyUcu
bWJ+VFJLo2Yl+NIje4Z16Mg+f9QT7/VvR0Spz2LZXLwmTjis/GVwSY9I/v4ZiaTt
dHeWr3dhPWNRnBx4PggQs0OyO3Ky4gxPVN1qfp7eiSLe9rOC3qcYsi5hdx50kVdy
ViqX56cl1qJ2HfUZmbCVc43IViRnhVfgtrkKLTdtsM/acBnMl5oFDUkmL8+lOOFe
V1/zKaMwRJMzabvh16khcsrHchaMSw==
=Mgl8
-----END PGP SIGNATURE-----

--SHcC+f3LwF29Fsqc--
