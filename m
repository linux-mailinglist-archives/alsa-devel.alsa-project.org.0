Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF68451AB5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97EBE1689;
	Tue, 16 Nov 2021 00:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97EBE1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019569;
	bh=/i1ppCc2i7+tsF2CovjUzUtrnyP5QUyPtkBbVkKtfnA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPpQnww+kz37vVwSD6s7b1EVe4HHiSYh/GSlNTDeq1jWgEbHw3QfRJ/ds26Kvqi/7
	 sx5OCYS9Vr0v8sIcc6oZj8K/Qub4LLnoZnK1nIEtLYvbYZ+ARTBlwHUmjPkZuQV5En
	 FD1cLSb6XEVRtLoXe+Oiy62+mbtYf2waaVjNKo4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE313F80525;
	Tue, 16 Nov 2021 00:35:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D43EDF80507; Tue, 16 Nov 2021 00:35:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE6CFF804EC
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6CFF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tjt1k4N/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D0C861B2A;
 Mon, 15 Nov 2021 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019316;
 bh=/i1ppCc2i7+tsF2CovjUzUtrnyP5QUyPtkBbVkKtfnA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tjt1k4N/MzsgGFUe1f5DoqujbzQG4fF5KSsegolZ13kRWMBlfyhNBCjVD+YKaRqKY
 mEBYeG9OLNmwPJLPz93CsQNw1mZgZxnWiv0JqS+SMrZmJdiPyhiNWm8Dp2ImRdTRiB
 TemLWlUxOJqDVMXq9ZbskY0sBL2URe+vdyGJM4GPO+0WVEH9FSRlFBvka/wya0HXEk
 bDOdnzHnCUFWe9NDFibB6xUuCUXEjmcLGPC7TmJdYl8eeQ8K7L5loZTe+orLdJq4M/
 I9/XHLLbiAcZKBbyB7bsSwRsLsia1MBgS9Hqi5jDd1jINJTfxk2AOTv41+pLp4b+8G
 x/7HiQCcEd9yQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20211115120215.56824-1-simont@opensource.cirrus.com>
References: <20211115120215.56824-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: tidy includes in cs_dsp.c and cs_dsp.h
Message-Id: <163701931525.675370.12192297791993296544.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:35:15 +0000
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

On Mon, 15 Nov 2021 12:02:15 +0000, Simon Trimmer wrote:
> This patch removes unused included header files and moves others into
> cs_dsp.h to ensure that types referenced in the header file are properly
> described to prevent compiler warnings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: tidy includes in cs_dsp.c and cs_dsp.h
      commit: 749303055b78bc38ec0790ccc596cae235446367

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
