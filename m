Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AE43BA5C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF8616F4;
	Tue, 26 Oct 2021 21:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF8616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635275325;
	bh=DBEx9t2CB+8MmSY7UjuuCdmlBwQL3CUhnAaUE+XYyRQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cU6jWc/4z18oTCOrZ006hIQ8tcYfZv4ACUxo3k9YVSgZRjAX7ROV4Kp8hCcq3jVTb
	 P0xmhiIDeCElyNeEPsq11Kimpvk6yJSs+c5dXlp3puiYs71ngmJxkKD3aGv7PuXd+2
	 +tyiwYYJjh+ZQ9tKaquic5lUuThYWuQdWQoWOY7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E7EF804FB;
	Tue, 26 Oct 2021 21:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06BC8F804E7; Tue, 26 Oct 2021 21:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1744FF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1744FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A60IOoRM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68A45610A1;
 Tue, 26 Oct 2021 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275212;
 bh=DBEx9t2CB+8MmSY7UjuuCdmlBwQL3CUhnAaUE+XYyRQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=A60IOoRMMZGy3t3QJ/KgLxG6B68GkrknhmQv60RG9RzcnPF+kGVJLYBZNyaJAbIP7
 mH0xmyBZ0YOwFw3zFWEbeZ0AfMbrWdViwtX2wIJ/j88Gwlf8J0u+TzDP3JhYn/szgM
 D6UX937++toP4t4hWIUfesB5c4t/p80Akjnh3NaPMrXCmRi/WhpmawY3qsNsGTQxpf
 Wl94+wQBPcbmaCaMJl2t9Ul3CyX5E2bBfqXRWVOgRCZYuK5pUCw7F3DV4syn6UL1Nt
 a5QirX7LtfktYZO3DMw3ITf2tg1Suyn4sSUbnRHiDFcfhz3hLAisSLF+w/IddH3uUL
 nZwANVZMl/Kpg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org, judyhsiao@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, plai@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, tiwai@suse.com,
 swboyd@chromium.org, srinivas.kandagatla@linaro.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, perex@perex.cz
In-Reply-To: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
References: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 0/5] Update Lpass digital codec macro drivers
Message-Id: <163527520915.2033755.14378859701858526354.b4-ty@kernel.org>
Date: Tue, 26 Oct 2021 20:06:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 26 Oct 2021 13:13:03 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for lpass sc7280 based targets.
> Upadate compatible name and change of bulk clock voting to optional
> clock voting in digital codecs va, rx, tx macro drivers.
> 
> Changes Since V3:
>     -- Removed fixes tag.
>     -- Change signedoff by sequence.
> Changes Since V2:
>     -- Add Tx macro deafults for lpass sc7280
> Changes Since V1:
>     -- Removed individual clock voting and used bulk clock optional.
>     -- Removed volatile changes and fixed default values.
>     -- Typo errors.
> Srinivasa Rao Mandadapu (5):
>   ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
>     sc7280
>   ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
>     codecs
>   ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
>   ASoC: codecs: tx-macro: Update tx default values
>   ASoC: codecs: Change bulk clock voting to optional voting in digital
>     codecs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for sc7280
      commit: 9d8c69814d7d8abf299998dd1d3f4a0b595cddca
[2/5] ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital codecs
      commit: 6e3b196e5ad2e4cd23498935ba32cecedae53642
[3/5] ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
      commit: 864b9b5856ae74a350933782399934bdde5df989
[4/5] ASoC: codecs: tx-macro: Update tx default values
      commit: 7b285c74e422d35b02349650a62d32f8ec78f51d
[5/5] ASoC: codecs: Change bulk clock voting to optional voting in digital codecs
      commit: 9f589cf0f91485c8591775acad056c80378a2d34

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
