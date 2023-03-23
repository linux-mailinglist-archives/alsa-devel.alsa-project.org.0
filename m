Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6356C70ED
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 20:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563E9ECB;
	Thu, 23 Mar 2023 20:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563E9ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679599109;
	bh=t2fKFQycO5bMhtMShqAmTqjWXbmR7ABgwZ9hE9vbbO8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=REziBo24VbIJ8CCYGvhUo5eXirVv3JTYGw7jFyryZz27igIqfGocy7V+K+JE6EV5A
	 F/7be3FAb8KOb2WFnOyIai66OCL4LbHGUB2w8z3fZPxnVKCUSdbDcmtxPcjLS4PH+E
	 s6rO0EQwncqtDHNtC9Pei7Obmc76jtHUffhVYa7I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90044F8027B;
	Thu, 23 Mar 2023 20:17:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F001F802E8; Thu, 23 Mar 2023 20:17:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBE54F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 20:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE54F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sv9hDyvA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29EA062859;
	Thu, 23 Mar 2023 19:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99678C433EF;
	Thu, 23 Mar 2023 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679599046;
	bh=t2fKFQycO5bMhtMShqAmTqjWXbmR7ABgwZ9hE9vbbO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sv9hDyvA+CJBvCs2nrf3nppcKC97c95IbuTArMW9F2m4z3CmaNXXQYyOozwm/5hUS
	 6mpHk4LewEl5Q8E67w/vpahxuk2+hi5oPpAsrsEnUFvPYQqcJ3DJ/q+8ihyfAKUKP9
	 J7HllZQzFrNterW6trCzi3QmBuBXzrX2rw1e5wA9a98HXUZOaG+oFJuGUQUP+xOG3I
	 bfVj58P1n/iX/M33ssg7d/CSyM/bpfEC02jeYrYoC9YPusbtnfSQhRdGHXvI5+1Rpy
	 Jt6C5+ZEyc9sF5MQGkW7AVlkJ3uP/VHTM5vbu+qRVPNVbCAST5XlXOt7oNfs/EbOsk
	 l3dwiYKMAntGw==
Date: Thu, 23 Mar 2023 19:17:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
Message-ID: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
References: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
 <20230323171111.17393-1-danascape@gmail.com>
 <5e0ca610-70b2-90fd-45b8-6b0da089eb4c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7CQC/ouNR9GP9b1L"
Content-Disposition: inline
In-Reply-To: <5e0ca610-70b2-90fd-45b8-6b0da089eb4c@linaro.org>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: B5NCMT64MDC6ACA5X6T3YJSL5RX4CWVC
X-Message-ID-Hash: B5NCMT64MDC6ACA5X6T3YJSL5RX4CWVC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saalim Quadri <danascape@gmail.com>, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5NCMT64MDC6ACA5X6T3YJSL5RX4CWVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7CQC/ouNR9GP9b1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2023 at 08:08:33PM +0100, Krzysztof Kozlowski wrote:
> On 23/03/2023 18:11, Saalim Quadri wrote:

> > I have a doubt, for the maintainers list, is it required to include all the names of the subsystem maintainer
> > in the yaml too? As for this codec, there are 4, shall I include the names of all of them or the one to whom the

> Depends, choose one or two names, maybe the most active.

Note that the binding should have maintainers for the specific binding,
not the kernel subsystem.

--7CQC/ouNR9GP9b1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcpaMACgkQJNaLcl1U
h9BsEwf+Nx+o3rV+MH36b07ERBsVKvXQ6FnQ8HOLP5a2hTkgLHsrsA5DabtTZL2n
C0ljaxQnG9Zshd2NXFLJo9fUQQV7pY/P00ChOR1xj6pYmGuo5rUNBgUJDOv815T/
tMeE8doM4fB1VtDB+N00BKQ/mwQNmi2IegqyfsFAUXrq2BXEkFU+QusiyVjV2Kds
YA8qCHEU08XOeR1Atx5fobkG5e3+4jzPXkdb7RJWwqBj37UxAKkP4Gro1FAHg3R3
p1rujZCF96UHOmNNexX42a8Fnx7PvVSKTM9r94qsKPXtwEBzABc2GwhXnYgEf+hh
oGfSbBgbFmixgevj37S8rj0UcwBbqQ==
=h6F7
-----END PGP SIGNATURE-----

--7CQC/ouNR9GP9b1L--
