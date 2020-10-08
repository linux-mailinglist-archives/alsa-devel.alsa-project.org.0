Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C457287E75
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 00:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1A21677;
	Fri,  9 Oct 2020 00:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1A21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602194594;
	bh=fiR6jpKAvDlcokth74nMFsLm8l3QzG9fg+lfdqqOD4Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CANkYzg1Y2litck+4AzTBEhczdo2eCyjw/va7zAqGmBB/s1ilHXAIi3PrANrHqPpK
	 7VBcaaecI2ljBkMJ8O9odfiLcKbTEwQk16X9EhDH8hvKV4Weh2BZxYJ4yb6TuhYlwv
	 2UF0+gRC1K7RzEawwcolAYw7apHuir9qBVvLj42M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9254EF8015B;
	Fri,  9 Oct 2020 00:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 811BFF80164; Fri,  9 Oct 2020 00:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7F6F8015B
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 00:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7F6F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CojQRFLW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43A5322241;
 Thu,  8 Oct 2020 22:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602194485;
 bh=fiR6jpKAvDlcokth74nMFsLm8l3QzG9fg+lfdqqOD4Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CojQRFLWVdbXinCy1JP2G7CodlR/3BJ6j+aJeXx+i9BFE7pYcSFMhiLUOeyPCYcKV
 4X6LMIBiSYRutIUjU7iTBAsSPosQ6nmJEDAgcShgZMrMOHU7ng74jAyqOpATjCn44n
 pv3la8KJfsJZkLTEdRNWS6CDng64ReCbATyBM0fk=
Date: Thu, 08 Oct 2020 23:01:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, lgirdwood@gmail.com
In-Reply-To: <20201008085400.19944-1-peter.ujfalusi@ti.com>
References: <20201008085400.19944-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Use &pdev->dev for early dev_warn
Message-Id: <160219448331.29664.16505115034215869597.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 8 Oct 2020 11:54:00 +0300, Peter Ujfalusi wrote:
> At this point mcasp->dev is not initialized and we would have NULL pointer
> dereference if we would have failed to get the mem memory resource by
> name.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-mcasp: Use &pdev->dev for early dev_warn
      commit: 18096cb0bcff1ebf4459ea5f6dc940d8eaf4b942

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
