Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0847979D7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517DF84B;
	Thu,  7 Sep 2023 19:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517DF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694107381;
	bh=XlJDbU1PykwszLckIDeqTgZVj8n/v3RikjI/YqwqCDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F6rdQtTValM2w2HRjfwwPCbbD3040NjCpxnJVs+h/SG1us1DvZdwoxHOJQk1pY0Qk
	 tj+80aMzbyjeBAnS34BUpsP6axVcIpJer/EBP4UnEvtMngIticw2frdd3DMyOuUTMD
	 s+FQ4jbQI0PCzU9PWOmadaTB2G1ru4nm1621MbxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A721BF80494; Thu,  7 Sep 2023 19:22:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D992FF800F5;
	Thu,  7 Sep 2023 19:22:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95436F80494; Thu,  7 Sep 2023 19:22:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B059F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B059F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p0/oYw03
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4414ACE1A54;
	Thu,  7 Sep 2023 17:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C61C433C8;
	Thu,  7 Sep 2023 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694107317;
	bh=XlJDbU1PykwszLckIDeqTgZVj8n/v3RikjI/YqwqCDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0/oYw03EZZzSTmukYBCAvlRQoG3dUkXObbI08zjrlWK6Oy/YhuBuhaSvQ87M37Eo
	 zPwzWt7GqDW+AO5NOgcRNe4gaDQ986thcklUFGm6lUJPyN+fjI9ruBqgQyN172nS83
	 5B6cvq/I9qSC/4rR/Rii8bKiqaEb2u9DOCQTBd7TGQBN23Pg5xHJQwVy62WeF97wpC
	 MW4d4jQEXORyXQj4Pc5DPRMwgDtJ3Ia0ZrRARdtH6s46WqibxtfbUDPnvA0kPVsSra
	 2aRf3487ENrAFAY5rm88EoLIi9EWxuVFWbeT9WG4Vkz9Gmk8BPUWMf4thVRntEaDSl
	 bwzF7PA8IFg5A==
Date: Thu, 7 Sep 2023 18:21:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 00/11] Improve CS35l41-based audio codec drivers
Message-ID: <4a658238-b5cf-44fc-802b-f09f8d5e0ad1@sirena.org.uk>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvuXBREcYlQzjp52"
Content-Disposition: inline
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
X-Cookie: In the next world, you're on your own.
Message-ID-Hash: KBGZMU7TOBYZCAVBM5JJJ63U6YV5PUQB
X-Message-ID-Hash: KBGZMU7TOBYZCAVBM5JJJ63U6YV5PUQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBGZMU7TOBYZCAVBM5JJJ63U6YV5PUQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XvuXBREcYlQzjp52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 07, 2023 at 08:09:59PM +0300, Cristian Ciocaltea wrote:

>  - Added 3 new patches providing some HDA related fixes

Do these have any interaction with the rest of the series?

--XvuXBREcYlQzjp52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT6Bq4ACgkQJNaLcl1U
h9DHogf/RF1H5pI87OixXP/jRxp2mAsLVLGaQ3RjIJTi00LPr5TJEv455keNqxGU
ZGFv0gPvJ7j2ja/Psu23ZBlcgoeI/y9sVaQbaISTw1bUXIXdxRPDjIQrbzuw0Tpp
/K/89ROxmK3I2xwZ2IzBZwwb4jE2Jlxr96Q5EaFlU0gJpWQFOVzGmeymAwgCmS1E
qLJg+jqf++xxUvPgcM+l5J86srsE597mf2lVwsR5532JeJBQ/smC+vrBFihdQLNP
ALnftYbhT+18pdhP0xPVaErBhX65xOYLCwYHt1Q3Pjt5GDQvorWG2hF4S6aFBQIa
vQYudyD/Fn8U1qdPFn3xssF9p6x6pw==
=vXsG
-----END PGP SIGNATURE-----

--XvuXBREcYlQzjp52--
