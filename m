Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5063398FCD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FBEA1713;
	Wed,  2 Jun 2021 18:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FBEA1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622650803;
	bh=8NTOtVAUlWpijIjD+K59+VsdlOTTwWVBZEPEICpdQiU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=poeweo/m4rSlRvBTUYdqhRaS7xClJAWHAYKS7t8ztldk+TufJ+KgCuMVFNqYPDPMz
	 UxYkAkctnWkeRc0uLV9kiMpL8iOLutatLZPjMaIf/m4gQxcXtQfVfsA1BKCLTADUVk
	 XXloBk8hA8NmW2B8bnrnDnFQMIXpUipmynn3Yfo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E575AF804D6;
	Wed,  2 Jun 2021 18:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1803F804D2; Wed,  2 Jun 2021 18:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50BAAF804C3
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BAAF804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gBjTIE9L"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF1861943;
 Wed,  2 Jun 2021 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622650650;
 bh=8NTOtVAUlWpijIjD+K59+VsdlOTTwWVBZEPEICpdQiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gBjTIE9LH9twgKWQYnj4/GAKhRzPCNCrdnNFa9Xr6aOEZ1AFkPtayHjNw+AmqO/mi
 aBP+qQ2zlR4jaUg/g+wy4DyDTyc+C6XfdQ6rssF2nBHx3Gau5320aMLbTVENlwHDm+
 W2Hr0xmGUweNXSgS+Fq6WwC125ZIKFs20umhwNctDX7/jOW0TiklK+QVwW85BodTMq
 ZfjgTix5aLIYIwPzz/bmVwUKnZFmi/gt2UkJc3vQjJCD/d4Mgf0JAfiwU9nZCP7HmL
 YudRKOfIfyXq01Vd7yUfE+LpPEnknjtRkSGJP8obPh74rrJs2Un9Nc5k3xmkXZoBsx
 qm0Aafr3SW07w==
From: Mark Brown <broonie@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: nxp,
 tfa989x: Add tfa9897 support
Date: Wed,  2 Jun 2021 17:16:55 +0100
Message-Id: <162265045454.22459.11419124227044779135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528105101.508254-1-vincent.knecht@mailoo.org>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
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

On Fri, 28 May 2021 12:50:58 +0200, Vincent Knecht wrote:
> Document TFA9897 bindings.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: nxp,tfa989x: Add tfa9897 support
      commit: 513df99993857863e42bf3d7d65d87c191ce9493
[2/4] ASoC: codecs: tfa989x: Add support for tfa9897
      commit: 1ba1d69d8aa938f64cb07604b320a5074c3bb107
[3/4] ASoC: dt-bindings: nxp, tfa989x: Add vddd-supply property
      commit: 9cf1a98e2b0171e2586a13197a9a1ad605336166
[4/4] ASoC: codecs: tfa989x: Add support for optional vddd-supply
      commit: 8e5607e9941ce915187785bd09805bf7df9f7349

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
