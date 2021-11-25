Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D218745DB3A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62EEE18C0;
	Thu, 25 Nov 2021 14:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62EEE18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847506;
	bh=poHrEhGl7zsnU+4kye3vp0N+i8nAWYUhb+e4JL8EpdM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZ0U/bfcC7eXF5iVOL5s4f/uq30K9yyi6fFpXfcjqhgMrzcjyVxpXEgoVLH2L6/xC
	 +eR/D6/HPROcPzl00YoB9GUJSTgDtieIvN3Kw1mD1dibGZMNXzvjFEB9v3mdPGlg62
	 5YXtYvGxz2zhV0lHTRiNb5h49e5rMVSQ/f97rWIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97179F804E6;
	Thu, 25 Nov 2021 14:37:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F2B7F804E7; Thu, 25 Nov 2021 14:37:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F068F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F068F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EVO9OdG4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 745AA61038;
 Thu, 25 Nov 2021 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847419;
 bh=poHrEhGl7zsnU+4kye3vp0N+i8nAWYUhb+e4JL8EpdM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EVO9OdG4FKFDpI7BoUEpdNOuu0QNqZbVQ0C7H1GcL0GLbEb8rRpOlcoZIOIx35HvI
 wwt57W5cjwVuaJzHlJu7jz2fGbXB0P445cvC/mUO0E3NEbQ7hR8F676OuL0kzdZOBI
 7Obq4dCYqRrXIwYJLh6iisDfuIz41Lvyu3ug5Sk7h1Dg2W/6cJ93ephTJPYVsQl39k
 lzL9ulwAGt6GBETVKEbfQWFKDLRGucniK5GQXWfK/+xQuq1AnDafEIvAr/aM5kenGU
 zhL69/OkhcfTh1GBI8SlKjOsnl60D71S6bkhFKJkaZgw707Fg+sXsgz4aQcyhAAeaL
 A5iTTSXFLyZew==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20211125055812.8911-1-oder_chiou@realtek.com>
References: <20211125055812.8911-1-oder_chiou@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt5640: Add the binding include file for the
 HDA header support
Message-Id: <163784741721.3101847.7862601501455287189.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 spujar@nvidia.com, albertchen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Thu, 25 Nov 2021 13:58:11 +0800, Oder Chiou wrote:
> The patch adds the binding include file for the HDA header support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Add the binding include file for the HDA header support
      commit: 083a7fba38885a8ffa03a2857e383421cefd36e6
[2/2] ASoC: rt5640: Add the HDA header support
      commit: 2b9c8d2b3c89708d53b6124dc49c212dc5341840

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
