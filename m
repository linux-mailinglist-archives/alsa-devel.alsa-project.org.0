Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 143548C6B7D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 19:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6498483E;
	Wed, 15 May 2024 19:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6498483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715794319;
	bh=UN45XrcplBiWIwHLzWwPDlPwnn1T/rCPSLHiiDtQLpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k5k4Sel24gJec5Dqn4egNAi6cB3jzcTETU3uH1ccocEhfD2p4oBoqfZLcJIx+vn0i
	 UDOCrSAaatXBZGOhD+P/wCY8Hmx7/BnIhO6AS9MY8AiLTUdwVWAS6ds+0DL0P2y3Qq
	 EIzhNyjAuWR5LNRqpaXV3KhzfFR/ZL7eY0y56Xdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58299F805AC; Wed, 15 May 2024 19:31:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55D9F8059F;
	Wed, 15 May 2024 19:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0438F80224; Wed, 15 May 2024 19:31:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F9F9F800E2
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 19:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F9F9F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pfJOufAp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0798160A77;
	Wed, 15 May 2024 17:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC77C116B1;
	Wed, 15 May 2024 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715794266;
	bh=UN45XrcplBiWIwHLzWwPDlPwnn1T/rCPSLHiiDtQLpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pfJOufApdasnXCKoXlRIZfpVpNIduLNcO4l4CsOVR8Oj/U8FkU1oZb41CHLYOEnr/
	 0TWxTSFSUNyBXUTWCPSBgmvfGGHYZEovrs+iM5YQCyXPuAFp6Odd172nQgSjgBRstS
	 jPaahhwug/vbKHTrsXmAJYERR7fcGFNZr/+xI6be7UJZJAhEBR8JSxDwBlaMaYsM5s
	 m7767lqDkJm03q7Ti7cgLIaLx3Yu74W2uSpgFfnt5ulY8IBtwX/hLdP5RrLCcUkZPj
	 1gCcUp97HOn3x4l/Q/VJ79fesygdT8k/r4R0bvT7LrS9wW7X0qjVGSVxag2iyJ/moG
	 nIEtVb5via//Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240515062517.23661-1-zhangyi@everest-semi.com>
References: <20240515062517.23661-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: solve hp and button detect issue
Message-Id: <171579426467.205011.15007558060787175576.b4-ty@kernel.org>
Date: Wed, 15 May 2024 18:31:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: PGZ4ZEUH5Z3EU7JBZT7DNUHC5VCVKVHU
X-Message-ID-Hash: PGZ4ZEUH5Z3EU7JBZT7DNUHC5VCVKVHU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGZ4ZEUH5Z3EU7JBZT7DNUHC5VCVKVHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 May 2024 14:25:17 +0800, Zhang Yi wrote:
> We got an error report about headphone type detection and button detection.
> We fixed the headphone type detection error by adjusting the condition
> of setting es8326->hp to 0.And we fixed the button detection error by
> adjusting micbias and vref.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: solve hp and button detect issue
      commit: 714f5df027b085c19c32af6f08a959bf35b9fb7c

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

