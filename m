Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010305BD7F2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944A6851;
	Tue, 20 Sep 2022 01:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944A6851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629182;
	bh=KxyL/YMTe3xp5VtT+ZYbXU19kolGIuUiR4jK0OHYe5M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7R/b6mm6oSNF9I/SohlRJyR3xxImki/ZLE1f3qf4V/8uoPYMkJ1eR+gNl4c4jZvg
	 EqTWKHV2hSxd3XCdliMD7m/db9B/ZoH38iK/5QOt1JSOu+S8qQ6luh76UBkh7tI9nL
	 VtRT8sWOSOWzGj7bn5ZxVXwzWlLDJqKSriyHzrQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0256CF8057B;
	Tue, 20 Sep 2022 01:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F2EF8057A; Tue, 20 Sep 2022 01:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E874F80566
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E874F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cZiSGmFX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC176B821B7;
 Mon, 19 Sep 2022 23:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1841C43149;
 Mon, 19 Sep 2022 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629005;
 bh=KxyL/YMTe3xp5VtT+ZYbXU19kolGIuUiR4jK0OHYe5M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cZiSGmFXTQnHujmqd/9zcOtcpGeNhtNZV5SZ/yZ58Y6NmzKL3BD9RIbYM/jYkr5Jk
 N2RGyOB3qceEkm8Oz5apptH6k7ATE8xpXksbJ76rcP45pSpPY/iSFvMeKkmG8nbf3H
 rltB+tskfA1KX3RAJn1j3BAYQUzpaoRUO3vo5hle4WTPAAzgGGNWdrhTWvcJbPPgqC
 xSk2MppbWYII+tuUNU10nhnt/kBccUDwZNW0OhZlc1fKv2v4yU9JDFiNkweHg5ZH3N
 cxB01Q2ffcMwmfmj0i5BT6kvqsETNLHHBaB7HyciqQUGXFvjN8pv+Hdtw0MMRH4BMo
 1GnK1FG6XGDNg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062415.153659-1-ye.xingchen@zte.com.cn>
References: <20220916062415.153659-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_es8336: use function
 devm_kcalloc() instead of devm_kzalloc()
Message-Id: <166362900145.3419825.1680084874127824841.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, andrey.turkin@gmail.com,
 kai.vehmanen@linux.intel.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 muralidhar.reddy@intel.com, mchehab@kernel.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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

On Fri, 16 Sep 2022 06:24:15 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_es8336: use function devm_kcalloc() instead of devm_kzalloc()
      commit: 59f84d2dd76ad6e681b5135db6e6cc8c8238cd89

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
