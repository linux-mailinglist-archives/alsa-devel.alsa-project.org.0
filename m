Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2A1C1ACC
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 18:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A8716BA;
	Fri,  1 May 2020 18:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A8716BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588351648;
	bh=EdzADl1dqA/pSkvOdRE6yygS79Beu2SuHzIiA/XyE98=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aq7ooOoSHQkhG4vhwbNspEK+7l3pu0S+JnsO41IfLRDtnvQNFqFDlqP1ffHFeJvP/
	 UhjJQY1g+NtIKwZugtMGqFLCQLcVf4VTP65o70RF+7jwmuQ1abBvmPG7xq4fS2Udxc
	 5VT6fpTTuaIoEC7alH9M/7AtbUu7JPo2dkjMZo78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8850F800E5;
	Fri,  1 May 2020 18:45:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00414F80232; Fri,  1 May 2020 18:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E04F800E5
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 18:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E04F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nnmg1qfU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00FC2206D6;
 Fri,  1 May 2020 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588351534;
 bh=EdzADl1dqA/pSkvOdRE6yygS79Beu2SuHzIiA/XyE98=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Nnmg1qfU3BIKXxQRAWlhBw57anIewhP1elOY9tKzrynlch8MVQ6C4JjAJswbP8FpD
 4IFQbjUETCKvIfzRPwlTiFD7MAorYdnDmWITtaxipWcnivHjNQrfanN++mx6mI9leU
 NsHB6H7HNjiC4CxW+4Deee+Dm/qre+7HYczgX0po=
Date: Fri, 01 May 2020 17:45:31 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200501133534.6706-1-krzk@kernel.org>
References: <20200501133534.6706-1-krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: sound: wm8994: Correct required supplies
 based on actual implementaion
Message-Id: <158835153189.13173.5201387267459150176.b4-ty@kernel.org>
Cc: patches@opensource.cirrus.com, Jonathan Bakker <xc-racer2@live.ca>,
 Lee Jones <lee.jones@linaro.org>
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

On Fri, 1 May 2020 15:35:34 +0200, Krzysztof Kozlowski wrote:
> The required supplies in bindings were actually not matching
> implementation making the bindings incorrect and misleading.  The Linux
> kernel driver requires all supplies to be present.  Also for wlf,wm8994
> uses just DBVDD-supply instead of DBVDDn-supply (n: <1,3>).
> 
> Reported-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] dt-bindings: sound: wm8994: Correct required supplies based on actual implementaion
      commit: 8c149b7d75e53be47648742f40fc90d9fc6fa63a

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
