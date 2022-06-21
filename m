Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EC553858
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 19:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56103201F;
	Tue, 21 Jun 2022 19:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56103201F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655830874;
	bh=hhDgR9+5NL1h5Gv282n4ttBsZNpOmbxBkFIjUMRxL+Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMLMRnK+Qo5IWJIkPz7sbI+96pXD/lf9ay7xFnoNC0BqOHYanfyABeIwoKZd91kPJ
	 GBY00gNzPVZO0AOGuD9p+q8ywC5dUV8Hw6WJZpMttympW9EMBXDPvVBz3cV/bizPwt
	 5nGeJN1akaTjpVVx/H9nJ0NgZMAqOPT2GRMWXpUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 500A9F80538;
	Tue, 21 Jun 2022 18:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B77F9F80539; Tue, 21 Jun 2022 18:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FF0EF80253
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF0EF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gei6u/KB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2CC8614EF;
 Tue, 21 Jun 2022 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520A7C341C0;
 Tue, 21 Jun 2022 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655830769;
 bh=hhDgR9+5NL1h5Gv282n4ttBsZNpOmbxBkFIjUMRxL+Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Gei6u/KBmvx7ON01tCim3cOTmP0WwDaYDUALfpz1QqZTIUyLnYwaY/ZlGTSg1GJ6b
 vzR0ZLGagImXNmzFayhD/yQ/xOXvKmgRsvqD6KP1GErzAGcUUMKH679xxbmEbWFa2x
 8Rw3D6w9aKj/sI+HPMuc/ULk6/+35G0/PG+JPRKG6bHLrf7W319InFMtVp9QqZsbOX
 c2rzhvVzCapXQRrWgf/AMga9pqOudDB113q+gIVT16E4i08cRrL7/ohVAzrzcInAm2
 U3nSYf4waXrbcW7Gv4j4ODARisPiCqOregm4OaeHIIw/1WaInKE09HiqrKfzLcWFxB
 MrGagKjHA4Kpg==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20220621090719.30558-1-shumingf@realtek.com>
References: <20220621090719.30558-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt711-sdca: fix kernel NULL pointer dereference
 when IO error
Message-Id: <165583076705.271995.16679730452918183093.b4-ty@kernel.org>
Date: Tue, 21 Jun 2022 17:59:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Vijendar.Mukunda@amd.com,
 flove@realtek.com
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

On Tue, 21 Jun 2022 17:07:19 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The initial settings will be written before the codec probe function.
> But, the rt711->component doesn't be assigned yet.
> If IO error happened during initial settings operations, it will cause the kernel panic.
> This patch changed component->dev to slave->dev to fix this issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: fix kernel NULL pointer dereference when IO error
      commit: f69a10f84cb5ff0b1c6aef0e19e866bbe53ec7ea

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
