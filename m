Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB27AB3B9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A8CE75;
	Fri, 22 Sep 2023 16:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A8CE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393129;
	bh=+/eXrMbjo9AYUje7C8sHSUC5rVwhb/5kqN65KjNA98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AYJCcot6oiJIRVUaSH2XkqGfjaEzE0gYcA34wYVxdKaLaV5ciDgQWynFRAUOdCK5v
	 GjCpj79rq4OFuPS+TtIffNHXz26VamEoM6CmZgTzv3laOX1/m9+stlGfEKDcvoPrwe
	 ulP2i9vS8ZgY2RUaIdgJ02+6V0r6rk0tL+I+5LGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589CBF800F4; Fri, 22 Sep 2023 16:31:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E554BF8025A;
	Fri, 22 Sep 2023 16:31:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62760F8025A; Fri, 22 Sep 2023 16:31:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D8AF80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D8AF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bX7AfFwT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 783E161041;
	Fri, 22 Sep 2023 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99ADC433C8;
	Fri, 22 Sep 2023 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695393061;
	bh=+/eXrMbjo9AYUje7C8sHSUC5rVwhb/5kqN65KjNA98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX7AfFwTfpiTS9a459g8HxQKG5NcBLT2GV8e1Vv+h5S2zF6aOxajjcJtIQiZVqK/T
	 wlbDQQSAqkEoWhokbsqXTpszdQeHzeM2H0C72yI0cyAlsVOv8Q4GAFZcxp6LBNuNWH
	 uefyI2g/suqUqJ2Qj81D5dFTP0jE/ytoDL5+BvS4Q5mEgUEiIXN/J0NeCyFtdWYD5E
	 Z4yrbR5mhzujZqLl2HgbBKKYuPjl8BFZIhNQ8kb/KpckIfr1GNTuV9QPLacMWMa+db
	 dc/bo5/1ItwAwMTJ+aQ6jrjgqVGM3uci+Uzi22f7mH3fgNjwNMs6r86K97QOIjSjlz
	 ZmOVhX6TnAcsQ==
Date: Fri, 22 Sep 2023 15:30:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/2] ALSA: cs35l41: Fix for old systems which do not
 support command
Message-ID: <c484d680-f000-4eea-88a1-7816749c92c4@sirena.org.uk>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
 <20230922142818.2021103-3-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wyZdhTYzmwaa4UCO"
Content-Disposition: inline
In-Reply-To: <20230922142818.2021103-3-sbinding@opensource.cirrus.com>
X-Cookie: A day without sunshine is like night.
Message-ID-Hash: TC6XASX4PFRCRUW2QOTTK36JNAWE7O2U
X-Message-ID-Hash: TC6XASX4PFRCRUW2QOTTK36JNAWE7O2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TC6XASX4PFRCRUW2QOTTK36JNAWE7O2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wyZdhTYzmwaa4UCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 22, 2023 at 03:28:18PM +0100, Stefan Binding wrote:
> Some older laptops using cs35l41 use firmware which does not support
> the CSPL_MBOX_CMD_SPK_OUT_ENABLE command.
> Firmware versions v0.28.0 and older do not support this command.

Acked-by: Mark Brown <broonie@kernel.org>

--wyZdhTYzmwaa4UCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUNpR8ACgkQJNaLcl1U
h9A4agf/co+S2ZofqO0cRimwQbeFCeWFmyn1SgSNWuDgQIqcT+s6NwDhz4yztkxQ
M/4O2nwOi6Nj1YtMClU/QdF1nRB8/b+W/P8H0nt+e3+SAVI1jjBL7m3zCXptyKrV
xyzl1aC7tHiSMvaRYgxEKTDz1B8Qg6ONTCqGR18sRv1XWn9f9jQAnd+dU+fkT0J+
N6zChy/LLNVe2Z3hK/fq388C34qbjcKaiFvSflc1fI1aKIo2ynQR3IJTw0cLof2Q
+s9oonRNQaoHoQt5CXYH3UpyT7WStA/hMUtHXUzFrO51yx5TIHk2JCbqQx+rUsS3
TMTG2TPbiXdbe7tU58d2UhRwe/S9hQ==
=aP6q
-----END PGP SIGNATURE-----

--wyZdhTYzmwaa4UCO--
