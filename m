Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD8281D3B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 22:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AC81ACD;
	Fri,  2 Oct 2020 22:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AC81ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601672338;
	bh=S2pK2zZphyllgyoDUlqH+n0UMNxZEfNf9+OmkuBwScQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vzw0KKm4x8Tvo21i3NDgnO7lW6SNL37isE8qp22zmJpF86ZPYTibgSSHaVAQMkNfX
	 P9MC6hHX0M/bNMu5uG2EmRD9TSwdm/ilX+Els5wjSCpk9SwYvqk03gnhwHs0FlADgD
	 W4h+YwAlyXZc9qo3H/9/8BlxfdbZwEhFj6gffLr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 712A1F802C4;
	Fri,  2 Oct 2020 22:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9699AF8028E; Fri,  2 Oct 2020 22:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00FF9F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 22:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00FF9F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pLwh4XEc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D35E206B6;
 Fri,  2 Oct 2020 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601672274;
 bh=S2pK2zZphyllgyoDUlqH+n0UMNxZEfNf9+OmkuBwScQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pLwh4XEcLHi7PZ5/bow9lhh+VH5AwTBKsvoc37/61s0PqAxj/C1HgTVWOCZQEEzpf
 Mj0Mbm9oluHysFQou+S9mE3O9cDg3boPZDxWDCnMWzjfvplglxho0c+fzaH5RqGv3Z
 9R0kr/jhyDMhOh6ks9fQNHvzbRofwGL7+sA8wAP4=
Date: Fri, 02 Oct 2020 21:56:53 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20201002160305.815523-1-codrin.ciubotariu@microchip.com>
References: <20201002160305.815523-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 0/2] Add driver for Microchip S/PDIF RX
Message-Id: <160167211499.21762.18186234770386677649.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 lgirdwood@gmail.com, ludovic.desroches@microchip.com, robh+dt@kernel.org
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

On Fri, 2 Oct 2020 19:03:03 +0300, Codrin Ciubotariu wrote:
> The Sony/Philips Digital Interface Receiver (SPDIFRX) is a serial port
> compliant with the IEC-60958 standard. Among its caracteristics, we
> mention the following:
>  - SPDIF/AES-EBU Compatible Serial Port
>  - 32 Samples FIFO
>  - Data Width Configurable to 24 bits, 20 bits or 16 bits
>  - Packed and Unpacked Data Support for System Memory Optimization
>  - Line State Events Report and Source of Interrupt
>  - Line Error Rate Report
>  - Full Memory Map of 192 bits for Channel 1 and Channel 2 Status and
>    User Data
>  - First 32-bit Status A, Status B Change Report and Source of Interrupt
>  - Line Digital Filter
>  - Register Write Protection
>  - Abnormal Software Access and Internal Sequencer Integrity Check Reports
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: add DT bindings for Microchip S/PDIF RX Controller
      commit: 80db8751d7c0bebe11e62df19cec9cb0a392c354
[2/2] ASoC: mchp-spdifrx: add driver for SPDIF RX
      commit: ef265c55c1ac0f02c74a33d8e054547f7eafc81b

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
