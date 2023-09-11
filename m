Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C281B79A0C9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 02:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8754B84B;
	Mon, 11 Sep 2023 02:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8754B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694392115;
	bh=0UCzLWCstL0ZopkfUvL7PD9fXTOv7H97Mq5oqvfgZMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwXSeCPajnpY+THFw3mzMjasS+mHKX90nHpOUo63VzSdaDRcvHJHyXebUZX9rLU3B
	 4EoTaO8lehXSAZsyFIa/1ZGoqT9d1Ln6fLqQlNJAih/MiUGQNvMgVotZHn9ijoYf2s
	 QZh+eC+4Lr4ehBEtNuUq3CQV/4PWFkXonmxqSfQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE0EEF800AA; Mon, 11 Sep 2023 02:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C3AF80246;
	Mon, 11 Sep 2023 02:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA1B3F80425; Mon, 11 Sep 2023 02:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9F59F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 02:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F59F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mBsrGQ4F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7176BCE0E3C;
	Mon, 11 Sep 2023 00:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09170C433C8;
	Mon, 11 Sep 2023 00:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694392029;
	bh=0UCzLWCstL0ZopkfUvL7PD9fXTOv7H97Mq5oqvfgZMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBsrGQ4FW8p0UiM62eD2lMn8pWT46uHV9MZa/y7V1d9EQ3G+2VWIWrldg7u7n37kA
	 HTa076iojmbLk7sp0Ds4/niJfEhiY2YxKK5ZS8n+xI+H/Pm2EiKytFseLr7YP8b1lF
	 477ksczLfK7j52D0tOXZmeYwXHHE1iUcp3vVlqb0o2iWypjUAfVoyRjbJ0X1RKgyX2
	 XxLj1ldJW1mARf5nXRk3TJDbezhj6utvPO8oYSO70dc4qgu+EKI0OShvdvCh6as7Sk
	 xuxIMRRJMFTm7qh1+4Fmn4f2IhMM7aKJUE3XrAbPUT2xN9YSuVUCB6geClR8tAQ6QI
	 FGG8JV0YrCbBQ==
Date: Mon, 11 Sep 2023 01:27:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] ASoC: cs35l45: Add AMP Enable Switch control
Message-ID: <ZP5e2X4hry+KJZ+B@finisterre.sirena.org.uk>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230831162042.471801-4-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3v04NETlEyGouWXO"
Content-Disposition: inline
In-Reply-To: <20230831162042.471801-4-vkarpovi@opensource.cirrus.com>
X-Cookie: The revolution will not be televised.
Message-ID-Hash: U7XNDOR5FWSP2L72V2JYI5BTKIHQTCJG
X-Message-ID-Hash: U7XNDOR5FWSP2L72V2JYI5BTKIHQTCJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7XNDOR5FWSP2L72V2JYI5BTKIHQTCJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3v04NETlEyGouWXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2023 at 11:20:42AM -0500, Vlad Karpovich wrote:
> The "AMP Enable Switch" is useful in systems with multiple
> amplifiers connected to the same audio bus
> but not all of them are needed for all use cases.

This doesn't apply against current code, please check and resend.

--3v04NETlEyGouWXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT+XtgACgkQJNaLcl1U
h9CsSQf8CiKjWm47l3WLdJRNU7NpvghNrr3Kd3iwsR/IIaAAu28HHVCn4iUxhBQB
m69fo+G8p7WxhuXcwXL39yHiyK0xD4E8kc5vXfQjf5CfEh4Im36piOtiQnqiSoLF
Ld3mZ5J8ayM4bgaHkxLmQ7a/iNHFlpNsv6Mi5jEbS8yQCakSPzzqQU1WROu//hAV
Pc0SdrBELUZ6+7hJBFuBOertUBHy92KEV1+JYUOa5xuyydgxJv3yHWLdobG/Qm/9
R10rixSechOrb2x4O77s3L1ZSWABaMysUs7tH6yBuL0ru+xnSMmEKtGYCUF+0YK7
GQQq6EJsuTTElsiB94ZFy1/JBoThSQ==
=tOc1
-----END PGP SIGNATURE-----

--3v04NETlEyGouWXO--
