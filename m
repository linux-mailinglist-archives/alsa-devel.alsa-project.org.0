Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5D3E204C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:51:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DED1733;
	Fri,  6 Aug 2021 02:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DED1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211089;
	bh=STQ4jFjhT2tAmblc4n9G9SuqeStkebra6JvvzascIDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3+j2PQS4tpDFySCL9c29lVWaALsLTf+OBfxJN7xOW77S/KJ5O+1ZIdJGeWsZ5X1w
	 yFTpxL0Zx7oyQ4REVzCigWKhIDvgBqpI+6mwNbW5/5jH2+r2iLW4Bzu8HRAi+bLFXn
	 pWArDT+TcCnC8KCM4GvDL5f22QOZOUYbjgImxxrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 561D5F804E7;
	Fri,  6 Aug 2021 02:48:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 747FFF804E4; Fri,  6 Aug 2021 02:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4987F8049E
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4987F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RlqQV+Lj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B86D0611B0;
 Fri,  6 Aug 2021 00:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210913;
 bh=STQ4jFjhT2tAmblc4n9G9SuqeStkebra6JvvzascIDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RlqQV+LjV79/5T6Sgc9AYyJVBE7WqUD0pgceK4Wl3br44c5rO547dKLvO94s8BZMl
 V8xpSEK4DtZRj7RG9EWrRPAC25M2VHzrfTzF4UethXekitZLBdFiP0uyVpFRQROyUr
 ECao3mAf63mONRJfpwAolwuY+vWnwA0aJ5Krshz+ra0rhz117qRQyvIUm8+cf5aXgN
 IApP4ynfieNpBS4O0MLOFaCORNdLxiOe7lLm+WTiFagMY3KEs3Z2kxPj5C4UhZd8mv
 o1v89LuEAJ5HSillKDoFiekthSutAYruewBrs+bjs0SOtH+InZJXiP6uRAJ2GmFzVK
 sfGMqdAI3roGg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: add Multi Button Headset Control
 support
Date: Fri,  6 Aug 2021 01:47:52 +0100
Message-Id: <162821054282.18754.16317109735589826799.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210716105918.7301-1-srinivas.kandagatla@linaro.org>
References: <20210716105918.7301-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Fri, 16 Jul 2021 11:59:18 +0100, Srinivas Kandagatla wrote:
> WCD938x has Multi Button Headset Control hardware to support Headset
> insertion, type detection, 8 headset buttons detection, Over Current
> detection and Impedence measurements.
> This patch adds support for this using wcd-mbhc apis.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: add Multi Button Headset Control support
      commit: bcee7ed09b8e70b65d5c04f5d1acd2cf4213c2f3

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
