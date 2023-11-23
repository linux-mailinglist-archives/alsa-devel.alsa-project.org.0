Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0317F659F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 18:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A459B209;
	Thu, 23 Nov 2023 18:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A459B209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700761163;
	bh=Yw6Y36ErXAJIavqLBexXl3lguY2vTWpO+ADAlK9isC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ITvepGy0dplQDVVRVsI37DHMTHp35GcOFAkyoAr1gneV16mtZ5eyMaT015fivUFxo
	 suH0t6MUEfQlQQymuoMeMkEZa7OzNAGTJLjnDXPZBuym8f9NbjSdq6sUDADgrJvIig
	 j9GubWkxMydSHCth8iOVM5IOuTw+T52pHT88AHOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0AEDF805A1; Thu, 23 Nov 2023 18:38:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA16F8057A;
	Thu, 23 Nov 2023 18:38:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09121F80254; Thu, 23 Nov 2023 18:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9FBCF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 18:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FBCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S3dFS4mk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 362C4623C9;
	Thu, 23 Nov 2023 17:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32238C433D9;
	Thu, 23 Nov 2023 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761104;
	bh=Yw6Y36ErXAJIavqLBexXl3lguY2vTWpO+ADAlK9isC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3dFS4mk9+zqoMSDzNRYX4a7q0zN2SB+nJXO53+w3a+g9Hjmc5PF3JytQHH+okqDe
	 OKdoDF2lSatcZdn4fOZom7H2C/OJ6jpgoWOYexLTXRt2iYpdU2kyt0OgJyECkY5EB3
	 1QUubQpzlv5VJu/Tdqdtbk7+e/4PJAZzUU4b4Zo1cKPTnGJB/3SXrnPnEjLAlghs/3
	 btsfc3dxxGMxsQLEJ8Pj7dG74en7eo7GTTGmP3tg7hxuTLWgfDErgFGy0MAZMOUa2K
	 sE5bJRtTerrBgxq/PWfZSfFON6od6oWddYy9kxyonTBoAP4hiqt2BQz0CXLogFZAUx
	 W3qlONMHoBSJQ==
Date: Thu, 23 Nov 2023 17:38:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: codec: wcd-mbhc-v2: add support when connected
 behind an USB-C audio mux
Message-ID: <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYYvbpAWCNy9mneV"
Content-Disposition: inline
In-Reply-To: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: I6K437XBN2VWOETGDXCETIJOILARMY65
X-Message-ID-Hash: I6K437XBN2VWOETGDXCETIJOILARMY65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6K437XBN2VWOETGDXCETIJOILARMY65/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zYYvbpAWCNy9mneV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 03:49:13PM +0100, Neil Armstrong wrote:

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(wcd_mbhc_typec_report_unplug);

ASoC is generally EXPORT_SYMBOL_GPL.

--zYYvbpAWCNy9mneV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVfjgwACgkQJNaLcl1U
h9Borgf/WCcOu17PlfQEP8LcwwF7WliMIbDFpt7Sn3t6UjtZ4dG8lxo/wdWm3/zC
9a4IqCgD7yJT+N6iGTEzfXw4G9ql6x0QKA3eJhLPlcDHPUhm7K0Hk0NJZUltNSve
FScbROkncl72dzXhp3xmED1Xx+S+9lcLgQBE+LS8cYH6ifUPIe2zY2PLdzw1XQT7
jajx1PGVE7trmzx9cymbbNAGbL2At5yqdR/biX3O6ckzY3kkNThWIwAdPedZdn/S
kr/daf4kTS0ciuGI2RdeI6ZxhXt+BDEeW3Nf2pOF1ezaSnPm89GeoufjrkE3uIQm
XvoszEBrtSkSv7oM0ASB2XyrRjkH1w==
=aPTl
-----END PGP SIGNATURE-----

--zYYvbpAWCNy9mneV--
