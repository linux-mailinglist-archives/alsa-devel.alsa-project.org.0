Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9E6D030F
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 13:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 936891EF;
	Thu, 30 Mar 2023 13:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 936891EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680175500;
	bh=+O/4Jtp+dl/IIuHbyONVfOFQ6UfRkWjCdWEVcgKsFv4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WIMIzQQQ0QTXsxuYkUPpfK/LdeKyma5YoPDs0+NLXCDL/vBfRImB4J0g+o1oPH1ke
	 lkvSjzH8Wd0YgieF/A7bWg2leaNG+XEXubUt7VtCKBnfCVjFfkkuzReNhn2WxM7wJe
	 KGxqN571DLM+u3TTTHLISUSic80fS676Hnxbpiqg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07436F8024E;
	Thu, 30 Mar 2023 13:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86D16F80272; Thu, 30 Mar 2023 13:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45F46F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 13:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F46F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZSPYxjaX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 899A961FF9;
	Thu, 30 Mar 2023 11:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802BBC433EF;
	Thu, 30 Mar 2023 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680175442;
	bh=+O/4Jtp+dl/IIuHbyONVfOFQ6UfRkWjCdWEVcgKsFv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSPYxjaXNMzNbi0WjrpdMNgWglmyaH0cSYLGv+wBCwlhIPJw1/zL5yAHXXSuHFCIK
	 IIsg41kI0KBmZidbqZ0DjIadziM3haAVTDLf7TED2ddzSsXX2hKcjUSufJE0APdci1
	 rlosasyH5JYavK/woAvnwY+Fslq/OKhBp8gr5BWkPHDez+7R8RwCKKDTeXq/BvgH3c
	 xq/NgJ9F1sH88M9lmVz738//zhVdL8h1DB6bwmecyRYtqNT4BZm32CI/CpX+g6BAQ1
	 TecAafDThZakMcWN831ummz8l5GcBua81Otx8+jrnW4sfWs6RNIpaeJPyamTuYPnXI
	 vcMzmq781H3Ew==
Date: Thu, 30 Mar 2023 12:23:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing
 NPL clock
Message-ID: <ZCVxTlb+qQXXuaay@sirena.org.uk>
References: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RgQFrAdnCXJBeoOK"
Content-Disposition: inline
In-Reply-To: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Misuse may cause suffocation.
Message-ID-Hash: TMARNOBF4YYIEG6PNJAFWHAEC2D2NXPZ
X-Message-ID-Hash: TMARNOBF4YYIEG6PNJAFWHAEC2D2NXPZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMARNOBF4YYIEG6PNJAFWHAEC2D2NXPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RgQFrAdnCXJBeoOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 09:03:42AM +0200, Krzysztof Kozlowski wrote:
> Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
> clock.  Add the clock and customize allowed clocks per each variant.
> The clocks are also required by ADSP in all variants.

This doesn't apply against current code, please check and resend.

--RgQFrAdnCXJBeoOK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQlcU0ACgkQJNaLcl1U
h9BSwwf/XGc3O2Ze+FtjmLmXgxQEKai10eNESrZmVzpj3RTtlNWMEkrFh3zqxV2G
TRgvWI4/DLWAjR6snW0DzmVpOZpMow+4GQ+fwf58GgWCbeuHcyNzgwF+qb1ZpScW
YbroKR7kauxV9lx9u0Wae13RZlFCGF8tY9hDO6V+xTlR/L5MsUhxzujfj6uSTgWY
GasGIjTXmTA6t/jueX9VSYp+sRo6oFKvVqGzi37IFfk6fEUW5GPaETJJIiPgwpfM
OSMTmrjzSs87TdH0bn+Hm510sG69v4kDVwroL3buMjs9p3Wh31R05FfaGCpKkHEA
IV7aWC6+fWOItuI+qx7D24t8AfCd/A==
=VdUt
-----END PGP SIGNATURE-----

--RgQFrAdnCXJBeoOK--
