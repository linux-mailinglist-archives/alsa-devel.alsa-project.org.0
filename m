Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0A58EC3C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 14:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E0C15C1;
	Wed, 10 Aug 2022 14:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E0C15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660135525;
	bh=KA3dwPhdercQ+bjwAHZSLXEZgALOI5+blLRwOWv3xsk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4JTtPtgHqf55bXc7ZRqq9HnvL3wA8CGlS8+hg1d2b4LcOW67zC02CRrWcq9Jc/AS
	 FLIGGvHtLBbtYInOnOvCfdsZnfvmBIDEDREdivkxma3Z8J67qe5kVnZKIfW4ZaFbHc
	 ZelNkMaK1LiA7N64opi5vHVeSflGA++jrgbimS80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B59F80240;
	Wed, 10 Aug 2022 14:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C971F801F5; Wed, 10 Aug 2022 14:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1ECFF8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 14:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1ECFF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="huzI43NG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E6586135C;
 Wed, 10 Aug 2022 12:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB35FC433C1;
 Wed, 10 Aug 2022 12:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660135459;
 bh=KA3dwPhdercQ+bjwAHZSLXEZgALOI5+blLRwOWv3xsk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=huzI43NGmEQHtVQIKUKaIqn54Pe12Y2tnG9TuUhj4L2l086g3kuVZBX7gWMfyAQnA
 F/moX5+AjnGTvjlZJDBLinLQXTJhOd5nl2PzNTXDMJMkOIoxM88uyHsFYKWdnkA5Fx
 HePsksH3dwh4+EcrZTP5Zw2EkJg5qprCzZzXhuMxqUBFmt2IX/4rC43XvLZkWvLATi
 eMPeCCUV4a735dLWBOZV18fx8NVb8y4eWKqidwBcoz8bmXTdlT/liELClJke81WXok
 v2x67hTPveR5huz4hYwgl9iZ+LH8IVrmSQ/ZGBs5YF9McIslXt7HlmR1pbPL7KMbEr
 p0tBB27fxLTWQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 0/4] TAS2770 fixes
Message-Id: <166013545745.24388.6261052304965817378.b4-ty@kernel.org>
Date: Wed, 10 Aug 2022 13:44:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Stephen Kitt <steve@sk2.org>, alsa-devel@alsa-project.org,
 Frank Shi <shifu0704@thundersoft.com>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
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

On Mon, 8 Aug 2022 16:12:42 +0200, Martin Povišer wrote:
> The first two fixes should be straightforward.
> 
> The latter two clean up what looks to me like a mess in the setting of
> power levels. However we settle it, we should then do the same changes
> to TAS2764, which has the same template (and maybe there are other
> drivers).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tas2770: Set correct FSYNC polarity
      commit: e9ac31f0a5d0e246b046c20348954519f91a297f
[2/4] ASoC: tas2770: Allow mono streams
      commit: bf54d97a835dfe62d4d29e245e170c63d0089be7
[3/4] ASoC: tas2770: Drop conflicting set_bias_level power setting
      commit: 482c23fbc7e9bf5a7a74defd0735d5346215db58
[4/4] ASoC: tas2770: Fix handling of mute/unmute
      commit: 1e5907bcb3a3b569be0a03ebe668bba2ed320a50

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
