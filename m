Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38125706D0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867B284D;
	Mon, 11 Jul 2022 17:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867B284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657552803;
	bh=0zUxV5qEJx6VLHEZ+aflwcgyZVTJfLhtlYkIoZub5P8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hVUvgvHazOlK/c1th/DcpW3jAwWjVQBZQfrwGcLxkMjMxwBsw2xmt9Y/h6FzmrU6F
	 0ZjqNRTkI6Rg+TJYF1b/2WuWDTBE3r+yJ4W2pPJHOMm47jz9rYCm5m2cU1oRlosKNH
	 tGu6ssMH9pV0gwWW/ZS+IlES0Fo/7WSP3xItIpMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F5EF80155;
	Mon, 11 Jul 2022 17:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E61F80256; Mon, 11 Jul 2022 17:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844D5F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844D5F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C8IQ5kT6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A99FB81031;
 Mon, 11 Jul 2022 15:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A27C34115;
 Mon, 11 Jul 2022 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657552732;
 bh=0zUxV5qEJx6VLHEZ+aflwcgyZVTJfLhtlYkIoZub5P8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C8IQ5kT6+icLITxX0TYDs9HoJ76+Ase7saIaFk3xSu2X4Oiwas8KgiVnBB+M0ijKJ
 W/US3VcjUPhnxtzOW2y0DFeJAx0KUDGvKXMGjJuvZD5phLB/U4HKwBUb5TeQcRhmZ6
 /J3cuJyIs6cMNae1a4T/A4PrtTTDi4fmdPXzOxMLFCTBm0QIZ8sqtcNNDAUdPO/6Vd
 d00V2vXK1br2N/tSMd5ROGJbF7hkV8wFYaFTNn5HWM44dpPeBMPJGmhPEPn2uS6pgX
 xrs9mwxW1Fso55UEafdL8hRLiFrpI+1qBUsbVUVYU7+ntnw0gSLXJxBS+URHrpN+Fc
 pm51SCCr0gmpQ==
From: Mark Brown <broonie@kernel.org>
To: Vsujithkumar.Reddy@amd.com, alsa-devel@alsa-project.org
In-Reply-To: <20220707161142.491034-1-Vsujithkumar.Reddy@amd.com>
References: <20220707161142.491034-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v1 0/3] ADD legacy audio driver support for rembrandt
Message-Id: <165755273053.520536.5655983982300282613.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 16:18:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Vijendar.Mukunda@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 7 Jul 2022 21:41:39 +0530, V sujith kumar Reddy wrote:
> Add Generic driver to support multiple platform,
> ADD HS control instance for Rembrandt platform.
> Add nau8825,max98560 and rt5682s,rt1019 combination support for legacy
> platform.
> 
> v0--->v1
> -- Kconfig syntax changes done
> -- robot errors done
> sound/soc/amd/acp/acp-rembrandt.c:264:5: warning: no previous prototype for 'rmb_acp_init' [-Wmissing-prototypes]
> sound/soc/amd/acp/acp-rembrandt.c:264:5: warning: no previous prototype for 'rmb_acp_init' [-Wmissing-prototypes]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Remove rt1019_1 codec conf from machine driver
      commit: ac2606df8a3fb4450240cf0893ff3934b5882c69
[2/3] ASoC: amd: acp: ACP code generic to support newer platforms
      commit: b24484c18b1089f9dd1ef7901b05a85e315e9f41
[3/3] ASoC: amd: acp: Add legacy audio driver support for Rembrandt platform
      commit: e8a33a94078560df73761f6d6147a25bda07605c

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
