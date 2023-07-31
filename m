Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A93769F6A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 227BB823;
	Mon, 31 Jul 2023 19:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 227BB823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690824221;
	bh=PU4Q2NcWuTz0Ljl+qIxxhnCK21j9B4K3d9CMPbiQsVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BZHV82yk79RGUxFUHAWqAnRvTZmgsF1TR2k/4sssiT6gNLn0q8XlNXajYnhQnQ1tc
	 t7YWzc7CWxOJTMgspXb3FqAs/yiPS4p/UmVjgM4rtuzLNnppnts0zsf0DjxVcj9pa7
	 FB6jJauNxNaqAijG3eiQw26ZXnlYKLZNYX8osHZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB6D9F80544; Mon, 31 Jul 2023 19:22:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB2FF80163;
	Mon, 31 Jul 2023 19:22:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85FADF801D5; Mon, 31 Jul 2023 19:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C0EF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 19:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C0EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aDzXyUmc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCBED61257;
	Mon, 31 Jul 2023 17:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A46C433C9;
	Mon, 31 Jul 2023 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690824162;
	bh=PU4Q2NcWuTz0Ljl+qIxxhnCK21j9B4K3d9CMPbiQsVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDzXyUmcP/mq7uOYynW3Im8djXcQDSj0YS8HEe8JlvvUfl5NeFnqOqZuIt1brVQYI
	 t04I4V+VMswZtT62AhtnO4rRb9of+/R3t0WjS5ohy1vubTwuqNWjVPmKtwiohsXGbH
	 3i4Cm4ajP7aJ4Cfa7S4m+eUro7cMdEkjwd2VIR6JH+bbAJSWOFmRTrOakWrxon+a/1
	 dtxN8Ui+Lw+/Q1Cappdk6m6C/MVW5MMPayXuhsRlQjzgplV27CYG49N81ScjZt4RmG
	 SWYVkDpff37dn9ptoVcIs0k1mOXgX3MYaSDbfCsCdFxB+u5uUaHSJqlqzB5NCUERSd
	 hxu8jdeS4tTHg==
Date: Mon, 31 Jul 2023 18:22:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: rx-macro: Enable RX path clock to match
 POST_PMD
Message-ID: <017933a7-e674-4619-9690-630448ac3c26@sirena.org.uk>
References: <20230731165522.328301-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZmbvYP7TIeSL9tA"
Content-Disposition: inline
In-Reply-To: <20230731165522.328301-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: YXLGTTSAPHZN4C2XDCT6DUVCV4XN6C4X
X-Message-ID-Hash: YXLGTTSAPHZN4C2XDCT6DUVCV4XN6C4X
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXLGTTSAPHZN4C2XDCT6DUVCV4XN6C4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fZmbvYP7TIeSL9tA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 06:55:22PM +0200, Krzysztof Kozlowski wrote:
> The driver disables RX path clock in SND_SOC_DAPM_POST_PMD of
> rx_macro_enable_interp_clk() and rx_macro_enable_mix_path().  Make the
> code symmetrical by enabling the clock in SND_SOC_DAPM_PRE_PMU.  This
> also matches downstream Qualcomm driver for Qualcomm SM8550 SoC.

Was the clock previously enabled somewhere else?  If not how did this
work?

--fZmbvYP7TIeSL9tA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTH7dwACgkQJNaLcl1U
h9D3tAf/UQUKGASLJzF7ZTnW7l3dewmhquXbbdGbQrWtF8oDpGwTQe4ARJk8UmMV
CRi0495iHIkVn76gjCsOtk6TXb+cd9OYSfTtjODJVQam26xeyAathvf+PnMuHMwB
qVgZkHvgXjz8T23ErcUds5i2xZ8az2+aqrRHaWb4n2Zqkn5awLoroEfeDztE1uJn
NdFNpc3W+wWGK0Z05nRcaes/EGrRhF0Tw/R+XNo+jf7o5N/ZOkMbMydW4Of1OUfK
xuXZKtw25VGuqKOS1rwS2JXwagsINVpG1s7vp/Qx4G8EB5jBzKTiFdIoAVXd+dLK
xMcciUnk7/WPJW6GQNSsDIQcNI1Lsg==
=zpeb
-----END PGP SIGNATURE-----

--fZmbvYP7TIeSL9tA--
