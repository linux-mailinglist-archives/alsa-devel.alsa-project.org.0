Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF80992E66
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 16:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CB9857;
	Mon,  7 Oct 2024 16:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CB9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728310181;
	bh=h+QeAigkiFQRhspDO81Q8Q3C1f4WKr5wyPAd8JPSXSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R95cfq//xXIASjnhmeVLEljjdHeAnr+XLmHk+itcx5micxEuXPaCU/Io+PWf2u9Kb
	 ERAUaUTOh3vU3I9UZAwD4wg9AFNkMokCXJS9VeMmQDkDBh3lOXKb2bnY+pGAmW08IY
	 PKnF19OeBnMXu+8PLzPxF/OG/CfE0CdgoxdNUewc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D970FF805A1; Mon,  7 Oct 2024 16:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A58F805AD;
	Mon,  7 Oct 2024 16:09:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA49F80528; Mon,  7 Oct 2024 16:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04528F8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 16:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04528F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZVjC5sU4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABB675C5A6A;
	Mon,  7 Oct 2024 14:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10391C4CECC;
	Mon,  7 Oct 2024 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728310140;
	bh=h+QeAigkiFQRhspDO81Q8Q3C1f4WKr5wyPAd8JPSXSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVjC5sU4qLgo85AqvRlv6YH7zW4GhLZu7uhBROkvpavYti84CDPXd3Wxj8wQr+ErX
	 Ap7s3Foq4neGNvRAfiFRJOd2EReHcliThmM9cdlZVWsyqcuwPd4l+5Yg9HOgQ2xdWj
	 yk5ls5Yu0b+rK6k7JwCPpXdSkjEwf3LBH3dB0/DtgxkKeWAQlInDuzFv50nZ1blyOX
	 DSDO/8VNqDCys35ZuexxxraQhjtSgQSWu+1K42WCqsvA4tL6gqom5iIEPtjx8L6MYu
	 3J8QrE/X6a2A7cQuMu7+GRWj2rDGzO1mdLyIKD1UJeTFN02lSa6/6gmlwZrbfnPrO5
	 PRSJtX2LiTKuQ==
Date: Mon, 7 Oct 2024 15:08:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt-sdw-common: Common functions for Realtek
 soundwire driver
Message-ID: <ZwPreUo4rWyfUocX@finisterre.sirena.org.uk>
References: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVsnpoiqCzYswM3e"
Content-Disposition: inline
In-Reply-To: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: ZZXS3VIM6BUA4PMSZH7BR5X3WHMRK7AS
X-Message-ID-Hash: ZZXS3VIM6BUA4PMSZH7BR5X3WHMRK7AS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZXS3VIM6BUA4PMSZH7BR5X3WHMRK7AS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OVsnpoiqCzYswM3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 09:16:27AM +0000, Jack Yu wrote:

> +config SND_SOC_RT_SDW_COMMON
> +	tristate
> +	default y if SND_SOC_RT721_SDCA_SDW=y
> +	default m if SND_SOC_RT721_SDCA_SDW=m
> +

This should really be posted in a series with the patch adding the
driver, I guess the driver won't build without this.

--OVsnpoiqCzYswM3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD63gACgkQJNaLcl1U
h9BX+wf+JURPTuH1dcR5SYvWRF1EhL6dm2P09fDAsY5xSQiyZgrO3aDylQ5xYyy4
1lVG3JWKvlyMOrfo3XAS9wNUPJUSJQIli2FwWrAzpIDatYX/OouPqSuw/b+/OdV9
Jj2in1Ibr7ab0PDMR3pfLpmUUON2fnfTlr3HgmICWJ7n8QWHPWbUgM2qR9Imd2S8
t5Cq/Zq4cImez8UOQby8aoKBXmqPJw8gVfzPL7mwZRsJhdgppV+/DqumfoQ28Bnw
534LKj0bppi/6jgafjgqxK9omhDbxd/oAV9NfCbAnozSM9WUrnwaGulLi30rw0OQ
KoOSVaNJXjcl1RI71vsvfV1zBxt6zw==
=68Qv
-----END PGP SIGNATURE-----

--OVsnpoiqCzYswM3e--
