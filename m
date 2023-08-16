Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8177E62E
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69CA542;
	Wed, 16 Aug 2023 18:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69CA542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692202674;
	bh=4AtNaz4In+27Ls6CAbhyQLYN6uzA/dL12VczE8ckqko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fWJNAg2xxA7MCbNOYa+PB6W7XofiU40MvKudrwyUwpEli3VC3SN/EMvJ33DXab/2t
	 W1RTTbQD+BKqnEVhD7nA3gcA2S448vGIFg4WHF/oUpaHSoLm/n8HRl35bFD8qQ7l69
	 y/Y+mJl+nSl7am4BHHH5lTcMsWfU3t3mmDELK3aA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C6DF80272; Wed, 16 Aug 2023 18:16:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8537CF8016A;
	Wed, 16 Aug 2023 18:16:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 361EEF8016D; Wed, 16 Aug 2023 18:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4483CF80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4483CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hF62KICV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C02E611DF;
	Wed, 16 Aug 2023 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F312C433C7;
	Wed, 16 Aug 2023 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692202590;
	bh=4AtNaz4In+27Ls6CAbhyQLYN6uzA/dL12VczE8ckqko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hF62KICVR39YuyE93xo/Jk/2f3/OYfb1q21A4dQvnPnlq7pnhzxE92GxknVW+zzTU
	 FZ/HG346g1ChvAsqCffXD1HWFva2TK4U9euD9akYHPPXMh3QU+sIn7uMHGQzmWuKB2
	 CJmzxpuvp6vnKxJMvFiu1S1MZSOkg5M6t+Ifa7oF+oz8Wb+OlkpaTMPs00qz62dspZ
	 Xbl2NpPYQaFelmDjAsyurCKFRmusH9wGa+OjIcFStNs9URYZh8vOC6aogruQYIep6d
	 HooqAXZ0Pwv9nGH8ZaBS761wjufeZLTHW90HttB4px67d4lfbg8Kz9Tktkg0mYVGcW
	 85V5jyLylnQ8w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, chao.song@linux.intel.com
In-Reply-To: <20230816133311.7523-1-peter.ujfalusi@linux.intel.com>
References: <20230816133311.7523-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-pcm: fix possible null pointer
 deference
Message-Id: <169220258811.817217.17022540458057559719.b4-ty@kernel.org>
Date: Wed, 16 Aug 2023 17:16:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: JI2IRJJHQBQUYLDJWPE6FQ7LNSXYOPHZ
X-Message-ID-Hash: JI2IRJJHQBQUYLDJWPE6FQ7LNSXYOPHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JI2IRJJHQBQUYLDJWPE6FQ7LNSXYOPHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 16 Aug 2023 16:33:11 +0300, Peter Ujfalusi wrote:
> The call to snd_sof_find_spcm_dai() could return NULL,
> add nullable check for the return value to avoid null
> pointer defenrece.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-pcm: fix possible null pointer deference
      commit: 2d218b45848b92b03b220bf4d9bef29f058f866f

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

