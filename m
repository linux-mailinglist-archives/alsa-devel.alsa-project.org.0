Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8538E26F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 10:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11BE41686;
	Mon, 24 May 2021 10:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11BE41686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621845676;
	bh=fTt+Qq8onraK229Ng8P/zkKO2Mk9cBmrPG1tSa2V1Qw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHnsCm1hbwT2h0dCKG7d9n67dzgDIUnQW5vpB2MCgYRAvnbCOScZxDQmW0IoTUdXS
	 Dy2u+Ieuxh3cUar7S3bWiKkxrD8SYBYBYTckFzVwFYeBesTxY1sVTAl+5L9/OEzlRt
	 M5KdX8nDMQLtsqzxGzZNaI0+/4EUaAJM58b8V0UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7686FF80137;
	Mon, 24 May 2021 10:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1C54F8022B; Mon, 24 May 2021 10:39:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C0C1F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 10:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0C1F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RDjw63Wf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3694B6113B;
 Mon, 24 May 2021 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621845578;
 bh=fTt+Qq8onraK229Ng8P/zkKO2Mk9cBmrPG1tSa2V1Qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDjw63WfFBYxX97iu4uNOIzNdcVoZgzQ1QdQSDbv81AqtzmUFis5XdCuaxv2pF/xB
 D7xbw0CTftdyk403ltr9jauEB1RRLvX3uOXUlRkHiV0JmaI+kH3xTSTw34YRT/cuMd
 45UuKwOIx8gd+enJ394wpj4nCP30xfTdmd/cOBKtsSdpjJzGxz3mfiLcIUK48wYr87
 Q4pDOg75h4xCvEdHtn0QwUqszmRRC3JYRyBe68jmgtdYGCaMJ/siXKUwv14JdSEEar
 CGHjtaOvvr6VKX4XDC+WXLuTQe1rceNA2nGkKSepYcSYaRdfqfQmKc7n459rOjWqHj
 HQnrsZOzlhmRg==
Date: Mon, 24 May 2021 09:39:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 5/6] ALSA: Drop superfluous argument from
 snd_power_wait()
Message-ID: <20210524083933.GB4318@sirena.org.uk>
References: <20210523090920.15345-1-tiwai@suse.de>
 <20210523090920.15345-6-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <20210523090920.15345-6-tiwai@suse.de>
X-Cookie: What!?  Me worry?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 23, 2021 at 11:09:19AM +0200, Takashi Iwai wrote:
> The power_state argument of snd_power_wait() is superfluous, receiving
> only SNDRV_POWER_STATE_D0.  Let's drop it in all callers for
> simplicity.

Acked-by: Mark Brown <broonie@kernel.org>

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCrZkQACgkQJNaLcl1U
h9BHBwf/fWrs0HV8XuAAlgWEG09gx9ZOEQy3MEjKnPlBy/DMg/NwNwP6ltl5FUxC
IcCzHOBG395jzTwaYpSnGAMJkD6wxIegfCA6PPsntJm0gm4RD2p1Qen7Q/Oi112t
vIubXELBs7j+lexHfRV1zk/JGGNTKGwca8t1LyKXmC2eByF3Be8q9qZwZkYqTZf5
qv87B/uYx6gjSH+NrYD1Y3M9BzCc1yrEtPvQmOkEX4S5EGwar6nAFHtXPBIqIVsp
+g5nFkoXfc1Dr9yWtBlFrr9w3rQwT51buLm3RHNm9NNbbHmLuQzMYdTTaYvnCY9r
sVY68f94Plv07wc5SHoYAdwYbuKdQQ==
=3PrO
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
