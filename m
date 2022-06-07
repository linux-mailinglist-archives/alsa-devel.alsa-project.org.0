Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F653FBF8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564121A42;
	Tue,  7 Jun 2022 12:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564121A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598908;
	bh=SJgNHe3KICgmmrvxqN6h41R01m000Z64oQ2RkAsB7R0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVishyo4QilmJaaJePXIEnA1LzYOfI7VJ+krlCQv2z2gbTbQexOTAqXBjJLfk9DPp
	 8SYlqBrd97kCNjTaY8m4RtCf029Hj6s2YaHlP67JDlBhjoMKXkuMqTxwnjW//iFWPB
	 8qdaYjkTJRELip6QajdM2zbfe0tnG/NbElutY+pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E1ECF8054A;
	Tue,  7 Jun 2022 12:45:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C066CF80551; Tue,  7 Jun 2022 12:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D7CF80544
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D7CF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gxx4eQTN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EF9861555;
 Tue,  7 Jun 2022 10:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A127C34114;
 Tue,  7 Jun 2022 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598735;
 bh=SJgNHe3KICgmmrvxqN6h41R01m000Z64oQ2RkAsB7R0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Gxx4eQTNfVkZsr+Y/sX3S9k60i8nHYFFD0DGJOqcxqjNgUF7suN09lDMmBu4NVq28
 N04VPhijT9ZabUHdBIPDDnD1bVMRncaoklJIlnHWbHalLRW/rX+UaJ9xp0a+9vHXcL
 CHcKWg3E+StG8kr2gx6EaWWr0SmV/h6ogh7fnaU38maMYTX7gV5bh12kKeLNqTQVoj
 Cx1u/b+SJGEpG4o6QB1LnXB++O++C+0XqIFVotk4h3zNa2cDQXboyQtUxWAd1QNvQb
 rz8rcBWXwC37yv0h1t79yKHJmut7UWt8geIbWv5POWO2KY+ryh22Y3XeRSHe22AlgX
 ZeQGa1CE+1OIg==
From: Mark Brown <broonie@kernel.org>
To: simont@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220603115003.3865834-1-broonie@kernel.org>
References: <20220603115003.3865834-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
Message-Id: <165459873421.301808.11005973850683820177.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On Fri, 3 Jun 2022 13:50:03 +0200, Mark Brown wrote:
> Currently wm_adsp_fw_put() returns 0 rather than 1 when updating the value
> of the control, meaning that no event is generated to userspace. Fix this
> by setting the default return value to 1, the code already exits early with
> a return value of 0 if the value is unchanged.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
      commit: 2abdf9f80019e8244d3806ed0e1c9f725e50b452

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
