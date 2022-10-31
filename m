Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60639613DEC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56AC1664;
	Mon, 31 Oct 2022 19:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56AC1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667242848;
	bh=8VQj+ZASnWKsMq5F2lwAZzxH4fhL26IZ/d81+ZNjgh4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hy1ahHADIIH+/IxthoQrGEEIfwPQ8KUzJL1HC1fjO5Ywo3shT9kuXQP9QIJauiAjJ
	 G1iZQI3l15c6pWr9yokmfUr13nL0aL2qBkALv/5vgH6nU66/cORZ6fo8OoTEe7RuQq
	 tdm3wXwATVym33prF/UiwgkATbV+CfbxlAEhkfQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 599CFF800CC;
	Mon, 31 Oct 2022 19:59:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE264F8021D; Mon, 31 Oct 2022 19:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ECA5F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECA5F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l4wqZoqs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 986DE61358;
 Mon, 31 Oct 2022 18:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD61C433D6;
 Mon, 31 Oct 2022 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667242786;
 bh=8VQj+ZASnWKsMq5F2lwAZzxH4fhL26IZ/d81+ZNjgh4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l4wqZoqsTFW6zgfrtSlWuFUdQbs1wYiTdx7ozje+pmc3+E/1z6KNqiSd49UyHF9CS
 w+b+pFU+wsu8EIT0xPNUCbrESXvJQpLt+6jM+LsNLQXU3l4GXUtDIWtH4/d2mq0V3F
 Dqn7ndaKMHR7+aWyBfbE7SUA3JjigUEkf2vsatKuX/XY3gskTFRvyh7QV2abCVdGUv
 Gxx9f7XyWyERZqlSw+1+tXpFR/Rp59P+MkcVgGR5EwvPGBFu5dyfLX46L8Jc+zSwAr
 CX1Jy4i1Jkyy8d9y6yz6s1ObiaCe7uvzuMjsGj9hDYWZbAT0Rh3M8FT06mPG8mEdg7
 P/dnIqfWMXhyA==
From: Mark Brown <broonie@kernel.org>
To: tsbogend@alpha.franken.de, paul@crapouillou.net, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, 
 perex@perex.cz, tiwai@suse.com, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 robh+dt@kernel.org
In-Reply-To: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: (subset) [PATCH v1 0/3] ASoC: jz4740-i2s: Remove .set_sysclk() &
 friends
Message-Id: <166724278340.784642.4861390938395208106.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 18:59:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 28 Oct 2022 11:34:15 +0100, Aidan MacDonald wrote:
> A quick series to get rid of .set_sysclk() from jz4740-i2s.
> It wasn't used in practice so this shouldn't be troublesome for anyone,
> and fortunately there aren't any backward compatibility concerns.
> 
> The actual rationale for removing it, as opposed to fixing the
> issues of the current DT bindings and implementation, is provided
> in the dt-bindings patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: ingenic,aic: Remove unnecessary clocks from schema
      commit: fc839054615427aa15de7677082b23b3033faf07
[3/3] ASoC: jz4740-i2s: Remove .set_sysclk()
      commit: 1c0036e03edd5d97fc0af94dd3ab7e8c58b8191d

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
