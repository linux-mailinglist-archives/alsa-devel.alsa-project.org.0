Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A77D535E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 15:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8720857;
	Tue, 24 Oct 2023 15:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8720857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698155798;
	bh=ZwRGvdK1vLRyYCBNB8H0GmRZoD2LA6Gw+YOD+d7uvu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NVXKqzY+tt5geDiQw3QxNBjTyXvwQ893wQpxbI/8Ij7R+o/vX2DFIeN35iEhhI2Ua
	 QyxcXBFM5b3bJqy1vQj3oFLV9B0pUk7ndk3aP4O1YlBkJI87pzRtlwZxIpAyy7SPcb
	 nHdl3SKmMFjid5ouYN40h8NGePM2KlDF2VBTR4V4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 429B3F80165; Tue, 24 Oct 2023 15:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86AB8F8019B;
	Tue, 24 Oct 2023 15:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73757F80224; Tue, 24 Oct 2023 15:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FDB5F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 15:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDB5F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NxD9Ggy+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A30B8B82487;
	Tue, 24 Oct 2023 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB6BC433D9;
	Tue, 24 Oct 2023 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155712;
	bh=ZwRGvdK1vLRyYCBNB8H0GmRZoD2LA6Gw+YOD+d7uvu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NxD9Ggy+9A7RNU1Bjgd9K1z8hWPbQi879G28Ip41uwiWe84uVlCmqllbF9PsZlh0d
	 G2rydM2Pm8bPxq1DGXAswrBQZaiBbtD2nUQOq/dVx5Pe+M5aMmb3ce+hLcuhcpm99n
	 IBA6YnK4LsJEuNRmBOYuEghoNzNXPErkIBxjHaPUOHv1v7qVBy0MthbcJ1+gwhZ8TN
	 h9yAceinSkCQwzwPw8MHnSgTlhdJXuXwl97QknJRHl8UEhqKYWOP4McA0UZK58HDoH
	 g4kDqFM2pCzLdXK7VuOeMRZCRt9fIJak9Q0FPTgpZp7THk5I2meWR09NCmKYrks+Ee
	 5AhaJ8ROchJgQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Zhang Shurong <zhang_shurong@foxmail.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
References: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
Subject: Re: [PATCH v2] ASoC: fsl: Fix PM disable depth imbalance in
 fsl_easrc_probe
Message-Id: <169815570943.69390.931793622764684694.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:55:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: QKFISSQZ5467XFHS4W6LVLV3IVTUZ43R
X-Message-ID-Hash: QKFISSQZ5467XFHS4W6LVLV3IVTUZ43R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKFISSQZ5467XFHS4W6LVLV3IVTUZ43R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Oct 2023 21:03:15 +0800, Zhang Shurong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
      commit: 9e630efb5a4af56fdb15aa10405f5cfd3f5f5b83

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

