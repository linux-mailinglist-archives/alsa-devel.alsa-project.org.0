Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4194C60E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 22:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B3D4E67;
	Thu,  8 Aug 2024 22:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B3D4E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723150638;
	bh=6d3cWqVCdJO0OpAjDetmkYiZ9As4WBJyrx0zuxN2k+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WClhRpGuLv09um1XPX4U2cjz/74EFsZufl013YVVQS6yKevPvgehCWjv/R5TFUZ/+
	 UZ1O/QZl2a0QxnoR2QKNcqKLr/VHMOwDwBWow0jlrSymKaxZEIf3DUl6591EoXouNe
	 frQS8a1QYtlYgORK5pxIk0HCuXtFKJZPwn5cd4W8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B56ADF805BE; Thu,  8 Aug 2024 22:56:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38CA8F805AF;
	Thu,  8 Aug 2024 22:56:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32B33F805A1; Thu,  8 Aug 2024 22:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2EDDF800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 22:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2EDDF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RLZH+0Br
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26FA5CE13D8;
	Thu,  8 Aug 2024 20:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75058C32782;
	Thu,  8 Aug 2024 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723150587;
	bh=6d3cWqVCdJO0OpAjDetmkYiZ9As4WBJyrx0zuxN2k+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RLZH+0BrYEX8+NwfuPPkQOYJDmsWVbSjFDJwM8AB+vpzzKH6OTLaucifTi/8W5uK4
	 obr+VKnBrJlivSVXeeMbEu9Ng1yAdvO4AgfrKf+FHIXOiPkhAIlUGVHqPzlhccJZrZ
	 VCYwDA0RIXOz5dDFQSGG3HElLp5MFLk0dxzw8Bg7ZVlrRFkFc8q3WzmjOZ18zzWT0Q
	 s6hZcEq59cUWjcKdKIz26ACxS4Pg71VMR2t+nXrMewPzxZLZxBB8z8flerJuTmZLAK
	 O0fZETGPoErof4OBIXXvbSKYOqalrPcv0UaxIpkmBaVXThWzayCTzyfMcBrAOs2Uiu
	 nZia1eftxWpyg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, krzk@kernel.org,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240807050846.1616725-1-Vijendar.Mukunda@amd.com>
References: <20240807050846.1616725-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: remove MODULE_ALIAS for SoundWire
 machine driver
Message-Id: <172315057813.475406.17002949847981977222.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 21:56:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: OCFMEWBAVH5DTGHNQW6QRB3Y2BIWQAEE
X-Message-ID-Hash: OCFMEWBAVH5DTGHNQW6QRB3Y2BIWQAEE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCFMEWBAVH5DTGHNQW6QRB3Y2BIWQAEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 10:38:39 +0530, Vijendar Mukunda wrote:
> As module device table added for AMD SoundWire machine driver MODULE_ALIAS
> is not required. Remove MODULE_ALIAS for AMD SoundWire machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: remove MODULE_ALIAS for SoundWire machine driver
      commit: 20288905e1ee33af82570b79adee3f15018030d4

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

