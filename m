Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 783714F350E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:47:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00F2517DE;
	Tue,  5 Apr 2022 15:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00F2517DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166463;
	bh=6FT+vsrk7A58unbigsMpXJ/ejV9CaB4GUTSWS8aQnMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DW/0jQsAOmOLdcT61pmeJ0bPzuCDX7d2aqgmCrRxC5+AQvOZSID2aQ7A6Rfr4hkUD
	 NLdzlLW98C9m3cNk64AxAIOwHSGgBsDbUX+FEQSdg56B1hqGV7ymiHSDKEjU2gWGJL
	 Iwc0j+CL5yrWAbSyNWNPTkUqbESW/iZR5lcoez0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8148BF8016B;
	Tue,  5 Apr 2022 15:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906F2F8016A; Tue,  5 Apr 2022 15:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45FBCF800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45FBCF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QNkingbn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F4DAB81BA8;
 Tue,  5 Apr 2022 13:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7758DC385A4;
 Tue,  5 Apr 2022 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649166394;
 bh=6FT+vsrk7A58unbigsMpXJ/ejV9CaB4GUTSWS8aQnMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QNkingbns+F3xZH2JBDdTZEGJWrWRjIfFc+oondKc0Y34iIdykbIkMu7yUSFtipMy
 sx46AiNX2rdrBCkDCG6Lt7xSCA7iFqf/TQvmps5xLV+RazivPdRv2W6DOFa5RRq5fX
 r7DLOZ/3+SmK/qQnzpBCtuWdDxFwGTjA/BGwa/v7NBVDtb1lommH1/5fzIYR7cUqQp
 zhaRpo1TNsYnQAB8WcN9sPA00PWMzHPJmCfoecHXL/1CWMV0aU4JhCwnd/I0DESK4o
 myVgvJLOzAnwHKr8aKV0ASGQnlbmNOpp5+CnJwr7Rg9YMsDeT+ko0yisrvSScS9DrB
 sddOJli3tSvMA==
Date: Tue, 5 Apr 2022 14:46:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326 dts
Message-ID: <YkxINieRax8jQBg1@sirena.org.uk>
References: <20220405133121.2655-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J732WEfHxTc1+GHp"
Content-Disposition: inline
In-Reply-To: <20220405133121.2655-1-zhuning0077@gmail.com>
X-Cookie: diplomacy, n:
Cc: Zhu Ning <zhuning@everest-semi.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 yangxiaohua <yangxiaohua@everest-semi.com>, tiwai@suse.com
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


--J732WEfHxTc1+GHp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 05, 2022 at 09:31:21PM +0800, Zhu Ning wrote:

> +  mclk-rate:
> +    description:
> +      clock rate of mclk
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1

There's a standard clock binding for assigning rates to clocks
(assigned-clocks) - that should be used instead of having a custom
binding for the MCLK rate.

--J732WEfHxTc1+GHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJMSDUACgkQJNaLcl1U
h9CYTQf/ZU4z7387cNsYOqxlHUcHVNM/5IYA5VfmanRzyDacOs6gMj/FxH8hd2qN
nWfmaf3K/pQNckcLZrsqAE/7IVJZLjcnixWc2WWQAl843j2A6ZaNhO5Yw3Fq6BCl
rTEQmKD0JmMGpedMWLh8ph5gs6egBYBLUyFoNlAqNr0jefFc7rA8y+ejs5wMlhsf
aJczbaeSinDUrAGwf+cRyE4m7ztLJZJiEy02KBgl87RSLwnT7vHAw0HMnVwVIfFN
eMaxn5KIUj1myPb6TLQ/4A4diDJozqWK0MxK1h/8wEzP745SrmzdrbUFQ14kGrSV
eBTDEol8UHpgoI3kz7VWKOVx9YbWjg==
=3vCp
-----END PGP SIGNATURE-----

--J732WEfHxTc1+GHp--
