Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507A7AE71D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 09:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A8CA4D;
	Tue, 26 Sep 2023 09:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A8CA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695714528;
	bh=vl35SqT6As6GYRAB1JyOE9/QeFzf9D4iT44T99JNDlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ocUUZerP5UoBSYNVto8cRP8MllerjGrby7VGbKi6G8C/QEP/ov6f2Vt9LosgWWGAc
	 mXbLS+0/CH6XUHcRWEqH8d2vwfSwFMCTJYhgwWAqzTIXqlloa1jpI7CjIk0aM3jq37
	 gWFSS891W8fgb4PUDeSxlKf6LM+CRWdrHVRrDAGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A9F6F80552; Tue, 26 Sep 2023 09:47:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45662F80166;
	Tue, 26 Sep 2023 09:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D102F8016A; Tue, 26 Sep 2023 09:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8966F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 09:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8966F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JjUhAaao
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E8D12B80C66;
	Tue, 26 Sep 2023 07:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91C3C433C7;
	Tue, 26 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695714455;
	bh=vl35SqT6As6GYRAB1JyOE9/QeFzf9D4iT44T99JNDlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjUhAaaoMDko8sv9+IFAdtVK2RNanulH1ZWFUiB1DPHQE7cHVcsGafcs8JEz0Vsaw
	 mS9dPobqyU+cvTEo1zmOaQ/21D5jUVnWXrgkQkd3M+qYg/8kfRi7p6lHnMEgPMrk+h
	 D8lCCVtAczUF7D03AL5w34mfyQd0S5MSrI/6FefEn5G5o+JBHOQCqlVMc7BE67xyQg
	 BqUksUX/eKNggweBScJtbTmo0lKvSq25NB/NLy70aSszQAox93L8xic42RY01Nj4LE
	 152ryVriErwTu1sUfFrFk6XPN+sIY2Ez54b1ppXxdguEyE7bxlzVgLE5724i75oLKp
	 lsXcr6Pq1b6JA==
Date: Tue, 26 Sep 2023 09:47:32 +0200
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, alsa-devel@alsa-project.org, arnd@arndb.de,
	ckeepax@opensource.cirrus.com, colin.i.king@gmail.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com, herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
	liweilei@awinic.com, perex@perex.cz, povik+lin@cutebit.org,
	rf@opensource.cirrus.com, robh+dt@kernel.org, ryans.lee@analog.com,
	shumingf@realtek.com, tiwai@suse.com, trix@redhat.com,
	u.kleine-koenig@pengutronix.de, yang.lee@linux.alibaba.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V4 4/7] ASoC: codecs: Add code for bin parsing compatible
 with aw87390
Message-ID: <ZRKMlCd+Ys5kGXVw@finisterre.sirena.org.uk>
References: <ZRGT2oLQaJBVVYFH@finisterre.sirena.org.uk>
 <20230926070436.486530-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tZVZOycL8pVKc0vY"
Content-Disposition: inline
In-Reply-To: <20230926070436.486530-1-wangweidong.a@awinic.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: YYM2ZUGVZEWYBOIBUVR6VF4DIRMWJH67
X-Message-ID-Hash: YYM2ZUGVZEWYBOIBUVR6VF4DIRMWJH67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYM2ZUGVZEWYBOIBUVR6VF4DIRMWJH67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--tZVZOycL8pVKc0vY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 03:04:30PM +0800, wangweidong.a@awinic.com wrote:
> On Mon, Sep 25, 2023 at 16:06:18 +0200, broonie@kernel.org wrote:

> > /build/stage/linux/sound/soc/codecs/aw88395/aw88395.c:199:21: error: to=
o few arg
> > uments to function =E2=80=98aw88395_dev_get_prof_name=E2=80=99
> >  199 |         prof_name =3D aw88395_dev_get_prof_name(aw88395->aw_pa, =
count);
> >      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from /build/stage/linux/sound/soc/codecs/aw88395/aw883=
95.c:17:
> > /build/stage/linux/sound/soc/codecs/aw88395/aw88395_device.h:184:5: not=
e: declar
> > ed here
> >  184 | int aw88395_dev_get_prof_name(struct aw_device *aw_dev, int inde=
x, char=20
> > **prof_name);
> >      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

> I did not get this error when compiling base on "2cf0f715623872823a72e451=
243bbf555d10d032"
> and the changes to this function are already in [patch V4 3/7]
> Can you tell me how to modify it?

Apply every patch in sequence and check that it builds individually,
including for configs like the x86 allmodconfig.  I don't specifically
know what the context was here, I'm just reporting the failure my CI
found.  If you're confident things are fixed then resend.

--tZVZOycL8pVKc0vY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUSjJQACgkQJNaLcl1U
h9AhNQf+PgXK+9hFtAV8TDEBHilOTUoirrT7GLRXtflsuD4DNlW9QYMd+UEt6YT5
lfNWJhq9hhwcgdAfc2L8n22a+WN+tt5iEv1r4V0lRXxhvoxuWiWoPcM4z+Udr5KG
Oj49aBdhZ0XMtu8z4YzhDJtra5cO19kvv+1t8zI+9XKYUSuUc4PrVDDWdCU1LSMm
8jnd/Q5ViOky26oktO/JMDD9rpIIE023Zwvyrz1/gadhZsodwUP0UUwXs+dR1KVF
3sLPU61KC9TVfPrtRESiFUn+rj6FW4qk6m6H/vFq83UksIBF3V2H1M5Nk9m/meyV
JY+hC93fqWPdqhpqPJSTC5loPpwfNw==
=5Afg
-----END PGP SIGNATURE-----

--tZVZOycL8pVKc0vY--
