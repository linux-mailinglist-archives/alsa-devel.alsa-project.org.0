Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC175BD7EC
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AC6C84A;
	Tue, 20 Sep 2022 01:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AC6C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629143;
	bh=czrs/JCQeLvkCIsmJwNiu8IJWSro2CgKkL6JbaWcVtk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EvGyKfJZaECKv6X/DFRDWO8VjfjLHq3De3MYJ5yJQ10NprDzn+kLE98dJgMJQVSR3
	 kp1uuHgWQ1qGmlMbXFzwrwr1lbq/8oD6eLSLH3lAGn7e6N0TnFz47fChRxgLcivAGU
	 d7vh0Ndn4wkIkwAH0B556/ukHhrUaQTongVcI3WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8211F80568;
	Tue, 20 Sep 2022 01:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBFEBF80566; Tue, 20 Sep 2022 01:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 815EDF8055A
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815EDF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mg/cQGoM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17217B821D1;
 Mon, 19 Sep 2022 23:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EF9C433D7;
 Mon, 19 Sep 2022 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628996;
 bh=czrs/JCQeLvkCIsmJwNiu8IJWSro2CgKkL6JbaWcVtk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Mg/cQGoMb8m9PzRTTpYjd49+LbRU/6ZjCo8Bg2Ab0xbW4qXjaxNSgEB8OXh2GyNVt
 4QQnbqckOAOykeXnJBqmBRAvWhjKRBGpLdsyvSl6xbVd5/V6Ix2EqKzEJsYKTmNokX
 lzGtKmY/5G9Pou0ntN1hkiCGCMBLNzlftPINBK7J1kd44c7++4u0riEcOfhXWL5jLo
 FnGL2gi00vYJxuHMbN/PRZ8NBm/pbrUnVidmbq7jVYsqk7M03k1nI3abL0xL3dnBXh
 XTC/YRTehVtbLt89qS/2UrcYX0Zi/aA+rkaXtnzfEoTkajZKu2KfKezKghKFCB1Tf2
 9cYz94xHxhEGA==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062234.153275-1-ye.xingchen@zte.com.cn>
References: <20220916062234.153275-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_cs42l42: use function
 devm_kcalloc() instead of devm_kzalloc()
Message-Id: <166362899277.3419825.11560937482868750935.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 akihiko.odaki@gmail.com, yung-chuan.liao@linux.intel.com, brent.lu@intel.com,
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

On Fri, 16 Sep 2022 06:22:34 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_cs42l42: use function devm_kcalloc() instead of devm_kzalloc()
      commit: ce6be534a615a361bf4877bd321639993dd74dfe

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
