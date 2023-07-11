Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F305D74F945
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 22:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8962FC9;
	Tue, 11 Jul 2023 22:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8962FC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689108362;
	bh=WvLzSisJq2oRKTEyDbk28Gk5dGNC5kCY3InHxU+5L/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JySL5jgSPfu9HvESBuCOtrgmCCBKzilhJYYKlsdJXwz76+g6d9VYONq1x2FBv3VmX
	 VCJ5/ZRbncSX1nd/ZZOFDe/a7ONhEXbBxBP1F37lpDkY9huqcku99/pq8JzQYPMyo0
	 grPbjj1J+5eDd10rhaADAQcZjROKb7eAOSOqoCbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2CA3F8055A; Tue, 11 Jul 2023 22:44:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 663B2F8053B;
	Tue, 11 Jul 2023 22:44:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4573F8024E; Tue, 11 Jul 2023 22:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08B86F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 22:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B86F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WRE9flHX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1C3361627;
	Tue, 11 Jul 2023 20:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0F5C433C7;
	Tue, 11 Jul 2023 20:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689108251;
	bh=WvLzSisJq2oRKTEyDbk28Gk5dGNC5kCY3InHxU+5L/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WRE9flHX5D5Wxpf4PQ+f0TqDt7ibqwU0d/x0UIW8QpB6EnSuVLgDLXnG3XR2h7I/0
	 YPOKEdR+f7hXXcUpjGjg82DVktk35wohrU2XStSuOwfvsAKAN4jpXrUr09VJc70TiV
	 h6ieUp4xnEOqrl9uBxFNrkAQg6Pptz4bfIvvrhFw/LLiDU3SqR/fBELEegCi8ery5J
	 DQuO2eXbKV0PrHxShYQBLfcc1W5KH+L4QRGwk8C7oFMx7Z2w7YochMdL60kIK8uiZD
	 GrfGwvvoOItVUXaJFbXA2WlfIi5oTsEvqZJuAspfeS5a7Z1se+32KEuEZICF9boUVy
	 l+CA/1mzPdNSg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20230705131842.41584-1-srinivas.kandagatla@linaro.org>
References: <20230705131842.41584-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6apm: do not close GPR port before
 closing graph
Message-Id: <168910824948.478364.14308031274089171698.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 21:44:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 7VCOWHWGQFA6CZ4IODUHV7DEX5QDWOCD
X-Message-ID-Hash: 7VCOWHWGQFA6CZ4IODUHV7DEX5QDWOCD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 14:18:42 +0100, Srinivas Kandagatla wrote:
> Closing GPR port before graph close can result in un handled notifications
> from DSP, this results in spam of errors from GPR driver as there is no
> one to handle these notification at that point in time.
> 
> Fix this by closing GPR port after graph close is finished.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6apm: do not close GPR port before closing graph
      commit: c1be62923d4d86e7c06b1224626e27eb8d9ab32e

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

