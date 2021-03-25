Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC1349871
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:40:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1A41684;
	Thu, 25 Mar 2021 18:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1A41684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616694057;
	bh=1g0ymfKKeil9RN/uPQNtw7qS+3W7ggqGXapUCg0NkV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/R+r2bpOwl3LF6+iFsmsythUH7PyuyVlcu6c/+2NMubiNEnm9LEuzmWGcaeN0dTm
	 wYt5N6vcBRl7ZfPff6xv2W0GIo0NoaRyUBDzuiG9mzlVd0Bw5EJoEubLF61fUHh7fb
	 fH283wnVILzabxKVP1+5dukqxhnbSgob2Z/XZbaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D2BF804AF;
	Thu, 25 Mar 2021 18:37:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A80CF80430; Thu, 25 Mar 2021 18:37:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E050F8026D
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E050F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kEfGfakW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13DA461A2C;
 Thu, 25 Mar 2021 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693861;
 bh=1g0ymfKKeil9RN/uPQNtw7qS+3W7ggqGXapUCg0NkV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kEfGfakWKp7ciHKy0udBHqlqmjlANfUTku7KpJ/sgEjH7iUge9hHR/C+qRjvIDnY9
 begDphefk0w0XugDXIJZPxUUce3tMuf5GPtrJqmB+YKqbs9jHxNHApLimYsOnvBJsG
 nh5mdvLe7JSKmb5PiRcpdrJBN8zSlK0m4pk9uPQHZXKNgNIskyPfzDOoDvLnOrkCtn
 jRJhYwEvfhwTaSoY9RzO1AxgKIMN7/1DP6Rs+dqV4Naw8pWN2lC266o7kqULO6BtpT
 qM8/+Dpi+QH+GVK/4H2zZwg9zXbqwnY4ipIBECN2S5O5FyO0u+1bleZp/zGhN4s/FZ
 +rCyuY2Sv/qyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, festevam@gmail.com, Xiubo.Lee@gmail.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 robh+dt@kernel.org
Subject: Re: [PATCH v5 0/6] Add audio driver base on rpmsg on i.MX platform
Date: Thu, 25 Mar 2021 17:37:08 +0000
Message-Id: <161669370551.41585.13939031002896940550.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Fri, 12 Mar 2021 10:38:39 +0800, Shengjiu Wang wrote:
> On Asymmetric multiprocessor, there is Cortex-A core and Cortex-M core,
> Linux is running on A core, RTOS is running on M core.
> The audio hardware device can be controlled by Cortex-M device,
> So audio playback/capture can be handled by M core.
> 
> Rpmsg is the interface for sending and receiving msg to and from M
> core, that we can create a virtual sound on Cortex-A core side.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: soc-component: Add snd_soc_pcm_component_ack
      commit: 8bdfc0455e3a59e2c1207a56be22e910fae0e0d5
[2/6] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg
      commit: b73d9e6225e86492f6a901223a34ecfa7b55c178
[3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for rpmsg audio device
      commit: 49c6bf62498344fa8f8af2314231f3eb37e0e150
[4/6] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio channel
      commit: 1935050de0b6c6c961e9de51d5b5d05642f861f1
[5/6] ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg
      commit: 3c00eceb2a5391ed1ca6703b71cad35ab8cd4352
[6/6] ASoC: imx-rpmsg: Add machine driver for audio base on rpmsg
      commit: 39f8405c3e502e7b9d0533fa0b0bfe715b3e89c1

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
