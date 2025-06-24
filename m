Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E234AE65A3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jun 2025 14:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2CA0601D3;
	Tue, 24 Jun 2025 14:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2CA0601D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750769748;
	bh=IJYkSqmI2lMK8gEM/9IKh/oXnySNxv0ffD9AZxQ1rA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJ6+YDrfQOs5NwDebqa+0HB5hyF3SUF+dLZfXtN5ZKoxGG/YxmEwNV/mr8/he45L4
	 LrxVye0LfZUK/Cgt28fmTu0kIY6vq/I8oeyuLTwBbdAQ3U8FaUFpC8BkmgBXOvKqyL
	 srzBPYNPTiXsOoDnwHtx21ZRkQJIfAoaP2S3dVmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31558F80087; Tue, 24 Jun 2025 14:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26AF3F805B4;
	Tue, 24 Jun 2025 14:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A683F804CF; Tue, 24 Jun 2025 14:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E28DF80087
	for <alsa-devel@alsa-project.org>; Tue, 24 Jun 2025 14:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E28DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jTEzbD/0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 268C6A51745;
	Tue, 24 Jun 2025 12:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6369C4CEE3;
	Tue, 24 Jun 2025 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750769706;
	bh=IJYkSqmI2lMK8gEM/9IKh/oXnySNxv0ffD9AZxQ1rA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jTEzbD/0bzea63+HNBffdDghe2VA1xDqGsFrviqJLpRZOfYEujbBWMwk7URaV7+Mp
	 hx+Ab6hSWpkVyxWL4Z7E87bxd+5+Qp2C2xC8Y5g8ErMVnR/lxp3QWrjTHsgO+ig6BP
	 5cGSoxRJbdB8hTCjwj6JPhxANgVqGw2iUNDGRABX6mZaprowdIpnamz4WfhYB1lZ+7
	 a2RirP39euxMe3d/iJinyCNZG4own0H14nE2EGAXpn68vG7UW7FsDNxhd6M1GoTQk0
	 yayQev010U3QaVuagdbTnqAqVBk46dxKXml5Pca1CBK3+TC0f/wQ02/iV6st3KSYVe
	 KegFSWjhbzb7g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250623084630.3100279-1-Vijendar.Mukunda@amd.com>
References: <20250623084630.3100279-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2] ASoC: amd: ps: fix for soundwire failures during
 hibernation exit sequence
Message-Id: <175076970454.77119.16488039769676863649.b4-ty@kernel.org>
Date: Tue, 24 Jun 2025 13:55:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
Message-ID-Hash: JFTBQ5ZUS72BJTMZ7YARBHZULQSGVBSM
X-Message-ID-Hash: JFTBQ5ZUS72BJTMZ7YARBHZULQSGVBSM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFTBQ5ZUS72BJTMZ7YARBHZULQSGVBSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 23 Jun 2025 14:14:55 +0530, Vijendar Mukunda wrote:
> During the hibernate entry sequence, ACP registers will be reset to
> default values and acp ip will be completely powered off including acp
> SoundWire pads. During resume sequence, if acp SoundWire pad keeper enable
> register is not restored along with pad pulldown control register value,
> then SoundWire manager links won't be powered on correctly results in
> peripheral register access failures and completely audio function is
> broken.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence
      commit: dc6458ed95e40146699f9c523e34cb13ff127170

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

