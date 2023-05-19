Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52091708DB5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 04:20:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A3F200;
	Fri, 19 May 2023 04:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A3F200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684462800;
	bh=3m3zEYW3ZtDjurspBCO1GS8X3tGts0YUXMYugRQCwEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yz2tN7RO5hRCzn6VIEdAXsUPvO+SxsOlvJo/t6MdTj3JcYu5vZisxhiDc19tI+y6b
	 RaqiFq0NE247JpkYF3/f7DI5oY7UZD7ew0X5AH+8+Jx2O5vZMPoFam1R4g1XMmtWI9
	 fRAOZRiTVH2SM9q8WNnBk/PaGZUIPyBa/3J06PPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 554EDF802E8; Fri, 19 May 2023 04:19:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1258DF8025A;
	Fri, 19 May 2023 04:19:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C0EF80272; Fri, 19 May 2023 04:19:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6976AF80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 04:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6976AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dBI7M/Mm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 604106538F;
	Fri, 19 May 2023 02:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAB8C433EF;
	Fri, 19 May 2023 02:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684462737;
	bh=3m3zEYW3ZtDjurspBCO1GS8X3tGts0YUXMYugRQCwEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBI7M/MmAyWcs/qdj+/kJSPhQh1oIEfWzmp8J4unUPqr8JRQhlV+4430MNoNkMEXH
	 KWZi5PUsIemrtZ8A+zplqI6v3bb5zLh2l2B2/SEB2/5QXOM84nIkKzdQDPntwTM0Hh
	 OyV9VZesh1jfWH2l86yK3KrxJ8SkVy+bk/qT9B3F2eSyCBPLIzuhCISbL73lz4W0LW
	 tAA9Innemy41P+IUCmMuD1K6Z1OIKrtjIqFQgd+mOtfYMQE4yRdtx2YTpv06NacdN2
	 JDAVXcR+uiWQmQm+smsf7vT6kIuWJ790750BT4ik1lhfkusnfNcEu95/e0NfoJmK8O
	 g+6pqyyRCuqkw==
Date: Fri, 19 May 2023 11:18:54 +0900
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Svyatoslav Ryhel <clamor95@gmail.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.3 01/24] ASoC: jack: allow multiple interrupt
 per gpio
Message-ID: <ZGbcjv87zExPUCj4@finisterre.sirena.org.uk>
References: <20230507003022.4070535-1-sashal@kernel.org>
 <ZFg2ZWqEBkPsJk+Y@finisterre.sirena.org.uk>
 <ZGZbsIMIa6qgU0ht@sashalap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="50MO9Agatimjxjpc"
Content-Disposition: inline
In-Reply-To: <ZGZbsIMIa6qgU0ht@sashalap>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: MHZYR25HOVAMGXJZ3B42IYALTAQHZJR7
X-Message-ID-Hash: MHZYR25HOVAMGXJZ3B42IYALTAQHZJR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHZYR25HOVAMGXJZ3B42IYALTAQHZJR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--50MO9Agatimjxjpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2023 at 01:09:04PM -0400, Sasha Levin wrote:
> On Mon, May 08, 2023 at 08:38:13AM +0900, Mark Brown wrote:
> > On Sat, May 06, 2023 at 08:29:57PM -0400, Sasha Levin wrote:

> > > This feature is required for coupled hp-mic quirk used
> > > by some Nvidia Tegra 3 based devices work properly.

> > This is a new feature, why is it being backported to stable?

> The quirk aspect of it :)

The same logic applies to a huge proportion of new features...

> I can drop it and the other patch you've pointed out.

Thanks.

--50MO9Agatimjxjpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRm3I4ACgkQJNaLcl1U
h9DKwQf+Mikt6+8MCZHDxQ1wachhRQ5/pRZKLkBDLYX2s0RJUvXHYfJPYsnDvrGJ
COd3UQRBWcPRc8G8nuSQlB9V93MaL9d8z5nNlBhIltMiX5Vgjg5W7U/ZKiQ/UAEc
O0vGDApPKMqhTwxqFOhm6NnszmtDDMIB5k0kMw7N53W64y8BjQJugwappq2CtkDu
s6UaaLlVwYLJJw+HG2ZOwQ3Ig23uxj3knZzAToG36xFOdGd3J11PqWvR/naDcaDl
sI4yUPvH+ZU4BN79dTa/zihwond2jtHKNsDvZiBJJxul+e2XUKENDT2GKzTlGI5b
w9z3lNVMf+VuuElsCjGxBmKxZqY3hw==
=koQL
-----END PGP SIGNATURE-----

--50MO9Agatimjxjpc--
