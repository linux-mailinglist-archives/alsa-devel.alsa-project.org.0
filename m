Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB42FA58A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:06:03 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1CD184B;
	Mon, 18 Jan 2021 17:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1CD184B
Authentication-Results: alsa0.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzaQPszK"
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91248F80253;
	Mon, 18 Jan 2021 17:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE015F804C2; Mon, 18 Jan 2021 17:03:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6997EF8016E
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6997EF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DzaQPszK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EED4722C9C;
 Mon, 18 Jan 2021 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985810;
 bh=QXwKP4DJh3Kn2ggUnJljWCLaQYV3zf+1V69gurgjk8o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DzaQPszKrsXyNhHeNY/bJR0uJ+USaEuVxsAhqZTq8B739YmF1fPIlKZaJmuKLg93h
 HnRvborY50l/6rrfIVe/L2YaWSMAlp4FnOVA9WZuSE9sLV16SR+KktP0lCy6TgraxG
 IrQNevtu9h0XRh6MgFpb608i8rm5FqEk9j6l/lK0QVVbdKfkopShCccF6xNnC/W7SL
 RVQgUmuBo0pWHDLu7tz4XgsbbBscqZvbzQxdrqLYp/t1gxKX8ofxIdH0LMH9j6JWb6
 3VSkK/uJ9qBYvHKIgX9XmkYJBQ0JoBhbte014Jj4kkhotw6LQuTEmYHNdU3tjpiNbU
 2Gyi7zgvrh4tQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
In-Reply-To: <20210118102706.6125-1-michael.wei.hong.sit@intel.com>
References: <20210118102706.6125-1-michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH] dt-bindings: sound: intel,
 keembay-i2s: Fix dt binding errors
Message-Id: <161098576158.26872.386153958098693344.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, jee.heng.sia@intel.com
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

On Mon, 18 Jan 2021 18:27:06 +0800, Michael Sit Wei Hong wrote:
> Fix devicetree binding errors caused by newly added parameters

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: intel, keembay-i2s: Fix dt binding errors
      commit: 160e8f96c626ae2bfeef18df467fd9f3814ec89a

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
