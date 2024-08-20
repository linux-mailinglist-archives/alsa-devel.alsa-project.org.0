Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFE958BE6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 18:04:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65ED7F1;
	Tue, 20 Aug 2024 18:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65ED7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724169855;
	bh=FM/6slYqkUzhEFqy4cFsVFigikMsa3+XDaqNAp6RoJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fuM8wlS84m2fpsH3KCJLPB2DNkJ91tbJw6fdQ+OlhW4RBJdJ4zob/rcHjTynXZods
	 tlphZF50Z2/iyM4F+1+znA5baTnh1NMC4v6SPkyMENYwYMLjP7jpmEtZmAVF02q263
	 eFh/QD7iepJrjbrPUW7St/4ts+cr6S8KqmjB61bw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC8AF805AF; Tue, 20 Aug 2024 18:03:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB7A0F805AF;
	Tue, 20 Aug 2024 18:03:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD70F80494; Tue, 20 Aug 2024 18:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB5D0F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 18:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB5D0F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TEHVLSqu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C477CE0B73;
	Tue, 20 Aug 2024 16:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B025EC4AF0B;
	Tue, 20 Aug 2024 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724169806;
	bh=FM/6slYqkUzhEFqy4cFsVFigikMsa3+XDaqNAp6RoJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TEHVLSquwf9Ig5CgXWKGLxZ+TqKYi5Qtp/qj9KwEgmJ2v3G1DbuDsjRF+WrHSGCD8
	 W5TjO73j3fHSmsgSI02xCD/zgg9U47996m+hCuFFLagBGpz/GY6rjLFq4aVmtuZIhK
	 Es4JwxSriOx+6kjnYI6X6kVMcDlpFsGIQRX1+ngU53SM7YUXpPm/0X5lHKMKpATl1C
	 FUnqIFjg1R5b1UmnHeo9S0eDk/OJDgesjitp6PVd1o1ZeO8bqaqpZ2Sec2Be4hQfGv
	 bzJKHYwQpLK+cPdjBRNcKm9AKGDMRNzXKk4WJJl/m7m6Kl/fsyR7HMPjIMtqsMlVqv
	 g8eFm0ctdbMVw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240819061329.1025189-1-Vijendar.Mukunda@amd.com>
References: <20240819061329.1025189-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: replace desc->rev check with acp pci
 revision id
Message-Id: <172416980343.391665.2003933347335223810.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 17:03:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: C7KVCBSWH5TCV2GOATCZMBQIBDHXRRZ4
X-Message-ID-Hash: C7KVCBSWH5TCV2GOATCZMBQIBDHXRRZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7KVCBSWH5TCV2GOATCZMBQIBDHXRRZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Aug 2024 11:43:29 +0530, Vijendar Mukunda wrote:
> Replace acp descriptor structure member 'rev' check with acp pci revision
> id.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: replace desc->rev check with acp pci revision id
      commit: 1004f34d4f4a59aa5508c3b96069759efa738544

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

