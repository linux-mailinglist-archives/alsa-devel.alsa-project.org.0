Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807B7A2CEE
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EAB1E92;
	Sat, 16 Sep 2023 03:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EAB1E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826877;
	bh=nvgkVq14DgfwbmuVFuVSFi9zupSUMPWrzMEtqJxm+HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NswYT2z7Eu6n68RWIdCqjpWgolzQumKZe/g7QLtTLvuAfbMXaT21jYgZrnwZvFzX7
	 nVbG6B1L1NhOsRzaL0CSew4yL2EXpYB0AfCPTak6mIKh2cue/KnfQbBPdFqEz8MRLN
	 1FOjhytvXsX5xLTO7vUC18mzIkLrZWc07Vs1mpr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62F6AF805CA; Sat, 16 Sep 2023 03:12:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94171F805C0;
	Sat, 16 Sep 2023 03:12:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3212EF805A8; Sat, 16 Sep 2023 03:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E970FF80568
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E970FF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1sHTeBN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D0FA2CE2E4D;
	Sat, 16 Sep 2023 01:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C254DC433C7;
	Sat, 16 Sep 2023 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826702;
	bh=nvgkVq14DgfwbmuVFuVSFi9zupSUMPWrzMEtqJxm+HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G1sHTeBNAaFSuLXcxc/0haQhQUiHtiZsF0oaFCdu/GL2jRqypLmzjr+VPOyaSWoF8
	 72EqFlNvCPyoSMVfT8APDCwwgj9nsJBuiMS8Uz8pvpM9HStEdlmpVIPz11Q+OP7sD7
	 wwD+9NLyJ7C1udXoS6n+HzcjstKaVaxKto7dHLCRhKsObOuQ/jMXUy6STooAaHxv35
	 TFwNC1LbZKhiOS7WDdMayh+4ESZgV1YCw/3Fy5VO4eXYBYiOh77ixnRNexmwDnwm5t
	 gVLVb6AYp8uacT2Yrv6WkWEQbyje9HV+NLgb900NNF8b59q2TDbMpO/RAYPo51wfT4
	 wc0C9pcnqsSOw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, arun.t@intel.com
In-Reply-To: <20230915080635.1619942-1-yung-chuan.liao@linux.intel.com>
References: <20230915080635.1619942-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/1] ASoC: Intel: common: add ACPI matching tables for
 Arrow Lake
Message-Id: <169482670051.606223.17684306734062535167.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: OQHXWFMKKVCHMSNH6IKPEYOZ6ZT6QC67
X-Message-ID-Hash: OQHXWFMKKVCHMSNH6IKPEYOZ6ZT6QC67
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQHXWFMKKVCHMSNH6IKPEYOZ6ZT6QC67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 16:06:35 +0800, Bard Liao wrote:
> Initial support for ARL w/ RT711
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: common: add ACPI matching tables for Arrow Lake
      commit: 24af0d7c0f9f49a243b77e607e3f4a4737386b59

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

