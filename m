Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F57D2276
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Oct 2023 12:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790C3844;
	Sun, 22 Oct 2023 12:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790C3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697969019;
	bh=7PsMWbaVMedcFn6pPH+/OzV5PSechVS/ScQduga9eQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Som32OjSySFYpsrzOgE0MKWeopwtbLgXUGLmlIx8BU3ASfC2Q8SId54H72wcYP9/0
	 pRg4XLaVYOnHsefX/kXZn6pAD4KSSBHtJY7xlqnK93pKkTvvpdp+EGeNN2z3lsfaOD
	 rF4JntatJoPT1QjIShTR+agOohdLx8Cwlj5PmwOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06DB2F8024E; Sun, 22 Oct 2023 12:02:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B18F8032D;
	Sun, 22 Oct 2023 12:02:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47906F804F3; Sun, 22 Oct 2023 12:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C61F8024E
	for <alsa-devel@alsa-project.org>; Sun, 22 Oct 2023 12:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C61F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FLa/vHW7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A5C7CCE190B;
	Sun, 22 Oct 2023 10:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48913C433C7;
	Sun, 22 Oct 2023 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697968813;
	bh=7PsMWbaVMedcFn6pPH+/OzV5PSechVS/ScQduga9eQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLa/vHW7t8aqno59J8dt7ReYX8iDpAuNnwvWrlchV/dNSytiLmDRXjqasn6wdZfhk
	 hV+jNBGwOT+sXnjm7yMLdAhMCFi2vfSikzVUwjp+xu5F+lDFKAo/1xhHbJG19yBCCT
	 u5dBv5n7TsQlKrPbV3q/oNx4XbKb7cpayC7x9noJCcJGUV8bE4EUX+lZh+Z1kmiL+J
	 DyxNt3kT5d0Qh6rkMpm4BkWKjPFwdfsRUV2a6vtfbXTkfgrDjGAEXbMeirAqIStS9z
	 dUYV6L9LMJdnG0eujR0GuqeINj+D3/pHBDG+fz+zbbL3ozNoHFnYSqVzK8rYU+3eqv
	 T7FKjtPcjtZIA==
Date: Sun, 22 Oct 2023 11:00:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add
 sc7180-qdsp6-sndcard
Message-ID: <20231022-snowy-flashily-0c814247e557@spud>
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
 <20231020-sc7180-qdsp-sndcard-v1-1-157706b7d06f@trvn.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nNQF1DonWtR70u/D"
Content-Disposition: inline
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-1-157706b7d06f@trvn.ru>
Message-ID-Hash: TM6CL4VANZJIAKSJNBIXNVHEZ7IE2ZCO
X-Message-ID-Hash: TM6CL4VANZJIAKSJNBIXNVHEZ7IE2ZCO
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TM6CL4VANZJIAKSJNBIXNVHEZ7IE2ZCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nNQF1DonWtR70u/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 08:33:46PM +0500, Nikita Travkin wrote:
> sc7180 can make use of the adsp-baked soundcard, add relevant compatible
> to the documentation.
>=20
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
COnor.

> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 262de7a60a73..e082a4fe095d 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -25,6 +25,7 @@ properties:
>            - qcom,apq8016-sbc-sndcard
>            - qcom,msm8916-qdsp6-sndcard
>            - qcom,qrb5165-rb5-sndcard
> +          - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
>            - qcom,sdm845-sndcard
>            - qcom,sm8250-sndcard
>=20
> --=20
> 2.41.0
>=20

--nNQF1DonWtR70u/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTTypwAKCRB4tDGHoIJi
0gl5AP0X+bwFzAyHiu5r1O6UFDt6fXJWOpKG7KiyYT2H/ADLfQEAv0d2OZNJEAOh
3R4ScbuFOliRrkzghDPBebpGO59z+A0=
=XI4e
-----END PGP SIGNATURE-----

--nNQF1DonWtR70u/D--
