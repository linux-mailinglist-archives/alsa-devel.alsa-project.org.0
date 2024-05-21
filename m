Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096758CB389
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 20:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D0B826;
	Tue, 21 May 2024 20:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D0B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716316438;
	bh=9oN1+Qiu3ZjosqghZMHoJO8Wg1Ja4YbCGeqa01ozJAg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UlPB857qAjZp2PbCtbp5A+KtS4itd4zvZ9ATtfeVHIJ2CFz9fwD6T10pLzovux4sf
	 1koX4tdKXQDUtYvCn12i00zCeRai+o2Vu8vPDh77AXyeR47SnFr9Qhn/avZbnNH6Qa
	 jfDei81J1uyMJCkn3IOBqvCDpR3+yx1sggmA61jE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E72D6F8059F; Tue, 21 May 2024 20:33:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0B0F805A8;
	Tue, 21 May 2024 20:33:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 011B6F8026A; Tue, 21 May 2024 20:33:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 29FAAF801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 20:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FAAF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uSNDHaLt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D972CE1093;
	Tue, 21 May 2024 18:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61784C2BD11;
	Tue, 21 May 2024 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716316384;
	bh=9oN1+Qiu3ZjosqghZMHoJO8Wg1Ja4YbCGeqa01ozJAg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=uSNDHaLtNjHp2bjf1f3dSmtpezQrkutqJSil0Qx1MnHaq9gR0MBDVINkZ4iOz+En/
	 BA35lwYMXxMvSg/Q/f8amERGWFDhPiKVcWoyAwEd5PRk/a3QiTt13iOBJRu06J3D4g
	 YUxma3QKyESdLVXxaaJUcnNVuKQQuZvsvO4UsuzQAVlJycrFC9ZJsLgoN3n8aSGIIk
	 8n+1kDQQxXTEoJ2E//iK82okve78UL/AIZUAyKm3NP/fvk8W9BzV0T3rnALo2sUtxz
	 huX6UnzXbzV+YhlvxX+fAfWpuysU5m2Q3D3e30eI/95ULOdCsATVaDhY5uW/6lEozx
	 J78PA6sv6sDmA==
Date: Tue, 21 May 2024 19:32:59 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org, miquel.raynal@bootlin.com,
	perex@perex.cz, tiwai@suse.com, lars@metafoo.de,
	lgirdwood@gmail.com
Subject: Re: DMA Transfer Synchronization Issue in Out-of-Tree Sound Card
 Driver
Message-ID: <6e01c13f-2bc1-4e08-b50e-9f1307bda92d@sirena.org.uk>
References: <Zkxb0FTzW6wlnYYO@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xueZ6/gZSHePXE0a"
Content-Disposition: inline
In-Reply-To: <Zkxb0FTzW6wlnYYO@localhost.localdomain>
X-Cookie: Eloquence is logic on fire.
Message-ID-Hash: LVL5PNHNXGSUOY6XUHBBTBK7EKI6XN7C
X-Message-ID-Hash: LVL5PNHNXGSUOY6XUHBBTBK7EKI6XN7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVL5PNHNXGSUOY6XUHBBTBK7EKI6XN7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--xueZ6/gZSHePXE0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 10:31:12AM +0200, Louis Chauvet wrote:

> To address this DMA issue, I have created a patch [1] that guarantees the=
=20
> completion of the DMA transfer upon the return of xdma_synchronize. This=
=20
> means xdma_synchronize now sleeps, but looking at other drivers around it=
=20
> appears expected to be able to do so.

You need to set the nonatomic flag for the PCM to allow this, the
default is that triggers run in atomic context.

>=20
> 		switch (command) {
> 		case SNDRV_PCM_TRIGGER_START:
> 			/* Synchronize on start, because the trigger stop is called from an IR=
Q	context	*/
> 			if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> 				dmaengine_synchronize(my_dev->playback_dma_chan);

If any dmaengine work is needed put it in the generic dmaengine code and
allow it to be configured there (ideally through discovery through the
API).

> The problem might be related to the sound driver. Should I avoid manually=
=20
> using dmaengine_synchronize? How to achieve the same effect in this case?=
=20
> Perhaps there is a more traditional way to properly clean the stream in=
=20
> the sound subsystem which I overlooked?

If there's no way of resetting things without blocking then I'm not sure
you can do much better though I might be forgetting something, it does
seem like disappointing hardware design and application behaviour.

--xueZ6/gZSHePXE0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZM6NoACgkQJNaLcl1U
h9CQJgf/SoGgK5fxlN1tBFGIN5h4MwbX7Y5VNEDDebRPlp4d9xf84kvYAyqY83vL
PJ0Ta78vJLPUxM8CeHXkn5duaLzUAsAtJsn5gtSCBdUy3rhlvMt4v2JkNYE2nZ16
HilFrOejdfXGebjpHoPP4KocrUTQTSEuiHvOViuql2h4kqbt9PYaz9SATZii7QXT
cbaLKt7YlY2M8X4FCvy3O782rx7CJRTpK9QMm9SYJ0BMhviRCom084r+dQkuqFn3
V3MRZukP9UEMr7E8HrTU8NMOeQVoogf7ppb4h5xiQ/tZCAUfvoP4U6j/LZInc0NN
bNEb/K9hJvM14U9yp/rsw5ub2jhcxQ==
=Su6g
-----END PGP SIGNATURE-----

--xueZ6/gZSHePXE0a--
