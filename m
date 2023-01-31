Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DF682F55
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AEA1F2;
	Tue, 31 Jan 2023 15:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AEA1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175630;
	bh=Tn+0ChE4NWLr1lne+v5CorulaUB++qNmFcq2U3U5Ub8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ivuRa63bi1u9Ldj3cC9tIk3u9/irHmtAlfWglHDsI/0TXKxDJnqNKn4RDv2YkDuBj
	 fT3iYbRzbvHtDGmyuIGzeec+jV67ezNtLQKQ7C3Kh18ejqe/eV9o3ZUxEa4nLzhcj6
	 f9Rwm08WWgIWwULsci4H1v7sIqwWkTa0zjO7sEfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09913F80169;
	Tue, 31 Jan 2023 15:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81749F80519; Tue, 31 Jan 2023 15:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26FB8F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26FB8F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bSqK5/QU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBFE4B81D1D;
 Tue, 31 Jan 2023 14:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DBCC433EF;
 Tue, 31 Jan 2023 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175549;
 bh=Tn+0ChE4NWLr1lne+v5CorulaUB++qNmFcq2U3U5Ub8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bSqK5/QUylC2NfQKLm6W2zyDrtNpfgRQVv+wpXzzthJFkJansSzrblzel+BFf86CC
 AogqKKfdpjztGW6ufG4Ql0aumbeRcT+3wZIDLWPrpAjBfJw1exlOcJp1f+iBv7P6sj
 PRyMvlCxSvzj4Yuplej+0Hb2V14PtmsSs1SzTPGBG2MpfxiruguOpYO5Ohu5COoWvE
 Kzx73gM8da5qkaXRfRtbf6LQOdBQakHsN4STNd7V3TGm8JVWpPjlQHjlQta/MewQmT
 btLDzqztOaajuV2EuHjxikIh2eNLjvmyoUu1ZvDgqekVXxlynWkWdBNsCGcbUfIVOR
 /ZkkJCp3xIsmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH 0/8] ASoC: mchp-spdifrx: add runtime PM support and fixes
Message-Id: <167517554751.691025.3083822887476196230.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 30 Jan 2023 14:06:39 +0200, Claudiu Beznea wrote:
> This series adds runtime PM support for Microchip SPDIFRX driver.
> Along with it I added few fixes identified while going though the code
> and playing with Microchip SPDIFRX controller.
> 
> Thank you,
> Claudiu Beznea
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: mchp-spdifrx: fix controls which rely on rsr register
      commit: fa09fa60385abbf99342494b280da8b4aebbc0e9
[2/8] ASoC: mchp-spdifrx: fix return value in case completion times out
      commit: a4c4161d6eae3ef5f486d1638ef452d9bc1376b0
[3/8] ASoC: mchp-spdifrx: fix controls that works with completion mechanism
      commit: d3681df44e856aab523a6eb7ba15b5e41efcbb1c
[4/8] ASoC: mchp-spdifrx: disable all interrupts in mchp_spdifrx_dai_remove()
      commit: aaecdc32b7e35b4f9b457fb3509414aa9a932589
[5/8] ASoC: mchp-spdifrx: use unsigned long to store clk_get_rate() value
      commit: 36187a67ab931eae8b7d13d80fccd097971b7bac
[6/8] ASoC: mchp-spdifrx: remove struct mchp_spdifrx_dev::fmt member
      commit: ddce4aeccacb6f575cbfad623da5f0deb2592baf
[7/8] ASoC: mchp-spdifrx: add runtime pm support
      commit: c7db2a59438959bc881bc5722abf0d0a38681c2b
[8/8] ASoC: mchp-spdifrx: document data structures
      commit: 514d7f9df3f409cbb0ad59e726b4923d83251e4f

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

