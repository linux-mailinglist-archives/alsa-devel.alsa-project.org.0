Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAE5BD7F5
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB40868;
	Tue, 20 Sep 2022 01:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB40868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629233;
	bh=e0QF4vfam6+gxxuHUDz8GUn1DNo3hAYlR7LZMd9gIQ8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=II7hvqEoAR9hVX/cneg/wNwR0K7+6U4AYk29iH3CcZ2IWbaoJMj0IfNr2pabcwgry
	 oTaKMQAFm7/pWXQ5ZS5tNh1b5fPABSgjw+UBb6qD/WfnBDpRD6uP2DWFFte/mP18rE
	 O+SQYCxqzUKadj1MoAk41zaU8K2hXYGjTOK3xW9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1FD8F805AF;
	Tue, 20 Sep 2022 01:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 439C2F80589; Tue, 20 Sep 2022 01:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FCFF80580
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FCFF80580
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GxWaeCHH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77624620DC;
 Mon, 19 Sep 2022 23:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AB0C433D6;
 Mon, 19 Sep 2022 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629018;
 bh=e0QF4vfam6+gxxuHUDz8GUn1DNo3hAYlR7LZMd9gIQ8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GxWaeCHHVSGeYRdRzNxnu7GAHIYHQr34SlU8w78hY/mGDgiJgAbcNc46N4eVEOdFj
 bxnGBfMTH4iPRAcNcA7da5HrTlnA3RdIe4QKQHXhdRw/xMK08Gaj2peGpKPUVPzFww
 pSSepQYeLAD5T2BC9v0QKXdNEx4K7GUIdw0HZpY7T8BAGVEoHjZpwYN6jc/jRPp1rx
 2s4VlX1vWbfIOwK8m8ZqpcH/Ab6wC8qIgSXF5b5kKABDYmm9PUMaPSbMXmxwl//gUr
 TyJJzvYnrl+1Nkxo+VHYs1WdC/KHJaqkMhnO6kWW8vdc49bRyCaWsmCcSzY5iqerpg
 0dSry+0sWZ6sg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062630.154277-1-ye.xingchen@zte.com.cn>
References: <20220916062630.154277-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_rt5682: use devm_kcalloc()
 instead of devm_kzalloc()
Message-Id: <166362901419.3419825.11809822092689370163.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, linux-kernel@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, ajye.huang@gmail.com, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com, vamshi.krishna.gopal@intel.com, yong.zhi@intel.com
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

On Fri, 16 Sep 2022 06:26:30 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: use devm_kcalloc() instead of devm_kzalloc()
      commit: 54a0511067217e7039045623942e4e021ef1db84

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
