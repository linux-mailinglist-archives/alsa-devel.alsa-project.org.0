Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D325A959DB4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 15:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A22E820;
	Wed, 21 Aug 2024 15:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A22E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724245603;
	bh=p1sqhjD4ylWmvdHtvSuqQze9HeUw+IqVr9VtYWgAGQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8JPI1PXUf8w1kTj9fJ9fE+T3hXmok6MwsOOZT1GkCErhfkyq23MFlHAFcS75tgkn
	 QKDXmosWfa9pHwPZEqk+Ho+z1du8uyaihjEqt6lGu5+NxLqoB5nWNjEuehIYoIjewJ
	 NsnIGd1JmtiVXYM8javfHfKZSURdspDHfyCjQj5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1609AF805B1; Wed, 21 Aug 2024 15:06:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2077EF805A0;
	Wed, 21 Aug 2024 15:06:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38AA3F80496; Wed, 21 Aug 2024 15:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10304F8025E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 15:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10304F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ub76omb5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A40DF61025;
	Wed, 21 Aug 2024 13:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65341C4AF09;
	Wed, 21 Aug 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724245555;
	bh=p1sqhjD4ylWmvdHtvSuqQze9HeUw+IqVr9VtYWgAGQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ub76omb58LU9FAOeH6aF7vfnxlc2vty9US0MbTYdioZQlSuVTmU28OTQkCMn6z29/
	 11xXCIz7FRRAlNmbbgKIJdCq2VX4Exf7QjHTssyMAAZO+p59WnSxQKzZP3ym8chFsn
	 d6chje2FYLJ/niIIZ2ZOKbizJxSgewSpBbFXKqqq6f8Wiftad0hUNMGTdOxl9z5azH
	 o34L2yHXKYzrEXszqEmVjxAoNZVOpLobko1m2WMotj2N9IYkyVMIS77QDZq6EaPE89
	 o+AJbAVkfDKvul8tGU1hTIqy17ygpiH1/dgXiDISle8lKrUveDfe9A2aRDVemuS5jL
	 mq17N8IiNP5/w==
Date: Wed, 21 Aug 2024 14:05:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com,
	tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
	linux-mediatek@lists.infradead.org, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [RESEND] ASoC: mediatek: mt8188-mt6359: Modify key
Message-ID: <e71cf2e2-9b66-4bc8-825a-6ccb7925ff8e@sirena.org.uk>
References: <20240821074051.3165-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pd3ireFZcx+QdBZM"
Content-Disposition: inline
In-Reply-To: <20240821074051.3165-1-zhangyi@everest-semi.com>
X-Cookie: You are false data.
Message-ID-Hash: 5UBBVQEON7SYY7DSXX4FWSEHL3TITFMN
X-Message-ID-Hash: 5UBBVQEON7SYY7DSXX4FWSEHL3TITFMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UBBVQEON7SYY7DSXX4FWSEHL3TITFMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pd3ireFZcx+QdBZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 03:40:51PM +0800, Zhang Yi wrote:
> In order to get the correct keys when using the ES8326.We will associate
> SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
> when the ES8326 flag is recognized.

Please please allow a reasonable time for review.  People get busy, go
on holiday, attend conferences and so on so unless there is some reason
for urgency (like critical bug fixes) please allow at least a couple of
weeks for review.

--pd3ireFZcx+QdBZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF5i0ACgkQJNaLcl1U
h9AdlwgAhUT6zTnsivKrOEqFNg3dfQuMKgCdroZ1gNv9o33yxO2IuAwy6YcEpxPf
ajqB/gwUGbypff2/+grXp/ucfxyxufPBy/Fd+XEy3brTWTAi+yXWLA3FuYFm9xKC
RttFSCSHcsgIVwAwyALWlMA+vKA30mtNXx3Nxe232iptx8+nDdCigimIegbpRjZn
0P0MO+jME3FK67YQUZvAuWxGQAtG+VVX17h/LMtS5D7c0hd5dKCL5c2IcgbGz5fP
oNjjZX1AoMT79OmSzp5ZAFmlKwlc8ds3MCbnpGsp2TxT0Qzmtl5wfSZQS2DnDNic
t+5yc/eu6KKp95Db8ILnyqwmscIesA==
=tV+5
-----END PGP SIGNATURE-----

--pd3ireFZcx+QdBZM--
