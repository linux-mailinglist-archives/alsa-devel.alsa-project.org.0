Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A128474E3
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 17:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331EE857;
	Fri,  2 Feb 2024 17:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331EE857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706891699;
	bh=EYo6WqoGFpyqCfVMnDxKGo8I30FFMCSMN/sRDEPXn7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NpWVym82+9OaZ6/dnZ6j+1tmFrt8tZHUc0CZefK7W5zTx+tzXI/GwC3FLYJpr6M+w
	 oqeTmATbXOGuOwHmwDbqICqCJe8eap9vpwAF7jVOhYGxUq2w9rVb+jrQ5D6Uuf1ehi
	 ydc3EGJD7Wof0wXqCDeFHJ0SR6F+6sgmBSklRPb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99448F8058C; Fri,  2 Feb 2024 17:34:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE580F8057F;
	Fri,  2 Feb 2024 17:34:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9039F8055C; Fri,  2 Feb 2024 17:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAF20F80548
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 17:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF20F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=phYJAnaG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ED0C626C4;
	Fri,  2 Feb 2024 16:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAD7C433C7;
	Fri,  2 Feb 2024 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706891647;
	bh=EYo6WqoGFpyqCfVMnDxKGo8I30FFMCSMN/sRDEPXn7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phYJAnaGm3QAJTy3o2MktiN0Erb03lDq8tG0t+i+brLU20Nfc8qglRmbeDJVjRcng
	 pnCScgF7sBOK+u3lc+oPlpgQWGq99H84ng97s/OkHZP8/bVqdPTTZhDWj6CsVLoCu+
	 DZ9bMezyaj6rzP9b4ps9A2xxuXbaqwlaIMpFrjTAOS8tDKi07ROjx4ScmiPG8YCLh0
	 UFx6ewi1eEKvyTnpTEBpXbIXODSvB3lRmwUlTiykxyuVkDs1I8EMp37NCoh2zrO6zA
	 HqEmJx54LxUPBayIrZDLqTWo7XKu1OEjeNFzqJpxj92OmgheJrKm70bY//bFyrNUGW
	 SHl+1aVOpDd5w==
Date: Fri, 2 Feb 2024 16:34:02 +0000
From: Conor Dooley <conor@kernel.org>
To: AS50 WTLi <WTLI@nuvoton.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <20240202-boney-clerical-bd4205dd6aa0@spud>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
 <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
 <20240123-bottle-elevating-9fbba5424014@spud>
 <185f3912-5a92-4ef2-aac4-0df8363d8727@sirena.org.uk>
 <20240123-brewery-roving-b9ebc70468f4@spud>
 <591e12e6-117d-28b5-986c-83414ebc6b4e@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWik59nRW/RnzmqE"
Content-Disposition: inline
In-Reply-To: <591e12e6-117d-28b5-986c-83414ebc6b4e@nuvoton.com>
Message-ID-Hash: OAA24U3DXKBQROFEPWQRHOHKWPCV35ZO
X-Message-ID-Hash: OAA24U3DXKBQROFEPWQRHOHKWPCV35ZO
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAA24U3DXKBQROFEPWQRHOHKWPCV35ZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OWik59nRW/RnzmqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 02, 2024 at 06:04:12PM +0800, AS50 WTLi wrote:

> The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.


Please fix your mail setup, the quoting etc is broken (html mail?) and
you have this footer there, which is not really compatible with working
with public mailing lists!



--OWik59nRW/RnzmqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZb0ZegAKCRB4tDGHoIJi
0reyAP9WgT8B2fRzo0EUizrv75crTAufITGT8IWw2JoIcu+dhAEA9OycBbKIAzok
h3dn8+MmDvn0KryHB9fYcZ2xteMggQw=
=nyeW
-----END PGP SIGNATURE-----

--OWik59nRW/RnzmqE--
