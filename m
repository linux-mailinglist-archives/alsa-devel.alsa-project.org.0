Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227351C396
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29BAF17AA;
	Thu,  5 May 2022 17:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29BAF17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651763592;
	bh=6qY/H7PnXRQuP5EX1Md1pWAhX259HlPJLeGM/4Ewz2k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDiYqvwa7jmWPNVhAHxclnabN2qShkyzbqKOFmMJkuxJgLWexp4cx4GzCM//qakxH
	 N4zB16FPD+yWpG0HfkbVOnSKICauqcM+MQ8BbgBoAS5EsJm93Cud2JVpPJFt4J5G+b
	 FG61IjUpVVBoNGrmYcacXTYzunWL+lMYemchyZwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7B6F8016A;
	Thu,  5 May 2022 17:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26EC2F8016B; Thu,  5 May 2022 17:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FA5F800F0
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FA5F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f3QG3rn/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAA8A61CEB;
 Thu,  5 May 2022 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8E2C385A8;
 Thu,  5 May 2022 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763527;
 bh=6qY/H7PnXRQuP5EX1Md1pWAhX259HlPJLeGM/4Ewz2k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f3QG3rn/OIT/SgJu7aYWSfIAcUO43kIWsvpoIv1hAmJ81r7dzCoySPUXCH4xdy7Jn
 oAYGJYtyxdiZs7nmzSD6aJ8nO9opWGvRnY0wBUsj7JmyaBXqIv6rvJjeuxpkOBJLZD
 SqZRRRpHVXMsQnUptxYbaNRs740tFHIaCoLPwGS/+YM20cYSZ++/F6c5tf2S7mIVx/
 1vhpRxDcdU+FqxvLPJBgytlzpjEEM3MfpeIVZXDUrk6RROMoqQ6AeBDSAEnKkGhXLM
 KbACW6fxnEiUBWjpQ50kL+EviV/sGAm7jgs5Y2V7/0xjDGo9XL1kp5hZk1la1AQYhP
 py3i9oCqaFLjQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20220502120455.84386-1-andriy.shevchenko@linux.intel.com>
References: <20220502120455.84386-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: cs43130: Re-use generic struct u16_fract
Message-Id: <165176352438.543130.16785839452900264536.b4-ty@kernel.org>
Date: Thu, 05 May 2022 16:12:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tanureal@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 rf@opensource.cirrus.com, james.schulman@cirrus.com, david.rhodes@cirrus.com
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

On Mon, 2 May 2022 15:04:55 +0300, Andy Shevchenko wrote:
> Instead of custom data type re-use generic struct u16_fract.
> No changes intended.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Re-use generic struct u16_fract
      commit: e14bd35ef44606c7d55ccb3660cededd421a14a1

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
