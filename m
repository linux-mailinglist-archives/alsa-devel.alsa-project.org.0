Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB763A5DCDA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Mar 2025 13:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39B960219;
	Wed, 12 Mar 2025 13:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39B960219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741783229;
	bh=ofedNlzRBTBal6pdHYXCJprbv+5hj+/1WGyAvKwu/6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P04MCresqbQlfLOnbLjV8M+Iopj7zO18U9Ug9JHaymhpPqyeXLlGAObar8YZ+TJhe
	 k3BT5iCqH6DXujxgEhqvKSFXNIbOR50hEn1I9GYxBm4h5EJsk/taEpDDOyjqkjKIdh
	 OE0fqLyS5AIoKMdvg0eMM2rWtU4EzGQYWf0SGTA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A30A7F805B4; Wed, 12 Mar 2025 13:39:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6D8F80588;
	Wed, 12 Mar 2025 13:39:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBED8F80301; Wed, 12 Mar 2025 13:39:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2A6F8003C
	for <alsa-devel@alsa-project.org>; Wed, 12 Mar 2025 13:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2A6F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dgpoAPlN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DE57A47150;
	Wed, 12 Mar 2025 12:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7010DC4CEEC;
	Wed, 12 Mar 2025 12:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783183;
	bh=ofedNlzRBTBal6pdHYXCJprbv+5hj+/1WGyAvKwu/6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dgpoAPlNydd7g6QXc9etdsnZl5uDIKR47XxVAOU4E5RZsdlIqp9NZngibwnNNtM4h
	 VavRmUHQq16bsYl2fmpbZttAJ/frfRL5PBBA9ixlwZpH000iwarWQ+mz/cGJl/1SWx
	 7Z2Mvf+o4YWHhqhTskOtyYelZesWJoGB3BQFWfyThXEslojNkijy3RhoVx8tgV0vAv
	 FY16Ia8yt46FSu+A0q5XAKj34jjidvT7MSAI/smIZzOpi9ETGvsuWKFxbv/i65NdY5
	 VyxHQoTODnbPzpNzNcye9MRDyB0wipBPHA8z+OPtWepgD1PQPDEj9voZehu44ttsnM
	 zW2xMRut3n2ug==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Mario.Limonciello@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v2 00/14] Implement acp_common_hw_ops support for all
 acp platforms
Message-Id: <174178318217.22408.15659510789860544387.b4-ty@kernel.org>
Date: Wed, 12 Mar 2025 12:39:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: M35MDZUQYXKHATTH2RWWWKHBQZYBEZY4
X-Message-ID-Hash: M35MDZUQYXKHATTH2RWWWKHBQZYBEZY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M35MDZUQYXKHATTH2RWWWKHBQZYBEZY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Mar 2025 00:01:47 +0530, Venkata Prasad Potturu wrote:
> This patch series is to implement acp_common_hw_ops support and
> refactor interrupt handler registration and interrupt handling.
> 
> Venkata Prasad Potturu (14):
>   ASoC: amd: acp: Remove redundant acp70 chip->name
>   ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
>   ASoC: amd: acp: Refactor dmic-codec platform device creation
>   ASoC: amd: acp: Refactor acp platform device creation
>   ASoC: amd: acp: Refactor acp machine select
>   ASoC: amd: acp: Add new interrupt handle callbacks in
>     acp_common_hw_ops
>   ASoC: amd: acp: Remove redundant acp_dev_data structure
>   ASoC: amd: acp: Move spin_lock and list initialization to acp-pci
>     driver
>   ASoC: amd: acp: Remove white line
>   ASoC: amd: acp: Refactor acp70 platform resource structure
>   ASoC: amd: acp: Refactor acp63 platform resource structure
>   ASoC: amd: acp: Refactor rembrant platform resource structure
>   ASoC: amd: acp: Refactor renoir platform resource structure
>   ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: amd: acp: Remove redundant acp70 chip->name
        commit: c3d5d331c96f35c6425f7dcfa5c60cf9a5055d0e
[02/14] ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
        commit: 8ae746fe51041484e52eba99bed15a444c7d4372
[03/14] ASoC: amd: acp: Refactor dmic-codec platform device creation
        commit: e2cda461765692757cd5c3b1fc80bd260ffe1394
[04/14] ASoC: amd: acp: Refactor acp platform device creation
        commit: a8b9d2d7376d2caf74c0ffbf9bc71b98ed9d1a01
[05/14] ASoC: amd: acp: Refactor acp machine select
        commit: 6e60db74b69c29b528c8d10d86108f78f2995dcb
[06/14] ASoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops
        commit: aaf7a668bb3814f084f9f6f673567f6aa316632f
[07/14] ASoC: amd: acp: Remove redundant acp_dev_data structure
        commit: e3933683b25e2cc94485da4909e3338e1a177b39
[08/14] ASoC: amd: acp: Move spin_lock and list initialization to acp-pci driver
        commit: a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
[09/14] ASoC: amd: acp: Remove white line
        commit: c8b5f251f0e53edab220ac4edf444120815fed3c
[10/14] ASoC: amd: acp: Refactor acp70 platform resource structure
        commit: f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
[11/14] ASoC: amd: acp: Refactor acp63 platform resource structure
        commit: d08220b6e32e88655f54b497fd45a3982b59093c
[12/14] ASoC: amd: acp: Refactor rembrant platform resource structure
        commit: ee7ab0fd540877fceb3d51f87016e6531d86406f
[13/14] ASoC: amd: acp: Refactor renoir platform resource structure
        commit: e167e5b268b2d06a7b59872c189fae0f587562ee
[14/14] ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry
        commit: 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

