Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274C844690
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 18:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7BB9F6;
	Wed, 31 Jan 2024 18:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7BB9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706723618;
	bh=+SBoRTG/7yJh2bzXOn6xrNUVIZjOWKzhAMQMTzsybKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vX1us1x/7hvzH7R5wJgB1Kao7H3O6g0hcAuvNf20LcGkBRn5slrldJk6YjJ3XLfCK
	 tuEBHwYzhTa2aryRoKi1oYkPHY0kePyZox0PKZSZPB3syUpTgXEX1vnWKDmTZ4vmH8
	 XdlJSiKGK2Gj7ybUx4XTb/VlHBvjYHJKqGVqMbLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD2BF8057A; Wed, 31 Jan 2024 18:53:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A586F8057E;
	Wed, 31 Jan 2024 18:53:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9EFF8055C; Wed, 31 Jan 2024 18:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FA66F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 18:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA66F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qWrWdg4k
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7676CE2233;
	Wed, 31 Jan 2024 17:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F86C433F1;
	Wed, 31 Jan 2024 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706723476;
	bh=+SBoRTG/7yJh2bzXOn6xrNUVIZjOWKzhAMQMTzsybKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWrWdg4kZWYpyHJjJM0EvZX7LjfWFA3DRwxvX5Xs4cAQ6k2i7bm2bivadFbLPNsmi
	 Wt57/qDZ/WzFfk6WvWobdjmyr4pAOZqJOolIwrLXYFc55E28rJi4SoZskMmPBlXmwp
	 fQLwQndWWQwc+CkGAvnfTPvQapC+Z+QKTj3013djFBBbj6E1JaHQWbKUjkxKHxujXs
	 LdSKD+i5UgHRzhbHVEt4ToZOjJnks4SrQLy4zXIu/zNcpLMJYAdABTyacBLSc6S+Kk
	 RB6Z15vZbz+MDPnBDRQYzUuAQZDhWRDTndOTmELn/qxNX/PxrOIvc/sfuauaPG1J8u
	 /xcAaBbVcn5RQ==
Date: Wed, 31 Jan 2024 17:51:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Message-ID: <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUrJoch5hRkaDQo4"
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
X-Cookie: I will never lie to you.
Message-ID-Hash: ZIJOZKJNZRCMFLFRQ74WIZXBRQYL2TJ5
X-Message-ID-Hash: ZIJOZKJNZRCMFLFRQ74WIZXBRQYL2TJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIJOZKJNZRCMFLFRQ74WIZXBRQYL2TJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sUrJoch5hRkaDQo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 29, 2024 at 11:21:34AM +0530, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device creation logic
> for SoundWire managers and Implement generic functions for SoundWire
> manager probe, start and exit sequence which are common for both Legacy
> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
> AMD SOF stack (ACP 6.3 based platform).

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-soundwire-amd-v6.9

for you to fetch changes up to c1263c75294cc8178ca964e0220b35518d6fb38d:

  soundwire: amd: refactor register mask structure (2024-01-30 16:06:36 +0000)

----------------------------------------------------------------
soundwire: Shared branch with ASoC for AMD driver updates

This branch contains the soundwire portion of a refactoring of the AMD
soundwire controller and audio drivers which allows for better code
sharing between DSP and non DSP case, as well as support for SOF.

----------------------------------------------------------------
Vijendar Mukunda (6):
      ASoC/soundwire: implement generic api for scanning amd soundwire controller
      soundwire: amd: update license
      soundwire: amd: refactor amd soundwire manager device node creation
      soundwire: amd: implement function to extract slave information
      soundwire: amd: refactor soundwire pads enable
      soundwire: amd: refactor register mask structure

 drivers/soundwire/Makefile        |   2 +-
 drivers/soundwire/amd_init.c      | 235 ++++++++++++++++++++++++++++++++++++++
 drivers/soundwire/amd_init.h      |  13 +++
 drivers/soundwire/amd_manager.c   |  47 ++------
 drivers/soundwire/amd_manager.h   |  16 +--
 include/linux/soundwire/sdw_amd.h |  83 ++++++++++++--
 sound/soc/amd/acp/Kconfig         |   7 ++
 sound/soc/amd/acp/Makefile        |   2 +
 sound/soc/amd/acp/amd-sdw-acpi.c  |  62 ++++++++++
 9 files changed, 405 insertions(+), 62 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

--sUrJoch5hRkaDQo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW6iI0ACgkQJNaLcl1U
h9Ar0Af/dCx/U98IFqdCTMqetXpOmyFnW+fJYBGeriVtQi76A4jBV2VhT2t/7vSs
JyDaKiQ5QNiVfawE9cSJtjuZ9oLf6l5nzs8V739QGSYdbCpW2Fll+TgSZ/hJK4z0
u+a8N5eSROnvbks8n4GWqFJDAwPUEejQG6VwKQzoOdYj0WIzwH1zKI+VBCjx6OX1
XOq9k8V6vFfcVaNoRTgXoIhNfyuvDFWh5l9C/ItTjLD6UjK+JUjK20wQ6TgWGxez
EW2wIupZXWGk/LnbUkJIH4KkMeb9U0DMQAVT+GRw75HostuEVYwebLlHeCdHAbK9
ItzMZPs4NUs02Jq0MSs5jOo8m/11WQ==
=ZooC
-----END PGP SIGNATURE-----

--sUrJoch5hRkaDQo4--
