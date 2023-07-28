Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674D766E4D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 15:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF470207;
	Fri, 28 Jul 2023 15:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF470207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690550878;
	bh=lpIxrmKmbOC7WRk7UtNOjkyEwzHrgZsH0CggdVA8FGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMPxWFRx1VNibkzD2LURIv1WL127dzw2JtWK06FgzIRhL1KGPusnuQ7Ja412dYFH+
	 YBE9XLCaqd04wiP8strWv0k6HdjO2hHivtlXYTYuV4+AWznSrMaKKD5xV6GMvoEVsS
	 5TOUm7tk+KmJEd3ObvpqOSnRT3baOTeFsSSDwhH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A940F800C7; Fri, 28 Jul 2023 15:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 197A4F80163;
	Fri, 28 Jul 2023 15:27:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151B3F8019B; Fri, 28 Jul 2023 15:27:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EA3BF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 15:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA3BF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q5EVvaCz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 688D962154;
	Fri, 28 Jul 2023 13:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05421C433C7;
	Fri, 28 Jul 2023 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690550814;
	bh=lpIxrmKmbOC7WRk7UtNOjkyEwzHrgZsH0CggdVA8FGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5EVvaCzpJQ4I3pL/dqanw4An88CDoDbuoxNALg0XrSbi+gG8ZdD18x/u13pPRFvs
	 szdS5EFpi7oxt3xFKvDYOxTm8D5z8Gp3V86McLswxN0c+UChvniaenoibuvyAxQ/vG
	 u2p+TbOnwF9T87wQ3w6DqrgPk/5v0wqKbZ3Xq/oly9L/XSG4gkl6X1icdEcLra3Tyh
	 spwuMgqoY3ckyUtxgqTSacvHP+XihYaz6/x74xu/H/8dIh3wp83EwmhzY/gwKZBtr1
	 azeL+cbsqfGQCJGjSyw6Gd3UnyCXPinEl+Vl81NwPm0vQOxKqzmtUkMUmFsSC97Kz6
	 /hgp/mm0jbUiQ==
Date: Fri, 28 Jul 2023 14:26:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maso Huang <maso.huang@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Message-ID: <557424df-a8bf-4b52-af4e-7f6dbe660cea@sirena.org.uk>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
 <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XT3kLeQv44OA4A+I"
Content-Disposition: inline
In-Reply-To: <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
X-Cookie: Ontogeny recapitulates phylogeny.
Message-ID-Hash: LFGPB3LMNBNMNTSPSG2W3Q6MQJA4E4Q4
X-Message-ID-Hash: LFGPB3LMNBNMNTSPSG2W3Q6MQJA4E4Q4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFGPB3LMNBNMNTSPSG2W3Q6MQJA4E4Q4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XT3kLeQv44OA4A+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2023 at 02:51:26PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2023 11:08, Maso Huang wrote:

> > +  - assigned-clocks
> > +  - assigned-clock-parents

> You should constrain your clocks per variants. I doubt that they are
> really so flexible/optional on each SoC... or maybe missing clocks are
> result of unimplemented parts in the driver? But then this should not
> really affect bindings. Bindings still should require such clocks. Your
> DTS can always provide a <0>, if needed.

Depending on what the clocks are some of them might genuinely be
optional, it's fairly common for audio devices to have multiple clock
inputs and be able to select between them depending on system
requirements or to have bidirectional clock pins which may be either a
provider or consumer depending on system configuration.  No idea how
that applies with this specific device.

--XT3kLeQv44OA4A+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTDwhYACgkQJNaLcl1U
h9AF5gf+NIN7ZO19dqJ/AAyoSKsZgUmZxvpWcqc20xa2BWORhhpXVszso2nROeQY
jsefIMUnAc0ZTUc+dTecZiFZBTZKRAjeIa2yoESwzssTXpGzFjJl8Nik7G+RCTcM
Cz283cPsg9KbhhSqcBwKrmcFfnNpGpjgk9r6/gCtt01raGtRdzRlWJAWJH3eqe9T
OuE/jOaguHuHjkw49hcGqUdlSj5BqdPjO/6wMm9cuS1jQ0VPwAraH97T2JXH9sGK
ufNZ9h8Bh2XQGOFgK+ADXUP2DdGNuIP/uxz1kBRSL+1+VI8DjFD09wRJB1/92bye
JQFqsIVQhdj19h5m2Y/IKt/qut1ppQ==
=zUSr
-----END PGP SIGNATURE-----

--XT3kLeQv44OA4A+I--
