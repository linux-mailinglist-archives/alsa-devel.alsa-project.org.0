Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C2338FFE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 15:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C86516A3;
	Fri, 12 Mar 2021 15:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C86516A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615559285;
	bh=RaGXMvtngGPPtkkC/wsE4ETfUTd8b3MZ7rwhK5ToRGg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGMnMWa6v3EnpSuCboOPQzspeMxCNWaOkdelkTWhI2FfiHgJgS8L2QkFTYr6Ck+bM
	 7Fsie/zLB/EZs9KQpuItJj71QveQxz61GjeZnouc1ChJsPL1I4i8F1HHRyqXySm889
	 QTurfQqTZVm6AvraBC/Twm8pJ09IRJA+ofOr205E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B914EF801ED;
	Fri, 12 Mar 2021 15:26:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E868EF800AB; Fri, 12 Mar 2021 15:26:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6159AF800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 15:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6159AF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qsTT96Q6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 227B064FB2;
 Fri, 12 Mar 2021 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615559184;
 bh=RaGXMvtngGPPtkkC/wsE4ETfUTd8b3MZ7rwhK5ToRGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsTT96Q6oC/DSPDmXvuuplJzPWy6szt7f73H267AKB6RUu3AIjUf9WInswnr5jDF8
 ZMKd1Z0bXmgudtWL5/0FDmhKPXx5yT7iQu6tJl0AV9C20Iwvr89Z4YkH8Rs6zggXrX
 zKXDHrdOXZqaZIz11F3tW8FAAaeUEXy1f72FYVO+b6QH4E3Sufi7rQeo1sLKKFecMg
 9K8fryI/FzemIxgVo3ni+c8HuUY6tkY9/SWy5fwxOmJOJ7cjWvrNwHNZhxM13zM4s9
 IO8Z3AZ2zzGkTIXQ0jgkUaZSmMjAikh+LCOt870XAc0Dk9v8uUBW4zvNLha6E59cM5
 ZIJq9n1EwmMig==
Date: Fri, 12 Mar 2021 14:25:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: intel: atom: Stop advertising non working
 S24LE support
Message-ID: <20210312142511.GA16445@sirena.org.uk>
References: <20210309105520.9185-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20210309105520.9185-1-hdegoede@redhat.com>
X-Cookie: Subject to change without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 11:55:19AM +0100, Hans de Goede wrote:

> Fixes: 098c2cd281409 ("ASoC  ASoC: Intel: Atom: add 24-bit support for  media playback and capture")
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

	Fixes tag: Fixes: 098c2cd281409 ("ASoC  ASoC: Intel: Atom: add 24-bit support for  media playback and capture")
	Has these problem(s):
		- Subject does not match target commit subject
		  Just use
			git log -1 --format='Fixes: %h ("%s")'

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLecYACgkQJNaLcl1U
h9CoYwf/ReyC7yEurS99wNbE/0I0AFXHjpmJqXNPLqIulJDGDLjPyaHWTtS6PEa7
i76gEAw7WWTGR73FgHAcoD+0ZOkOcKg6Qk64bAPUk4oemQo7m0JBvUKssmC+9M9W
eNf2LuJJiqJRe3DMp5AO8Ew3cuP3JfZzS7sHGo/U1C7251gIUG/YKG2Qj2wKBQJi
5X+rjj849qH9WS0IZSGEsjCPrlqiiFhuw60nM+KuZcts4M0tANhEYJ4TrPV5Fp8Q
VRC1edyWaFewm0iYX6QtKAQjR6Zdb0z68AGe20mSwPV05Ghz2lMjxD7YY36EtlX7
+++59pH+l0RJunCKumT5oe2Xcli8BA==
=FD5i
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
