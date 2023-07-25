Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BD7613A5
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BBF814FE;
	Tue, 25 Jul 2023 13:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BBF814FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690283558;
	bh=0c00IIl4jNKUbzeZGk38M6Ww7nU9z5KnWG+sqFdmzd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndZ0Xczd2bQVRY31/T5eeiyxTLt0jS7zAaOZ35LV+sJXnEiCt42zU+OGormfasrRo
	 i3TmYC1jwYxRTwa+b5LhAlEUaiMTbYfVtLI09o55J/gLK8coSl8DjamT/G0CgTI7Jz
	 IkQFUWbEPnaD3ZopCJeG0XjxYDk+Nr+Tocqwk9Ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9DF8F80544; Tue, 25 Jul 2023 13:11:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FCEF80163;
	Tue, 25 Jul 2023 13:11:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B259FF8019B; Tue, 25 Jul 2023 13:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11318F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 13:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11318F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G90AbqXT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06A256168F;
	Tue, 25 Jul 2023 11:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC9BC433C7;
	Tue, 25 Jul 2023 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690283488;
	bh=0c00IIl4jNKUbzeZGk38M6Ww7nU9z5KnWG+sqFdmzd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G90AbqXTzqV9gJ3g/IByNaPfrY5CDlbuwQB9NYOZWZiw6+JqHfW7Yh0Nk273J06Bj
	 fxNJBNd9viw1HaQLebeVpCoVDQVGcDRmFCPKWg/uWf0IameHekRvCoGmjbrUjasRc+
	 kY2oGbfGC3TV7HQu4t5jQjm0pvmqGxQP/0dbq/55JOftneAxUyFJTLlf8TahpLC9PB
	 1VTWON3+Hv2GZIEU8mmu91Q0h61Rpf7b19DbJxv3zsYjNkf1u0W3XmqJur1ONn9D6M
	 b0oNBkGHmfElfSk/eJ+hgscqNhMmuxq5A5zm1gr/MiCN6KrAa+iggtg7EHKGf9RHRd
	 xDQY4GgO1e/pg==
Date: Tue, 25 Jul 2023 12:11:23 +0100
From: Mark Brown <broonie@kernel.org>
To: sunran001@208suo.com
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix application of sizeof to
 pointer
Message-ID: <39df7dfb-b4ef-4775-b756-9bf8eb20731e@sirena.org.uk>
References: <20230720073836.3285-1-xujianghui@cdjrlc.com>
 <74739aaaa05f52084757b526bc8348c8@208suo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+IPDrYl3L8ucP/um"
Content-Disposition: inline
In-Reply-To: <74739aaaa05f52084757b526bc8348c8@208suo.com>
X-Cookie: Bones: "The man's DEAD, Jim!"
Message-ID-Hash: SF4JX363GUTY27NWRYWEBYLTSMLYI55L
X-Message-ID-Hash: SF4JX363GUTY27NWRYWEBYLTSMLYI55L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SF4JX363GUTY27NWRYWEBYLTSMLYI55L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+IPDrYl3L8ucP/um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 20, 2023 at 04:43:57PM +0800, sunran001@208suo.com wrote:
> The coccinelle check report:
> ./drivers/scsi/csiostor/csio_mb.c:1554:46-52: ERROR: application of
> sizeof to pointer

This doesn't apply against current code, please check and resend.

--+IPDrYl3L8ucP/um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS/rdsACgkQJNaLcl1U
h9BqfAf/c6lCoyIpyVjweqxzgRXJYLCVnq3RkbPAJ3ccrrlou1q5m7QCyvHAegPk
iJmM5DQBdCY+NJPIB8qFf+ixn2gO2x70sbcalETQ6P4Y8hCBf9x+NNsGDsbMz4QE
R43xj9Ld+T3l+ynuws/M326ZkuwyLU5WfNS9npZARJfVhzz/tioF44GIsXJ/0l7L
3FRpDW0xdaK4T1M8j6QGSBkUuwLAop/DnWr0DNa0U67t9WVlaVLZDRXPV3bC8FZj
phZqVUT4h475SYiUrjvTZqtSyPHcg7Dmav+MkeaqyZxGgqdXqyVoq/Y2ABVKyOIV
EtwPtOJnMd5/32DAbSlS17A8tv5cEA==
=BTjl
-----END PGP SIGNATURE-----

--+IPDrYl3L8ucP/um--
