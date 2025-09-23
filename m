Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3EDB94F7B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Sep 2025 10:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB358601F5;
	Tue, 23 Sep 2025 10:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB358601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758615703;
	bh=uhVcKOVGexkqhwPIFLonAcK9G4SknktyxCVmDC5JL50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ChLFXTXTzyWFs4wArW4iM794cM3VWvx6lFl7yadNXUAS+9D0d2eVgtnPygcpmkHpx
	 sHmKrDsSDlxCbcYj6AOACsP3HoIr6EkhnG08uBDGSWbPg8oS37u1c12Cyes1YHwMdM
	 umo0wWUHgqnx0ZW5/jpkb5zpj7sJla+ezLhrNju0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB361F805CA; Tue, 23 Sep 2025 10:21:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53916F805C0;
	Tue, 23 Sep 2025 10:21:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 044B9F80027; Tue, 23 Sep 2025 10:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFB04F80027
	for <alsa-devel@alsa-project.org>; Tue, 23 Sep 2025 10:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB04F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tf7mnyH8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A84FA437D0;
	Tue, 23 Sep 2025 08:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C48DC4CEF5;
	Tue, 23 Sep 2025 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758615645;
	bh=uhVcKOVGexkqhwPIFLonAcK9G4SknktyxCVmDC5JL50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tf7mnyH8XoV8VnR6a1L+Mogf9pms+7AAPLczAbK2jGBt+jvbU0wRhxr0YHo161vDr
	 YSas3eFm3kaoXrTqi4W3is5sYkRlgWm0QE/B0QUocZdNxzeRNciEwUtBLBqi902cqT
	 6ZJQB3WuUG+m9l7oVc6jFnLilmcF5iptIUH5YJZG0gkwRWGkLGZwMcJgwbL4wMIrNi
	 Vk4yBFZdWG55WfjPwZeF99znnyapJ36IWWbo5dEzpE/43uFBy6iQxH/L3VrdoYyK9m
	 qRCQbQHqt2PvsYRigLECSB+heVEerVwwDgZDec8FYoLxstrqBn7nb9SO1YFQuMuDw3
	 z9Cgi/Df3Uclw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, navada@ti.com,
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>
References: <20250912083624.804-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Message-Id: <175861564199.978426.13414867456859175456.b4-ty@kernel.org>
Date: Tue, 23 Sep 2025 10:20:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
Message-ID-Hash: RJOEZNDT4P435NZREBWATNVBVYIRXSCV
X-Message-ID-Hash: RJOEZNDT4P435NZREBWATNVBVYIRXSCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJOEZNDT4P435NZREBWATNVBVYIRXSCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 Sep 2025 14:06:20 +0530, Niranjan H Y wrote:
> * add error handling in case register read fails
> * clamp the values if the register value read is
>   out of range
> 
> --
> v5:
>  - remove clamp parameter
>  - move the boundary check after sign-bit extension
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ops: improve snd_soc_get_volsw
      commit: a0ce874cfaaab9792d657440b9d050e2112f6e4d
[2/5] ASoc: tas2783A: Add soundwire based codec driver
      commit: 4cc9bd8d7b32d59b86cb489a96aa8a7b9dd6a21b
[3/5] ASoc: tas2783A: machine driver amp utility for TI devices
      commit: 96384a34dd15b0e7357a34af5c848d1115a35e62
[4/5] ASoc: tas2783A: add machine driver changes
      commit: b41949a2109e49cb96a1dc292efa249933e5232e
[5/5] tas2783A: Add acpi match changes for Intel MTL
      commit: 63b4c34635cf32af023796b64c855dd1ed0f0a4f

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

