Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14366161D0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 12:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F8B1669;
	Wed,  2 Nov 2022 12:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F8B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667388831;
	bh=yoHsM6tzdVUYkSoFF8KSjoXXJcut+N1ohrZ0gOth29Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qa64VDZgX343abazP6ZUNJ9o1DTcI83ciomGKfXJhIza25VZDmLxCbMZIba4oTom+
	 Piff/74N3BkXL62V+GCOHIWUegM/HSJFogWWzJ8vFuDl9Y0nJnKBU9GkjIBfBJWc3N
	 M9771R1o+QlzQjvkz+NexJbajfqOsbm+RJ9fl8ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF78F801D5;
	Wed,  2 Nov 2022 12:32:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF0FF8026D; Wed,  2 Nov 2022 12:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C1E6F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 12:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1E6F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MmSYfK+U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07F20B82071;
 Wed,  2 Nov 2022 11:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F11EC433C1;
 Wed,  2 Nov 2022 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667388768;
 bh=yoHsM6tzdVUYkSoFF8KSjoXXJcut+N1ohrZ0gOth29Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmSYfK+Uxc8Af0fr9SSp1F2vFXBAAiNMWRKCQsYuYy1waaPZCBtnUFINCX7N3SM4W
 s13tuFdamtC6JI4h3QBVAqdxWZrQPJfB8CVyG1XTgKfIfYMA55jI/oXhGvlMPPMEXF
 B6TcVEnxrF900DtBvHOfSn6JMuqjvOoP+qd20yU2qEFmalPHp6h8dd26vEQHB9hKXE
 H+rNXTtKpSRZeNKTWEvimkPYEZe+vpc5qop5CQtfVbgwG0GfK/+RokTZYxTJ79fVQh
 SJiOnMArcxS6O5OsTgtDqtt8ss+/ovo0r5ongKtQ612I6Q3WROm26opwe4bKWmXdwl
 UwwPsJEWDKkJQ==
Date: Wed, 2 Nov 2022 11:32:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Message-ID: <Y2JVWmJsprt0xnKH@sirena.org.uk>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
 <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6S2eJXa8E4+Y1UCq"
Content-Disposition: inline
In-Reply-To: <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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


--6S2eJXa8E4+Y1UCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 02, 2022 at 10:59:07AM +0530, Venkata Prasad Potturu wrote:
> On 11/1/22 20:01, Mark Brown wrote:
> > On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu wrote:

> > Right, that's what the code does but why is this something that should
> > be controlled in this fashion?

> This machine driver is common for TDM mode and I2S mode, user can select TDM
> mode or I2S mode.

Why would the user choose one value or the other, and why would this
choice be something that only changes at module load time?  If this is
user controllable I'd really expect it to be runtime controllable.
You're not explaining why this is a module parameter.

--6S2eJXa8E4+Y1UCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNiVVkACgkQJNaLcl1U
h9BonQf/WOzgZDEZv8RNQ4jP23/wuknKo8guxsWKck2+1KjS6H71fYA8QQov0Ram
ctytaYT07gWmnwqOU7rNk8dOsMLeqSi4fRaOrX9P5D2QJ8Q6HF7IgBHN4b9QMqLe
/SuNdWvkY+rgkiaZOuMzXAw4xVXao0B1TG3feHqgeYeO3h4Gkozy6n2tQOn/ETBg
N6szVTLGRqzGQeb12XBkpJmeQwUrA3VagVeV6CQquMUdnf4Q9xAsPi9LWYVpS73U
lh4digzscLLrlU/yZxbqz4gJqrZ+iGbQRBa2cD16pDueAIuDBtSh9Dx+k95Y0MvS
VY5i0Qe/maNcCPV4537jKuwcMxlkLA==
=DdXj
-----END PGP SIGNATURE-----

--6S2eJXa8E4+Y1UCq--
