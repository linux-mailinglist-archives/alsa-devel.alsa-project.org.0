Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B10299B00
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:47:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9BB16C5;
	Tue, 27 Oct 2020 00:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9BB16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756077;
	bh=k1zrWp9O22qh+WuKS8rpiY1h0T+j/FYSrPVkMy4dspw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=InetBPEb8XxD5mS6R8khQexLeYNngzPeUD56xVYrzFPNOthPopz1nrLhCuOsgxZGs
	 JzVl3Mt7UNjf8dhl2vyf/ydxgT/lEbyXr+OPzBnQmCaWk9Vmrgfh7wgjGnJ+RDtggO
	 ePk6itfG2+MdDxMBl7hhvvFPO9vozNi+Q0eJLhM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B6DF804B3;
	Tue, 27 Oct 2020 00:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB48F8028B; Tue, 27 Oct 2020 00:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31FF4F80272
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FF4F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="myP7uDKx"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4A1820809;
 Mon, 26 Oct 2020 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755938;
 bh=k1zrWp9O22qh+WuKS8rpiY1h0T+j/FYSrPVkMy4dspw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=myP7uDKxoFHaZTQufI/w7gt5mGhd5IKADw2XCX+IEerj7nZ6LmVRP0QYc5oOU89nl
 hL998deP4S1ZUAOpVX/yhkmvkFqwBtcfD7Y035+MLEvDZRXceuggABVPKLXMSJYZx5
 Ijh8i+fMGeqmfavLlPxtAugRsKSgYgaG81pLgsOk=
Date: Mon, 26 Oct 2020 23:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: mark.rutland@arm.com, lgirdwood@gmail.com, robh@kernel.org, perex@perex.cz,
 tiwai@suse.com, alexandre.torgue@st.com,
 Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20201009141051.27365-1-olivier.moysan@st.com>
References: <20201009141051.27365-1-olivier.moysan@st.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: stm32: convert sai to json-schema
Message-Id: <160375592347.31132.11608590385209657603.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 9 Oct 2020 16:10:51 +0200, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: convert sai to json-schema
      commit: 49491418c1dceb11ccb2ab841e4e5590e844378c

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
