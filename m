Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321FD38B8CD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 23:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C336B16BB;
	Thu, 20 May 2021 23:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C336B16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621545020;
	bh=Eyw7AhgeWkNoF/E+yWX1GIGo+7JsMJgP16p5702kNag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdMOlwjxXtH+eR/12Wk5I6i2LydZULCMp0W8jZSrIueET2xo1IvduLtT161vUV9e/
	 rwCi0kBDBsctWXLL1noeQAdnq6Tnidd9wCHQDGrDGrUCCfi/6ezZp1omxMLA/QMvTk
	 qgW446RmGovY7PrOJQWUrr4sioOXgivXgg8G2N0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0ABDF80431;
	Thu, 20 May 2021 23:08:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E8CCF800C1; Thu, 20 May 2021 23:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E296F800C8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 23:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E296F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rPfvq6T9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A2BB613AA;
 Thu, 20 May 2021 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544904;
 bh=Eyw7AhgeWkNoF/E+yWX1GIGo+7JsMJgP16p5702kNag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rPfvq6T9jPHHoLrpAmUCDwr0acOdV+fbT9JwnFC26H23kNSXZVGQCtLF72bnXCKXX
 Ec2OGa0WgM0SrPHyiU5w0Wga1PQBkFqMJX2QUpJhbqJIKxJOaQUxrCtEfvsHb64aZb
 R8iiob0qGqSVsldSx2iUBgkBAKrr2EzLw6T8lr7FwNBdCYkHDNvBl2vmbrTdYOn7pb
 0yz0D2W/VnKjTv7SUqzK4X1nozBRtdeQM8b8lbkV8400Lefg1b9X/8xotOIkw5Bidc
 qf4lC0AadGfUglFxR6RdtedfeuolgSWEd2vc33klIHvebxKUw1gJW9LCA4w0rlQg6B
 Fn3QuC8+u1BwA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Fix using uninitialized pointer
Date: Thu, 20 May 2021 22:08:05 +0100
Message-Id: <162154465459.5161.3767874017058642105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100713.879958-1-jaska.uimonen@linux.intel.com>
References: <20210519100713.879958-1-jaska.uimonen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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

On Wed, 19 May 2021 13:07:13 +0300, Jaska Uimonen wrote:
> The original patch changed kcontrol_type to a pointer. In some goto
> cases the pointer is assigned into a struct member as uninitialized and
> this will cause a runtime error with UBSan even if it isn't a real bug.
> So initialize the pointer to NULL.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix using uninitialized pointer
      commit: b9c035aa43b8c074b3bcfdaaa8bea2537d85b7c3

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
