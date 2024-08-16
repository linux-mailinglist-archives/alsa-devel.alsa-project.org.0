Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9B954D5F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 17:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C74F42BF8;
	Fri, 16 Aug 2024 17:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C74F42BF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723821089;
	bh=/gWJGAAYEWysus8W/MIeKMY6Sfi3VK0jLdw6jlTOx2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tawsO/ixZYZi7H2KbQb8Oh6B1bq5xA5XKe2DaW80gIVO7SwT0O2+imC4N5qnV3qiY
	 l67pgwJCAYTyn8OfbRngG9XgAkmY/j4DLuY+xXa0lkO8WlRKXl0k+ldHGI4dcCcqPH
	 4RJn63AyC5ty0rFiBX3rT6GAKOhpqtxGkpxu6gnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FEEF80589; Fri, 16 Aug 2024 17:10:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96206F80579;
	Fri, 16 Aug 2024 17:10:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD68EF80423; Fri, 16 Aug 2024 17:10:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8250F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 17:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8250F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oodnuVxp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 60981CE1DF8;
	Fri, 16 Aug 2024 15:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BFEC4AF09;
	Fri, 16 Aug 2024 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723821043;
	bh=/gWJGAAYEWysus8W/MIeKMY6Sfi3VK0jLdw6jlTOx2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oodnuVxpVNOYj+ABas+W/M+19tvVVV+ISJz+iKdFYy9YEApNewhCJ00ZAh/50+lAY
	 tmlAzPJNOXd/hajPrV8kBc5aE7ylNySspFB1d5OYmagTLhQvqcBSREVbW5uDQ0sm3M
	 T+uptJTFkwuZU1aqeVoIu+4VSazi9qIq+SZ3GYgTSUTxiOH8bY3snCfEKEHMIJFkHh
	 3i8mNIQ3Z326OplFFNVWRkFESALBdtGMFKlCoYkLc+0tpdQVoZCCCTc5u63Nj5I4xq
	 MWAzhARvX0JlhmBuK64ydTWVy01WyU6UNLG4i7+IrlKymkyNHNub+uJupS3zgYcV4D
	 iVDcBpYk4tD3A==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 dmitry.baryshkov@linaro.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
References: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct
 clocks on SM8250
Message-Id: <172382104064.70235.8442859739541696689.b4-ty@kernel.org>
Date: Fri, 16 Aug 2024 16:10:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: VYLV32KYF7KUWAESQUDS6WB6G5SWZYFA
X-Message-ID-Hash: VYLV32KYF7KUWAESQUDS6WB6G5SWZYFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYLV32KYF7KUWAESQUDS6WB6G5SWZYFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Aug 2024 17:53:20 +0100, srinivas.kandagatla@linaro.org wrote:
> we seems to have ended up with duplicate clocks for frame-sync on sm8250,
> it has both va and fsgen which are exactly same things. Remove the redundant
> va clock and make it align with other SoCs.
> 
> Codec driver does not even handle va clock, so remove this from the
> bindings and examples to avoid any confusion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250
      commit: d08ea4193a72c5e3090240872ff7ed60a70716e6

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

