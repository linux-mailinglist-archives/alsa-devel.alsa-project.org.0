Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F73808962
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 14:42:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16368839;
	Thu,  7 Dec 2023 14:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16368839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701956537;
	bh=LrKFalPpX4ro1UCj+XeZRPkOqxKYC9UU2FyCF0mGy08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MOeaVDX9mNTLPy6jCWURbUa1hUfjkiht/ahujTdehbbaeNtKqLJ3tgY6qIAbSy8kE
	 Dtg9A4GFiaylps2p9XK+d5BC7dLQmBd87L+qftLefaSyme0j73/XvDwVyTZUb8Ts3S
	 j1BNSLf5WE0+oP7cJx5YNJk6xpmvyK8uwvB3/o3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EEB8F805B0; Thu,  7 Dec 2023 14:41:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C74EF8057B;
	Thu,  7 Dec 2023 14:41:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E368F8024E; Thu,  7 Dec 2023 14:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DB78F800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB78F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kjLPZIg8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 76DAFB827E9;
	Thu,  7 Dec 2023 13:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7E5C433C7;
	Thu,  7 Dec 2023 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701956337;
	bh=LrKFalPpX4ro1UCj+XeZRPkOqxKYC9UU2FyCF0mGy08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjLPZIg8FFgsaWRJGrgM6lwAFRaMTuWNUEdoEZvWuxAYsk5rD+M9zXvKHaXN1xlrS
	 hXU/HzHP6fXanl92P/HT69g0DluwYbE+xs8k7PpcJ2g50JRXKnct5IOFVJ0TtPo+dm
	 pLPZxW2WmIq67oYfevuMMtKStccsxVUdN7fZqGVpgksCsyRPTkrDtHNZyG2ODFUjsw
	 1mcvjtPeWPGKEj4DxkbdpVd4shxELDPBf+Uq9viCxEFQid8zyP1ekkbsfPmESx8jna
	 /On7CAGQCWJntcZabaDryMMDMWorCO6m+gEZjEAQ6MIGGThmYxQ2cfF5IQHlPzG4Bh
	 TS2sianKt7+dQ==
Date: Thu, 7 Dec 2023 13:38:49 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: [GIT PULL] Immutable branch between MFD and SPI due for the v6.8
 merge window
Message-ID: <20231207133849.GB8867@google.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
 <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
Message-ID-Hash: UNYCS4WOQIDL4NGJ3G3VMFD26JOCSMGC
X-Message-ID-Hash: UNYCS4WOQIDL4NGJ3G3VMFD26JOCSMGC
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNYCS4WOQIDL4NGJ3G3VMFD26JOCSMGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Good afternoon Mark,

> Is there a signed tag available for this - without this change the
> subsequent SPI changes introduce a build breakage.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-spi-v6.8

for you to fetch changes up to 4ae08845db4c1f759b8382bc7527ab8249230e7f:

  mfd: tps6594: Use spi_get_chipselect() API to access spi->chip_select (2023-12-07 13:36:29 +0000)

----------------------------------------------------------------
Immutable branch between MFD and SPI due for the v6.8 merge window

----------------------------------------------------------------
Amit Kumar Mahapatra (1):
      mfd: tps6594: Use spi_get_chipselect() API to access spi->chip_select

 drivers/mfd/tps6594-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Lee Jones [李琼斯]
