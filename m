Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC95F34AB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 19:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341B9185F;
	Mon,  3 Oct 2022 19:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341B9185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664818717;
	bh=kSQDH9DcbUcC6QUuOUfyfevI6EW1l3YPQhbc1mqY79U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BA6Lv/zWIy5VeELh2G9xj3n2KA6SH5b1dhkEdscsDvqRcBZTWBKOpFT3QlFtRtsm+
	 16FSZVxCoQWphE8oxW62GAAGIXPMxANiZcw/KYis++Fysz9viEHz50Jda+QdE2iWqp
	 DG+pGSg7RnoP3JBQ64R6rLr7QPnJH2fpE7XSOp0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9183CF800C1;
	Mon,  3 Oct 2022 19:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7438DF80269; Mon,  3 Oct 2022 19:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99754F800C1
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 19:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99754F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KfC7a95N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7252FB81085;
 Mon,  3 Oct 2022 17:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DF1C433C1;
 Mon,  3 Oct 2022 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664818654;
 bh=kSQDH9DcbUcC6QUuOUfyfevI6EW1l3YPQhbc1mqY79U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfC7a95NFUEUtwQ5tjnTpjp1m+tqpRKb7raF/HJTUkUAsOwbdfgxdBvI126ia5Lfr
 hR64fi/gWkLEUtIfdF+PS59xeyJPJN6Jt96nVaaIMdwQj4l1g8XlT+gHkJDHhEPwGP
 S3+hQ63v+ofvqfRw/4hHTghPbK/JDh2R9VOIPfgHrS783I2ftLHyJ6jRVYipUnMK4g
 +7hNeXlahBJ24n5TTtgwzplCtEmt4dwgXP6K/Ed1LSAJ8Tu2DXfg8gT83B2dYIMPbi
 BMDOz0lLTc7/hmG1Ph6bC/GJXLdCT40vw3D9OoFwfAN73OmIuJjswZGYIX/XuIVu8v
 n1m5nF2La8ZbQ==
Date: Mon, 3 Oct 2022 18:37:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 4/4] ASoC: mt6660: Fix PM disable depth imbalance in
 mt6660_i2c_probe
Message-ID: <Yzsd2ctRQB/6Tdvc@sirena.org.uk>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-5-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hZY/cLFnhrylGE4A"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-5-zhangqilong3@huawei.com>
X-Cookie: Store in a cool place.
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com
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


--hZY/cLFnhrylGE4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2022 at 11:06:53PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.

This doesn't apply against current code, please check and resend.

--hZY/cLFnhrylGE4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM7HdgACgkQJNaLcl1U
h9DeXQf+Pcn1W5iMv8sq7yHqIH+EEwcqfrgjbAl3T/+zCd79/uPnzlz93ic2vHgI
sn6QKTTb9yNqyp30+FzJQcut0kRNT2My/Ykw7AC7VDHERVEqpOVFFvyRh7XvRxvt
pC2NwRH8WRGvQwJe4D/z9EqdAv0h1MgdaRjh8+IWdUyJz3+XsGcnd0TJ3XPYMxrm
vnj8a3M6djEJJijZtkooEgteByH2I8YI/ggXTgh48C2y4SJ8pu3mjTkGWTNhwbHp
FmMDCUVrKab0AxFbtSk7RClP5VLTCnHr0Ot7ThE4BdYBB6wNeDJtA2jeddd1FHPs
6UF1eHrFgwEYSEZ7DsiSDwRyoXQhyg==
=bQ2p
-----END PGP SIGNATURE-----

--hZY/cLFnhrylGE4A--
