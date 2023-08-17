Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA8780127
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 00:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C996AEA;
	Fri, 18 Aug 2023 00:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C996AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692311926;
	bh=rIHX9Z5/J85miF4p/AYvLMNc6o8isoWh9x2Q3al4j7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJsPig0PKjADLhcPTZ8avLCinQmvp5C4l4jxCvtGqsnmrYkz2f4pHvRN7+uJ5/C+L
	 buDpJ8DKV570PZu8eUsAaJsRr+ENw0kID0h94e+FTaycd4yGpzw0d2YzQZ2oVd+qOS
	 N/6ccTMlmoCNWGGhhD6mEyxV4py9NuNALgODiQmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AB8FF80580; Fri, 18 Aug 2023 00:36:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22BF7F80587;
	Fri, 18 Aug 2023 00:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39B2BF80551; Fri, 18 Aug 2023 00:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBFD3F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 00:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFD3F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rkj09KBO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88DC061EA5;
	Thu, 17 Aug 2023 22:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8A5C433C7;
	Thu, 17 Aug 2023 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692311793;
	bh=rIHX9Z5/J85miF4p/AYvLMNc6o8isoWh9x2Q3al4j7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rkj09KBOa+ce/+CZFcr/dCzbkm4OQz2bV/8X/ItKrANDa9txkJnkY5LbiQJDMDHrH
	 xZiuTDcIe9MhVaO2GHkyomFe//nwcrJ8iiIrs0MneBIGEE644ZISiNMMNaKF2fHzvz
	 evyNV/+TpO5MtyRX0WLiqKKQf+ZGZjtQanS7lzcIuwLJqtMmfqXr10RJnyd/tCP6yx
	 Eya06wyUieVxJHBQwueHXVVCL51AZUUvsUKBi4Xwi4sHRleCTsCMh6c1SgSgkLpjxc
	 mIVLvQWnb0YWanoytMuKdhU915C5rKzYTi93GIyEaYwusFA8BFelcE0mAGXGFrVN2r
	 Fvk+snX9TVXjg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, Shenghao Ding <shenghao-ding@ti.com>
Cc: kevin-lu@ti.com, 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
 peeyush@ti.com, navada@ti.com, tiwai@suse.de, gentuser@gmail.com
In-Reply-To: <20230817093257.951-1-shenghao-ding@ti.com>
References: <20230817093257.951-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: fixed register access error when
 switching to other chips
Message-Id: <169231178941.153247.7234904514917786817.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 23:36:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: VOYIMEH5ICQY3KSMT2YUIWYV66SEIJDR
X-Message-ID-Hash: VOYIMEH5ICQY3KSMT2YUIWYV66SEIJDR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOYIMEH5ICQY3KSMT2YUIWYV66SEIJDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 17:32:56 +0800, Shenghao Ding wrote:
> fixed register access error when switching to other tas2781 -- refresh the page
> inside regmap on the switched tas2781
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: fixed register access error when switching to other chips
      commit: 3d521f9f3663ba7a22e56d339c6632f0ca787371

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

