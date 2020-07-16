Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A8222F9E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE8D1669;
	Fri, 17 Jul 2020 02:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE8D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944230;
	bh=0KEn9GGodMAd0GZ7nJ9P9iUYKaDti52GK2guzJb/P4w=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKIdQ3H7Gl8pPIb+K/NEUHI+0PRsHGJU6HDhwZpwQjYKNFKDhv6R21bfPyh0xssbh
	 cvZc8nM7l+P0a4zNADeKW+cTxF2jeIZvc8+zjyWbXGkvi9NffjfEWL5E3RaUXpz9BS
	 TuJ99eWPuSTgCzf/GBrnBOGQkwBz0ulLt46fesnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA45F80316;
	Fri, 17 Jul 2020 01:57:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3394DF80315; Fri, 17 Jul 2020 01:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 732EAF80307
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732EAF80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XAIocMRK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EB922076D;
 Thu, 16 Jul 2020 23:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943862;
 bh=0KEn9GGodMAd0GZ7nJ9P9iUYKaDti52GK2guzJb/P4w=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XAIocMRK2IbotWianyYDXpavaPbno1JrNsGdRieeU6p/nLKKp8TYjuaPvzd8Jmwid
 Fl6z5R/ElUHBtrvDsmRq9ov6ZJKonxNpOsCHQTNWXB/41cfytpBn0nuwCLqEesKOSY
 efn3YpQdcJvpe+uPIEP0XSfH7W768BnAPDHbpn4E=
Date: Fri, 17 Jul 2020 00:57:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, lgirdwood@gmail.com
In-Reply-To: <20200715094447.3170843-1-lee.jones@linaro.org>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling of
 'exists'
Message-Id: <159494380521.42174.11701175343660094863.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 15 Jul 2020 10:44:47 +0100, Lee Jones wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling of 'exists'
      commit: 1b58214113481616b74ee4d196e5b1cb683758ee

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
