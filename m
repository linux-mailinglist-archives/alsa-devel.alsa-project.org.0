Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51238B79AF
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345EFEC0;
	Tue, 30 Apr 2024 16:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345EFEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714487556;
	bh=P/HYWi/LV077z/N4A+ZZFfgcNLE/hTASIK4wgh7zsPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cXSzAAbxGs5ctHO14uvZgqMRKFT7Ton+hkwRrm+f66NBvCp5JLDSabP+EIAQRHh7Z
	 4rTvAUzjhUiGyBcwSspYuJQHGV1qxAWqlz40yq5TNft7DAGNtc4xgtnEzuIhlwl3Np
	 QDIwMRJbiPTYsMt77LEdOnOKS/dhthgRow2TjdD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29724F805D4; Tue, 30 Apr 2024 16:31:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F418BF805B5;
	Tue, 30 Apr 2024 16:31:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A68F80269; Tue, 30 Apr 2024 16:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4349AF8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4349AF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LK+YxBbP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33B7961614;
	Tue, 30 Apr 2024 14:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADEC4AF19;
	Tue, 30 Apr 2024 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487493;
	bh=P/HYWi/LV077z/N4A+ZZFfgcNLE/hTASIK4wgh7zsPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LK+YxBbPqxXLUdS2eBmf/gK0xn3SWu1zTu+GSvZ6K4hmjd89eFab2s1Vv1VtVFCFm
	 +DTyf/Q/X+Rya8uKNgdfx776lXc8tyQZK2vEPwfHtqyJbenDRX8QHNzkCFwrcIOLoh
	 u4fcQrB4W2uZroJfqMFX+ZpSnSy6qcPXApjeae3Ikeq4M4Suj0y3h2ULirXX7iMHOS
	 r1FVkPeha5HCkHKetmMyM4aIC+9RoppHFqHnBZFll3m0chIcy53+ViMbZttnNyuDOd
	 jOibllnSk9BGWrXYST6DYCd5e34+2f1hZTt6wgZiUYL65k3XKngd9rGTsMZVw72SlI
	 8YFCXkLT3sRWQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: da7219-aad: fix usage of
 device_get_named_child_node()
Message-Id: <171448749253.1870439.912738117860341147.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: LBTFDPKYVP5NENJZSJQ2ZBCOA4363V2N
X-Message-ID-Hash: LBTFDPKYVP5NENJZSJQ2ZBCOA4363V2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBTFDPKYVP5NENJZSJQ2ZBCOA4363V2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 10:30:33 -0500, Pierre-Louis Bossart wrote:
> The documentation for device_get_named_child_node() mentions this
> important point:
> 
> "
> The caller is responsible for calling fwnode_handle_put() on the
> returned fwnode pointer.
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219-aad: fix usage of device_get_named_child_node()
      commit: e8a6a5ad73acbafd98e8fd3f0cbf6e379771bb76

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

