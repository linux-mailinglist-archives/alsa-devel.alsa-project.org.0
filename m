Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A24ED9C1E09
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2024 14:29:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92853DF8;
	Fri,  8 Nov 2024 14:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92853DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731072589;
	bh=SvKwqMJIE4NuLauvgTW1PgmhPaFGJPSAxWSGXumwJgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3KqGAiuZpfTUkO4I3HZumq2RUArUQLskba/3cCkoUmLwUt3xaYX9H6jCzfxlgK+C
	 Fi5glRGJHUc1wnjoxSQdrvsuTCHNssng4NKF+5WndASKl6W+p2sbD1S5OKpYSKvIJV
	 Sd7Kv7DlhvOhz6581FdnfugaO8bWt5uzZgf2Epi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78433F805BD; Fri,  8 Nov 2024 14:29:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C629EF805AD;
	Fri,  8 Nov 2024 14:29:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16454F8013D; Fri,  8 Nov 2024 14:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5579F800BD
	for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2024 14:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5579F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qFQB82XB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C54BEA43581;
	Fri,  8 Nov 2024 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E75C4CECD;
	Fri,  8 Nov 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072543;
	bh=SvKwqMJIE4NuLauvgTW1PgmhPaFGJPSAxWSGXumwJgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFQB82XBWn7PQj8/Aa/Q9K51VXLr6zYAm+2pir05ZfEr8cm9WqH9m/omBQX2U9A6g
	 DHMlI+NoaBfY/bD7jGoyUE4HgI43vuClw/xuHPnR/kVta7LOwYXkfuA3QJ6CAxYuLS
	 raOfNzxDeyeSrdhLvxUlDQRhoond5lWYNWt1ID86HXy7LUcmDvNK17UHdL0WgOh/UU
	 oDDwtbvgEZU7M/w6vshOYoVELc3bztM/SdFVjI1irZOR7HeD+F3Z2GjmfH3HKOs6ii
	 x/ZQ9x3mw0DwnbHoAHM7N3wHPSG7cqXvfzRKTeLlrtkGDjdDiu/O4llwA2sIF+rfq0
	 d5srBka6T2PfA==
Date: Fri, 8 Nov 2024 13:28:58 +0000
From: Mark Brown <broonie@kernel.org>
To: "Shalini Manjunatha (Consultant)" <c_shalma@qti.qualcomm.com>
Cc: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Raghu Ballappa Bankapur (QUIC)" <quic_rbankapu@quicinc.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: Re: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Message-ID: <036ac7eb-aab2-4cf9-b332-e03b7b7c849d@sirena.org.uk>
References: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
 <PH0PR02MB7269C77CFF58B57CBD2B3637D45D2@PH0PR02MB7269.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M2J6Xqdiv2V/g8ol"
Content-Disposition: inline
In-Reply-To: 
 <PH0PR02MB7269C77CFF58B57CBD2B3637D45D2@PH0PR02MB7269.namprd02.prod.outlook.com>
X-Cookie: Do not overtax your powers.
Message-ID-Hash: FXSARRDAFOTL6IOVS7J75QK3EDIVBEOK
X-Message-ID-Hash: FXSARRDAFOTL6IOVS7J75QK3EDIVBEOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXSARRDAFOTL6IOVS7J75QK3EDIVBEOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--M2J6Xqdiv2V/g8ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 05:25:44AM +0000, Shalini Manjunatha (Consultant) wrote:

> Could you please share your input on previously asked query?.
> We are waiting for response. Thanks in advance.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

https://lore.kernel.org/linux-sound/aa1a8eb7-685c-4aa7-b73c-640bbcebdcd5@sirena.org.uk/

--M2J6Xqdiv2V/g8ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuEhkACgkQJNaLcl1U
h9CN8Qf/eMlU9mVRPI71yDRW+OVhEYY4P7UwhYeJTac/K6709Gz1A/+3ElDq7Ds2
pFwkYMOS9hR8xgQFRNjEEe60bNlBPZeerZb79802KX65FFwOmckfqlLIivfJUAzu
CuAX9+ZpXeiHcrnWb7sSLdt819dUsRxjmZTKiTxq7t8d5f6siEkU61Kx+8Jn/IqO
u1FD3xky0r44drf7aYYZBdXolW8AfON+klWa519RKzpvRXQNWdIVVzQdOcsr9uDW
fQYxPCIg1ePUhKuDCaxtOPupxwNoKBlnQYUhD3uGttNOySrPgFoGSZF9wGwAJj1o
o8fca5jPILO6AlupcrlIULuuYFKsHA==
=EN4r
-----END PGP SIGNATURE-----

--M2J6Xqdiv2V/g8ol--
