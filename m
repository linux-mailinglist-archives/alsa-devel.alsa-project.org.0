Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CE313DD3
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:42:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E2D168C;
	Mon,  8 Feb 2021 19:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E2D168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809778;
	bh=E4dVr+ba/8pFyDzHXiNkLmJYvxNx/LW8NoDwcK0pMdA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7bi5JWJQ+zNIJwPPGikV+o2ky6ZtguvrYI0ywkJYD6fJsOPQ8bcYclbcC/04Jm+Y
	 UR6mx2N2KwhOMl8Ezh21CQY+BQSvfGgJ1z1jTw7S5T9GwwaTcBuZY94VXgpoM/6VoT
	 o65TD7UfSzXj9WeP9NxxPV9P47lFA5asyvYonB0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 053CAF8032C;
	Mon,  8 Feb 2021 19:39:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7491AF8032B; Mon,  8 Feb 2021 19:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A0A7F802DB
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A0A7F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PTU9OX4v"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31C0764E6F;
 Mon,  8 Feb 2021 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809576;
 bh=E4dVr+ba/8pFyDzHXiNkLmJYvxNx/LW8NoDwcK0pMdA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=PTU9OX4vVNfvZpgSBApuHncY1cXfM7CCqFi8jb7Nour5cpaziZVa7cN+CnHhtqiLk
 RJNFqrmWrp1is7FRVHyDMRHh8rr77jnEBoRfEBoKgLrWK+OMkxbr7KHiKUQqxl0D2/
 9mjfoZhoterAXtdTgRE66funU3378eY8Xhje5tDLLa+mlEhx3BSnYarvBKHHDXXL5T
 Bcu5KdVbWpaZgxUiZN6Xm4MUW7T29JMuUoci2q6O5Tdz5YSiNY7iijt+RDUjPDgKUG
 jtekqMJDsQzD09/bzLWYX3yM5rGd2FBrWB7NXxXBTLDT+0aTfThHdGcbszoVya4DkJ
 K37kKc4jIkJfw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20210208103857.75705-1-hui.wang@canonical.com>
References: <20210208103857.75705-1-hui.wang@canonical.com>
Subject: Re: [PATCH v2] ASoC: SOF: debug: Fix a potential issue on string
 buffer termination
Message-Id: <161280948305.10741.11899846666720938987.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 8 Feb 2021 18:38:57 +0800, Hui Wang wrote:
> The function simple_write_to_buffer() doesn't add string termination
> at the end of buf, we need to handle it on our own. This change refers
> to the function tokenize_input() in debug.c and the function
> sof_dfsentry_trace_filter_write() in trace.c.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: debug: Fix a potential issue on string buffer termination
      commit: 9037c3bde65d339017ef41d81cb58069ffc321d4

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
