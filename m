Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C43518919
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 17:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DD286F;
	Tue,  3 May 2022 17:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DD286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651593168;
	bh=9NanTsR7u1YvPHXUBbajdoW6Gu4PT5r8nQaIC9rVc4Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BTAQdYIGKorAkXtUUVG97yYuPzKHvPl58U4JCEH18RZYXK50m8v0dv9Rzzgv0epyr
	 tj7m4956LhYDcOzufgxIpdLH775JgD12DmQgmpAfwpoOduLK9yz+9czAiRz1J5Dhip
	 W5gsP+7UIabMyjQ6n4dW15fYlr0uk9nrdN0eZbZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CF1F8050F;
	Tue,  3 May 2022 17:51:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B319F80158; Tue,  3 May 2022 17:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76B39F8025E
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 17:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B39F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h+tFXLbc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 014346168C;
 Tue,  3 May 2022 15:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F1FC385AF;
 Tue,  3 May 2022 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651593059;
 bh=9NanTsR7u1YvPHXUBbajdoW6Gu4PT5r8nQaIC9rVc4Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h+tFXLbcDFQL3QBa5OAnkcMHmqwDLOBRluafB44o94/hWjmsT2iQJrbmuDVxmMIfm
 ajUdhjD6WBy4G5vwM7Oei3TU8nm2DiKXe0cPbMoFjsmcunrbl0Z1M2+FnqvUwtD0h+
 Vke2bO1lUO96VS8KGFpqQfCdVm/jaJpRlJgDgGIHc0QiZ4wqW/YVM2MQHjRuWm1quL
 aryMqmrklIKSDMIij9M+3pU8HlFnUO4xr+WMdTE9QgGU5no4QA0HnC8zoWRYP5SuVA
 rsp3IySBLNeQoHBJZSznIO7crP3BzsrD9X57YMU842JXPXYhg5ElD3KwcUnhsCs948
 wpQA2jDscqk7w==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
In-Reply-To: <20220428161833.3690050-1-broonie@kernel.org>
References: <20220428161833.3690050-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Don't fold register value changes into
 notifications
Message-Id: <165159305846.184114.14148614569923073381.b4-ty@kernel.org>
Date: Tue, 03 May 2022 16:50:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 28 Apr 2022 17:18:32 +0100, Mark Brown wrote:
> DAPM tracks and reports the value presented to the user from DAPM controls
> separately to the register value, these may diverge during initialisation
> or when an autodisable control is in use.
> 
> When writing DAPM controls we currently report that a change has occurred
> if either the DAPM value or the value stored in the register has changed,
> meaning that if the two are out of sync we may appear to report a spurious
> event to userspace. Since we use this folded in value for nothing other
> than the value reported to userspace simply drop the folding in of the
> register change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Don't fold register value changes into notifications
      commit: ad685980469b9f9b99d4d6ea05f4cb8f57cb2234

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
