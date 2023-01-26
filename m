Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7967C1AD
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0F3826;
	Thu, 26 Jan 2023 01:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0F3826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693078;
	bh=3Gl7E6jxTJB4ZcRekvn84sIy4EUd9X3kKt/L9R5RoHY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Et9bgbQMwE0t1FeDj+mfRcR155UE1iQLL6FbSFAcSLJsuxcs11mmOjtFhqgCwrzZZ
	 emccXVVuZxdDul8+xKYoKIEiTZtzx4Y+jMU/NxjKlIHnXvLC9idmYs+9kJuQ7wMlV/
	 5BAJkTpb/jpkxPPhaGS9W7iWzCt30RM04lTyfy14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E263F8055A;
	Thu, 26 Jan 2023 01:29:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AB03F8055B; Thu, 26 Jan 2023 01:29:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFB7FF80551
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB7FF80551
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l3+9Yz5W
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 821FE616B5;
 Thu, 26 Jan 2023 00:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52879C43446;
 Thu, 26 Jan 2023 00:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692944;
 bh=3Gl7E6jxTJB4ZcRekvn84sIy4EUd9X3kKt/L9R5RoHY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l3+9Yz5WREv4TJsO3Ykp8x5ZEKcEgVPsZ6z4HVH1Z1xwLRJU51Ljq8kwLPYZP7+fE
 aYqBkKye3roMOfsPQg7ktKddWjIjgXFlPIOdDMxzg2YDAlbUyuv3ihE5ZeP+Xvyw5E
 TgdzkK27hi7If8h6WADZ5otACPoWlE1K0UJz+RY6lO9dwLios7V6gE0amfj8zbCgOL
 FFaNhzbrRAMw82iKEk1WHtQbiZ6AgpaQ5CWCZbEVJEYJ4s0n83U/qabDi/+qAiJT/g
 wtOXGhOHzech6qkjaZ/nDxTHD2nL81kRnoDwYcCoC1RsxbaH7zDdtwnwB5zFd71kse
 SFyb/aGoMtpqg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org, 
 lgirdwood@gmail.com, Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20221208084200.2136311-1-judyhsiao@chromium.org>
References: <20221208084200.2136311-1-judyhsiao@chromium.org>
Subject: Re: [PATCH v1] ASoC: qcom: lpass-platform: Use
 SNDRV_DMA_TYPE_NONCOHERENT page allocation
Message-Id: <167469294198.2696228.16654878670798627815.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:29:01 +0000
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 Banajit Goswami <bgoswami@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 08 Dec 2022 08:42:00 +0000, Judy Hsiao wrote:
> Replace SNDRV_DMA_TYPE_DEV by SNDRV_DMA_TYPE_NONCOHERENT for pcm
> buffer allocation. We measured about 18x performance improvement
> when accessing the snd_pcm_mmap() buffer from userspace.
> 
> Eg: aarch64 with internal speaker
> ==
> SNDRV_DMA_TYPE_DEV
>     frames_per_second=66.4557M/s
>     max_time_per_4096_frames=106.094u
>     time_per_4096_frames=61.6351us
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-platform: Use SNDRV_DMA_TYPE_NONCOHERENT page allocation
      commit: 01270f905eea786f418cbc2040f7a52b969ef377

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

