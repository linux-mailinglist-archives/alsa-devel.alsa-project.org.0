Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC283FF085
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 17:52:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C5E1662;
	Thu,  2 Sep 2021 17:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C5E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630597948;
	bh=n+fcc/Ub9f6mKkgV3xaS1g7ny+8ESxl5WnwJsctvzG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2xfeT/ydPTU6cOfLA5ffQiBrkQG1OpvKVg0pcJnXZ97+QaAdqwCFr23slaKbxvtC
	 R4D6Chsqr3+La1VHC4ucxZuAVClBBiqxXifpX5w/6T7WipMj7ZbAp1gqQJjPKxk1XV
	 iaXlKxBzyu3wg0XNB2ubdvocB6YwuyJNsGu9uJEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F61CF8028D;
	Thu,  2 Sep 2021 17:51:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D1BF80269; Thu,  2 Sep 2021 17:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19F7AF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 17:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F7AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uX6Tyh5B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6C6D603E9;
 Thu,  2 Sep 2021 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630597861;
 bh=n+fcc/Ub9f6mKkgV3xaS1g7ny+8ESxl5WnwJsctvzG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uX6Tyh5B7FV+nIUoIKjPXxp97L37MM+R+QE3KSsOWCf+d6Poz17k91CJ4s1akYrr+
 AX8m4b4SwPERs1b+1zvGxtHEWx4QU1g7nh80JyhE/Y1AKFE3TY9K4UIBwnJD6E1a0f
 ppy76lt9kUw/8GcccfhymlrdgqLKlCyRrC/Ahp/oy7vCnib2eaQ4cSo6AM91UG9kww
 YjMABzgIvPI+cGALPlMbfO4XUF1IaBr2bgGYxYxn/eWwQd5SBk7KDsXa+t0mNO4kZn
 iKuBQv6Az5yMfsYvFfYiE01OZT/+QqJziOQceBjzD7n7pAeV/cDlv27GVbbMg9gv/a
 1t04SjAV9K93A==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for
 i.MX8ULP
Date: Thu,  2 Sep 2021 16:50:29 +0100
Message-Id: <163059750027.34506.2833380124820785822.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630553525-25655-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630553525-25655-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Thu, 2 Sep 2021 11:32:05 +0800, Shengjiu Wang wrote:
> Add compatible string for i.MX8ULP platform which support audio
> function through rpmsg audio channel on M core.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX8ULP
      commit: 4f89ff026ddbaab49dba993ad2dc757920d0ad49

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
