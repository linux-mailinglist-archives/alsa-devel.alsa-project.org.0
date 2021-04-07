Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189635760A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE6CA1693;
	Wed,  7 Apr 2021 22:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE6CA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827394;
	bh=DapdfZkCmQxiuqMn5+0fag9RbsXzXBztZK5Y2BqkUqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AU5BNr5rCDll0rwI+sQJrr/BUt+X2BwM2VfN34DE4tffW4EycKZ0uFDSCuqtSsBPF
	 MyZMU/IJi47DtC9zvU4eVhARhQY5JVLaiihz8b7w/CtVK6alLfRI8ynyOmgRLOiK8Y
	 ag/2R4CbYte9VVU1zihBnDDqf8TgKfhlIAn5jyPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB9EEF804AB;
	Wed,  7 Apr 2021 22:27:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3785AF804A9; Wed,  7 Apr 2021 22:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10C00F8016D
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C00F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X9rT4CRP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D14611EE;
 Wed,  7 Apr 2021 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827222;
 bh=DapdfZkCmQxiuqMn5+0fag9RbsXzXBztZK5Y2BqkUqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X9rT4CRPK4Lot0QDWyJSr4PwnWN/TzBK9sxRedCn2FTzKa7PBXqNBXWHXOFAM4CH9
 Q6hAltC8DX5LJN9LCPOH0jQAr3gYumPmfqD8xc3Qyr0ErNEyZ07uf9zwpm/+DQjiA1
 o16Fg4y+IZxDoSiO5gu/m59HfTiFllfNpil6bCA9b5OeP7BPTQBNW7/g457QH80WiE
 VhaqRWny/7OStm0hxCM75br2s89+2haVrv+KqaePiNoC145noTYUIioDyFUAxyY3Ly
 MevEdbEMwfvSLLa1npz6RxRblWQ0yh42XQM/6xaAdtG3LK6aZxBY2r5AO69hxXDCbP
 XAlwAIpOkiBfQ==
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: simple-card: fix possible uninitialized single_cpu
 local variable
Date: Wed,  7 Apr 2021 21:26:25 +0100
Message-Id: <161782703230.42756.15970652059464773892.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407092027.60769-1-krzysztof.kozlowski@canonical.com>
References: <20210407092027.60769-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Colin King <colin.king@canonical.com>, Mark Brown <broonie@kernel.org>
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

On Wed, 7 Apr 2021 11:20:27 +0200, Krzysztof Kozlowski wrote:
> The 'single_cpu' local variable is assigned by asoc_simple_parse_dai()
> and later used in a asoc_simple_canonicalize_cpu() call, assuming the
> entire function did not exit on errors.
> 
> However the first function returns 0 if passed device_node is NULL,
> thus leaving the variable uninitialized and reporting success.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: fix possible uninitialized single_cpu local variable
      commit: fa74c223b6fd78a5314b4c61b9abdbed3c2185b4

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
