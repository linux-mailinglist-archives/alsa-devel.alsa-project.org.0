Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F2C3DE7A
	for <lists+alsa-devel@lfdr.de>; Fri, 07 Nov 2025 00:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752EB601B6;
	Fri,  7 Nov 2025 00:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752EB601B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762473297;
	bh=ZqauHgPc3MWbXQyDCi02XYZMxOt93KMGYqST1LgJt4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PUrWjt6tpjAc8py9KOrdXQwlvDIgvVbMGM3ls5BwyEYzEU8pdHG7QQcQQ2HEpLRVe
	 Yk0Sb+exAt4AA0oWTRM99RHIuUAmbxWdI4vCpeSbZ7PzwEB+ZfC4sJxpHgEfibEntC
	 R0FUfLOVRhBminUCm9469h8GzdUpyM/D3r62hC/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F615F805BF; Fri,  7 Nov 2025 00:54:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB2FAF805C2;
	Fri,  7 Nov 2025 00:54:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89AA9F8055B; Fri,  7 Nov 2025 00:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41BB0F800B5
	for <alsa-devel@alsa-project.org>; Fri,  7 Nov 2025 00:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41BB0F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dmSOM217
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95CEE601A3;
	Thu,  6 Nov 2025 23:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F799C116C6;
	Thu,  6 Nov 2025 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473239;
	bh=ZqauHgPc3MWbXQyDCi02XYZMxOt93KMGYqST1LgJt4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dmSOM217QdNUrknPsm+Zra13EH+PblhkY8RgyxqGaWQNa5JdIgRmkMGoCUjLMhvXO
	 bPBd3/YuwXOeMm5xy0+c+6YcYojJWhhZWtJmhpvTwyVc+t1HOERjZdg5sGs5rhTnu/
	 8mLFFe4nYNs7+BtfE16E/0Tdx1xKO6JKJZR1j9clOcBIutQbMIev4cCVR1ATzpF/Hx
	 LdGchLh8CdMkRUOQyWLDRUb4317/QiaMHZrAwlf+g+h2evr8nLSosdj/J11TKPUa17
	 WTf8UVTj2b7Sd65CHiGLcmYwX18yB7M8OU3GA1NRGdLbI0q/Wql5Tqdjvoeiy+HYQl
	 taBHOTz6bEVaQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, navada@ti.com,
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com,
 dan.carpenter@linaro.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20251030151637.566-1-niranjan.hy@ti.com>
References: <20251030151637.566-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2783A: Fix issues in firmware parsing
Message-Id: <176247323396.2482911.634928680966070810.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:53:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
Message-ID-Hash: CF3YQR3OU3SACCONQ3WMCF7C4K67BNAI
X-Message-ID-Hash: CF3YQR3OU3SACCONQ3WMCF7C4K67BNAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CF3YQR3OU3SACCONQ3WMCF7C4K67BNAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 30 Oct 2025 20:46:37 +0530, Niranjan H Y wrote:
> During firmware download, if the size of the firmware is too small,
> it wrongly assumes the firmware download is successful. If there is
> size mismatch with chunk's header, invalid memory is accessed.
> Fix these issues by throwing error during these cases.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2783A: Fix issues in firmware parsing
      commit: 84f5526e4dce0a44d050ceb1b1bf21d43016d91b

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

