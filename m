Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2495DD5D
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2024 12:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62B7820;
	Sat, 24 Aug 2024 12:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62B7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724495003;
	bh=DHfBeB6VH0Vj/VVf//ne/Oe4kp09vPVca2xpKGtQfBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BCUFkrqivy8sZqvuLkHJmsG8dMmsF0DSGha/L+JiHi7lSstHl25bymMSUbGjpZTIa
	 6D5Dwoe75KvAyelrkhY1NYa6Hr0cWEqUc3ECoVYXjU17mWMCySlr9nC0UPMx3rLDZi
	 /rowFnYSBWnd9Z7c9e+CtC0wQHO4iIM7NAow1z/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B292F80580; Sat, 24 Aug 2024 12:22:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9F2F8059F;
	Sat, 24 Aug 2024 12:22:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC632F80107; Sat, 24 Aug 2024 12:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B3ACF80107
	for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2024 12:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B3ACF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hLGHZ+RE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F18B2A400A4;
	Sat, 24 Aug 2024 10:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F85C4AF09;
	Sat, 24 Aug 2024 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724494411;
	bh=DHfBeB6VH0Vj/VVf//ne/Oe4kp09vPVca2xpKGtQfBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hLGHZ+REqqbHGEW/qUWs1P9xob2+A88Mi228LTFNSu+A4GMjvMJh68lUP/SISnAHU
	 YyvML9gbMD1CeXdLagPtyeWvb0hYXsJT0tQh5k3caBqg2SW6e/60yXdCnniu3Yr3u8
	 26Pg3wCLzNooOBK4Z617us44d74dH8JiYZ22XFM5vV6cmMrA+o5YX+NKwBYbZy/WKz
	 xEJiLXCTNWvI9d4kZQpCUVd/ubQC/eLJ9LL0ayMx7iPkzkvSCtI8Gv6VImJ6KARPnm
	 3pvlv+H6pVa6as8lYyZ2To35H8y3eFv2HQoWGpXA6Zy9IfDThJnHnH33N2ZsaE0tku
	 Y2VToHX7zmkfA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
References: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] Add SOF support for ACP7.0 based platform
Message-Id: <172449440702.846858.10370645706025243690.b4-ty@kernel.org>
Date: Sat, 24 Aug 2024 11:13:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: QAWILL5ZIJ3LXWTO3H5BLZT7RGIYPIQM
X-Message-ID-Hash: QAWILL5ZIJ3LXWTO3H5BLZT7RGIYPIQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAWILL5ZIJ3LXWTO3H5BLZT7RGIYPIQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Aug 2024 11:07:37 +0530, Vijendar Mukunda wrote:
> This patch series adds SOF support for ACP7.0 based platform.
> 
> Link: https://github.com/thesofproject/linux/pull/5139
> 
> Vijendar Mukunda (2):
>   ASoC: amd: Add acpi machine id for acp7.0 version based platform
>   ASoC: SOF: amd: add support for acp7.0 based platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Add acpi machine id for acp7.0 version based platform
      commit: e17de785850e3112b2ea6ba786016a61f195bb23
[2/2] ASoC: SOF: amd: add support for acp7.0 based platform
      commit: 490be7ba2a018093fbfa6c2dd80d7d0c190c4c98

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

