Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE463C070
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:55:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1353216CF;
	Tue, 29 Nov 2022 13:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1353216CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669726547;
	bh=FS3QMf7lGbiy4UrDmdlvwB6d5Iy1+qNxQTClB3jGvBA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+92nVUaJKHTNoxODEmLuNCuTKRRu0GsvYG5JZmfzSzQcUvgCxNanyhMRa5hy4ici
	 sUETXW2dfZmwGCluLg6EynUcU3jdmV3wcyGSwqvxEcuuSsS6ujY71i31I6K0R+rSBc
	 9gce+k7wr6glsMcoghnLJT+MnD57xswfhnwemizs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B9FF80224;
	Tue, 29 Nov 2022 13:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81769F802DF; Tue, 29 Nov 2022 13:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B2D5F801F5
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 13:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B2D5F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TLFeYOvd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDEE6B8162B;
 Tue, 29 Nov 2022 12:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C65C433D6;
 Tue, 29 Nov 2022 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669726482;
 bh=FS3QMf7lGbiy4UrDmdlvwB6d5Iy1+qNxQTClB3jGvBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TLFeYOvdBP12WjyOSZBULkQkjnpnWzKTTq25ud8FgBgKtEUGeL4eAWOxEvpci+wjo
 fcuXABsBOBx+MF++qNA4Tmlk0/Gx9tjy48hVyOTdxiSqF8xEx9kkE9W4tP6T4PZy9C
 kkLkQPhSR8BQEBlomqtAx41bO1Ot9F5pkm8KfTF4YKmwFoIxaQaH/1xaNopcF0WWaH
 LwmbqOE4NisLSJI9TzS3HJbFKrE/Vitqkqy7K1fgK2sHZWPgeP2/YigaX4DB1pbcoh
 VT96A5ZGdluT9Q/LQNVb5UkXGGdiT8jN5Glcd8H8Xv1ghJghlQSWgsv7gE+C0IsxN6
 KgzBmqEX5g9ZA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221129001633.v2.1.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
References: <20221129001633.v2.1.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-sc7180: Delete redundant error log
 from _resume()
Message-Id: <166972648016.69085.432837268858452614.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 12:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

On Tue, 29 Nov 2022 00:16:54 +0000, Matthias Kaehlcke wrote:
> sc7180_lpass_dev_resume() logs an error if clk_bulk_prepare_enable()
> fails. The clock framework already generates error logs if anything
> goes wrong, so the logging in _resume() is redundant, drop it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Delete redundant error log from _resume()
      commit: 863b9179cee4570e5da4206dcf8dbcdcc37c8348

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
