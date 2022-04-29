Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD08514EA6
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 17:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A349C15E5;
	Fri, 29 Apr 2022 17:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A349C15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651244603;
	bh=Q9J8nfFbLcH6u/qm4eHj84G34KDbxXld+7fzihyYfPc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRjquIVeibUv7FG1pFe7/bV1oKTUP1aFhebrGsD9aqIxwN9us+/FZC9VyOHFMrkiU
	 GZst3022iOvaW0fT3JjN6awdUPHTPibfI85i8YEowKf5pu1Mlmc7nFC2Qt81GWisd7
	 BGDf0Dnh/6ISGUXUPv8N7RJJHncRJWPPvCY2Rdq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15824F80269;
	Fri, 29 Apr 2022 17:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 496BFF8025D; Fri, 29 Apr 2022 17:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E23DF8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 17:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E23DF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SFfCAJ/U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E7EC61FEC;
 Fri, 29 Apr 2022 15:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1B1C385A7;
 Fri, 29 Apr 2022 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651244533;
 bh=Q9J8nfFbLcH6u/qm4eHj84G34KDbxXld+7fzihyYfPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SFfCAJ/UJgPZA4oKecLcRClW9Fno8hmmkOuJIQMxdyyKOV9qPnwDc4fbFS10xuLxv
 XtTPLfkk5ePWl35qAHXSY5+VW4l5vn3a7AgM7jAleqtkxNyVWZeSh96eXXW23MB7OF
 Kr7nUnMC/GTNn/b75wVf0J/i4Ikr5paHMZTu2fHNTbb1riEk2lJo+i2a5OLu4aJ9NZ
 39VzDKDjiVYV4Gvm/c31qka5PbHJcxgdsuhArOPTClpVrGq2XJrabP62XZKiuQ3qDR
 X/cplXnllK7b3WHU4Gno1RX6I7IcmdhCTKImvOKNSBNrqSQPoCtAp1u/K9xds+RUWY
 glyyXxana3kQw==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 yc.hung@mediatek.com
In-Reply-To: <20220106064847.15588-1-yc.hung@mediatek.com>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-Id: <165124453080.141488.6009641744846773699.b4-ty@kernel.org>
Date: Fri, 29 Apr 2022 16:02:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 6 Jan 2022 14:48:48 +0800, YC Hung wrote:
> From: "YC Hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: dsp: mediatek: add mt8195 dsp document
      commit: 66727cdb250ec5d3f42558e33ace5c7d0fbd9477

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
