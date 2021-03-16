Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649EA33DBDD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA5917E9;
	Tue, 16 Mar 2021 19:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA5917E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917703;
	bh=Vtpwig98DoZbrSR0CuLqzxBGXELlkECOuNP5eItQs1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xm/w4gltgE59Zsn4Tc0omphrx4pIupCAZtFjZaVxId8IZh0tBYbQuJDJMA6r3jGRy
	 ymVxLUlVP/BXxoomEQlPZ9285LC87jDH48ibfM/Q+innpjfHAnUSMD+99oX/9+AVM5
	 F+xcJdAeIhmabuiSYo1kbcYfJ0rTqFOEAZRahBBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BECE4F8023B;
	Tue, 16 Mar 2021 19:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D73DF80218; Tue, 16 Mar 2021 19:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54916F80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54916F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B5er0DI4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B063F65130;
 Tue, 16 Mar 2021 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917601;
 bh=Vtpwig98DoZbrSR0CuLqzxBGXELlkECOuNP5eItQs1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B5er0DI4ZmvZIRiX7qGda9dnCI3L7nNsR1o0jHOfuze8qNxaEklDyNkSe7Y5GJxSz
 09PP8gZiwlSo6hjh25CM0x/YiC6auGmVMNffGEXnwebvDD5X2Y/ePISsGk9qo5DfND
 K9ZUQ93tU3bpdlquwXTNOVCDamtDGi3APpz8kw47XGwQYmkthItjiVMBGJ5AmsqwJ+
 vDAkUwWgLS2l0LBSreUtZ8/rruQGP3tp8iwmC2goFiIKf9TPXELiy8VRXHdTl5Gowu
 2I57AaB9VHl96WbxgnsuMdIHzOZxgcV1NpDOJ5ORs/oRemiODBQlfpqese4fLjvW/B
 shOeHe2y1XNjQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: fsl_spdif: Add compatible string for
 new platforms
Date: Tue, 16 Mar 2021 17:59:42 +0000
Message-Id: <161591744696.13544.14124776783754754865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615884053-4264-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615884053-4264-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 16 Mar 2021 16:40:53 +0800, Shengjiu Wang wrote:
> Add compatible string for new added platforms which support spdif module.
> They are i.MX8QXP, i.MX8MM, i.MX8MN, i.MX8MQ.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl_spdif: Add compatible string for new platforms
      commit: 9deef665f5811a7ad22b5e6eb80fe2a14ba4494c

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
