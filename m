Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A37A4A80
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A71B20C;
	Mon, 18 Sep 2023 15:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A71B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695042487;
	bh=hsho6zwJgdGzMVL4844nsBVJLIQBFgjfSPu5NS4R7o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=homefOaEq0saP+5xSA0xYjt6yrsMabfhS5L5pB3sfByPZ+Q9jNqjxpqeGH30q87B4
	 N9z3JMg6To1en3M67dDpdPOrUEfu24X/fnh59pBIq5++cWBByBWoXke3C1arsKeMJN
	 XQfc5d4EN9l08UtyFsYdI+5KN1svc/B15aMKrSfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FDB7F80552; Mon, 18 Sep 2023 15:07:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F50CF80125;
	Mon, 18 Sep 2023 15:07:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B36F80125; Mon, 18 Sep 2023 15:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC3A1F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3A1F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mYtySxGM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E5AD3CE0F8B;
	Mon, 18 Sep 2023 13:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA87BC433CD;
	Mon, 18 Sep 2023 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695042419;
	bh=hsho6zwJgdGzMVL4844nsBVJLIQBFgjfSPu5NS4R7o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYtySxGMysdHsCIovmnvfHlg2AaCRdxOSMVbY5d92dapcymNtg/kl2qtiuus9BWWP
	 O5xRQVUXhyPqGfR3NU5kIxPupa2m0Hpp1SeCCC1aK3hnqJqUYS/p6IFu2lT2qGFGBz
	 YW0d9AwawXYSSHY61bLTtA4GMOT+UThCQ7b3Vz5AtA15rH7ZpPmGv91UF0UAvH8V19
	 HFKDgIVwF4TB+7Qw79Q22nieQnypZNGrTjB+gEDcVTZiLNNQl5C+jEHIpGcFdJGjwg
	 o4QQU9vPvO2j6M82ZFhGAaJUAmaWXXglLUVf0IzSeHB/1AJZM3ezI5cbQuHY8bPBsh
	 wcTWASdhyv78A==
Date: Mon, 18 Sep 2023 14:06:50 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
	herve.codina@bootlin.com, shumingf@realtek.com, 13916275206@139.com,
	ryans.lee@analog.com, linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com, povik+lin@cutebit.org, arnd@arndb.de,
	harshit.m.mogalapalli@oracle.com, u.kleine-koenig@pengutronix.de,
	yang.lee@linux.alibaba.com, liweilei@awinic.com,
	yijiangtao@awinic.com, trix@redhat.com, colin.i.king@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/5] ASoC: codecs: Add code for bin parsing compatible
 with aw87390
Message-ID: <b695fab0-1f0e-468c-a6c7-aa1003473c32@sirena.org.uk>
References: <20230918115255.33171-1-wangweidong.a@awinic.com>
 <20230918115255.33171-4-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5z+Fx5DotXtZSz3Z"
Content-Disposition: inline
In-Reply-To: <20230918115255.33171-4-wangweidong.a@awinic.com>
X-Cookie: Never kick a man, unless he's down.
Message-ID-Hash: Q5WOP6HWPVDT7RZLXI6FQJT22PA2OIMY
X-Message-ID-Hash: Q5WOP6HWPVDT7RZLXI6FQJT22PA2OIMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5WOP6HWPVDT7RZLXI6FQJT22PA2OIMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5z+Fx5DotXtZSz3Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 18, 2023 at 07:52:53PM +0800, wangweidong.a@awinic.com wrote:

> Add aw87390 compatible code to the aw88395_lib.c file
> so that it can parse aw87390's bin file
> Modify function return value
> Remove the fade-enable property because other properties
> already implement thi functionality.
> Modify the transmission method of parameters.

This would be easier to review if it were split up so that the
refactorings are separate commits, removing fade enable is a separate
commit and then finally just the changes to add the new CODEC are done.
That way each individual commit is both smaller and simpler.

--5z+Fx5DotXtZSz3Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUIS2kACgkQJNaLcl1U
h9Aj0wf/VncxZlHRbBN0E5dNaMspwCt53RF7zzRX8acE4xwwNEi9RATZwZnamY1B
QHozPKBCqDrLv0QTnW2g/ZsForhKwa/q826C7X3ROhrp3O2aKrt25Nypbtn0Lup/
4lRZ5r33uo4FOoh6t+Uj7+eCVaRnTENvmoMwn+8pfIWzmNpX8SrjKuB84kY3Ouh7
8M5qt2/G9TwArVShx8v+ovZUf99Vbm/zQP3PueyLJfH/hJxm1j51zNBHhESEoThT
tUdelqK0GXX3F3JKSc/o2B/WDmk5unSx/uE7N65Y/hcgn1qZ7FBjuur/jR8uy424
Et6u5OOpx0tplM8EO5FVl1hZG+pUgA==
=12+n
-----END PGP SIGNATURE-----

--5z+Fx5DotXtZSz3Z--
