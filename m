Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6C40C83F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFF51833;
	Wed, 15 Sep 2021 17:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFF51833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719485;
	bh=XWxiO2KlemLDS/JBHi+KKV0/3h/x2DPr6xTOQUt2t9k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FidCL7LbxG2KvbEhEJYVrA47m0D9j23DjO3qh94uxEttrqyJWK4ScSc1u7htX3JdV
	 7hQmo54OK8/hUY20o8un86Ve1HV2O0E+Y2/EoQG3HmeDZlJ+avFQGWHLsY2Krbjqnu
	 /LL6eaBESf7ge0GYX5umxb8jyj7CWEUoz+lrZipI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 488AEF804E3;
	Wed, 15 Sep 2021 17:22:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3CEF800EF; Wed, 15 Sep 2021 17:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87157F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87157F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BCNXa/hJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCACE61186;
 Wed, 15 Sep 2021 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719354;
 bh=XWxiO2KlemLDS/JBHi+KKV0/3h/x2DPr6xTOQUt2t9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BCNXa/hJkU0FXK1LD1GDQxtjT4tgxlIflXNOMzETmmGzxhheyf8Sy/fnsssTXE8uv
 mNXv9kmG8MSFmdm6PCil6NaTQAXaXpPzmUEYX3AwN1xNjvXe55laEqkC/4AVw4L3Wz
 wMi2NYwd/BGHyEluR9+4lehkZ+MgxdrCg2jo+6/jkgsbUEWpaYtha22f8ssozZN88I
 ThOKRpX0VsrhVKsEsXU29EQ1siiy/DzSMWG4dmFJF+L9ovaVJ2Fx/WBN6Q6/6nt5hf
 bjWS3XbFiWXerLHqfkusx1rfD8J3CijiziLILbgj6QLAyZ4pugpWJ2EgT2JlYZWOo7
 l3Gg88QYASSUg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: SOF: Fix DSP oops stack dump output contents
Date: Wed, 15 Sep 2021 16:21:42 +0100
Message-Id: <163171901943.9674.14447227045564759721.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915063230.29711-1-peter.ujfalusi@linux.intel.com>
References: <20210915063230.29711-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@gmail.com,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Wed, 15 Sep 2021 09:32:30 +0300, Peter Ujfalusi wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Fix @buf arg given to hex_dump_to_buffer() and stack address used
> in dump error output.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix DSP oops stack dump output contents
      commit: ac4dfccb96571ca03af7cac64b7a0b2952c97f3a

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
