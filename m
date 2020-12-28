Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87692E6603
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:08:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69208173A;
	Mon, 28 Dec 2020 17:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69208173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609171698;
	bh=YgrGkHMfAyZKwQEyxTmWs0kIk58KqReA72MzIZ4Uem0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hz7jju4rmcVChcah50qYsDgTG7l3DbtRnhF6KZPeLzvOxTzEgtOAq17tXNuR+TNEg
	 VF1xWNouUG9GPzLJFdio6qv9mqTGfNkHBvjlfdvo4ctPkj2b+cJvJTbMOumEZ72jI2
	 yuGw4pKvdBApk7GmeEhij48MtiWVuut/APmJUcBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A7AF8014E;
	Mon, 28 Dec 2020 17:06:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2176EF8020B; Mon, 28 Dec 2020 17:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9146DF8014E
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9146DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P7mxp10g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B2F82074A;
 Mon, 28 Dec 2020 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171595;
 bh=YgrGkHMfAyZKwQEyxTmWs0kIk58KqReA72MzIZ4Uem0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=P7mxp10gFK9ETne0zeAuKlPLkV9uc0dy3Tr8lcR+++3mvNZBmforWcRMxYbjJ6MkG
 1sQ5dl5jHXrqd8gw68ObZVJON/Azy0POjqbX824Utdk89Z6pQQO/dpnoIBeyRguMNm
 RQWC1qybkiVl9s5UwBtxAHP/kCAE3qGbREmBFagbLqhVyL5fzFovuBf1TP9wgXgcVd
 3opp7esGBYtigPYuA808irMuE8m6RryIGhhFHtdNMVBjwjNuomBanu5xx8IVqnL4CR
 nqZSeMu6ur7W5JEWg4KhFkjx9R420JHS+iiyaR9/18Fure8J5RaEnft/KIjDT9CbKg
 gLTc9uo5UJqkg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
References: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Message-Id: <160917143256.51553.10440161736126371527.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:03:52 +0000
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

On Tue, 8 Dec 2020 12:26:37 +0200, Andy Shevchenko wrote:
> Since we got list_entry_is_head() helper in the generic header,
> we may switch catpt to use it. It removes the need in additional variable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] catpt: Switch to use list_entry_is_head() helper
      commit: a9830fc388817c90282925694474fae005fec990

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
