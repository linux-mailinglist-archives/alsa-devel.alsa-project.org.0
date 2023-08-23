Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B283D785D3C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CFBA86E;
	Wed, 23 Aug 2023 18:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CFBA86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808096;
	bh=rNfZoHGrJxEx66+XWnl4ed77OnPtmZCdQF51z+lbUPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=givjHdtnsDPnGNmpU2VKRQ2osJ7VveYt5s2aBBHxx4aqp+IEEQoAKzezk/CegJckC
	 1cexKuL/nszWVmAg64GRa55hi49dwLDJyyRJy5ddGAxtHKViChgFMLaSV3hunnQ8rL
	 Vl6OH6wxMU9CojLQIEfmhDt1ooaNbHyvFd9Qw2N8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D693EF80571; Wed, 23 Aug 2023 18:26:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56875F8055B;
	Wed, 23 Aug 2023 18:26:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C85F80553; Wed, 23 Aug 2023 18:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3DEFF800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DEFF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GVI58jIH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F8A160B51;
	Wed, 23 Aug 2023 16:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4524CC433C9;
	Wed, 23 Aug 2023 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807980;
	bh=rNfZoHGrJxEx66+XWnl4ed77OnPtmZCdQF51z+lbUPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GVI58jIHI7FivG8k3bPdoNX0LFu3usBwEm5yCFzdiZCHNvPr7XNzB7wN7srOvhVGF
	 dO4S9bExRH2W2MB0bpFkfDn8l+xGQE9jHPlO7ZiOKlEs/V56IFGHdXJ7K7JlEGRbtL
	 InqvwP4QCtLXtaIdUqteysF1J76Rnb/rEHqtRKJR8CF/adoUVtArQbBte184e3w2wk
	 c0Abq5rugFWetIe05JM/ec6oE4VchioIFuY100uqdb8KYpLUZwvHIrhA40B4KE3xju
	 Yz/ivJuTbTf7vNeb+oJ6MNi0dGAWkHdg+wTPpgNOr4RFtSNZHsJ62TfSkOjzX+rXDo
	 PnvPV45wqWqtw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: david.rhodes@cirrus.com, vkarpovi@opensource.cirrus.com,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230823085308.753572-1-ckeepax@opensource.cirrus.com>
References: <20230823085308.753572-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l41: Correct amp_gain_tlv values
Message-Id: <169280797900.53791.9749470272910236654.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 17:26:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: PNICNWEG7BJYCKCD6QOU4W4LYQB5LVGW
X-Message-ID-Hash: PNICNWEG7BJYCKCD6QOU4W4LYQB5LVGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNICNWEG7BJYCKCD6QOU4W4LYQB5LVGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 09:53:08 +0100, Charles Keepax wrote:
> The current analog gain TLV seems to have completely incorrect values in
> it. The gain starts at 0.5dB, proceeds in 1dB steps, and has no mute
> value, correct the control to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Correct amp_gain_tlv values
      commit: 1613781d7e8a93618ff3a6b37f81f06769b53717

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

