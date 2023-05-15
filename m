Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7109F702B59
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8306D1E3;
	Mon, 15 May 2023 13:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8306D1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149721;
	bh=T9fUIZM//OsaJoszK2rbswFzc+I4mXJQ/XmvdRAp4Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HvuS9Duy6cR60ZNLctScWW1J1M4BtWURJbyLvjrQy7YYO1ljF44VOqD7csdiz9Rtm
	 6Hbs5rlV27CwZjCOCytTI9yVf4H2nYScxrepCpnoKIYv8tnTuit1zEuboQ2ovoOu/a
	 AHy+Kn2zUMMqBW23xc0uNhzRWtQb0uFGg1XM2ZQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C578FF80272; Mon, 15 May 2023 13:21:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E4AF8025A;
	Mon, 15 May 2023 13:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A639F802E8; Mon, 15 May 2023 13:21:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2932FF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2932FF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lxnqPdLb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A50C622B1;
	Mon, 15 May 2023 11:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A59C433D2;
	Mon, 15 May 2023 11:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684149662;
	bh=T9fUIZM//OsaJoszK2rbswFzc+I4mXJQ/XmvdRAp4Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxnqPdLb3m/VqY4ug2kVgU5qZqloUDQHQVPZeluUdr8l3mjkkvoXSaXdxIToBfBtO
	 Fz8kuh86bJ+B77su2sh0jtfsfCjMgOvg5Z3tLhC6AC2NcrthHURs5hmszzoiqM7f58
	 kao6P7OhvBtH7deZIW92FOwbCSM99Xyl2dCFlMJOFJ8hJsDoxrZkv90EQfKZEQJUNT
	 xkpyJiAAMy66g/HsIgDDEvPMdPQHP3AzjjkU3FxZJZIFUzv1rJNMaKZHZJwhY99BnM
	 fClP+I7y5JGSE+N0ybTcTlCnDS73tXDdg2Vg5outqNhUp+U5xGsR2aXB1ftLLPLTrH
	 V0ReRNOs0Ouiw==
Date: Mon, 15 May 2023 20:20:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Message-ID: <ZGIVm6LHMpIylvAC@finisterre.sirena.org.uk>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
 <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
 <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqP7O91n5Vmg09iP"
Content-Disposition: inline
In-Reply-To: <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: PM7RAN3GAYPK4NZDKZ7MQZG5Y333JAU2
X-Message-ID-Hash: PM7RAN3GAYPK4NZDKZ7MQZG5Y333JAU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PM7RAN3GAYPK4NZDKZ7MQZG5Y333JAU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mqP7O91n5Vmg09iP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2023 at 09:58:12AM +0100, Conor Dooley wrote:

> It's only been 4 days chief, of which 2 were the weekend, you don't need
> to bump it yet! You'd be better off asking one of your co-workers to

4 days, 2 of which were the weekend and 4 of which I was on holiday...

--mqP7O91n5Vmg09iP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRiFZoACgkQJNaLcl1U
h9A3UQf+Pl3EGxms+J3grtXRzBY+ejt6SgLQdSTJw9Uqz7Fwgfsw7oQ+yPWHDHp1
mXYCBFBWzfWWVh+Q9ogUF7GFDGMM9GmzU2ywgbDvmrxKBugimlXWbEArFWNi9vdr
qNsA4VX1rXD7qkkDptHDxoHuhcIsef6Rc3SGhCjByAeom+lEgOrPLmLOSxO+Fuh5
SemO/Tlac48KtG2L+oNRrQW3EVA8buAkkilgRmPpXOBQpJRinJNy/Lfc7KSCqk1U
MT4BpMeIS0kugU0brTvopy7W8+VuZhuflVhGOn9DWiKPJLz1Dt59TpKcdE9ABGVV
KcFKmBwEaJacIJQ8yKhiiEakuLImFw==
=6jDZ
-----END PGP SIGNATURE-----

--mqP7O91n5Vmg09iP--
