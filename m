Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE26CBF63
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 14:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B8C1EF;
	Tue, 28 Mar 2023 14:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B8C1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680007254;
	bh=nn16LIw9EpfaFwQcYGSQXqCsTKCycE7P4pZUOcy3MEU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3qa17tRJtsZr2U7BMbwrQebK4nXId2aglldi+bXh3gfGcLtyO2Mn0uruUNFeTzZJ
	 tS9h7Lz5gR+K0bKiZNmoU64cEpguICq+Gm2AcOC0dR4+yDF1Tkz4GPId6+WTgb+ksI
	 3BV+T8rpxdZpXALePZlBDScPBg7ffBhrX7lWiNSE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94714F8024E;
	Tue, 28 Mar 2023 14:40:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B275F80272; Tue, 28 Mar 2023 14:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA4DBF80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 14:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4DBF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z94os27u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EBD0CB81CA2;
	Tue, 28 Mar 2023 12:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B67C433D2;
	Tue, 28 Mar 2023 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680007189;
	bh=nn16LIw9EpfaFwQcYGSQXqCsTKCycE7P4pZUOcy3MEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z94os27u37AHs2V+iQFwJVIyYT1Wm28MhI8Vsj+UhKMTabj0WZUDVHZ1uZQd2QAcM
	 qkvCdJMw4cVw8D9LoT4Hf0VKdoQuoKyNiKONj5Z2hGOSPh0ObxZFGEQ4zD2UVdPxxC
	 QT6QJlLPSO9mu+bGrX2ZQGYhHymipMt07rGSKGCr599/nvYNOUo6/7gi4V6GN6/GKb
	 ynrtyX85nUAjR+1z5pQpsJ2B9wgS3GnhJMP5aL2PYfAGK9UbH5BS1WjWJpagc+S/dp
	 qgttq8533Bs0h4QnlK9bKJdhdLJMb1+Amosic0f/lWa5d7iretgHtQkQtZ1EhFqNMe
	 aaEAnWBP3W8Hw==
Date: Tue, 28 Mar 2023 13:39:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Subject: Re: [PATCH v2 0/3] Add "mclk" support for maxim,max9867
Message-ID: <55392d3d-6173-4add-9476-434c0ca1d4a5@sirena.org.uk>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <167810953075.75807.14829875612499629879.b4-ty@kernel.org>
 <20230328055916.GA11037@g0hl1n.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/KU+3QWGeX5Ws/r4"
Content-Disposition: inline
In-Reply-To: <20230328055916.GA11037@g0hl1n.net>
X-Cookie: Oh, wow!  Look at the moon!
Message-ID-Hash: 2NQ5LHCIHDBINGYFKMRWZ6TNXRKQFUEH
X-Message-ID-Hash: 2NQ5LHCIHDBINGYFKMRWZ6TNXRKQFUEH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, Benjamin Bara <bbara93@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NQ5LHCIHDBINGYFKMRWZ6TNXRKQFUEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/KU+3QWGeX5Ws/r4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 28, 2023 at 07:59:16AM +0200, Richard Leitner wrote:

> As Krzysztof requested some changes on the clocks property dt-bindings
> patch (#2) commit message... How should I handle this?

> The changes requested on the patch content (dts example) should be sent
> as incremental patch to the original series, I guess?

If it's just the commit message it's too late.  Otherwise incremental
patches against current git.

--/KU+3QWGeX5Ws/r4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQi4A4ACgkQJNaLcl1U
h9ALMQf+P/8cuhcsUKZkbi/0fDs7f4PbP2NnFRxf9cjyrqVri3bryJPse+80sqsp
5KRlX4Pjo/76Nx9BPt3gBCInn5aVZTsn8aGZIVOVYy7/+IoNzYTT+xdPdvlcYp6V
ChEkJOWSUINT7tLQ2VD4YVEapJB/xKGssTroBpMbh8meoPvGhwUJhleiPrpomf9F
3ChCECzZMgDFvbfkPXAR8mqkssYgWVugRbhYAY50uc8deZ0QIrqYGATNFdox+MEI
8QoKLzT78vf2pnr7q6lWDzJtlqFgBDGF16Rok9rvTYKOf9qKIZZjUJ8Ly00ozXx6
GzYgmU5F4xBJiTITtVMYThWCRQ58Ag==
=Sgms
-----END PGP SIGNATURE-----

--/KU+3QWGeX5Ws/r4--
