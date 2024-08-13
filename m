Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA7950984
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 17:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B4423D0;
	Tue, 13 Aug 2024 17:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B4423D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564481;
	bh=OXIfz+3/CpD9ukTb2nLxZ0KSKbyRZuPP5xJxuFIIpQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OlI8GRdT7tmlzFk/SToC8ery4SlYINgBXr3gwWXUUfK9ua3uS/Y0eRwxqU54wOnwe
	 B+FCmPm+w/xZagK3sxBu6EjD/9zIqfb4I0O66/XXqpQaVYAhvqgGXELdRq65JCps3c
	 CYLraVNcFsuiFYqU/Ja3CLrdd9ThWG423P7l1EdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0850EF805BB; Tue, 13 Aug 2024 17:54:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCFCF8058C;
	Tue, 13 Aug 2024 17:54:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0672FF80423; Tue, 13 Aug 2024 17:43:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AEC4F800B0
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 17:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AEC4F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W6BjmZTw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D3B06177C;
	Tue, 13 Aug 2024 15:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D8FC4AF09;
	Tue, 13 Aug 2024 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723562378;
	bh=OXIfz+3/CpD9ukTb2nLxZ0KSKbyRZuPP5xJxuFIIpQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W6BjmZTw4pJtnRk2eaXRu1hAS5kTOHX+Cg37tID1nw7hjNr5lcH+89sjfLtYLLCN9
	 mT0Jds4yqUbcnck+MAlMjPrETYPHWLgjONdnhgNYVmsxPTufywZiMZ4wtXKGU4+XMB
	 bMJS4ucv3zEZNYMkaddUENRKGQdxhMh5y5coGYG9eUw3oeZY9MXzWxYP8hCL+1BA3w
	 SyIZ2VDPuA+v08OqmnHLLIb0uU8eSe0PxB0D4hWtlNi/ZKt+sRub0TVuxndME4d2Qu
	 tWxNzHudvG48ZWFPiWldyF7k+PFVDIqNZmTitNmbXL3V5VpPeJWj+Nu65un2t/FWGK
	 4Je1MtPrIjMDA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240812100429.2594745-1-Vijendar.Mukunda@amd.com>
References: <20240812100429.2594745-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Convert comma to semicolon
Message-Id: <172356237561.72636.9236127890451321157.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 16:19:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: P5OVTHBQSVDSDCICHW6IPKU7RRABA5QX
X-Message-ID-Hash: P5OVTHBQSVDSDCICHW6IPKU7RRABA5QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5OVTHBQSVDSDCICHW6IPKU7RRABA5QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Aug 2024 15:34:22 +0530, Vijendar Mukunda wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Convert comma to semicolon
      commit: 6024b86b4a618b6973cf6fc5ed3fa21280e395b9

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

