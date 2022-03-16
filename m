Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AB4DB97A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B511765;
	Wed, 16 Mar 2022 21:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B511765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463049;
	bh=ftssrwglpKKVQfdsgq1xKuGibUN8q6X5uF9Eg6Rr1qs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1i1ORKMV8xs/mk4kcSWv8V9bEVS+PGjlfrg5D7dwZGBWx17UKgDR8oqfbOUCQC2J
	 s/uvrr6JvmYtP+Ssnn//ayrOYrRyq58OfblD2xvhf+YaJQxrOIIqS99J21/LhSYVXc
	 FVvoAecknMCjoUdY9itKfw/DUjL4CUaQ5vZ5U0LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D17F801F5;
	Wed, 16 Mar 2022 21:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A77F80515; Wed, 16 Mar 2022 21:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D42A0F801F5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D42A0F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UIV6sxB3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AA13B81D42;
 Wed, 16 Mar 2022 20:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E6CC340EC;
 Wed, 16 Mar 2022 20:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462943;
 bh=ftssrwglpKKVQfdsgq1xKuGibUN8q6X5uF9Eg6Rr1qs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UIV6sxB3RgWdIC/J02qcht7N50hr0GeSgxzIKXEuhX1tCV7N1fyrLlxlpS44GotSO
 Y55kydz5IQhtbPA/aD9ZAVgN6j9f6dYbgfo5HDjIziySBAL9Q6ZEDBMvZkZgXmaKmk
 rz2inRtSs1df4rM8BhIxypEfsae7/JPM4TLVOMbGcbf7ZURNZkKOJFCqUvU7hHvQMl
 sWZ31qrMHFAOeknf8t7I42AKpKNT1HBE4ZqHqaHPIzfl03MC4z6NTJly7uAVP6LBGi
 rJp9Y9wJ8tmaApGUiv295RmE+1P2Qbadyb/E2JdHdw00c78F3Y4O/s892ljDA9OKuE
 EiEfn+40w8Arw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220315023226.2118354-1-chi.minghao@zte.com.cn>
References: <20220315023226.2118354-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: ak4642: Use of_device_get_match_data()
Message-Id: <164746294144.1220201.15254830524209110436.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 alsa-devel@alsa-project.org, Minghao Chi <chi.minghao@zte.com.cn>,
 lgirdwood@gmail.com
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

On Tue, 15 Mar 2022 02:32:26 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4642: Use of_device_get_match_data()
      commit: 835ca59799f5c60b4b54bdc7aa785c99552f63e4

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
