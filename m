Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D3568672
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668EE169E;
	Wed,  6 Jul 2022 13:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668EE169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105823;
	bh=V1oSo1AQmycapa1vVwI/k7VAl2IrguFLziT4xpVLFFg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Euu7GlOEugBsCRo34rD+KNEXK/qOGs/1dySS6kI9OUPhjECnnRLnRUN68SbyNn69I
	 idqJreR7HamKyCVWtkyGWh2gCFwX0ByDEnYbVPUHRYmrov6zYn9rqVOK7dmOyZmVlt
	 xfiawK9Twfqwziit0x+KPrjjxDbznD9ILkStVOrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D37EFF80548;
	Wed,  6 Jul 2022 13:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B77F80544; Wed,  6 Jul 2022 13:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9FDFF80538
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FDFF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="opTtOxdI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 788F4B81BF0;
 Wed,  6 Jul 2022 11:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0FDC3411C;
 Wed,  6 Jul 2022 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105681;
 bh=V1oSo1AQmycapa1vVwI/k7VAl2IrguFLziT4xpVLFFg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=opTtOxdI5xvrP0TP3NAnHQpjFjAMLrMAhnVoku5qb5xPU7gWUyHerSDmeyaCbYOit
 RkN+XAn8A8veCuvPoDJNKriz2hO16NHYRLA9lkdM5hNjSxMkoaNqTt+/NlXWs7Yz7g
 F9oqzQddZ31R1ex2saHY4LfHVVMhFw2ianPouThUpl+AnsSvJUI6inqBqvd/CiSRIH
 5qmoiqG/bih+0OazWwJx6TiCw/L+l/BHiG0ie2C80XcalQEM9om6ebY5k1aVhKmbDA
 BdYFRCernxQpN6CvPILbxUvPzG3gxiq7TM0NAWXDVsck/7YZl3Dpk2DdkRWcvmRbLa
 Aps25WXt0hUBQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 andriy.shevchenko@linux.intel.com
In-Reply-To: <20220705155813.75917-1-andriy.shevchenko@linux.intel.com>
References: <20220705155813.75917-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Message-Id: <165710567856.237380.17954574328777286737.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Tue, 5 Jul 2022 18:58:13 +0300, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: remove duplicating driver data retrieval
      commit: b03bd215742c620812e47a9ef5f08e4e0e5f0a1a

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
