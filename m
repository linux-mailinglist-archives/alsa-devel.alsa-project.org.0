Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669227D501C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 14:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42342850;
	Tue, 24 Oct 2023 14:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42342850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698151395;
	bh=5lr+pjwvp0zOcTeinONIaVGHup83Xhs/5KopjafIzWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W75Q3r3uq6Zt94tgbOTbXaq+4NupPyWnuWN+N+vmfp6PK/fQVfAwA37lZRJ2jfxoQ
	 XDXRP2Vk+ugr+diF/CDVdWc/xxPugNA65NaJWtqGuJDK7vmwvIZibF7Hx2oapOkRbE
	 V4Lmmq3uRrnr1v+WvpuNzUUmm4YOa4bO/JrHCosg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4BCF80537; Tue, 24 Oct 2023 14:42:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 780DAF80157;
	Tue, 24 Oct 2023 14:42:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97305F80165; Tue, 24 Oct 2023 14:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F3A0F8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 14:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3A0F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jT/Q06gQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E361CE2F07;
	Tue, 24 Oct 2023 12:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AB4C433C8;
	Tue, 24 Oct 2023 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698151333;
	bh=5lr+pjwvp0zOcTeinONIaVGHup83Xhs/5KopjafIzWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jT/Q06gQwMhmXpCagBElDNMA/5ot1BalmQiWLI6DB9ID59whjQKQaCKm1JrMAKVCB
	 oQh+TomXr/VvPjWIzDJZhOvHa8QvvmTDDf8SQOGnWhZMb+XuxoSWFxJzoYfPwt5LhJ
	 WiNGScv9mbRQnFgdDMQQDcsV8h3/l8iUsEQ1uo510OFScpZQrroRFfVYuM6KSFHRiX
	 qC5n7AQqQJQRn4VMAFumFtTqpmo9DH59WBImCUzPhYCD3F1OM5el7To6V8e6BOwU6e
	 4qAxsqJ9xFjY1eLZtMXHQc/tOXL0+Nfzh/gLMaaFazGfLjr6UdkeCjms+EKZv89Nqv
	 Sz3zpyz6vhWSw==
Date: Tue, 24 Oct 2023 13:42:02 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org, arnd@arndb.de,
	ckeepax@opensource.cirrus.com, colin.i.king@gmail.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	devicetree@vger.kernel.org, harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org, liweilei@awinic.com, perex@perex.cz,
	rf@opensource.cirrus.com, robh+dt@kernel.org, ryans.lee@analog.com,
	sebastian.reichel@collabora.com, shumingf@realtek.com,
	tiwai@suse.com, trix@redhat.com, yijiangtao@awinic.com
Subject: Re: [PATCH V2 3/4] ASoC: codecs: Add code for bin parsing compatible
 with aw88399
Message-ID: <27dd3dfb-7a40-4e26-b8c2-e432c30a0eea@sirena.org.uk>
References: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
 <20231024071929.88898-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pL7UoU2fS9tXvDvv"
Content-Disposition: inline
In-Reply-To: <20231024071929.88898-1-wangweidong.a@awinic.com>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: 6WJOFGKN6LSR2MHJYBDYDPPBPTY5FXWL
X-Message-ID-Hash: 6WJOFGKN6LSR2MHJYBDYDPPBPTY5FXWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WJOFGKN6LSR2MHJYBDYDPPBPTY5FXWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pL7UoU2fS9tXvDvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 03:19:28PM +0800, wangweidong.a@awinic.com wrote:

> I generated the patch based on the mainline branch,=20
> Why would there be a conflict? I know that I made a change to
> this file when I committed aw87390 and that=20
> the change was in the Linux-next branch, but the two=20
> changes are in different parts of the file.

I don't know off hand, I didn't check in detail.  It's possible someone
else sent a fix that's been applied and is causing the issue - if you
check out my branch and try to apply the patches hopefully you can
figure out what the problem was.

--pL7UoU2fS9tXvDvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU3u5kACgkQJNaLcl1U
h9Dr6Qf/fdkNinl8wVxXP3U0qwaV15ASSfA38GeqDIqp+FlZSN61aMRCAfgEvI0y
QiJ1yqwLMrQzbWZcss2SnDi3N0J7KAqe3DXDHyH5FGYDxgSpMegLxDojqD6ecoEV
vf25mLtwq6w7/2LHuoJqiPDeE+LARk28dFHrIeAiQAl0NDxBX+Q84heKKbTzf0iC
RxFTOfdtBPxGmm0pyA7bm647VGZ5cqC2Yres0FD+ES20QnEh0lRImX7PY8yCAvyu
ykm+apBEZeKrq27nTFpmG4tNSFh2tCmlPCVhM4O2kGflQ0YHQUa0S8HxrnKiXSRb
2A8LUloo0+K+kEFa6oTbzwdjhOjcGA==
=RVdx
-----END PGP SIGNATURE-----

--pL7UoU2fS9tXvDvv--
