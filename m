Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9D87955E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 14:52:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1BDDFA;
	Tue, 12 Mar 2024 14:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1BDDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710251521;
	bh=nCk4hwkuKSvmkkr+UyO6YecifpNDJMsAfJtK0zzujtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apOJgcmNm3Cl02AxzO8KRHqyzBPS20kLd74gjM2PsXzP/uSwqY5PHOJdy6+TbIlM0
	 u6jIoHE83PHawpfy2650KFz2RWwvsBr6/fMsFURthx4ovfPEwKD8RSxnELj+6V313i
	 A+GweoD765jiMSWOlnMoBbsrt5wgZYezxQHt+AY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5317F805AA; Tue, 12 Mar 2024 14:51:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16985F80571;
	Tue, 12 Mar 2024 14:51:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F6BBF8028D; Tue, 12 Mar 2024 14:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9839F80088
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 14:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9839F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=swEn7tOm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C85B3611BB;
	Tue, 12 Mar 2024 13:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCC4C433C7;
	Tue, 12 Mar 2024 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710251474;
	bh=nCk4hwkuKSvmkkr+UyO6YecifpNDJMsAfJtK0zzujtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swEn7tOmBPpmF64PHwcL0OfOdhJGZt9mYtTw6QI3UiouWiPV0BGMNjBZrQoRtBI1k
	 vMGQAJbh1SE7CV4RJhbSgv95GDXYp4ApkmEBpEY71txJzf4gu4DE5rJrDYtiMHWYnx
	 meWa4H14DfadqxHA3TATcp1l4iDuIJDI7eO0ozFix/u4oeXnY+Zo3kYrsbvPv9lb7a
	 fWN7Fba6Sm0gzsImIFPB2K2uZk1iD3zRK1n8+ZN04++qQcVUGGDYMsgA9BDvdhaAGf
	 S5DCruC5Z9VPhnWNZx7/Ma9Fi+X0vDI/Yp/1XmU89FBbITveUJrmyY76H5H/zdLQll
	 IDvmwcaPGg+Aw==
Date: Tue, 12 Mar 2024 13:51:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
Message-ID: <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
 <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
 <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cJditwpOuVhAT9vy"
Content-Disposition: inline
In-Reply-To: <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Oh, so there you are!
Message-ID-Hash: XM2DSOOY6CWWRRY7KBPLVYP3U6FDT4OG
X-Message-ID-Hash: XM2DSOOY6CWWRRY7KBPLVYP3U6FDT4OG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XM2DSOOY6CWWRRY7KBPLVYP3U6FDT4OG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cJditwpOuVhAT9vy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 12, 2024 at 01:36:47AM +0000, Kuninori Morimoto wrote:

> Hmm...
> does it have un-cleared "dai_link->ch_maps" ?

> Thank you for your help !!

I can't immediately see where ch_maps would get set for this board (it
looks like Intel is the only user?) but I might be missing something.  I
don't have the board myself so can't run anything directly - Jerome?

--cJditwpOuVhAT9vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwXcwACgkQJNaLcl1U
h9BEZQf+OuBgJM2bQLxAKvUeIaP2XA8/r1lKYG9cExXf+F8+q6KRA5ZWImi6C4xF
+WTzFLMqpvmL3167yYCjarp7NTgYkQmD/IL3BavVy1eTIe/RroPTa0kp2y4gHZRn
EvoBXUGZwJmd/mZEECohLFIWHNsHlYSWteohlvC1Mdvst0DsLQPoMigvFE/6KAfW
hINtK43MS+b2KqYlTPVQru334TUAFDwXcLEtVzSuVcOT0bStwLQHp4BBC1EPp5o6
caiITE+AnFa7oWLgUbZOsJbuHu/pntXtq3uKBvv4zDYoUj/KmwD5Eep5E3xTT0ts
lqOBZdZ0XKRXdthD7u8Tsmh58PcbUg==
=oE5x
-----END PGP SIGNATURE-----

--cJditwpOuVhAT9vy--
