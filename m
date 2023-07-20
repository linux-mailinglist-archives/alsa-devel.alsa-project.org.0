Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F475AF12
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE6A31F7;
	Thu, 20 Jul 2023 15:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE6A31F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689858210;
	bh=iDQFQp11rJrZLxezjBjlrkLwjbbPrBw6n+TK9nYVfPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qH+yo7WObYP6El1aDpjrpcaWS6qV+OpwoSPJML5YrxmPXe9W+zfY36WgvwLsTFU8n
	 p35XD+iUt/z6U3t0MQ4TG64Sreokawm5FHw3lya8Be7D9oFK4aRNRXDGhRn5HOOjB1
	 rca5vwBESJ2dXoxBNMeFQYHMo01eJUIYsGbDzgxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF5DF8032D; Thu, 20 Jul 2023 15:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 928D5F8032D;
	Thu, 20 Jul 2023 15:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13439F8047D; Thu, 20 Jul 2023 15:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F5F4F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5F4F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MBoi7b9H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5003661AA9;
	Thu, 20 Jul 2023 13:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923EBC433C8;
	Thu, 20 Jul 2023 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689858145;
	bh=iDQFQp11rJrZLxezjBjlrkLwjbbPrBw6n+TK9nYVfPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBoi7b9HFZdMyU0fasS4LitWs9chJDN36X5yRlzXM+e+gNn+3HDsDgeagzXGL9RM/
	 /e+mmrzJLePM22Sma+SGbkXynM2BUo+aavXdEw0zNwCz6qork+2RI1QRhxTE7SHrb2
	 qUsAlGt6o9/lTZep2x1BQP3FOdFl68Fa5jMSYLLKk66l5hjPS+jzXlFYcv/zHWBRmd
	 4FiizVn+Gxk6VjFn/YQS9NHiaeBL5jULx6bNogYCbp2jSJyLh1g0OyWLgtVZhRbuzF
	 +iXb8C9By53tATVqCR181MclHYxkGEkWi3/AStJyB3PjWJXRHEDEdYzexxiNK65a+f
	 bMgceC+vbDKSA==
Date: Thu, 20 Jul 2023 14:02:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 10/11] ASoC: mediatek: mt8188: Simplify with
 snd_ctl_find_id_mixer()
Message-ID: <21af2881-c105-4dac-9662-96a51651e2c0@sirena.org.uk>
References: <20230720082108.31346-1-tiwai@suse.de>
 <20230720082108.31346-11-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anoI5FgGK3+R8YMi"
Content-Disposition: inline
In-Reply-To: <20230720082108.31346-11-tiwai@suse.de>
X-Cookie: Ginger snap.
Message-ID-Hash: L7MV2B22ONY4MZMFJT2V2V26HUFOYHIF
X-Message-ID-Hash: L7MV2B22ONY4MZMFJT2V2V26HUFOYHIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7MV2B22ONY4MZMFJT2V2V26HUFOYHIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--anoI5FgGK3+R8YMi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 20, 2023 at 10:21:07AM +0200, Takashi Iwai wrote:
> Replace an open code with the new snd_ctl_find_id_mixer().
> There is no functional change.

Acked-by: Mark Brown <broonie@kernel.org>

--anoI5FgGK3+R8YMi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS5MFwACgkQJNaLcl1U
h9Bh8Af+KAFYZQMoSair87YZ53n9sMyovmpTQwhKSFGObXlKIfJ0SsyVxC9EKaqq
6fJE3gcPtfr46MCjPG7/5vR8Ap3ACG4tcYJkJCiU/cgP7KkNjumkUhtvjwjr3Udw
3t3BGE5/5/n+Ba7ShScJJXgtgDqcPM0Rz/78HwMwPzN7d1hZNvmLPkOc1mbv2GB5
ZamIit7GjvetjsHgnSHt8TrrVr3LS0hcU5S6aswxGBcuXIloENeC13XxnCsm2wWW
PxLsiM8IodXwCst4Z8jLSjgkl5/EMGUdhY00egOxS9ggwUR9TdBY677keUFgww3J
yO5AqXS/LkqbZpoTrj/3xmdtaUgkWQ==
=wT2E
-----END PGP SIGNATURE-----

--anoI5FgGK3+R8YMi--
