Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8179171C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 022F4741;
	Mon,  4 Sep 2023 14:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 022F4741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830718;
	bh=RqwxV2g+EMhwDdFUCKxB6yJM/Of18ZC1KHGmZLecgyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BmGeVc6xIxdU84p6tBlzgiw4sGS7awJ4dhVedL35HX8Y9bhepF0m84F0xtolXKCha
	 wHUdLtH/07IeAMHSG8qmktMd5W4npc4I5aP3pjms+QyiDT3RGIBXppgxye966uns6l
	 bQrX9YTMutPDG5ephLBgEPdCOJPenPTDKHMnIdfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA8CF80431; Mon,  4 Sep 2023 14:31:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C1EF80494;
	Mon,  4 Sep 2023 14:31:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69918F804F3; Mon,  4 Sep 2023 14:31:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 758F2F80431
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 14:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758F2F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rf8Rp8WM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A31C61047;
	Mon,  4 Sep 2023 12:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEB9C433C8;
	Mon,  4 Sep 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693830649;
	bh=RqwxV2g+EMhwDdFUCKxB6yJM/Of18ZC1KHGmZLecgyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rf8Rp8WMghLUrPsZXpPmwO5qAAAmw7r+iOTyexQ3ZrqARtvOP1UwO9Yt/Jso7Z/Re
	 icXXJCzdQCIelgTdwT7Nej/MCuJjVNe2EUlyOiffPOH+gv68zj4N6b9YZQS6/kFsAI
	 ILjsx5otxrcrKRE94+a4voWYIfjAHID5TmXhQvrQ2nohpr0i0z2Dg6j5YkKgx13jPO
	 dkKc+DoXft+NZX05/R8qcfE6Ibcv/ti+FpACkL5fN6FMpAS2lc4K5WewIgRGnx3Az4
	 TSY/fJk8UzFgMs0vxmU4N6NJxkvUrxjvTPz8UNXfywRa3hyFVUZZ3pyp0ElXOvyn3/
	 dGY1b6/eUViyA==
Date: Mon, 4 Sep 2023 13:30:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wangweidong.a@awinic.com, lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
	herve.codina@bootlin.com, shumingf@realtek.com,
	rdunlap@infradead.org, 13916275206@139.com, ryans.lee@analog.com,
	linus.walleij@linaro.org, ckeepax@opensource.cirrus.com,
	yijiangtao@awinic.com, liweilei@awinic.com, colin.i.king@gmail.com,
	trix@redhat.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhangjianming@awinic.com
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
Message-ID: <598febde-429e-4319-98d4-4306a7f8bfe8@sirena.org.uk>
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
 <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+c3Ap+3u5fsANoA"
Content-Disposition: inline
In-Reply-To: <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
X-Cookie: Immanuel doesn't pun, he Kant.
Message-ID-Hash: FVPVEYXW5UXAACZA3AMR6EDCFYVV5IRK
X-Message-ID-Hash: FVPVEYXW5UXAACZA3AMR6EDCFYVV5IRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVPVEYXW5UXAACZA3AMR6EDCFYVV5IRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--x+c3Ap+3u5fsANoA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 04, 2023 at 02:17:43PM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:

> > +	ret = regmap_read(regmap, AW87390_ID_REG, &chip_id);
> > +	if (ret) {
> > +		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
> > +		return ret;
> > +	}

> > +	if (chip_id != AW87390_CHIP_ID) {
> > +		dev_err(&i2c->dev, "unsupported device\n");

> Why? The compatible tells it cannot be anything else.

This is very common good practice, as well as validating communication
with the device it verifies that the device descrbied in the DT is the
one that is actually present in the system.  This might create hassle
down the line if there is a backwards compatible upgrade but that's much
rarer for this class of hardware than cut'n'pasting of device trees.

--x+c3Ap+3u5fsANoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT1zfEACgkQJNaLcl1U
h9A+8Af9GepgJeENtK4ITVlnoOj/k1G9hqOW1/oZbk1m0bHzN5cGdLzP2fbfXmiJ
sItWYtATMZ6k8Jj3+m+3oN/Zb5LbJFgj2dn545Ta8ErJioNS58furbRG0tkvR4vt
AsJaIUwPRVEQNhPWGVPDp4q6El1mcbsOZgxMvQD5ljIbRugC3OvzVdsin3M/Y/IL
61QrFvP/9bfq5mP3ieLRcg8BkdZZnR4lLWGx6LFjIVedoFZ5aRrritfT/Hw8MLwC
lFpu2yPXej0/WSRc0qcjhoeHm2fxKtYwHJCl61ZfnWUj/iV3ojpFlpeFCfyL92Xk
bdGwVDZjPvpzWApR9AX5FkKvk+vH5w==
=r39d
-----END PGP SIGNATURE-----

--x+c3Ap+3u5fsANoA--
