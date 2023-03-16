Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC306BD97B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 20:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95FC10A8;
	Thu, 16 Mar 2023 20:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95FC10A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678996007;
	bh=E92zL3S0Wimh6vAEN3pu2tsbqcS9PJeZ980curFNxDw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARUigeyQ4uieVePh7lNNenQKLxl2QBqW1QPivO19B/QrusQWmS362drSiegzupIL/
	 NR6Qkkf2A2B63YjwJRXxnw8UhKEVN/1+DJFD/XWGZzID8tQplBuLcx/1WqKJUefZr9
	 EEQsHm6ErRjXP/g2V2lQxZ5NThtsjA/XGq7imtEU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D424F80272;
	Thu, 16 Mar 2023 20:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54409F80425; Thu, 16 Mar 2023 20:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F055F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 20:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F055F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WyyxY3xo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94537620DC;
	Thu, 16 Mar 2023 19:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B3BC4339B;
	Thu, 16 Mar 2023 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678995942;
	bh=E92zL3S0Wimh6vAEN3pu2tsbqcS9PJeZ980curFNxDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyyxY3xocNQCtRBg1YQrT+Cz8DKbNuzwPfWzDf065WBxlGrLsjulPnLsjOTyfA6q/
	 6u837by1tGT7oPBCZDwafix+nDv9IyehzoThti0i/N6zs6ntjZHTQzz2oHl7y7P5au
	 O8D+8O354Y7cCA2Jj2UDdehrYqxRRlVE3lWf8+YsR7o7VE2h3L0EmEVe2GIseAqkRy
	 QUPNyTL4u93xYJqfrJSmNKr8koqaF2X14/VxKPJxoytiD4JdzCKyDq0Vufc8nkEns3
	 26HP9+8W32ymNo7AM2qVaGFqxUMQJpU2pINSoWGawLnPAtC5SvQE+V3FLOCBFmre4L
	 lHke2x04q10JA==
Date: Thu, 16 Mar 2023 19:45:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Message-ID: <1cfd50ed-f7fc-46c0-9e6b-5a35b1a9572d@sirena.org.uk>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
 <167897628543.92626.6326219364017588458.b4-ty@kernel.org>
 <a3f7b1bf-b37a-1e42-1e43-02b82fbd895b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZgF76LVo/Z0d02h/"
Content-Disposition: inline
In-Reply-To: <a3f7b1bf-b37a-1e42-1e43-02b82fbd895b@linaro.org>
X-Cookie: ... I have read the INSTRUCTIONS ...
Message-ID-Hash: ASB6RHPWDLOOKTVXUIGJ7PHW7PE7VIH6
X-Message-ID-Hash: ASB6RHPWDLOOKTVXUIGJ7PHW7PE7VIH6
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
 Vijaya Anand <sunrockers8@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASB6RHPWDLOOKTVXUIGJ7PHW7PE7VIH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZgF76LVo/Z0d02h/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 16, 2023 at 08:16:29PM +0100, Krzysztof Kozlowski wrote:

> There was a warning from Rob's bot. Can you drop the patch or you expect
> follow-up?

A followup would be easiest.

--ZgF76LVo/Z0d02h/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQTcd8ACgkQJNaLcl1U
h9DsTAf8COhC2pYYz9C1xAjzWXwZ7K7F9iiVeuAZ8EkgtUw7oU9A1EzLHrmK/xBA
0KLVVpsysPJzNlEExUN2c96lB7iz+4zA/IAlFYZN9vuDWIdbPUpyFdr9jl8gpy44
VUL5UFsT0/aGqya1VCWErVJ3nsGjN1Mw6SM2P74OVpn9kn34Ewxk/2LKiO54Nr44
ZJ5giEg5jp6aMSx1FPeauRjm1hkHVkuucFfbTxsu5y+4q4UvCCkNnc46Zy5AWZfm
CbqlKPNYRruRvkdGq5Zi4xJw8SDI9fhS75pyTklnIvMSNGt2W4E/0rc2xno38hHM
QDfeuev0Bi7MhuNoAxVH8akMzTtZyQ==
=Cjpn
-----END PGP SIGNATURE-----

--ZgF76LVo/Z0d02h/--
