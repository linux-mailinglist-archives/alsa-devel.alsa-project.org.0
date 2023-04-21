Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27D6EAEB1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EEF9E9B;
	Fri, 21 Apr 2023 18:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EEF9E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093301;
	bh=pfCnxkTPPORV3FSm0G9duXfrOFnaYsyJwVbgzQuWlCk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O4Y0iiyaaggHhPgeT9YySS30WlHpB/ogQscszhBw0BMjZF6bjIRYj0HwY22WGLLcq
	 BC/MPjPFUaf2GBP/q/qaQH7jLO/OfGKKcXxHUyPrUoy5aClP/2ADaJLby/QjS9J53R
	 sewm5Is3DE+b/eEnt1OiBMU8SiMsNGxkZx516bCs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C85F8053D;
	Fri, 21 Apr 2023 18:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA69F804FC; Fri, 21 Apr 2023 18:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9764DF800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9764DF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mMJkUCLk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCF476518D;
	Fri, 21 Apr 2023 16:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78111C433EF;
	Fri, 21 Apr 2023 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093190;
	bh=pfCnxkTPPORV3FSm0G9duXfrOFnaYsyJwVbgzQuWlCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mMJkUCLkc/De54ytwNMSFvfjsDvMMcO0mjLIxHYSn7DRzGRE7IpVmPD6pFa2mD8Uf
	 DIbVRAeQ4HP81SuxWX0+5OszbH1gWyQ0K5e8L8T/jsIEKCffMoS+SNGaQIF1vCm+G9
	 m7D9WT9VFDqVGGmAROFT/nZmRlYoiRE27QZoALrDRoyKy6x9qaO0KBiGE/OtOEXMM8
	 HHCIWbqOmHaTudCeQ4Ynb68z1Ot20PyUfckUZoeZZ8fteJZ+4CLAOtRiJSiyey9Eoj
	 qiyZv6gBEEj2FJU8tebhiSJqhdrsniLhSErqyq+0QfRdgJNfF+F6Rk22muTF0dq8zR
	 orsruFrfGidDQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230419194057.42205-1-pierre-louis.bossart@linux.intel.com>
References: <20230419194057.42205-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: add no_reply IPC calls
Message-Id: <168209318921.108546.3812381475120656069.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: 3BUCYVNBHLR3DR4FAG7JR4KZ6XKTQJVA
X-Message-ID-Hash: 3BUCYVNBHLR3DR4FAG7JR4KZ6XKTQJVA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BUCYVNBHLR3DR4FAG7JR4KZ6XKTQJVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Apr 2023 14:40:55 -0500, Pierre-Louis Bossart wrote:
> Simplify IPC messages to avoid passing a reply structure that is not
> used later.
> 
> Changes since v1: fixed rebase issue leading to allmodconfig
> compilation error
> 
> Curtis Malainey (2):
>   ASoC: SOF: ipc: Add no reply inline calls
>   ASoC: SOF: Use no_reply calls for TX
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc: Add no reply inline calls
      commit: ccb541a00b5bf87f1b7b9301373bf88a3257c688
[2/2] ASoC: SOF: Use no_reply calls for TX
      commit: 367fd6ffa294ca3346902aa0814fac31bb5a6059

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

