Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2DAD22A3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 17:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02C53601F6;
	Mon,  9 Jun 2025 17:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02C53601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749483642;
	bh=79i4R9SAD/alYf7WTzRlygyu10EANW52xvy2M/Do+QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQ0iC/Axw9orOpKoqTnNSCCCOFhFij54BS2lfuvbJ8Dz3Dy2FftBBFwPYlr+LK7Uf
	 a3WJB0FjTmqo4suD8D6oqtd2ZKq2+zvVsbgNAQ6+tWmWfOgC50BkmD/mRbvdKaqaw1
	 lIFon7/WRpkteImDs+DvtVOSi7q6Z+ZlhuarhdbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84DB0F805C2; Mon,  9 Jun 2025 17:40:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77564F805BE;
	Mon,  9 Jun 2025 17:40:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EAEFF8049C; Mon,  9 Jun 2025 17:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E2CFF801F7
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 17:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2CFF801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jkd8Z7hy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3146D629DF;
	Mon,  9 Jun 2025 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77850C4CEEF;
	Mon,  9 Jun 2025 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749483600;
	bh=79i4R9SAD/alYf7WTzRlygyu10EANW52xvy2M/Do+QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jkd8Z7hy9VcKFGVF/k3GMiuZNhA8hpfqrTKYXXW9Je8G7+feslv2lSkbwsZS8sFn5
	 QHkWbADZUD9XV/luyZa1vbkWCt1YTgW7akHYZKWDy1u9qBHveFledA9n37B2QONLhc
	 ZktHqXIL8WQg79ILLwbsqsTpd6QbQQChORr4D2Z059wold8li4fSPKbQ43s6UTBLk5
	 upjF0NTuViNfBiXpLY8YpDs6hSLQJduk5+MecH8Rn1R99xoBKCITYInJG2v8E0UW5V
	 wy4Iuom04TDjcvXLP3bV1uWBwQmfeOkoAp2zASX1+v/QVpagpQSE8hmgbp72YIZWE5
	 LwbWi+g1AK2wg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com, yung-chuan.liao@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
References: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix pointer assignments for
 snd_soc_acpi_mach structures
Message-Id: <174948359821.187608.7932953931685705829.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 16:39:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: WEXFTZZK2SXEGWTZOULQJBUIWDIASM4Z
X-Message-ID-Hash: WEXFTZZK2SXEGWTZOULQJBUIWDIASM4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEXFTZZK2SXEGWTZOULQJBUIWDIASM4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Jun 2025 17:42:32 +0530, Venkata Prasad Potturu wrote:
> This patch modifies the assignment of machine structure pointers in the
> acp_pci_probe function. Previously, the machine pointers were assigned
> using the address-of operator (&), which caused incompatibility issues
> in type assignments.
> 
> Additionally, the declarations of the machine arrays in amd.h have been
> updated to reflect that they are indeed arrays (`[]`). The code is
> further cleaned up by declaring the codec structures in
> amd-acpi-mach.c as static, reflecting their intended usage.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix pointer assignments for snd_soc_acpi_mach structures
      commit: 0779c0ad2a7cc0ae1865860c9bc8732613cc56b1

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

