Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A171843CFBE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC8016AA;
	Wed, 27 Oct 2021 19:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC8016AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355907;
	bh=wF4ITQHovrfi+/zFjLWRp1/RkCOOsze0ZdjK6Q3RTvI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dr3oJV/Iywh6F6Y8KBzmWbu0P+JZDy7gNM0qsjVUm8j/C/JWT/y442a8DN/3Z0OW4
	 Yrey1ZFjy7UXmVbjUZx8Ruau3NuBOkrwM7al0DDVJkeAt4FW4K6fCyjRBt2sNlaoAv
	 EYmsVF6TuObsWLq2nuqVSH5ikwk8hN4BixIVgLPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1BD0F8049C;
	Wed, 27 Oct 2021 19:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD3EF804D0; Wed, 27 Oct 2021 19:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA47F8016C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA47F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AlNsDPBE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E069A610A4;
 Wed, 27 Oct 2021 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355756;
 bh=wF4ITQHovrfi+/zFjLWRp1/RkCOOsze0ZdjK6Q3RTvI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AlNsDPBEV84Pene+w55lrYdugdtmn9Sn6nsAUpH0VQ+rOugxtPjcK5mpkbN7tucK0
 OrRA0F6uYaswUBHcViU1yUyWc9c5DT4xNgDRRi2edtBGaN8ukx2f1V7sDjJMN97XD9
 Nf/F9YJOxi1JGSVX47p2BP+iyMoPK55FJy0YhTp9rLSx15wqCkhqd/miC4TDJp+TkL
 Ns9yqQqAM/Ub0PWHXOqG1NT7njNGgmNTftfH2g881weHDg12Zvy+PbGSF3nyUGQjiE
 oWb0/mxwx6oyRCPdlJ2FHgZizSGIdK5K5YqTCBuBk8JpArotEnLxx73LQ5HJhZglNY
 yWOo21a+LXiHQ==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, lgirdwood@gmail.com,
 George Song <george.song@maximintegrated.com>
In-Reply-To: <20211027001431.363-1-george.song@maximintegrated.com>
References: <20211027001431.363-1-george.song@maximintegrated.com>
Subject: Re: [RESEND, v6 1/2] ASoC: dt-bindings: max98520: add initial bindings
Message-Id: <163535575465.4012075.8539101072953032948.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 devicetree@vger.kernel.org, george.song@analog.com,
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

On Wed, 27 Oct 2021 09:14:30 +0900, George Song wrote:
> add initial bindings for max98520 audio amplifier
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: max98520: add initial bindings
      commit: 8af1f903391419809160aef3dac0641fa15680f5
[2/2] ASoC: max98520: add max98520 audio amplifier driver
      commit: f88ee76b8645c6da37eec79cfd45f2cc646bd01a

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
