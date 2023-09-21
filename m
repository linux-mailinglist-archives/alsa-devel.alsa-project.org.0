Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910C7A95C4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7059E80;
	Thu, 21 Sep 2023 18:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7059E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695314031;
	bh=U/Zpy09xGZYBvYhAIlFMFYCy2eQr+xmCS2IBKe0Kbog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MHQPlzaYU8jWlBqsnYK4t5zYu7n0KaMt/WBVB3rHG8ukNkFKrehXNiaCZP4IKYdr0
	 VzJh1nEjOeKZxzF/iXYHRrcD05LYXoEbPcQdkCfXsp4t7NN77eMPj1pZyA3HjRpfkA
	 maywpCanSgV8i0s67G+aTfAOCeq/slhYAvtGnQJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 684D3F805FA; Thu, 21 Sep 2023 18:30:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8129AF805AA;
	Thu, 21 Sep 2023 18:30:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50AFBF805C1; Thu, 21 Sep 2023 18:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86487F80578
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86487F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CJhEp3DO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CF6FCCE2296;
	Thu, 21 Sep 2023 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F058C611A8;
	Thu, 21 Sep 2023 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313827;
	bh=U/Zpy09xGZYBvYhAIlFMFYCy2eQr+xmCS2IBKe0Kbog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CJhEp3DOz3TedSmggezCG7O3OtNw5egllNb5RAQMiv+2UyYtyoF6Z2FLNOoHQUyMd
	 P97zJTKl7C60pcz1ziifL2gWaoA6F2Bb7GXWQNlVzudcTNjiotW7gi0Z4enVORVwKF
	 667vSAekPYtHhIcJHYYsoVWy+97/EcAiM04wPG3awPF6ave0QP+HaRHl0m6hSJFjck
	 n1a7cPOadD+Vs2KQR3VSlYZWtgdyRGRo2OyQaaDtoZ4iV4+63eib7YJScuAYLvRkUz
	 oxNIABgThcD0IJl/56UQpbWU3+zWttvE1uPCgcgC8EzPYTvAPsXk311Br15WKj9LQ5
	 vnAaoCCvSjy7g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
References: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4-control: Support for Switch and
 Enum controls
Message-Id: <169531382513.61074.5963579709090530013.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: VKGFMCRWUG7KEH5JHER33SBDQDCJRNHG
X-Message-ID-Hash: VKGFMCRWUG7KEH5JHER33SBDQDCJRNHG
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKGFMCRWUG7KEH5JHER33SBDQDCJRNHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 13:31:12 +0300, Peter Ujfalusi wrote:
> Currently IPC4 has no notion of a switch or enum type of control which is a
> generic concept in ALSA.
> 
> The generic support for these control types will be as follows:
> 
> - large config is used to send the channel-value par array
> - param_id of a SWITCH type is 200
> - param_id of an ENUM type is 201
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc4-topology: Add definition for generic switch/enum control
      commit: 060a07cd9bc69eba2da33ed96b1fa69ead60bab1
[2/3] ASoC: SOF: ipc4-control: Add support for ALSA switch control
      commit: 4a2fd607b7ca6128ee3532161505da7624197f55
[3/3] ASoC: SOF: ipc4-control: Add support for ALSA enum control
      commit: 07a866a41982c896dc46476f57d209a200602946

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

