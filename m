Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 594246ACF3A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 21:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5633F11B4;
	Mon,  6 Mar 2023 21:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5633F11B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678134716;
	bh=EzyQ3MFE9bDskGkMob8SF3iTbMV/JwpCm6+1rwkuY/Q=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BxmH+03GBieogIGF63hK4G+/oBU6Yv6FYGzGwsuSIYLZHADORdkIyKXw5+NDNmh2w
	 7ZkARIybeekWWULwtwUhVZlTklNz0CRS10rJSgkddPZyS4TjSeJkPK+2iCS5LdK3BX
	 zklhOOsQPtVfK3RgGKndUsDCyG0EIz71hk3XPfwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC56DF80236;
	Mon,  6 Mar 2023 21:31:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0E7BF80431; Mon,  6 Mar 2023 21:31:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53FE4F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 21:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53FE4F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hFabFcGK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2012761173;
	Mon,  6 Mar 2023 20:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054BEC433D2;
	Mon,  6 Mar 2023 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678134650;
	bh=EzyQ3MFE9bDskGkMob8SF3iTbMV/JwpCm6+1rwkuY/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hFabFcGKQag/u2uJWte4wLKT+RA++HuQxedYciItv3wzkFIN51mmuAmdZ7j0WvMUQ
	 3U2vUBH/aC6kQeSEYIcAuTLv0oxH5tTAgqJ0xDqWIzt7cNsHY0ECnU6iAvykze43ax
	 UT3DysiOrJwT1NitdGO6YiIsEgZzzvAWnMD2j1L9PKL4G0AEe/vHu3VmwXUP7Tgree
	 nIeiLIcOxGVp85Ddfmpfq4Aatio4mfAxtuzEma9sJ2e4iq/ilU50dMdjf8jaWLiInq
	 QiPytgUKSq25LNusOsm1r388EsNaJoNbChXv1QK5z/iuUjBlUTMyL/Njoncwr9rz0r
	 BZYh9khbpVXmQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <20230223084324.9076-1-lucas.tanure@collabora.com>
References: <20230223084324.9076-1-lucas.tanure@collabora.com>
Subject: Re: [PATCH v7 0/4] Add CS35L41 shared boost feature
Message-Id: <167813464774.226962.10169178357307484106.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 20:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 6DJDCBDCY7BNCU5VNIUT5BTOKEY5X6RO
X-Message-ID-Hash: 6DJDCBDCY7BNCU5VNIUT5BTOKEY5X6RO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DJDCBDCY7BNCU5VNIUT5BTOKEY5X6RO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Feb 2023 08:43:20 +0000, Lucas Tanure wrote:
> Valve's Steam Deck uses CS35L41 in shared boost mode, where both speakers
> share the boost circuit.
> Add this support in the shared lib, but for now, shared boost is not
> supported in HDA systems as would require BIOS changes.
> 
> Based on David Rhodes shared boost patches.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l41: Only disable internal boost
      commit: 4658de99d43cd740e019e7fd124b4128f8f4027f
[2/4] ASoC: cs35l41: Refactor error release code
      commit: be9457f12e84437259707415364cc5fc96041ed6
[3/4] ALSA: cs35l41: Add shared boost feature
      commit: f5030564938be112183ba3df0cdd6dea3f694c2e
[4/4] ASoC: dt-bindings: cirrus,cs35l41: Document CS35l41 shared boost
      commit: 340307d7effd99303fe933cde3b7288f8f3c6677

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

