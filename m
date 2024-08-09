Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4094CB96
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 09:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D61EB6;
	Fri,  9 Aug 2024 09:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D61EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723189420;
	bh=MKkruNKNh4Cg9ReIgGScwKqxFuJeRLtS5G6RkOok3Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dnrNmIVlF9dbCIYOPpohi8vt2UMUSAi9j/4YmlBjSJA2WQFP7hjGJpQPuAbDum3Z3
	 Liqu41yphQcjxNnuU1Q2c4BaH5MrVcLdlahVWm69k8C5Cfxv9u+uyPjrGZffA/dUnM
	 sMsL3R5Pv2bXStMau+YX318dn/87BOzktzftegNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 255A8F805EE; Fri,  9 Aug 2024 09:42:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B2B3F805C7;
	Fri,  9 Aug 2024 09:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257D9F8047C; Fri,  9 Aug 2024 09:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00CE1F800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 09:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CE1F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QEFpYwQv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8992161645;
	Fri,  9 Aug 2024 07:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99EC4AF17;
	Fri,  9 Aug 2024 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723188837;
	bh=MKkruNKNh4Cg9ReIgGScwKqxFuJeRLtS5G6RkOok3Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEFpYwQvYQ1L0WYxxq/s7qQXEI3q25gBMZFmlCKbsg281NUSyb15H0qlzisr/Ibz2
	 s2TWdXvOIrkwrMEafegpg1b1d7ogihi3hbJgV+bSQ6BD2MLUAk4EFRw9UJ310umgZ5
	 /ZLBHNOA4huDgkWcPCk6gHKLe3gq6+ojGJO/KcW3YVZZ1J5geYaLebAMiY5gfmcxuP
	 7s9dB1VNxnamt1sWz7fonCis3KAj1mLPn7hbDKLy+VlaSaPbh9jgbva+MhRe8Pyyoa
	 Xkxdvbnq61eeVmG8jrZpQf/NFYJ2shUuVjpJi9q1K4+UHNfWHXHNzlKPTrBDYgJbOS
	 SJlzuCTObHwfA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
References: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: warn on unknown codec version
Message-Id: <172318883316.484675.7690867442520809785.b4-ty@kernel.org>
Date: Fri, 09 Aug 2024 08:33:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3GRJMZHTCPRN2HOPCFLDOXATEJCS52Q5
X-Message-ID-Hash: 3GRJMZHTCPRN2HOPCFLDOXATEJCS52Q5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GRJMZHTCPRN2HOPCFLDOXATEJCS52Q5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 03 Aug 2024 13:41:39 +0300, Dmitry Baryshkov wrote:
> While debugging broken audio issues on some of Qualcomm platforms I
> stumbled upon the kernel not providing the actual error information.
> It prints an error from the wsa_macro driver, but the actual issue is in
> the VA macro driver. Add error message to point to the actual error
> location.
> 
> va_macro 3370000.codec: Unknown VA Codec version, ID: 00 / 0f / 00
> wsa_macro 3240000.codec: Unsupported Codec version (0)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-macro: fix version strings returned for 1.x codecs
      commit: 49f6202ce991742f451fc724f03d0c17460d06cd
[2/2] ASoC: codecs: lpass-va-macro: warn on unknown version
      commit: a9a7a2d80790d06cd32c535e2e7b10f72ce592e7

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

