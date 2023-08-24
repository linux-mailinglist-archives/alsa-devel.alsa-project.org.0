Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B023787B81
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA5AA84A;
	Fri, 25 Aug 2023 00:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA5AA84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916191;
	bh=iTc3zoovb4AGvbeGNQwajZ3wNU8eiPO3mUwxpqwR434=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K10G9j2psY2oq0CLGpsgLtgH/azNgQdKnLgucHX98f3Jut8N3UIwJThKeeXFNRDy3
	 wF8TI5xV+KAQmOWwEhUTk38WGqUeGziVidG9YWMGyqjL5zEtfpIHUxww+raaEQD0BN
	 nzQPx4mNMIp63jwbgdcSJR9ONgNWQzp5VLIV+Ae0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E411F80553; Fri, 25 Aug 2023 00:29:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD188F80537;
	Fri, 25 Aug 2023 00:29:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10CDBF80549; Fri, 25 Aug 2023 00:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92337F8023B
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92337F8023B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HitCDhdo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 373BB6485D;
	Thu, 24 Aug 2023 22:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AFDC433C7;
	Thu, 24 Aug 2023 22:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916133;
	bh=iTc3zoovb4AGvbeGNQwajZ3wNU8eiPO3mUwxpqwR434=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HitCDhdoYa+HjaBJeGm+ZmS6nfz876gFQaGXDtQVw0DjUMzMTSqCdzy63nUxbd38K
	 ZiXgd4TBUX4o8BvoUtNdtLBymVJNubx/nten9tP2OEG+2EsGXtRoIP2tThARqK1SLP
	 3GLdAYma6G1kAuQKl5UGA6bA64Y+B7Qx0VgOY++aNS43qYDZnmt/vHhDRZvPoAnI4m
	 vgg3rByWgqvyumyFDzhTipvT45cr3EOsR1svQDSFCmoUsthY+kRuLMwdWz+GShjFYG
	 LF7o/oMQu17pzF6iPZkkeaqSDZWl73yZGqBLIcujdpoLNetBQc0EEw08ePkcGmsWpu
	 b8Fb5ToLDDYqg==
Date: Thu, 24 Aug 2023 23:28:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 10/17] ASoC: codecs: hdac_hda: Switch to new
 stream-format interface
Message-ID: <ZOfZkM/ufHXWyvRE@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-11-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wG3FLIwGKE4UdSQG"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-11-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: CQIKMRYHF46CTIOGE3HX4VTJJJJXINU3
X-Message-ID-Hash: CQIKMRYHF46CTIOGE3HX4VTJJJJXINU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQIKMRYHF46CTIOGE3HX4VTJJJJXINU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wG3FLIwGKE4UdSQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:39AM +0200, Cezary Rojewski wrote:
> To provide option for selecting different bit-per-sample than just the
> maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>

--wG3FLIwGKE4UdSQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn2ZAACgkQJNaLcl1U
h9BebAf+N5YmouS8bbTbqBUCLrEpUGTjS9c/WCpSzTbvykom81e2C8R9LPt/YDxx
LQLj8G0IK3w4UraT/2l0WkqbhvNMErNzBSd+F3EQSlBoyhEtQMOELnlNvQQeIeTH
38SC0AeNLMoATFUCUlVngSSfbsmW+uJ8dXnpBDohuWIsLiB+YnrO+Rg1g3lPcXDw
erXqdLhQwlrWhkMuOR41qTJsc8xPqh2+I6TNdJZQRoKSDVCX+yqMIScb2T6TZchz
0qdGsMvzyB5xCwC+WABnu8ba5vhyevaiDgvdbabTxfecRq542jWjEk1k4Wqu3XrM
lLnjx9E4++1OAYSX0+QKjl5VALjLyQ==
=8pzo
-----END PGP SIGNATURE-----

--wG3FLIwGKE4UdSQG--
