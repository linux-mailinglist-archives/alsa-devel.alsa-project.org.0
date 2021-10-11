Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EC429520
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77AC16AC;
	Mon, 11 Oct 2021 19:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77AC16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971796;
	bh=rR6CIAETTiB8Hp3alrmbSApBUZ88acp+fwGwfCq2aV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2GHlySHiZIjuzl7XWgX7R0lW7iHplr/hz4IaenACRV4Ok2HFoN0pKFgWUs3qDbX0
	 PZQif4RMbI9w0l3MKX4W1NSnHbl+R0g+pn8dpV8aPmiVFXhRh3zWPMUOj+iznEE2g/
	 MSHoDO5n0a2nlC1CgLtUm31D8a/EkOTQAEZ2AqBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD78F8028D;
	Mon, 11 Oct 2021 19:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8A2F800C0; Mon, 11 Oct 2021 19:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B256FF800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B256FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GetKfUMk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48D9D60F6E;
 Mon, 11 Oct 2021 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971710;
 bh=rR6CIAETTiB8Hp3alrmbSApBUZ88acp+fwGwfCq2aV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GetKfUMkkiIXaBgv6CLGF6DId08Ovq7eNrCn6zbBqtmvm5ZAXb4duhsWcRSYRGXsm
 /oQegYd3GItZ/h/1SSn+rtlTCaYhWOY2vWkz+H9kn0LA/FwD+ZAjyJ2gIYNmulOoC7
 nfT0NCe/hjPc+y/rsFO3ZzWroEFXj83gnEUPL92igrktkgYdU/U7K1AgKcK8qE0OH+
 YXhTYf/s7LggSCV4PBTPwSrGeJT8ROLIl7MOLc8JkEVqe/yIWrwtn0JPd2PTziQ0t+
 +um1SEZHMu6g6aKn96wgbJe4vBUaAAFPM9AjqwJMAwYJ1X/gdnIQ8js4J57LUTUdPL
 bTW/xTMT61Unw==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>,
	robh+dt@kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Date: Mon, 11 Oct 2021 18:01:39 +0100
Message-Id: <163397094547.6567.10438692721309572798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914091204.2204278-1-tzungbi@google.com>
References: <20210914091204.2204278-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

On Tue, 14 Sep 2021 17:12:04 +0800, Tzung-Bi Shih wrote:
> The document was merged as commit 1afc60e00de3 ("dt-bindings:
> mediatek: mt8192: add audio afe document").
> 
> However, [1] revealed that the commit 1afc60e00de3 breaks
> dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
> exist.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe document
      commit: c861af7861aac72075046e9932c606c8cfe64427

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
