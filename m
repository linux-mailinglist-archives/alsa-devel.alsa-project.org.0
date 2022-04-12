Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E84FE91D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 21:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C00185F;
	Tue, 12 Apr 2022 21:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C00185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649793098;
	bh=IRI4XQzYsqIKVLc2NQrdZWqO6svmByi3NwsEZjTI4Ec=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qM+lupHzJkJmJH2g15tcGJU7sa3or1Vy9WHPt2PzM57fZArRZmoAcpP21tjnixGWt
	 sJVB+GUC3qTxlsiA7twKtCE8i/+Q2b1HlTz6VH9T/+iguaxv6T1YkaZE8RbK5klKa0
	 sj25gZooyNhGYdpYaHg0r3broAttel0Q4GB3b5J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DC0F80154;
	Tue, 12 Apr 2022 21:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E984F80095; Tue, 12 Apr 2022 21:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7E4F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 21:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7E4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ryqm5rbZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29E91B81FF6;
 Tue, 12 Apr 2022 19:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F43C385A8;
 Tue, 12 Apr 2022 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649793031;
 bh=IRI4XQzYsqIKVLc2NQrdZWqO6svmByi3NwsEZjTI4Ec=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ryqm5rbZis+FFXwbyX/l4pcJVazcSof7fjiTGpUNx23iA53Mz/FjEhu47CoObzWTv
 C/R2VleP0rYfA4s1i1quH0zWaDOabVflye42WXNSpra/ycdPdSYhpOJCK8B9eBf9DH
 4vC5gQ8nIXJqrv/nvbs6klhOOe2gN38v9tOz2XY9kvb28MpJfDNcHGWcMqqGNCM/aZ
 Nu9/DRNV8TssvpsdJqYO/sJAJwzaXyyFvdaMEmv701gRA7CgNhr9eLPrCVDsDYcBaw
 U4nfnw8o6+FpsOI/8yvGxRaRUNBn89T4H7AKNxvBspH2JgEjUiDVJdq7DP7r35jc/2
 a+ppXOb2mO1PQ==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220412163927.1303470-1-rf@opensource.cirrus.com>
References: <20220412163927.1303470-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Fix overrun of unterminated control
 name string
Message-Id: <164979303081.449327.16793414512968400823.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 20:50:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, 12 Apr 2022 17:39:27 +0100, Richard Fitzgerald wrote:
> For wmfw format v2 and later the coefficient name strings have a length
> field and are NOT null-terminated. Use kasprintf() to convert the
> unterminated string into a null-terminated string in an allocated buffer.
> 
> The previous code handled this duplication incorrectly using kmemdup()
> and getting the length from a strlen() of the (unterminated) source string.
> This resulted in creating a string that continued up to the next byte in
> the firmware file that just happened to be 0x00.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Fix overrun of unterminated control name string
      commit: 5b933c7262c5b0ea11ea3c3b3ea81add04895954

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
