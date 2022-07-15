Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC385765B8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 19:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0B115F9;
	Fri, 15 Jul 2022 19:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0B115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657905798;
	bh=zhKFGDAKzjIcdaKCKOjey1iz1DIJM+vZjFXRFpNiVa0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBHBoRg/smuXX+fwT72X1VU9v+uT6XB7MWT2v6QSAG2FZPT8DwdC4kYHGkmd5pfue
	 NHoxMzpnp+WqPJ5IpPYR7QugGdy2PQDvNOWOpc6ske5V2alGsigxJRH9N+IBQGRuOc
	 j5MX1xJHeGH9DXeiYC3nXHyMMXFXE5Lzi7D/gQfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3649F8014E;
	Fri, 15 Jul 2022 19:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8ED7F8015B; Fri, 15 Jul 2022 19:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36902F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 19:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36902F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rFmPJuP9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DEAC62292;
 Fri, 15 Jul 2022 17:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9F6C34115;
 Fri, 15 Jul 2022 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657905726;
 bh=zhKFGDAKzjIcdaKCKOjey1iz1DIJM+vZjFXRFpNiVa0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rFmPJuP9Z+UG9D6jPNimAhPrSVZLAU88g1c2UJrPhNhk55G/jNf37HEZFCuHrCGrw
 SQ+dMlDeNQtQRIZ/9dhvPUgRNClxsg8iVlLR8c19K45YpJkHNLO4qrO9TVdmDXXh2P
 YcTUyWJnBzN8iHZIOHja5PmogyG/YQ54FgiTnipDOPvDBLdN+hpwx3ZjAVRk5yroW9
 2xPkx0oAtqhRipjosoRCjWno4md/Sj52bM638vNBfoOA6aBT/UuSLHSHpgqBc/PmGx
 xZ3X5SU9yD2LKQJWvJOI1YZgSUdh/gKpro7M94X0xH/tZ7NSN/dnSikHA0FMx3VguN
 vebCAIu42KI3A==
From: Mark Brown <broonie@kernel.org>
To: sbinding@opensource.cirrus.com, lenb@kernel.org, lgirdwood@gmail.com,
 rafael@kernel.org
In-Reply-To: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
References: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v6 0/2] Read _SUB from ACPI to be able to identify firmware
Message-Id: <165790572476.3961283.3237743064047303492.b4-ty@kernel.org>
Date: Fri, 15 Jul 2022 18:22:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 7 Jul 2022 16:10:35 +0100, Stefan Binding wrote:
> CS35L41 has a DSP which is able to run firmware, as well as a tuning file.
> Different systems may want to use different firmwares and tuning files, and
> some firmwares/tunings may not be compatible with other systems.
> To allow a system to select the correct fimware/tuning, we can read an _SUB
> from the ACPI. This _SUB can then be used to uniquely identify the system
> in the firmware/tuning file name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ACPI: utils: Add api to read _SUB from ACPI
      commit: 93064e15c8a3a8394319a11b8037666e4b7d653d
[2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to identify firmware
      commit: c1ad138822a1be95a7a7b122521c2415583a0c26

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
