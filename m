Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059E3FE242
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 20:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23A701793;
	Wed,  1 Sep 2021 20:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23A701793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630520208;
	bh=hgwrdsFNp/PKcYjLFvMeJthQwTPWN5OLQPah0IlGyxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lh6RMm75Rn+tFOqB7PSzp/xQHmms1DzE0YcWKeX9IEoKSRMoBM0hmdAxah0aCVEmI
	 AVdLzHEWRa8WaCce3Qo4JM0iOlIpK1eTf8ZIDhRKcM1dIxh9tJx2sjDysaOxn6YS3i
	 HQwjGIuitH6gn2FqntYRGNyL+jrYT89H+YggUb8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F45F80256;
	Wed,  1 Sep 2021 20:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15184F80256; Wed,  1 Sep 2021 20:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8586BF8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 20:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8586BF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J3oL5crX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AEC3610CA;
 Wed,  1 Sep 2021 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520122;
 bh=hgwrdsFNp/PKcYjLFvMeJthQwTPWN5OLQPah0IlGyxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3oL5crXZty1r1iaWKhAvKkJ3zl/M6on1P4giuyK1suRYmEJGkTNVRzvYiemZxvut
 SkN43mXNKPWahB4y+pzIm15lY9bBm0qVwtBS9jQ7JGkSNrHYdA/5lS8hZpbm/6naO0
 qhgH7b6GPIWp3Q7c/LvhWeu8aXgVT6jz1lEZ5B9mdg5z1uxSr6Y/PgDVuC3OOz69Xh
 zX8rFvqZAit12h+vRQHiZIUMhb5AfhretwGzl0tnJDD8LqXNQFRquAEki4W2w/H6+l
 elp9IYrlEOVBAIrsWXbVYi2hTp85vURuTDws9b9fL3dGhTFathAngwZ0Em76hk3ahR
 OUBX5D6GclxIw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com,
 Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8195: remove dependent headers in
 the example
Date: Wed,  1 Sep 2021 19:14:42 +0100
Message-Id: <163051912509.21630.10720008205041847225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210831083956.9804-1-trevor.wu@mediatek.com>
References: <20210831083956.9804-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 31 Aug 2021 16:39:56 +0800, Trevor Wu wrote:
> Drop the use of the defines including clock and power id, so that
> we can remove the headers which are not applied in the example.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt8195: remove dependent headers in the example
      commit: 222039a2503e0839f859e18e6f09acb9997480d1

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
