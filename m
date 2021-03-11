Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4533792A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28B218AD;
	Thu, 11 Mar 2021 17:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28B218AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615479716;
	bh=s403Yj9fATOFnZaMBCJI/Gp0tkjtHDvFjlBDnVVKLIQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHwNLzZJJydTIE9rM8mKYm1T/XzXvD54flxZRQDHADLsLTTtTDWRSnFHLBeDd3vBj
	 SFlwfaJejmaAY22ZfA3JEA/2w64kJg6He38mRRC4j5J3TZ0UxFI4EzcC7h7Jp+iNDZ
	 lgMdKFaDLGKQEk/s+v5VN3xKgwVlIOo+KpEPcLsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2CBF8010D;
	Thu, 11 Mar 2021 17:19:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AAEEF80425; Thu, 11 Mar 2021 17:19:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D614F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D614F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pMb1uWdk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B93764F9C;
 Thu, 11 Mar 2021 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615479583;
 bh=s403Yj9fATOFnZaMBCJI/Gp0tkjtHDvFjlBDnVVKLIQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pMb1uWdkQilPnlnTKD8vClV6Ejqh4VX9NCpY804+8xPyybgu6WKTVYhJOVurPBsR2
 o/SvZOiw3lgt5TmMuxWyjIvMsZWSM1lhmbFRJBeFxPlUXmlHXvaj6wbb4AxTiP5nRD
 a8yTcv2oEnMl136qS+JvuXJlkGNNAu9fLeNFBeflBA75+d3U4HuHvDZBYIl5PUWSsO
 BdPU1ZL2j/c3NP30C2GrGJ2l5hbQS8ADd60P+d2Upx5z2LwTISpJZt+iKh99649LzA
 mXupEKYlruOe0JJx4Ir+VLAmKMg/MsGI1zXBLNB21hageiGwY14AzhnjSKkxC2kkhL
 xKz+rNRXjGlHA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210311033151.1818603-1-tzungbi@google.com>
References: <20210311033151.1818603-1-tzungbi@google.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8183-mt6358: support machine driver
 for rt1015p
Message-Id: <161547949200.51229.17809460239850176672.b4-ty@kernel.org>
Date: Thu, 11 Mar 2021 16:18:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Thu, 11 Mar 2021 11:31:49 +0800, Tzung-Bi Shih wrote:
> The series reuses mt8183-mt6358-ts3a227-max98357.c for supporting
> machine driver with rt1015p speaker amplifier.
> 
> The 1st patch adds document for the new proposed compatible string.
> 
> The 2nd patch changes the machine driver to support "RT1015P" codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mt8183: add compatible string for using rt1015p
      commit: 5fd6b9b8b1c477fb695e3ae313ffb70b3cc88dc9
[2/2] ASoC: mediatek: mt8183: support machine driver with rt1015p
      commit: 9dc21a066bb6bff55d889f22460f1bf236a9a4a3

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
