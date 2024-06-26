Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D67919894
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 21:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3880A192E;
	Wed, 26 Jun 2024 21:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3880A192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719431618;
	bh=lzU+cik77CuctsT3z+aF1e9wxYmZGia/8jYGIDA2mE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aeSiP5Qbu+esWxCaSjGbgk3KQ/mv6CiibuRaBUCq8JXc2n8HRtG7UPOMRtyvnqozC
	 I7KfuInu9QWPT1uPAGUoi0ysVW6yKmiqC0h5KeW/xQdl7TEZ5nHorzc2e+0PTlWUTH
	 55rIkph7yCi0v6Br0uWBdLe9UvNKj6eDTyaZPIH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14CD9F805C0; Wed, 26 Jun 2024 21:53:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9450F805D3;
	Wed, 26 Jun 2024 21:53:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F43AF80423; Wed, 26 Jun 2024 21:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC19FF800E4
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 21:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC19FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kKM1xyfB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9161CE20C2;
	Wed, 26 Jun 2024 19:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C30C4AF0A;
	Wed, 26 Jun 2024 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719431570;
	bh=lzU+cik77CuctsT3z+aF1e9wxYmZGia/8jYGIDA2mE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kKM1xyfBbSsNz2NF3csL/onKLZNJlgxmBOv8MFxtKYjRpqLXbVXZA9aXL+ZYO5Snp
	 YfKrVeYU+dRM3SLaAJg85cYNf3vTuffq9P6G7pEC2wxzSG+lVDrSY7IFBer88MDmtT
	 a7fsZM+wWpPAwR1edxi3VW+X2yTJVOZ4apfle98KUmFsLNGnUCLx9ueSLXqc+y3C/h
	 CnxbT8O6VDz7+zL9fiCrhXBvnNsxUVDOAsFuZJh42Ogx+IMl7w4r44xdB12hjaN3yS
	 uu7tEbLRTnQliSGTP21HnIdGSRsdpw9FgX8hV7ZsqBO4MvIWaigWvtqrYhrx+6G8S2
	 tX/6eELbmgsdw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Aleksandr Mishin <amishin@t-argos.ru>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20240605104953.12072-1-amishin@t-argos.ru>
References: <20240605104953.12072-1-amishin@t-argos.ru>
Subject: Re: [PATCH] ASoC: qcom: Adjust issues in case of DT error in
 asoc_qcom_lpass_cpu_platform_probe()
Message-Id: <171943156785.1690751.333640951846227902.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 20:52:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: K47H5QFQJN4B3G52K6VYPMAI24VPB5RX
X-Message-ID-Hash: K47H5QFQJN4B3G52K6VYPMAI24VPB5RX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K47H5QFQJN4B3G52K6VYPMAI24VPB5RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jun 2024 13:49:53 +0300, Aleksandr Mishin wrote:
> If IORESOURCE_MEM "lpass-rxtx-cdc-dma-lpm" or "lpass-va-cdc-dma-lpm"
> resources is not provided in Device Tree due to any error,
> platform_get_resource_byname() will return NULL which is later
> dereferenced. According to sound/qcom,lpass-cpu.yaml, these resources
> are provided, but DT can be broken due to any error. In such cases driver
> must be able to protect itself, since the DT is external data for the
> driver.
> Adjust this issues by adding NULL return check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Adjust issues in case of DT error in asoc_qcom_lpass_cpu_platform_probe()
      commit: f9f7f29f64454bb20896c7d918c3abc3a1aa487b

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

