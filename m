Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01342A8540E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Apr 2025 08:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2821368E4E;
	Fri, 11 Apr 2025 08:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2821368E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744352559;
	bh=uwwzJRyfNXL+Pb3Ntu55xpbTfqnsLWcsMS2/4C8sR9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldsXXsFwEj0n7cDYS+CAtgNI0LYq53JTQq/ugKpB9hJiSuyelNHJquQ7ljntN8wBJ
	 aRKsUoh622+pfAIBCJMjbodXFtC4dk/IpH7FWB5pimMzWTjYLVBSv7VOB/wm57oKf8
	 qG7AqaKACDkMpdifQjkfU9FXA9JjLAv+DwVfSqec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E5CF805BF; Fri, 11 Apr 2025 08:21:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D89F805BA;
	Fri, 11 Apr 2025 08:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09586F8025F; Fri, 11 Apr 2025 08:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28DC5F800E2
	for <alsa-devel@alsa-project.org>; Fri, 11 Apr 2025 08:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DC5F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rKsMFCn2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80D31440E9;
	Fri, 11 Apr 2025 06:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18731C4CEE5;
	Fri, 11 Apr 2025 06:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744352501;
	bh=uwwzJRyfNXL+Pb3Ntu55xpbTfqnsLWcsMS2/4C8sR9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rKsMFCn2k5vXBWmjWgqIe7kPyUtQb8IywjE2Ac9CTEnF9C55TJ+sPU8XRJon6hLG3
	 9/nAVaOkfLqn+1MResUe3oxi+rGAlnIsgMNCVLbcOFqa/KDvLwdFKsRGe4JKEGMJQn
	 uHS2n9pVMPy2mtFS74ASGiEUZz2I6W+sxOwx3ja/RAscwlN/1i4Pd4Cg7xn7+2+pPE
	 IPYbbvHRNlrgmMy9X8HMdyrRAnHIOYdCra/4VAAJk+B8gkvNsGTDoFsjtgIy948qxw
	 QjmolFIm2yd1DwY0kFvu81U99Ss8VhmgwASVorhr8TXTyysPoEHvWkiVxhCBMdLo2b
	 XlZkw1rdBff1w==
From: Mark Brown <broonie@kernel.org>
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, srini@kernel.org
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] MAINTAINERS: update my email address
Message-Id: <174435249981.1315708.17163326951823552256.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 07:21:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: ZK4I22LB2CX5PUVIBS7LLBQ3JW5MX4QB
X-Message-ID-Hash: ZK4I22LB2CX5PUVIBS7LLBQ3JW5MX4QB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZK4I22LB2CX5PUVIBS7LLBQ3JW5MX4QB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 10 Apr 2025 11:37:11 +0100, srinivas.kandagatla@linaro.org wrote:
> Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
> the @linaro.org. Linaro address will stop working in few days.
> 
> Mark or Greg, could you please pick these two patches?
> 
> Srinivas Kandagatla (2):
>   MAINTAINERS: use kernel.org alias
>   mailmap: Add entry for Srinivas Kandagatla
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] MAINTAINERS: use kernel.org alias
      commit: 7f33f247138554b84729688169dfbe87724b70ef
[2/2] mailmap: Add entry for Srinivas Kandagatla
      commit: 807c1c83152138e2fc22101a57b9346159ad4f4c

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

