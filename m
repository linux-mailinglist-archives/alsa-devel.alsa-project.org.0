Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5C85E27B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 17:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8C874C;
	Wed, 21 Feb 2024 17:03:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8C874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708531439;
	bh=9fJX9oO0DGcUweTUdjv0zxo4kkH5IB9QrIr5JPgthHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UiUCxWPtSovTKrXWBjTrypfX+mWVdWuNsTClnW5fcHaN6z7I5KRaE/lhNI95izHWT
	 JBkyWaSVMq/UTsbh7TdLqCv9SekbX9PXdl2d86QQwkWWzhY5tfCyDdNNG5W2EGKXX+
	 iNfXh05nKc7vSgT+dTLD29iPRHDF7dCIKGF9Y4Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AFFF804CC; Wed, 21 Feb 2024 17:03:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E432F80578;
	Wed, 21 Feb 2024 17:03:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19F26F80496; Wed, 21 Feb 2024 17:03:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AF83F800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 17:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AF83F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pXKV4C4/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 729A2CE1E75;
	Wed, 21 Feb 2024 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2C8C43394;
	Wed, 21 Feb 2024 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708531377;
	bh=9fJX9oO0DGcUweTUdjv0zxo4kkH5IB9QrIr5JPgthHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pXKV4C4/Z6bGtoSgNen3zLm43KFCgUokA3jbBRFCTHGJyzEyqu9KsXR6uIPPJS5s4
	 7WPR+dOTn1cC57QOy9m1vVwn8jTo/NAnlIWbUdMfMZQo4LuiQ5vpOL+QzjOJf7YHHw
	 hZKHAdgOcZzszBRFQ0utz5PybEg+dQ8PRliweOsQwV/lmJlGkiaj2dRcwDbPAY3TeO
	 GjjhfvblX9gkBcZXa2mJCrMbojgsCnnzsKrPdH0rOu3FDlFKyzK0/fk/Ff3fj1SnKo
	 iI+uSV44VCnWMaGhSxzl87b/yS7yZYhamNpMGLQixB9gJJzM9cbWCBhpa9n3uxYVDW
	 6bHIOctxbhvIQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240221134804.3475989-1-colin.i.king@gmail.com>
References: <20240221134804.3475989-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix uninitialized pointer dmactl
Message-Id: <170853137427.40410.4918124750403655559.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 16:02:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 3NJO2STIW6LWHXKATQZJUXKYGT37QAEF
X-Message-ID-Hash: 3NJO2STIW6LWHXKATQZJUXKYGT37QAEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NJO2STIW6LWHXKATQZJUXKYGT37QAEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 13:48:04 +0000, Colin Ian King wrote:
> In the case where __lpass_get_dmactl_handle is called and the driver
> id dai_id is invalid the pointer dmactl is not being assigned a value,
> and dmactl contains a garbage value since it has not been initialized
> and so the null check may not work. Fix this to initialize dmactl to
> NULL. One could argue that modern compilers will set this to zero, but
> it is useful to keep this initialized as per the same way in functions
> __lpass_platform_codec_intf_init and lpass_cdc_dma_daiops_hw_params.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix uninitialized pointer dmactl
      commit: 1382d8b55129875b2e07c4d2a7ebc790183769ee

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

