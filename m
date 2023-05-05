Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410596F8420
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 15:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478172CCC;
	Fri,  5 May 2023 15:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478172CCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683293687;
	bh=mwqoQO38w+V3pgb84DrA2oJJEX0u9T37WvU9ldSdV+M=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=li1ZeeAS+oXVOrrWdcURFIWJ7thRsyxT5RHsi2wwTbAdz3bvxWtaFGlPxwQ3lFLo3
	 bjO9krLt3AT3GIV4457CqeFoqBMDqRLjaFxBVFhPR9PzckTvXYTvWr8W/AkBv74t1w
	 SRtipkMfHanJPQWQlUcJhCGBPjzFa3AqJFBo0ZeE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E00CF80529;
	Fri,  5 May 2023 15:33:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 008F3F8052D; Fri,  5 May 2023 15:33:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F4CF80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 15:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F4CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ng+1e5M4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E30461435;
	Fri,  5 May 2023 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33AAC4339B;
	Fri,  5 May 2023 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683293616;
	bh=mwqoQO38w+V3pgb84DrA2oJJEX0u9T37WvU9ldSdV+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng+1e5M4ix9INnlBoq6xpRPfZvWJDO4lyD6unpuFRTO61mNkFnTfR7GgVKYj/gZ9G
	 /iEjTDtPIFg4DSy9QbK3mq50jCN2SO+ZXmeM7qIKIlabmJCzfvFckjphLcpjW4bEpm
	 lsNPNlFjxbW8cZqcpMhfsaohGmg+qIRbdnw2RWa+Xi4BGtX3UFMJE/Ciz+3hKPv/vs
	 3OviYPVgb7llrDfukvAi3348mZLVVw45hdcsUy1HoPWWBB1z7ak0Dk8amj62E4PuGT
	 X/YxKUrghpijwJlqSAP+1wTJXzMcghIMRWI12FxLNWfWWhZwey6/IvswSk5+FedVqi
	 6dQ8Q3OcfAZzg==
Date: Fri, 5 May 2023 22:33:33 +0900
From: Mark Brown <broonie@kernel.org>
To: Anup Sharma <anupnewsmail@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1016: Convert to dtschema
Message-ID: <ZFUFrWqOHVmzE+ut@finisterre.sirena.org.uk>
References: <ZFUFAmBJXvkQAG7m@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AyRtPdmLQG54+4Aa"
Content-Disposition: inline
In-Reply-To: <ZFUFAmBJXvkQAG7m@yoga>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: XAUHASTSHD3EUF2LNCVOWYPY5LZKZ4TB
X-Message-ID-Hash: XAUHASTSHD3EUF2LNCVOWYPY5LZKZ4TB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 oder_chiou@realtek.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAUHASTSHD3EUF2LNCVOWYPY5LZKZ4TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--AyRtPdmLQG54+4Aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 05, 2023 at 07:00:42PM +0530, Anup Sharma wrote:

> +maintainers:
> +  - oder_chiou@realtek.com

If you're nominating someone as the maintainer for a binding it's
probably best to copy them on the patch so they're aware...

--AyRtPdmLQG54+4Aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRVBawACgkQJNaLcl1U
h9AGbgf+PTsUzX2cym2JdhTl5yFGJj8rbfOCKPIS4ks0o52lfBdwu+gqXf1DiYie
LcNNgDPmZZBoPTDDo/86bdVpIZDgBpkul4xNjDAxnIOi9Td4QmwNZ/dPW8yJa76S
NltJATrzlEGS+eJyI+s2HDT8RrBV2Fi3kLBLEZ4m2wsqz5d3dGwMlqX1GPLytO1w
cREcovpaCDnIc5mPxHRuOB8zPB1zqSJ9bY1xLjSKbM6k0Q8NhvZNtpDE44QrlYPi
bO4Ip2mdkL9qCfThdtSiWpvRFdA14nXgeL5RRTTf5YaHw5xFxp9QdER1Q19aegLs
WtItwmcXeMeowfbVSnathYByRMtl+w==
=Puba
-----END PGP SIGNATURE-----

--AyRtPdmLQG54+4Aa--
