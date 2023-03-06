Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAC66ABFCE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 13:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6369D10F9;
	Mon,  6 Mar 2023 13:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6369D10F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678106806;
	bh=EGjzYm/2z9uZZ81Lj/ba0nqcUILcwbFpoY2UUdEuutQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jthtip2C/G/crEskabun/GqErwi+/7x+xwSRj09Y7jIvLgJyjzLfbhjh+k8ov5G3t
	 4qFW6HUE0B3MQIjpp0sqbiblrm+VSpezvPx08w+oTdbW0kPbTi06ayq4/oVxpBxY1C
	 644MlZJo2fv3tmMsQt1HJ6Z+lCNnrAqBn3wCCSmU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A88F80236;
	Mon,  6 Mar 2023 13:45:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AABF5F80431; Mon,  6 Mar 2023 13:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BB77F800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 13:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB77F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yr2jKpZh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63A4460EBA;
	Mon,  6 Mar 2023 12:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035FBC433EF;
	Mon,  6 Mar 2023 12:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678106739;
	bh=EGjzYm/2z9uZZ81Lj/ba0nqcUILcwbFpoY2UUdEuutQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yr2jKpZh1Mm3riFN5T+mPtgoGwPNflrFnIE12B3moTH2rx+lCRohi3TVA6LJjfGBn
	 ZQ81PLMF/+uwb/DoT/NohHAmTAE28Um+/ETw1ddPB33UiOTRtpKNm1U1GIdj0ygo8T
	 g8FkYO5dO2NULQJQSU8e1h09Lstt12X68nUY1iXAY84xzx3WMYGm96SGqQrnSozbFy
	 FFyGvESMRh2AKmfeuWqM7i7vGlrSQL0qCcXkS/gTUuQsJhF8cNIaGvpkuRJ6s2yqWi
	 nODCin57ymqOsUDAdI7feD2+mqIr/x+Jq2FDIrMRvGqpUeWBCxgbf8vb5Mu9PPT7FO
	 5Zo686MX5bTKw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302122908.221398-1-krzysztof.kozlowski@linaro.org>
References: <20230302122908.221398-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6prm: fix incorrect clk_root passed to
 ADSP
Message-Id: <167810673773.45838.18351424183553686686.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 12:45:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: E6CRPPFHOZCIF43LQ63CYZWQACHGHJX5
X-Message-ID-Hash: E6CRPPFHOZCIF43LQ63CYZWQACHGHJX5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6CRPPFHOZCIF43LQ63CYZWQACHGHJX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 02 Mar 2023 13:29:08 +0100, Krzysztof Kozlowski wrote:
> The second to last argument is clk_root (root of the clock), however the
> code called q6prm_request_lpass_clock() with clk_attr instead
> (copy-paste error).  This effectively was passing value of 1 as root
> clock which worked on some of the SoCs (e.g. SM8450) but fails on
> others, depending on the ADSP.  For example on SM8550 this "1" as root
> clock is not accepted and results in errors coming from ADSP.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6prm: fix incorrect clk_root passed to ADSP
      commit: 65882134bc622a1e57bd5928ac588855ea2e3ddd

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

