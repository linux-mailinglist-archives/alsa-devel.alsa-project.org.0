Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423F731946
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE2983A;
	Thu, 15 Jun 2023 14:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE2983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686833713;
	bh=PdugifJ988kHOdPqRVdugDyIXLOqN0JGsCj3o2txrKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OscPwdp77GkyfFRYlX2cO+ab2pUd7rHDViys3QdyQJn/Llw3RgJssl80wkNkxxcER
	 clMy6sRbaN4/vIb492Kh5siBGieLfCUBUY17h8befFl5sdqKGC9QTnpcxLMKHrS6BK
	 bou0/kgz2lrc7ja2k2V3h8cHjHUs2Q2UwFBrOWxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D27DF80568; Thu, 15 Jun 2023 14:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A94D0F8055C;
	Thu, 15 Jun 2023 14:53:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCEE9F80149; Thu, 15 Jun 2023 14:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 665EFF80093
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665EFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=utGJJOov
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C6F662883;
	Thu, 15 Jun 2023 12:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14796C433C8;
	Thu, 15 Jun 2023 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686833594;
	bh=PdugifJ988kHOdPqRVdugDyIXLOqN0JGsCj3o2txrKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=utGJJOovI3TUSVdVwfcvJdBw/Ei2bpgjAHM8k8Wuai6d7HUG+hKgBqaWvKe/needd
	 slDAf60dMHamjsw2s85TpYsjpQcywHJZXF3onpHmuAZQIPKZGYuQr8EtfWrz8zQzNo
	 FlYo5VjC5u3eMobT6H7qrp2yS0mamiA0OdQ85mdsPBHOu1c3nW1At9FQW3qH81xca0
	 MVJRLQqcWbTwB1zEy5WBDYPhk5b7YAPE4aBZy85Lba3I/Uk11Hucjk5ESyrv47NH0Y
	 t4Q2FdP2lvIpaxCdEOENc4i6nol3urvo83wUkZDP/NI48JQi2+Wq581HF9Hur0+5R7
	 EGcV7uhrqoKRA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
Subject: Re: [PATCH 0/8] ASoC: Use the maple tree register cache for
 RealTek SoundWire CODECs
Message-Id: <168683359259.543460.10829470795045808370.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 13:53:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: TRZBY45PODAOWMFMECREHY6TA3GO4VCA
X-Message-ID-Hash: TRZBY45PODAOWMFMECREHY6TA3GO4VCA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRZBY45PODAOWMFMECREHY6TA3GO4VCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 15:27:11 +0100, Mark Brown wrote:
> The RealTek SoundWire CODECs don't support bulk register operations so
> they gain no advantage from using the rbtree cache, convert them to use
> the maple tree cache instead - it is more modern.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: rt700: Use maple tree register cache
      commit: 049a78048e15ab276052d846c9692ea272699644
[2/8] ASoC: rt711: Use maple tree register cache
      commit: 0a5757293339fbbbb627baa7d2da65fd083c7cce
[3/8] ASoC: rt712: Use maple tree register cache
      commit: f438c799aa934fcd9b956083043b6f691bcc8492
[4/8] ASoC: rt715: Use maple tree register cache
      commit: dd08b6ddcb319375b4ee69cd02ce3298ca7608aa
[5/8] ASoC: rt722: Use maple tree register cache
      commit: 799457a3200b0451ca9859c77dd4e863f70ba608
[6/8] ASoC: rt1308: Use maple tree register cache
      commit: 4f69e29ace9dce5f8226bfc99b77b8497d3d3d79
[7/8] ASoC: rt1316: Use maple tree register cache
      commit: 6179a2e84f0b0b353079fe965d321ed25251c996
[8/8] ASoC: rt1318: Use maple tree register cache
      commit: 22691a051377763e6a4e149b7362944253fb434a

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

