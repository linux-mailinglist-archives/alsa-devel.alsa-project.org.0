Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE0561ABF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1441D16C3;
	Thu, 30 Jun 2022 14:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1441D16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656593424;
	bh=k/q/fhQMiNHwRSXcnMIjj16X53/sqxQxXQ33UBBRBQg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1ap3fF3Oy68tW/i7X/u0si4XJWV8Zggr+678Bq0okJT3ybb8zwv7w/1paEStKAuf
	 OKtfJuuweQ7f5wn5xYSYqPXav3iN2/bFLA0l/GMdUDrNHedcmwQ94+2/zDHJvfh03h
	 9zhyxdvl2bfC6CKJpkVGhYbK6joc5lWv7Ee6xU/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF325F804FE;
	Thu, 30 Jun 2022 14:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C53C3F804D2; Thu, 30 Jun 2022 14:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432D0F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432D0F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OWFzgAPi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC98061E84;
 Thu, 30 Jun 2022 12:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB46C34115;
 Thu, 30 Jun 2022 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656593326;
 bh=k/q/fhQMiNHwRSXcnMIjj16X53/sqxQxXQ33UBBRBQg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OWFzgAPisJ3hZoUITVF00FrWji4mXjlyy7SdsD71uKqqobN9B4pAfM11CjhFgChKa
 73deDyqQDY+CST+2qjun2EBLp9xqPtTacuwGMmWfsHQRmpC7rtW4gqENCP1hpHTf4K
 JCDA5A7eAKdXNklG71V93HR2st/ZYAeZ2m/6GeQ1ivqiYskk4Dj3nlWvV0nbyFPbMN
 1XaMitcGXlzG9Z8J0plWmCKyrXveMkg73ASnkmOPGxK5TZcNrT6PTqBR9xSu5wZznx
 RaQKJ3HkuCk50EjZ+fYRg9t3kqoYu2hUT/Hn22sIyrUjzNmUZPo+W70ukb2oJ+n8Tp
 Rc+rqHeA+Iv2Q==
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 bryan.odonoghue@linaro.org, lgirdwood@gmail.com
In-Reply-To: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
References: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Fix description for msm8916
Message-Id: <165659332361.455663.5255774878482906847.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 13:48:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_potturu@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_srivasam@quicinc.com
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

On Wed, 29 Jun 2022 12:40:12 +0100, Bryan O'Donoghue wrote:
> For the existing msm8916 bindings the minimum reg/reg-names is 1 not 2.
> Similarly the minimum interrupt/interrupt-names is 1 not 2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Fix description for msm8916
      commit: 59d0319cadff71a74c55fafc6f3cc1f2aeb6538f

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
