Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9456DD972
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224F6F17;
	Tue, 11 Apr 2023 13:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224F6F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681212823;
	bh=0QlH7LYkuY8oOCmXf3UQZzhd7H5TZf542g4qbnpMDfI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JqdVcSxt8ON2aVYH9BGU5/YVnAstL7N8XQnX9o7hcTHpb2BWMNj+4bbcRbc2leqNw
	 kqIgC/JazlNipFZSxUdcQYf22bYiGFytseJvfMXMoDTPkaSqRwP2uGUzsAQHN0aXGr
	 se53DQiIVdorl6MciSxPTYJ7vXSjLVxo5ZaMe2OM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA48AF8032B;
	Tue, 11 Apr 2023 13:32:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE69FF80448; Tue, 11 Apr 2023 13:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7283F8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7283F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sG4m8x1i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEA8624CF;
	Tue, 11 Apr 2023 11:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80305C433D2;
	Tue, 11 Apr 2023 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681212764;
	bh=0QlH7LYkuY8oOCmXf3UQZzhd7H5TZf542g4qbnpMDfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sG4m8x1ieqysBBSJn6P4HnE/fw+p6JRR4BtekvMHnK9NSGgyN6nhUoTXbxqwqKZQh
	 sWU7TSPsidJaqf/S5OBiKOW9gZlKfnGM7iLJUwkeG8juJKYzzYQmeCFS3RpdRsBa00
	 Ij+6BsE8+aMZQliHvQEiGKeLM6wkt8gyNVFdzT4bTRlLaYkkikXd1OG6Kek5JMnBIn
	 DdSPhFz5CSCoTPR8yNaeYSu9Qe6a5nu0onFr3H/8uhmhgo4bqGgnA1js5TQDEa2Gmg
	 brG5JN8+a2nogmIXD8f5B+xsIJUcDOTP7HKC8P5mjfP/uyrtGZ0qbaiwji8bIkDw7F
	 UNVEPyUX5CPAA==
Date: Tue, 11 Apr 2023 12:32:39 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
Message-ID: <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6JgKId6MKfB0txCu"
Content-Disposition: inline
In-Reply-To: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
X-Cookie: In the war of wits, he's unarmed.
Message-ID-Hash: YF3GCZUDHTBED2KG7MEFPAD553OCQUKD
X-Message-ID-Hash: YF3GCZUDHTBED2KG7MEFPAD553OCQUKD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com, groeck@google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF3GCZUDHTBED2KG7MEFPAD553OCQUKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6JgKId6MKfB0txCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 10, 2023 at 09:26:34AM +0000, David Rau wrote:

> This commit improves the control of ground switches in AAD IRQ

In what way does it do this - what was previously unrelabile and how
does this change address that?

--6JgKId6MKfB0txCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ1RVYACgkQJNaLcl1U
h9D3wQf8CxeEZ+9n04Njm+X6ndWhi3heDySWcGxfJ8BmE7MrpCluRWPbSGXKfxwV
tphbZzPetgoMUJHw8XIU578Cyje4Dfc5A3FzTYH2sRTteO4AYKnhOltdf4J1JoSp
73akt5C9NyXUyh0AqfYNDTKwpmTd/eIqsP4KGMP5Rfvwg0ejfzeecDojvZl1JWdW
7dOs14xj0NNiuB2IUBdCOs7nWPlO2lWxc7Ghn4eHFYNlclC/eaMig2EbBIRt9MQ0
TLaQeE1MuuFhCtFVhnLaJxMEe9ft6WAfWMIZh8dJ46XUPe6Zd/FGVXBTjUev8v5L
wW7HqTsfG+ODchGj6iwMwYgiaflwyQ==
=V6Mp
-----END PGP SIGNATURE-----

--6JgKId6MKfB0txCu--
