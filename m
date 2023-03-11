Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C5C6B5EAE
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 18:21:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D091671;
	Sat, 11 Mar 2023 18:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D091671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678555277;
	bh=gYQkLYUkx1K3uGDgxKkQD4VX8afsfuR+PMZMTcszPB4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBYRzQeLcssT4SUTolrYiD1h5TfTajVj/OyhPu2aYSoEJInwxdrHeG1pmBhszU1oN
	 d/kPIc+X/zBFo7/SaBl6VCUGhq8/idRSRZx1fHBD+0F/+2ZJGHeUiPbzBFcsT27MqO
	 vz2ECZCJV2/nza8uVLhHkW1k3FqnikU+eNXBcwio=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C1DF804B1;
	Sat, 11 Mar 2023 18:19:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FBAEF8042F; Sat, 11 Mar 2023 18:19:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFA20F800C9
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 18:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA20F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jmj9901e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 016DC60D54;
	Sat, 11 Mar 2023 17:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338D3C4339E;
	Sat, 11 Mar 2023 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678555164;
	bh=gYQkLYUkx1K3uGDgxKkQD4VX8afsfuR+PMZMTcszPB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jmj9901erMgO5Qg/Job+i2yn0gkTkpnOXRJLD9SDx5ECiQSGhgjv0vfxDAIgr25RU
	 56a3IEUtk0BceHVEAApcY8qO/eR+EHII8ZTs8XJnb7oVqIowVyhqX43nhPQ29ZPoJa
	 1VfR+6QmopMC6s6RHktfbMjtXnR2GUy8+TIv366nQ12NIHSLZ18eDS5Zxn3QTzZGs3
	 Ao1xjVlh5HN+stqLX2lmyphh8kazoWmSxFJoL/ggzx6NyOqwsRTEiX8nUVn7iYxQ6g
	 FxhSm+EBe5DqLf6bugPVUEk+quT+UWIhvjrHD/bHdzHBS6EZ8C/nzt6kygdQBVH+NM
	 HK7IOXmN5zoqg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230310144733.1546413-1-robh@kernel.org>
References: <20230310144733.1546413-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_read_bool() for boolean
 properties
Message-Id: <167855516017.950365.11671456936566563006.b4-ty@kernel.org>
Date: Sat, 11 Mar 2023 17:19:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: YN2HEW6WUJAKYEGXTGWPSDGGIDHHXJVW
X-Message-ID-Hash: YN2HEW6WUJAKYEGXTGWPSDGGIDHHXJVW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YN2HEW6WUJAKYEGXTGWPSDGGIDHHXJVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Mar 2023 08:47:32 -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_read_bool() for boolean properties
      commit: 2d2998b84330899bf88a0414f3356869be4a69eb

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

