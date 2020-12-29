Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211C2E7173
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 15:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8903517E4;
	Tue, 29 Dec 2020 15:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8903517E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609252444;
	bh=QqMaEx90N9oMhrMtPQbph9L/Wp7Di5Cvs+G8YCC9Yj0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Te9ZCTPvP1/csIUHAxAKy2DRdWPG7MmiIVrxSQBDZvA1N8aCLWd0FWLd4dIiHraOr
	 t01w5A2156Dd5e81PFnIFyNJl7NdKboONzsg0aSdrErCUWgAhO5wgoMBbcdhRBLTis
	 SbkvIZU169JeIKrwg6gvGVQE7CAG/5SzzKue6L2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4436F8022D;
	Tue, 29 Dec 2020 15:32:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4FBFF8022D; Tue, 29 Dec 2020 15:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D3FF8020C
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 15:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D3FF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pKAlpD2I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE3E120867;
 Tue, 29 Dec 2020 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609252339;
 bh=QqMaEx90N9oMhrMtPQbph9L/Wp7Di5Cvs+G8YCC9Yj0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pKAlpD2I38OwjhpE6ur7QgVruSaI0+oT7f0S52INorghVw0VsUnBuNlqVEWjw9gCR
 lPviXlaFLPMQSKy3QCqHvtJLrJ/mm/YVk9BOFuGTK5QH0ChXE7gceerp78/VMNG9By
 gN6hRRrJ3Nh0tf8BvoVfpFFsymMSrTm88McrvXsOnoiUYg4PEErzaG3BrGYLGCp0le
 CXm3lVJFufk5nXMEe8oIqNq+q5Lj47FgyIZv3qqibdVKkAZHZcAeIKkLntD5YtbuTX
 wapYgeroBrwmVLYc8+brBhM4rix2HU4uCeLUPmLLQJ6lUyNhUj16RI8GZsFdjWga/2
 eX/kxZI2M+TqA==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20201224100607.3006171-1-tzungbi@google.com>
References: <20201224100607.3006171-1-tzungbi@google.com>
Subject: Re: [PATCH 0/5] ASoC: rt1015: apply some refactors
Message-Id: <160925231113.47851.726753863114006613.b4-ty@kernel.org>
Date: Tue, 29 Dec 2020 14:31:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 24 Dec 2020 18:06:02 +0800, Tzung-Bi Shih wrote:
> The series refactors rt1015.c.
> 
> The 1st patch sorts header inclusions alphabetically.
> 
> The 2nd and 3rd patch improve error handling for kcontrols.
> 
> The 4th patch enhances readability.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt1015: sort header inclusions
      commit: 4ac275eda0d7bf6f222ad0093ffbdfd2f4228eaa
[2/5] ASoC: rt1015: save boost_mode only if valid
      commit: bf1eb056ac15a058fb5e254307f14f45efbe79d8
[3/5] ASoC: rt1015: return error if any when setting bypass_boost
      commit: e48b41e903a102744827661080acd500b7bbef26
[4/5] ASoC: rt1015: refactor retry loop and rt1015_priv allocation
      commit: 3128f1c3b53d73e35e1069663736284358fcdd01
[5/5] ASoC: rt1015: remove unneeded variables in rt1015_priv
      commit: a5db2ca51367eeafb0c4013d3a6fc58932612c03

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
