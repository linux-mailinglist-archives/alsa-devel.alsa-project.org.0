Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D940DDC8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DEF1890;
	Thu, 16 Sep 2021 17:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DEF1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805477;
	bh=J+t7al1PC9YD0NGDY9k6SXHphn/KGCEQ2mYwq/v1CZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgSjS+or9t33fmn3YKLfnZE8oXMc8arB+tEY/ouzJcQMPRvBtZnfVuKneCPnrD9Fm
	 kHZKJ8PC+/1BHaz4/oaFWQH41uB9f2FcKeUkIY5Hlthx8NFoJZMcRZBMMJHOcQN16f
	 4wZ1Aiw7lqkESK4l/K4VmIUK/UkXSIaLGfqd933I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751C2F804E5;
	Thu, 16 Sep 2021 17:15:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49EBAF804E3; Thu, 16 Sep 2021 17:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E9C4F8032B
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E9C4F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NuiHnnpt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DB466112E;
 Thu, 16 Sep 2021 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805331;
 bh=J+t7al1PC9YD0NGDY9k6SXHphn/KGCEQ2mYwq/v1CZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NuiHnnptIL2hlOfDg4Np0aDW8q3FdOjlvWuPRYcOMc3MTuS1Q39w8JXtyKxB8LKai
 xKXEba/9RLv7KEkhmjYukCNcmObot3qgg++sNBlOjV0/pJUTG6Z6UooZfQmruGpnGa
 uH9KA+c3kyZiZ/G5NQmrVGzkmWKty2MPnqjClF5sSJoA4rGCmRRESdYbgJOIgyY6Pz
 0LJyWNFJdkkV6wb0jXxsQqDkHa00lCVcPaFomv9OZlO2BZfj/Cn7s8AbzgiwSE7x/B
 Qy/+Mvn06p16cVokpZGFqCQcweH/bR7AOa1C8iv4ywG1N6vNRXQZVfqOQLL0+olC16
 srxglsgcu7TUw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] misc: cs35l41: Remove unused pdn variable
Date: Thu, 16 Sep 2021 16:14:33 +0100
Message-Id: <163180495857.19842.15191192255466556936.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916082346.12001-1-ckeepax@opensource.cirrus.com>
References: <20210916082346.12001-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, james.schulman@cirrus.com,
 Mark Brown <broonie@kernel.org>, david.rhodes@cirrus.com
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

On Thu, 16 Sep 2021 09:23:46 +0100, Charles Keepax wrote:
> Remove pdn variable that was made redundant in an earlier patch.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] misc: cs35l41: Remove unused pdn variable
      commit: c6d1fa6c8f663bd49bfe7a20eccb0dc7e43db63a

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
