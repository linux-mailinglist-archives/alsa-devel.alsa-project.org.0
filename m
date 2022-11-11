Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85100625A40
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 13:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F433207;
	Fri, 11 Nov 2022 13:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F433207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668168457;
	bh=Gn4LvE+gx8Rx+slzeOMcx1mv1gCVWfnMcM0vY/o8S3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1l0q2H9w0Qzx09I0poQ7sfCkpw4E5m13BIfL5Djre3uVg6uJhQcJZ2pQCSD+24kY
	 0eqMBBh9NLPTDk1y61HOfuq6pzURupkuYZ3izbjpn8r/sdo+PTXrpUPNB8i6nGAxfh
	 ex3w0GrMqVDT6TnBbTO1hIbUFWmzrIVNrpjo0edU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8EEF80249;
	Fri, 11 Nov 2022 13:06:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6744FF8028D; Fri, 11 Nov 2022 13:06:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDF4BF800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 13:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF4BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XRszRJte"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFD1B61F87;
 Fri, 11 Nov 2022 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A108C433D6;
 Fri, 11 Nov 2022 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668168391;
 bh=Gn4LvE+gx8Rx+slzeOMcx1mv1gCVWfnMcM0vY/o8S3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XRszRJtecPe+gjrCiPdOdwf65kR+1xmgcioWKZFrpMHAfHXbkvEvbs07Vm1I+Juc8
 IJwuN2+X6fu/GSSS8gQKKsWeCjgF5VS41UN8V4LVPcvzQPmySTDAl7x2P6Dnr1wmgd
 hj+1/9WgwLEbmiT8pbuWJRDW6H0/jhOR25ezA2fvaOqX8qdEBF9n3qJZ+cofsTRH4m
 6KHJqQ55Da41fCGKNbYCQtImsyJ6xzFHJ8NGbk0fE+uh4/sdZi5SYfd7Wm8O2oHJpe
 XghyqZAq+G/KB2SJ4fNzNMr8meCcoB/CsCKA6SkPFJAUDnDHFUVOqUWgmFweG9192Y
 H+3JHeNTA4j0A==
Date: Fri, 11 Nov 2022 12:06:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,wsa883x: Add sound-name-prefix
Message-ID: <Y246wC8zEGJp9SmC@sirena.org.uk>
References: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EFmww+5b01DXaZ+W"
Content-Disposition: inline
In-Reply-To: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Should I do my BOBBIE VINTON medley?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
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


--EFmww+5b01DXaZ+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 11, 2022 at 10:17:38AM +0100, Krzysztof Kozlowski wrote:

> For multiple speakers attached, it's useful to give them some name.
> Sound core already supports this, so reference name-prefix.yaml.

If we need to manually extend the schema like this it should probably be
done for all the CODEC devices.

--EFmww+5b01DXaZ+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNuOr8ACgkQJNaLcl1U
h9DGiwf/fZ7jw/Q4mz/4pgYUjRUhOS6l78Wnnz7FzW8zik92s2e0N8q9DNs6YOJe
pJNlVLVUhtSLyzYE9XQoTLjfnVKfLHFVCsZuwHgxncwLbdYetaRrpQlTdOgbbAqL
qrqD6QxNf9nkjafDSCpOPdMJLUOaV0jz7oVY3vdJTWgN16OosMr/KuW15ZNwmsjG
A+AlqT7G75ffl/JmImjep/krhp32zkdFpQzq+Q5Wbx2UTxJz6R4w7sB1Y7NZZ6dt
VPUGF3oCgOlwN3phFsMk3ijI1SfUVTo4dvnbqjefdClVrfm/SFtt0fLWRmKW59Ut
G7C6ARmprB4wHeEZYHBxvGo1ygYHCA==
=1awU
-----END PGP SIGNATURE-----

--EFmww+5b01DXaZ+W--
