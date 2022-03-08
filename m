Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D314D1F01
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6327918BE;
	Tue,  8 Mar 2022 18:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6327918BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760316;
	bh=wSgfdJeBnQuD5Tw0f9riM3mLX4grfj+Fq6bUvc86P64=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhNjeUzEx+RYCr5CEWujxQ95xoeRCXsCQkxtjUe3R5EUIO323mol5kZuarLJzTVIa
	 9pmsFu5VwxWg6PmQ58h9Dp8a+hjXhoh1YLTr7P/vKLEH6fEFN2LoEM3ZBnZM35qXf5
	 GDbYhaQ0Pk38lpGpFFFVfJDX8NVpy7JwJpOUI9MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3A0F8052F;
	Tue,  8 Mar 2022 18:21:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E98EF8052F; Tue,  8 Mar 2022 18:21:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4708F8052F
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4708F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OCeTIOQh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 977C160F89;
 Tue,  8 Mar 2022 17:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA83DC340EF;
 Tue,  8 Mar 2022 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760058;
 bh=wSgfdJeBnQuD5Tw0f9riM3mLX4grfj+Fq6bUvc86P64=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OCeTIOQh9qpUvmWZfWOIAHCl07UBaqndWDIed2WZLKCEj6mM+IAu2/OlhJ/IH590C
 LpcWjyKkTwoDt7u2nBbe4ZeBMRTANTgGV3HkoH+vLArzFNOfSs+rNX8Qz0Numr2JkT
 b/LWAdoFLatB4+ZAoUxXHipZX1Y5Lo69Xx6xu/ebiAwlUu6JGnRABEBqF5epD0APUm
 8txfRgGU+zsu+02WBuxVu8dxvE3QozWxKbKaXI6nWMDN8gepdgRtDcbqk9dsE//RC4
 5eEtaNCoEjamqaakfjzWwRcbp3LiqKstoY++yeAfDkS64QrlH2MnLi/AA4FBnQglrp
 TK9zbhdiwpTBg==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20220307033056.11463-1-jiaxin.yu@mediatek.com>
References: <20220307033056.11463-1-jiaxin.yu@mediatek.com>
Subject: Re: [v2] ASoC: mediatek: mt8183: support wb bt audio
Message-Id: <164676005561.54315.8574406268011125156.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 7 Mar 2022 11:30:56 +0800, Jiaxin Yu wrote:
> Use "bt-sco-pcm-wb" codec dai driver for wb bt audio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: support wb bt audio
      commit: 5ea14bf62ef4501c13f56fce75f6752cf643748f

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
