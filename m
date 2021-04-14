Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11035F898
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 18:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACA4167B;
	Wed, 14 Apr 2021 18:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACA4167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618416518;
	bh=BPlhBuiYRkW4vB0YGvE5clIuOpYnoQwsKGoAS9ZehhM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ac7ER8Bs1lLqBsmz0aaCILpyV7HARTKNFOghq3IDMZujK1rL7OFV4T+zbzX/4u/Mo
	 fQ5zQ8lNoHBTR+y3Cc0hyyRtu4fWsxMEP8Rn4yWpDwGNlvXd0lJdSc0DrhCy1Vd2Q3
	 i8STNmeHD+zWMysKgl+0Hv9UesNDt1GgYV8GVQg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9451F80278;
	Wed, 14 Apr 2021 18:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D595F80271; Wed, 14 Apr 2021 18:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5212FF800EB
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 18:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5212FF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CFQt6bK6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C19D061179;
 Wed, 14 Apr 2021 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618416410;
 bh=BPlhBuiYRkW4vB0YGvE5clIuOpYnoQwsKGoAS9ZehhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CFQt6bK6bi9ufRvVIHDJ1FOwMBnGKV1FbdyJ/T/XiKircSoWb6ODOR7fZNcLIQlPu
 Zhucq1fRYHWUgwCdQRQj35kvk6Ir8RFZghNgmQ5rlY+ID4rJGBBdgDg8jpe8YnuO5X
 0cdeYtq8BzgNcVxl0kpLbQnN6FBC+rrcxskTNy3uyu5AOyfvQgSlPhGK2DEpBFiX3P
 T3pQ913H7UjG7bVK7XrMpaK7T+MP6WPyCDbcRBi9/MjgyzWCbItIbBCmoSFGg0SKuh
 MaeT5eABQZraoOzLJ9zeqscZg3CB9EGWL9lQ9/rKzQRu9GuFxiz5vZhugLWIcfO/8/
 1YAmEQpyytcpg==
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>,
	james.schulman@cirrus.com
Subject: Re: [PATCH] ASoC: cs35l35: remove unused including <linux/version.h>
Date: Wed, 14 Apr 2021 17:06:21 +0100
Message-Id: <161841601730.20953.11471604452451396638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1618380883-114841-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1618380883-114841-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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

On Wed, 14 Apr 2021 14:14:43 +0800, Yang Li wrote:
> Fix the following versioncheck warning:
> ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l35: remove unused including <linux/version.h>
      commit: e42b6e813f4231d3c38362fd800724bd41040ef9

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
