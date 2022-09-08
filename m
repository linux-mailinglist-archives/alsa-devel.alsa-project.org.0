Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587D5B1D7C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:44:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014791700;
	Thu,  8 Sep 2022 14:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014791700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662641062;
	bh=Yn1mgLP0Ax3Z1pgIyIL7q6sYoi3PggAgd2wuqHldp7U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tl5y8p64kWGHG57CKayslXU7sCkmTNtxSqvNBHf2OuRJjBH5QMk0wcmd+r2099QeX
	 dhS4H3EBC5Y8rgSD1lLpk7FKopWhJvAa6xci5DqFtr7fP7adHfIK6bRV8V2b/34OLf
	 J2I1pKN8mcXvi2ttB8M8XsxfRO2fI2Oq4tG032jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E8CF8011C;
	Thu,  8 Sep 2022 14:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA44F802A0; Thu,  8 Sep 2022 14:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93064F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93064F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jqQVSenW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD125B820DB;
 Thu,  8 Sep 2022 12:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5C8C433C1;
 Thu,  8 Sep 2022 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662640962;
 bh=Yn1mgLP0Ax3Z1pgIyIL7q6sYoi3PggAgd2wuqHldp7U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jqQVSenWK6/C3xORle4YN6B/NA/NpaqafFS6BuEiIM3HGorIxhnATdniUTBov3ATx
 abbh9DhQX0dL+oi90ew6oHJvOrAJPVR70gIfF3XBUHytziNO3yTQarhiu6ZsINwx0P
 MwuVccBI/5vXv95vF803nOWOhInf2gfT7+4Tk8xoMeYv9MWJG4Ld10wOHXvlWxeHhN
 ZURQq7+F4R3uW59FHAYfr3tPbovpI5rxdk2qRclYAkC9egvnaLzt7SbYTYpH8a0nId
 FOboJR3w8TXshoxipeo5Y+IGzDDuUhNY7+XVdpYg0bcimitj60Ln4HII1HFNzezDG1
 H3Myq+sJ7R+jw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220908010304.342760-1-ye.xingchen@zte.com.cn>
References: <20220908010304.342760-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: sti-sas: Remove the unneeded result
 variable
Message-Id: <166264096039.88408.2327336590864979124.b4-ty@kernel.org>
Date: Thu, 08 Sep 2022 13:42:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, 8 Sep 2022 01:03:04 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value regmap_write() and sti_sas_init_sas_registers() directly
> instead of storing it in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti-sas: Remove the unneeded result variable
      commit: b075f21e533aa51c2bda87d86ddfb6a3c0e38a92

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
