Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B990B7FE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 19:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 919CA851;
	Mon, 17 Jun 2024 19:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 919CA851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718645229;
	bh=RBQUQZRRgitr539noZdkXKL/kl543yn4dVs2rg+GSnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQsNgdm6nIMGip3Ky+OWETgdiP2MXv0mA6PonsWVzEwp0QAR5euJ/slSug0My2LV3
	 aaysg09KIfKcBsdp20fEsW0Yw4iAxqrBb5/Lsdje+20dXMmgO5oUAzVnpVqJUZYIhh
	 RB7O/WddYDtLKNNHPZTyg99Qp8jSi2q4zJbj9wTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78514F80588; Mon, 17 Jun 2024 19:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC9FF804F2;
	Mon, 17 Jun 2024 19:26:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BEFEF8023A; Mon, 17 Jun 2024 19:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A38BBF80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 19:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A38BBF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mW58t3qi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1680161403;
	Mon, 17 Jun 2024 17:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB861C4AF1C;
	Mon, 17 Jun 2024 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718645194;
	bh=RBQUQZRRgitr539noZdkXKL/kl543yn4dVs2rg+GSnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mW58t3qi4nQG8MAdHJ4d0yYbcoPcHNHvSMWtVPgFcl0mvMoLjGvIHcG2gSTwcKsg5
	 E3KAiK45EvkHosqlgaJ2zkIEPrbhZk2rRQZ/JHIpptOtinJat71ggByGrf60/6s/GN
	 jgb8AvyK6/qL94k0WQA9Kj85WGo4yfyZ1p2eL+nzTgjhySqhoobzqMpJsrKPLYvQJB
	 TS5TOlCctYHkSnkrkfn8k52oDGWwMLCW19PH+RjTLF0/dMwMdUbTOsL8rsq/IPV0YL
	 /ygVUbf37fG3T3LlCsq3YdDu0mDLLa9U1HFoxtXVltbLOO/jFKAsnu5HH/vwOkN2X9
	 O2oVYJSfNDPDg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
In-Reply-To: <20240510175835.286775-1-srinivas.kandagatla@linaro.org>
References: <20240510175835.286775-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: lpass: add support for v2.6 rx macro
Message-Id: <171864519230.209755.2369055216085451531.b4-ty@kernel.org>
Date: Mon, 17 Jun 2024 18:26:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 3THIQBL3MD25LFBOZWBHZAWVI57K7DOA
X-Message-ID-Hash: 3THIQBL3MD25LFBOZWBHZAWVI57K7DOA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3THIQBL3MD25LFBOZWBHZAWVI57K7DOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 May 2024 18:58:33 +0100, srinivas.kandagatla@linaro.org wrote:
> This patchset adds support to reading codec version and also adds
> support for v2.6 codec version in rx macro.
> 
> LPASS 2.6 has changes in some of the rx block which are required to get
> headset functional correctly.
> 
> Tested this on X13s and x1e80100 crd.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-macro: add helpers to get codec version
      commit: 378918d5918116b95300dd7f03913a1d0841f223
[2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6 codec version
      (no commit info)

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

