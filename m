Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E9F638C28
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:28:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74CE3174F;
	Fri, 25 Nov 2022 15:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74CE3174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386525;
	bh=XAIRBJbnf54MBkCwp15rFPKjE5v6h8r+OImi98VohDA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYF/op22M+RmgTF6uLy1A8nUVf3zshOfPm4xArHeb9UedgnPGV0LZyNUiafr4hjG4
	 Vo7wK9gtMgo89ITdszZp65fBkC7YM+TAVzP4ZzI7Cf760p0TEwijnaC00S2ujYA2bM
	 GxH9ecwXhDshwI8YBwJb8mbn7tQ80ISzXg5a1Mu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4399DF80563;
	Fri, 25 Nov 2022 15:27:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89711F8055C; Fri, 25 Nov 2022 15:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4AF2F8014E
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4AF2F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NQJzQ5WA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AF11B82AFC;
 Fri, 25 Nov 2022 14:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E29FC433C1;
 Fri, 25 Nov 2022 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386411;
 bh=XAIRBJbnf54MBkCwp15rFPKjE5v6h8r+OImi98VohDA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NQJzQ5WAawQDE0R7OHT86nbCtYWBg8hKID49uirIDj64HINAUmJ1dSmHdv0KQpP8b
 IItJE+jJk/EQW3NXhcJenhVtWEkYQy28SGP0wGZQf5WOzRkPiOYocYuncrdEEuxm9C
 4f/mrxMYY3r3kq/4by4DgnsMyoAzuy1D2OQuKQMP20/V38tyQaYptlqNAQFv1oWwHU
 A/qh7+FFEA/Fi2p79Jc3H1QcVhh7Pb6tQbt5nnpXlBqvIQig62CikzuWZhElmClxS5
 DfyNj1xMC3wSISElPWPX5LBarOPHUzOZQH/dtznbS+TXDRoSxMikt4TNM1GyJ0BYp+
 JhnmEp1d5DJCw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221123165811.3014472-1-rf@opensource.cirrus.com>
References: <20221123165811.3014472-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: wm_adsp: Report when a control write changes
 the value
Message-Id: <166938640983.506633.5904617504530907005.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, 23 Nov 2022 16:58:09 +0000, Richard Fitzgerald wrote:
> Writing a firmware control should be returning 1 if the control value
> changed, so these two patches add that.
> 
> Though this is an ALSA requirement it is also useful for non-ALSA clients
> of cs_dsp to know if the control value changed, so the main handling is
> implemented in cs_dsp. TLV controls are specifically an ALSA thing so they
> are handled specially in wm_adsp.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] firmware: cs_dsp: cs_dsp_coeff_write_ctrl() should report changed
      commit: c56f4b2442d33bd94c418697f753271099384bee
[2/2] ASoC: wm_adsp: Return whether changed when writing controls
      commit: 7406bdbc4fb8b99cf0150cb2056a585c95ceafe7

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
