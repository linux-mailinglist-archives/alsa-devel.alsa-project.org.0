Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB126A712B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 17:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2951D9;
	Wed,  1 Mar 2023 17:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2951D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677688357;
	bh=L4jlMMdY5+vXff3HkIyD62qExEfKSQ2Kua/FRvp/i0U=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QoypGOt/lHYRNh0X+CSn7xlN6rEgnBnJtD7XmunWW2NI415/kE3HWtjbHrdbSAxIy
	 Kc6wMgtuZSDZPIHgWCafmqIjUPvCAZGTZR+4gRUJ4zyU43pTNVqJVnJ+eVUBgoQBLK
	 Vd4wKhHL/u54aack9Ff3sNrSdmzLNwyWSLCqVDKE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4FEBF80310;
	Wed,  1 Mar 2023 17:31:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D33A7F8049C; Wed,  1 Mar 2023 17:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFFDFF80236
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 17:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFFDFF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uT5HtI8p
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7231B810D6;
	Wed,  1 Mar 2023 16:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62365C4339C;
	Wed,  1 Mar 2023 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677688291;
	bh=L4jlMMdY5+vXff3HkIyD62qExEfKSQ2Kua/FRvp/i0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uT5HtI8pstrVytkQosOYEks70B7+x4u/NK9pUQvJfieKVnQYWrlT12z0xmjVzZjoC
	 dzTYM1QfNLP0CamFVRviSa7obvzop7LN0fvUZmieTjI+s8d058AgLflKcbWa5wvoW2
	 NQ2KRw1IUhezvcWLu0/twY3IdmX8FXcBvpsb9tgZSf2Qhi1+lEtWlppEv+o5z6YduM
	 YIbm7UFxjgmBLhoDNWzs/wlKPYlT2VQHhiHUvasQ8e8G78ADbThogNljD4a0AhpOtx
	 k+8Tp657eqHO8km2i8ffAXIII6v0nPo+93YBZEjMjCduRw2TI4lHqAugZEMXJMlkPm
	 8y15t4+c3aUGA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20230301110200.26177-1-trevor.wu@mediatek.com>
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: add missing initialization
Message-Id: <167768828912.48425.1653466601154354942.b4-ty@kernel.org>
Date: Wed, 01 Mar 2023 16:31:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
Message-ID-Hash: VJ2B3UCFKPDVXVZXAXRQYRILOCUSJAOU
X-Message-ID-Hash: VJ2B3UCFKPDVXVZXAXRQYRILOCUSJAOU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJ2B3UCFKPDVXVZXAXRQYRILOCUSJAOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Mar 2023 19:01:58 +0800, Trevor Wu wrote:
> Fix dts parsing problem in mt8188 and mt8195 etdm dai drivers.
> 
> Changes since v1:
>   - split the patch into two commits and add Fixes tag.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8188: add missing initialization
>   ASoC: mediatek: mt8195: add missing initialization
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: add missing initialization
      commit: 23badca4248a9a467f630adbd1557f664585e1db
[2/2] ASoC: mediatek: mt8195: add missing initialization
      commit: b56ec2992a2e43bc3e60d6db86849d31640e791f

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

