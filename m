Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F824F297D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D7C1801;
	Tue,  5 Apr 2022 11:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D7C1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151262;
	bh=wy56N3GzvYwz3j65YfFa+VXSzdPu9MSFvDzmV75JFcI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1UABfnVl3Yh7BHwZuPcOj/3TggdhDFsTRPzxqj+/bXak7LUVEKZSj8dnboxB2a2z
	 IErL5blMjuoA++jCyYZ0UC4UIiNyDjQ8w40FB3RZoA8N+4ENZG+XVa/Nggnj5N9sbQ
	 sPti2OOzQRDNDbYG0sTH+Q6Q4oRy22woXjD99CzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD31EF80538;
	Tue,  5 Apr 2022 11:31:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA54F80538; Tue,  5 Apr 2022 11:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D591F80529
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D591F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Uw9NTNC/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42DA2B81CBA;
 Tue,  5 Apr 2022 09:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46064C385A4;
 Tue,  5 Apr 2022 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151080;
 bh=wy56N3GzvYwz3j65YfFa+VXSzdPu9MSFvDzmV75JFcI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Uw9NTNC//zeTxqHZTEt4wLakcW6Vca5oWrRklfwR41ipRkQD1LKGG7M4UAp02aGd3
 cGdIRa5b6cTKewezf1I9Y0medT9WnPanu8PiTQrk/VtC8ATTFt2pgz4CKGS+gmCrxM
 Csd12UL4VZTJELkoUiw6KDb4RA7pg8OBIRMN9nRmS/3H8yytd6dRUyFxSqtYL9gWCo
 h54HRHwAW7L/Pyb3SY1v50Ct+V2TteZDEZbbTQOaIGpOT3HadOvZHRQ+N7N/3yvG8B
 lGDalUeSuET+N3cxZfsnuSZyLtEc4eG6tT9Vzy6iGmDDrONkzbSDC/FgOL01D8Pz6f
 2NDkk0PylUgrw==
From: Mark Brown <broonie@kernel.org>
To: xiam0nd.tong@gmail.com, oder_chiou@realtek.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz
In-Reply-To: <20220327081002.12684-1-xiam0nd.tong@gmail.com>
References: <20220327081002.12684-1-xiam0nd.tong@gmail.com>
Subject: Re: [PATCH] codecs: rt5682: fix an incorrect NULL check on list
 iterator
Message-Id: <164915107801.276574.16249779388452959492.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, derek.fang@realtek.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Sun, 27 Mar 2022 16:10:02 +0800, Xiaomeng Tong wrote:
> The bug is here:
> 	if (!dai) {
> 
> The list iterator value 'dai' will *always* be set and non-NULL
> by for_each_component_dais(), so it is incorrect to assume that
> the iterator value will be NULL if the list is empty or no element
> is found (In fact, it will be a bogus pointer to an invalid struct
> object containing the HEAD). Otherwise it will bypass the check
> 'if (!dai) {' (never call dev_err() and never return -ENODEV;)
> and lead to invalid memory access lately when calling
> 'rt5682_set_bclk1_ratio(dai, factor);'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] codecs: rt5682: fix an incorrect NULL check on list iterator
      commit: c8618d65007ba68d7891130642d73e89372101e8

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
