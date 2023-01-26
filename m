Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0D67D2C7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 18:10:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E61E82;
	Thu, 26 Jan 2023 18:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E61E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674753058;
	bh=YQHLBU7Aivmn9WcnpQM380Yt0zjC5w1aDhENH54PYoM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJJj9L/yc/v8hqT2BUvhlPQgJ33xAkFBPwf3kWgAw4p8xLCYSXTV0pVMONc6HSmAV
	 Hb4hnV6FyhS0Lqio/ygsVV2LxsVe9yWCZa+qtogY8WGTOVsXkvqTWRWWTr+3rDVklP
	 GlWVC7hobIWoKk4s2NtUROJCXim9f+Tyd41DmAwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FD9F804D2;
	Thu, 26 Jan 2023 18:09:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096F9F802DF; Thu, 26 Jan 2023 18:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FBF8F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 18:09:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FBF8F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r+e7VK9G
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FD02B81EB3;
 Thu, 26 Jan 2023 17:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661DDC433EF;
 Thu, 26 Jan 2023 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674752990;
 bh=YQHLBU7Aivmn9WcnpQM380Yt0zjC5w1aDhENH54PYoM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=r+e7VK9GhAWdoai6a4dQ+hIx/vGneah7AOXGXBJJsLAX8gnP+7gSJ/J2PumsnF8BT
 mrQxqzbtj/bUwSeCizoBGXqEzizrhsr5Sno/lJElFpgw7FIEi9LbBVotgadNYZdnUl
 fiNMXhAYhQWBMeoU7CPJBaZxv7nhwxZbEHwWAbKTS7E4fAUUFow1IFffpzUF8A86oC
 YX+LHOWrOk+etv6P1z0G3+ltRSl4huGNuFutDcaKPe2GbdvmSXD8AUXA3e+S2Dy+sf
 tBqDmckx5txXlmHhL0Ntqvag9YRoyU0DS5U4lU5eHuvZ+U8Q+Z7K+hzsWoLum9C6Iz
 +bYmAVabkDmpw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, agross@kernel.org, 
 andersson@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, 
 quic_plai@quicinc.com, bgoswami@quicinc.com, srinivas.kandagatla@linaro.org, 
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 swboyd@chromium.org, judyhsiao@chromium.org, devicetree@vger.kernel.org, 
 konrad.dybcio@linaro.org, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
In-Reply-To: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
References: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v3 0/2] Update lpass dt-bindings
Message-Id: <167475298607.4003145.11363897170835254190.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 17:09:46 +0000
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 15:43:20 +0530, Srinivasa Rao Mandadapu wrote:
> Update va-macro driver dt-bindings and add missing properties in sc7280
> machine driver dt-bindings.
> 
> Changes since v2:
>     -- Update commit message and example in "Add platform property" patch.
>     -- Update commit message in "Update clock name" patch.
> Changes since v1:
>     -- Remove sound-dai cells property patch.
>     -- Update example in clock name change patch.
>     -- Update commit message and add maxItems in platform proerty patch.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: dt-bindings: lpass-va-macro: Update clock name
      commit: 7a35498982e84e4d39e8c259f251dfa588f0f039
[2/2] ASoC: dt-bindings: google,sc7280-herobrine: Add platform property
      commit: ec9009724027b6599ee79a8ac6c97de442ad6f6d

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

