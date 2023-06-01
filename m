Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF76719B02
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 13:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48C8207;
	Thu,  1 Jun 2023 13:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48C8207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685619030;
	bh=YRpFV9EHccLiEr00ihV1MVHY1R0+dLRW9dyu9NplvMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UUBPBifBNKVbW3N1oE3AGhEaYWVPPSEqVs4DI1XU5isyKUSWAc9dbw4F6fR1S8/AG
	 4aQsyG+r1yfE60plgHkLfGXb9mF8tKqLS33pVsWwpxf3SDNBoeNVq6HO6nA1Q1inis
	 VO2tJuHnAhPUAabMrTXKU5ZyHisP62+8B8gnapyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34E7CF80549; Thu,  1 Jun 2023 13:29:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD3F1F80132;
	Thu,  1 Jun 2023 13:29:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B92EF80149; Thu,  1 Jun 2023 13:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94058F800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 13:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94058F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KSWlNENd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 485CD643CE;
	Thu,  1 Jun 2023 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A217CC433EF;
	Thu,  1 Jun 2023 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685618968;
	bh=YRpFV9EHccLiEr00ihV1MVHY1R0+dLRW9dyu9NplvMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSWlNENd8xqQprpGuF8Mhh0IbIukZI5MPrw5orokNRPf8E+42PK1wiHIOYFSNEf7w
	 644oct61rq004fmUbO7GU84F7lBCfbxqX+h+0hi2qsfira7vhjzDXfc0FaIh6Q5l0d
	 8MuUwpPPSMlP4/bk6jA3hdxGZkxMsjAQ/a3Pbv1tX1BFmNpNkG3LYqlA3dGOT572AV
	 T0dgJxIx+ACORWzL0Gispcl3WTq52rqE7kAzSZRgNv801uENOqemHGhLdzJm+e3/BW
	 NBkDychAbx9brsohEl9IFmkZWLcDQgIJIxVBH1iidKntxmZ815jjDVLMyl8wdbtix5
	 l6VMQctt3QhdQ==
Date: Thu, 1 Jun 2023 12:29:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add
 NAU8825 support
Message-ID: <df12a113-109a-438c-9a6f-ece021550b69@sirena.org.uk>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
 <20230526093150.22923-8-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JmksfPfyy4Bj0Tfi"
Content-Disposition: inline
In-Reply-To: <20230526093150.22923-8-trevor.wu@mediatek.com>
X-Cookie: Positively no smoking.
Message-ID-Hash: MTW634INSVFAARJAEK3BB44YME6SLSKN
X-Message-ID-Hash: MTW634INSVFAARJAEK3BB44YME6SLSKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTW634INSVFAARJAEK3BB44YME6SLSKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JmksfPfyy4Bj0Tfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 05:31:50PM +0800, Trevor Wu wrote:

> +      dai-format:
> +        description: audio format.
> +        items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b

Why is this a DT property - why not just pick one in the driver given
that it's for a machine with a specific CODEC?

--JmksfPfyy4Bj0Tfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR4gREACgkQJNaLcl1U
h9AxeAf/ehUGBygKINW6H+yy1gZ0HlpXhYS4swWucFmZqVQIaksZAUR2ly+8bPzD
Puhp4M5k+HV/+H+VLnmi1MGn803l5bD1q3Y4Ecy5mMz8cSzQx3tNEwL+htYaUeg6
pchi7gBYaiBd3nVWeEWelIsBx+1UYRURJ3r+YoCXRVAHaYCsbJynauBKCOAizCfG
W7MItpvce9g75QWSuifAPhQOEggg5eo6eGlq7omEVkvzUrExfGSM5L8bCMdGar90
dqHOrZSq0B0q2w6yGGG9KFvcqvSbnErkngpBeI33DBTDfCIhHuytcB+M3pLhFOnc
nKhBAj+1yD+OMbQC+HYc94d+bsXErQ==
=Zpw4
-----END PGP SIGNATURE-----

--JmksfPfyy4Bj0Tfi--
