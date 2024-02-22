Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F52885FE76
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 17:51:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4370846;
	Thu, 22 Feb 2024 17:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4370846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708620662;
	bh=jzgZY6zqPBSGD9YD0BKd1woI2fsVxRaFtsSJDMgRhhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L6WrDscwSnkht5+CT3e6xL1oGWIoyphDDbD7ngFoyFZ6pQj21tsPHvECB4WTCij5E
	 SZLeyjv8DPPU1BIAy4tywpJT+IQb9nRDwjRgDn1OlFeG/9pOkOurAecZlievbu/MOI
	 lqPWIHpE/udCiES/KdB03IX1yM2ZihrAsgF5vG8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0645AF805AE; Thu, 22 Feb 2024 17:50:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09AFFF80567;
	Thu, 22 Feb 2024 17:50:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795B1F80496; Thu, 22 Feb 2024 17:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3C8BF800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 17:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C8BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tvw+TbRx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52F5D61931;
	Thu, 22 Feb 2024 16:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECBCC433F1;
	Thu, 22 Feb 2024 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708620616;
	bh=jzgZY6zqPBSGD9YD0BKd1woI2fsVxRaFtsSJDMgRhhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tvw+TbRxk808PShE8X9kFc2djAPrBKVC3fPeou9JAwUeFEgmjlzWOarpNx0+DXxXp
	 FY0YTS2GBnXJ8RYNdGq67aBx2KngY9DLAKutqHQVO0KNrhxMZI5IkYerQNXazGQ3ZT
	 5n4TcWfuvwzo6M219lB8xUPyWUvLvyFowGO4IEdhX0zwlMEUT5sLea+jainoyh1OKv
	 kzY0fPn9XEObThLrabLoLo9ypfpUfRGXIN3L3zury9khOitSoyV596qjtHyC3tk23z
	 xOrc2HACbJB10923znohknE3lWyuIEnltcwgOxcuxXr6X8DJWxCDy7cXhRi8Nsdcja
	 +SVhesevS2Z3w==
Date: Thu, 22 Feb 2024 16:50:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
	robh+dt@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v17 36/51] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Message-ID: <bdc57138-e67e-47ae-8cf1-b8be5aeb2369@sirena.org.uk>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <20240217001017.29969-37-quic_wcheng@quicinc.com>
 <7dc9e80e-0875-4dfc-adf9-9bfad2fb8589@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cOd1FR6fHMWZvLvO"
Content-Disposition: inline
In-Reply-To: <7dc9e80e-0875-4dfc-adf9-9bfad2fb8589@linaro.org>
X-Cookie: I have accepted Provolone into my life!
Message-ID-Hash: 4MAZNN5FLB3GNZCTQ2JVDKYVRBQNS3SU
X-Message-ID-Hash: 4MAZNN5FLB3GNZCTQ2JVDKYVRBQNS3SU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MAZNN5FLB3GNZCTQ2JVDKYVRBQNS3SU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cOd1FR6fHMWZvLvO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 05:24:58PM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2024 01:10, Wesley Cheng wrote:
> > Add an example on enabling of USB offload for the Q6DSP.  The routing c=
an
> > be done by the mixer, which can pass the multimedia stream to the USB
> > backend.
> >=20
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)

> This broke next.

> Wesley, are you sure you explained dependencies in this patch? Why is
> next failing on this now?

It's surprising to see this merged at all while the series is still in
review?

--cOd1FR6fHMWZvLvO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXez8ACgkQJNaLcl1U
h9CQogf/Rty+PzQj/jpG1Fsxu7+MaMcQMkpn1XF2iLD4N1C1cgT6z9UpSyhYC29E
LHR1HWRiqckOMwnBNyrckGk+mP6PMkGkzqMGBb+rZskMwRX1hCrLkGQzNKVZiugQ
mirk1eX7etmEaXOAwVT8dKNa34Z/YQXUmEe4lXM6fOpDXhoDDe+5DI8C50Xecsvr
f/dVZiWq7Nl43QJfHimKiSHAR5JfIeiIBFKcJhTGLVhGAK/juChu9IK1bUnkXffT
7s+3Fqk5c4YbZ8g4WogDEToJkKAt1dQMf4GSJ21Dhn1xy0sewSXnKSilzX5ieLSR
PFrYDeV9DWhxNldEQDfvR+DPP/XWpQ==
=xlAH
-----END PGP SIGNATURE-----

--cOd1FR6fHMWZvLvO--
