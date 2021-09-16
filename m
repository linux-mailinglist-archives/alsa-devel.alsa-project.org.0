Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9B40DDC0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAEB18A1;
	Thu, 16 Sep 2021 17:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAEB18A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805410;
	bh=nisdCjxx8h3smoc19yNYbMFQO1k/T8CrbliHaeUAbaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXx6B0JXHFgitdCYgel4Ub9nn6Q2CtbNQ+lfujce/a/9viADNnvUbCsMIsOxl8wFJ
	 Xfei9/8PUSyMgE9MN1WoMRLZFQpS8IU/Sdjmek3p451mP7vMLKirNBnpFb7KxZKYpu
	 OnCj9PErfHS5h1xgSwBuTBjIoW8/u9S4I4dsScCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DD0F80113;
	Thu, 16 Sep 2021 17:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04340F8027B; Thu, 16 Sep 2021 17:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C7FF80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C7FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tyeGe50n"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F10D6112E;
 Thu, 16 Sep 2021 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805320;
 bh=nisdCjxx8h3smoc19yNYbMFQO1k/T8CrbliHaeUAbaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tyeGe50nEUbpewuTBOCJP4oosBn1Bq+QL6hGL6dKJrG2DaQc6OKL8DS70HAMAuKYt
 J2vvuJIljOjNLus2Tz4SAfww92Ymufy6rTajcER1movniMZ1xkC1sB2INffZmi4AsQ
 PPrMxBNgD4Nz7eijkg9qpmlw9+tt8rvOWpfHzCnNuFaNo69Yn6bOxk+umbNVQCqHJw
 AApVp6l0xJyoqcV13FnV01CjoriHMSGFMF1CAPLOT8h20sLzP1buOlZHqX+ZCt9y9B
 GytohIK0it7RnWkP/YCmAankyp0neJlJPhl+HW2+79qsLvWIPePtUaCNkW7zqLKzk5
 STuPM4+cGZQTg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, David Rhodes <drhodes@opensource.cirrus.com>,
 patches@opensource.cirrus.com, david.rhodes@cirrus.com,
 devicetree@vger.kernel.org, robh@kernel.org, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l41: Binding fixes
Date: Thu, 16 Sep 2021 16:14:29 +0100
Message-Id: <163180495857.19842.15753133396233565359.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915191422.2371623-1-drhodes@opensource.cirrus.com>
References: <20210915191422.2371623-1-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 15 Sep 2021 14:14:22 -0500, David Rhodes wrote:
> Fix warnings and errors in DT bindings
> 
> Add newline at end of file
> Replace 'unevaluatedProperties' with 'additionalProperties'
> Add spi context to DT example
> Add #sound-dai-cells to DT example
> Rename to 'cirrus,cs35l41.yaml'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Binding fixes
      commit: 6116df7fafabbd9b2b09bfd8d568cd5fad656125

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
