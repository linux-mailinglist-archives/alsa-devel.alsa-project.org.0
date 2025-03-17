Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE30A657EB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 17:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B549060347;
	Mon, 17 Mar 2025 17:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B549060347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742228684;
	bh=S8rkvyTlbJT1gIhv5b/YRSUsQaaIxz+gef47gM4FQeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DWuRcgdzrOs9rX83Bb3p3XB5UTijp4OLzFJ1VNHHgpD+Ec3v+jT42FBa8aTv+47JH
	 NJvTdEikRfKQUyW6Fp2ieSknEua2fW6m3bVamRESVQUxyC/ZEGoZSAr3zZmnzDeaFY
	 u63N+KF/IW2rYGCAIuzSQPYSu3w45YHZiEiB/ziE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D9A6F805B3; Mon, 17 Mar 2025 17:24:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 676ACF805B2;
	Mon, 17 Mar 2025 17:24:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1D29F8055B; Mon, 17 Mar 2025 17:24:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 292F9F80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 17:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 292F9F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eHgrafX/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06316A460D9;
	Mon, 17 Mar 2025 16:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01545C4CEE3;
	Mon, 17 Mar 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228640;
	bh=S8rkvyTlbJT1gIhv5b/YRSUsQaaIxz+gef47gM4FQeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eHgrafX/Y7f+UnMCDf310BPSsrehHgdQnjS7tlb/Vz9nUGn4IdyMwWRPbJ4QtXBVq
	 6RfTjHTbt4s3SOghrDbX0FbHMkuFyZrhe8ha9Ka5gwOaAdK/co+U5myIyoRNl4+nG3
	 SqRYjMSWX2kiLLq0NB+NdpSIFXg19HNJYh459wh/rpuVl3ayXuVSdIMkFu4mo11/M5
	 A0t1bnJZLRKmlC4Bz4q5Wo6GyYFqUqXxiA+SZ5F9NewLkxoXLEWeFDjDGXqmev6y3R
	 ni5Rh0q0RE4lGNyaIKFvbpsN+Okh9m/Yx9n5aV1Hxx/TQNQ2bp9nNFKsBFZktzsDNs
	 nky42SkDhXM4w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, nathan@kernel.org,
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>
In-Reply-To: <20250317072413.88971-1-venkataprasad.potturu@amd.com>
References: <20250317072413.88971-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix snd_soc_acpi_mach id's
 duplicate symbol error
Message-Id: <174222863673.227953.6804777136695160780.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 16:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: LOG7P4ECRQIRUXQXQ2GN3CHH3GBKSNT4
X-Message-ID-Hash: LOG7P4ECRQIRUXQXQ2GN3CHH3GBKSNT4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOG7P4ECRQIRUXQXQ2GN3CHH3GBKSNT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Mar 2025 12:54:07 +0530, Venkata Prasad Potturu wrote:
> Move snd_soc_acpi_mach id's of all acp platforms form header file to
> amd-acpi-mach.c file to avoid below errors.
> 
> ld.lld: error: duplicate symbol: amp_rt1019
> ld.lld: error: duplicate symbol: amp_max
> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp63_acp_machines
> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp70_acp_machines
> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_rmb_acp_machines
> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp_machines
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Fix snd_soc_acpi_mach id's duplicate symbol error
      commit: 9c2c0ef6400980f09b377be250f5dff14dbbf3b6
[2/3] ASoC: amd: acp: Fix acp_resource duplicate symbol error
      commit: 09dc8031f4a84103f4ba8f704ec21f1926b04366
[3/3] ASoC: amd: acp: Fix acp_common_hw_ops declaration error
      commit: 77ad261ecc4aa1b09bc98b32cdbfadb5e92197b7

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

