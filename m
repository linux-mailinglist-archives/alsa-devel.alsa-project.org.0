Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB59A3AAE9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2025 22:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD39C60426;
	Tue, 18 Feb 2025 22:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD39C60426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739914267;
	bh=lGPPM6C6CRkwda2Xb7fQg2RPI4I2QryenHs0aVrHk8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czHNUUCYk33KhzyOoVyl+dAnfWcIwAnbi6i6qi+8qGr7MQQkJNJDjIMBb8wMX9sZV
	 0fhN3Efs4PyzoynUm1qeF2uE3ktQKj0MIMJyswmNl+QvOldzp3wbf8dCLvy0yAAiSx
	 7vdLTW6VClvk6DzIy8Mz9GvNw5FVY+oAksQ7L/SM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A1FF805C4; Tue, 18 Feb 2025 22:30:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4AEEF805C2;
	Tue, 18 Feb 2025 22:30:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 443C0F80518; Tue, 18 Feb 2025 22:30:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 82659F800ED
	for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2025 22:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82659F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aY8BBoxF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EFA0A40A9F;
	Tue, 18 Feb 2025 21:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F2C4CEE8;
	Tue, 18 Feb 2025 21:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739914222;
	bh=lGPPM6C6CRkwda2Xb7fQg2RPI4I2QryenHs0aVrHk8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aY8BBoxFJY5XB2Hismdx3QK4JXY+0Y62ulymjjlojuEzn9pnI7BCWzcJ5Q47zMUvS
	 6DI/LVF/WbwEuKP4f8s3FdqjAhdUwDWMXsc3+g/unXXgBTzwwo8qr3MNN0JZ1FjTfA
	 5z9q00h1CdztuJJIDxpHzfOolVj8xrg1jK7v1ZjgCJLz5kCKOCxMWdk1W4zskMMUIa
	 Dq1mjL78GRJ/q0Mnbz9NS+8V1EmvlU8ufGHZzTUP/jGF66aPQIIbVzZRcmehzY3Rxl
	 +AnJzFT+SB96OamKntguwx+kBypEn1e0UPxytVAJxfauJCABk90/3m5t2TiNsPybgE
	 otChFDbI3Nh8w==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250218051000.254265-1-Vijendar.Mukunda@amd.com>
References: <20250218051000.254265-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: fix inconsistent indenting warning in
 check_and_handle_sdw_dma_irq()
Message-Id: <173991421905.1713371.4910441830117855699.b4-ty@kernel.org>
Date: Tue, 18 Feb 2025 21:30:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
Message-ID-Hash: DC2Q2DJKQ424GL2M45DOT4TGYGMU2DMJ
X-Message-ID-Hash: DC2Q2DJKQ424GL2M45DOT4TGYGMU2DMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DC2Q2DJKQ424GL2M45DOT4TGYGMU2DMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Feb 2025 10:40:00 +0530, Vijendar Mukunda wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> sound/soc/amd/ps/pci-ps.c:68 check_and_handle_sdw_dma_irq() warn: inconsistent indenting
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: fix inconsistent indenting warning in check_and_handle_sdw_dma_irq()
      commit: 5d9fca12f54d3e25e02521aa8f3ec5d53759b334

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

