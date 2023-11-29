Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BAA7FDFBB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 19:53:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCF5AE9;
	Wed, 29 Nov 2023 19:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCF5AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701284010;
	bh=UGgJf+xDm6TeaMGLjtQRriZZTl6p0lxp7AxmrXcux2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GPki0nfCJDsyKwUt46TlEc+LCwSNSYTBQfnjdyhP/pwx8XnV55EKK4XUxTUwmcDOA
	 CYUmGGHL267ZTfom2v4Z03MHqwRMSE82V8WNhkauLQqVThrk4DZlsDEWBzJDw44fw5
	 giRFyRNeXyiPq5yeM64Si4bPQJD8Jry7PZ5Y2xjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C385CF8057D; Wed, 29 Nov 2023 19:53:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 124F5F80246;
	Wed, 29 Nov 2023 19:53:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A84F801D5; Wed, 29 Nov 2023 19:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5A78F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 19:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A78F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zzqe7kj9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FD4D61CAE;
	Wed, 29 Nov 2023 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D82DC433C7;
	Wed, 29 Nov 2023 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283976;
	bh=UGgJf+xDm6TeaMGLjtQRriZZTl6p0lxp7AxmrXcux2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zzqe7kj9oMc7/5iqHUZGIH/2t2lng2nWwIqOejlb2it6VjKIH2QUf4wiZVqVGzrz4
	 7Co0gUNwabPBLVCZq7fVh2OiypyVmtCbhqdp1NzGrfB9hJvlxlxaaqQ1vDXhzwzQVi
	 jPlUR6kQiXHKTXeDAtVIavInxUKwYpUb0YEmmL4iA7bPEjfsNYglh36K0iSfMoVrh9
	 jb3+3LYRgQBpMkkh7nlK73/MIsTFYA6MNbbd7hIqP76XWxQmnQlVopf8FfjEMCYcIH
	 UB16FiHtXaeFUV1QQT93iReMZa/945VmXrqnZ39ij3GU2GLXfaGsN4uBiMO9OLNP3U
	 tzdcpJX7sKCaA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
References: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: check return value of
 snd_sof_ipc_msg_data
Message-Id: <170128397409.290371.3042450357579316139.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:52:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: AXUYZGRLDXDF4D7C7DJXTYQFIPAYPGDE
X-Message-ID-Hash: AXUYZGRLDXDF4D7C7DJXTYQFIPAYPGDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXUYZGRLDXDF4D7C7DJXTYQFIPAYPGDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 14:20:21 +0200, Peter Ujfalusi wrote:
> snd_sof_ipc_msg_data could return error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
      commit: 2bd512626f8ea3957c981cadd2ebf75feff737dd

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

