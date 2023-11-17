Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82C7EF66F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:44:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0C6DF1;
	Fri, 17 Nov 2023 17:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0C6DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239478;
	bh=0YO3W1z2caIL7bIq90ttl4T3ywvbM+YloArMTAnEaxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=smQcpKg4KefGSOQvd57HG/IU8J/STKAB0R5w0UiNNdViSJ83Xpf1SJ/Nm0Ee7IrWH
	 0y/S2fnkTb6R8/aeAT4NC65L3zkOrQgSyOOlQkQs9BraR+suA/arzi2TGj/fi8QPL7
	 9fSM2E9A8qrBqu3SCtbsmGHKznXMSXA8iUQYvMBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A9B2F8058C; Fri, 17 Nov 2023 17:42:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D250AF80580;
	Fri, 17 Nov 2023 17:42:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F030F80571; Fri, 17 Nov 2023 17:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C9E0F80558
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C9E0F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mz6s4cXi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03CA161DC7;
	Fri, 17 Nov 2023 16:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400B0C433C8;
	Fri, 17 Nov 2023 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700239357;
	bh=0YO3W1z2caIL7bIq90ttl4T3ywvbM+YloArMTAnEaxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mz6s4cXinGnAZ+ilnphcYBrJqFdAtJ/lw0ZuBJYZNN9co6pIjsm6jTNi3/jnU7x9w
	 ww8hOKh0A+mLjU5Fxznd93aRh+d/5L++/CHWVidqgvzlMZYyXB5Oq0S5/IeVjLwQyk
	 kqNk16Vm+8SjXyddUpDYjbpXATkk32a0EPMid2cCOJBeWs/4CnqBAtZxOeC+xw/0GE
	 4vnz5tEbsCWujVvZREFVCyNFwnDasEz/wUqwYUN1eu9MYW/b9sALmLeXI5gGaaU+LN
	 94KVvDkYXaloq7X1UlWn7lXiLhjaJy+lLwu4/eSnZYTi6YnaAzblVxSiX0IHnWLjZc
	 xbdjxa73df7OQ==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20231117043011.1747594-1-CTLIN0@nuvoton.com>
References: <20231117043011.1747594-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8822: Fix incorrect type in assignment and
 cast to restricted __be16
Message-Id: <170023935469.1567036.15285427485660372538.b4-ty@kernel.org>
Date: Fri, 17 Nov 2023 16:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: Y4CSETD7F4RVQBTRZA7RS5MTS4A7K54G
X-Message-ID-Hash: Y4CSETD7F4RVQBTRZA7RS5MTS4A7K54G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4CSETD7F4RVQBTRZA7RS5MTS4A7K54G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Nov 2023 12:30:12 +0800, David Lin wrote:
> This issue is reproduced when W=1 build in compiler gcc-12.
> The following are sparse warnings:
> 
> sound/soc/codecs/nau8822.c:199:25: sparse: sparse: incorrect type in assignment
> sound/soc/codecs/nau8822.c:199:25: sparse: expected unsigned short
> sound/soc/codecs/nau8822.c:199:25: sparse: got restricted __be16
> sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
> sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
> sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
> sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
      commit: c1501f2597dd08601acd42256a4b0a0fc36bf302

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

