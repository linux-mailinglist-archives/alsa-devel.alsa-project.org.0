Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1636732A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 21:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2551678;
	Wed, 21 Apr 2021 21:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2551678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619031980;
	bh=7GJ8cImrhwp/aVc1CvIyt2v/wm9ZxwmqrHc9zmrTxUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVc4WbSkRt+dt26jR8T/CcHPC7be+ZUlwyrjK46WNaJMS7hlOMPcKAUqzM1PFi+zk
	 pK1GdG6hCreL405Y1ARm3zJd5TmEjV+dXk5HQH+frujqDpMUEG6nuHoSnIc/5H3hOj
	 2ZZMTnzQdLrky5Biq1zcR2hPxRTofns19NtwYi9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 235C3F80256;
	Wed, 21 Apr 2021 21:04:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E435F8025A; Wed, 21 Apr 2021 21:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 803F1F800AE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 21:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 803F1F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m6XEr+EZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 980D761453;
 Wed, 21 Apr 2021 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619031880;
 bh=7GJ8cImrhwp/aVc1CvIyt2v/wm9ZxwmqrHc9zmrTxUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m6XEr+EZVlhZlmYiaxTNaN8ELdU3q5cKMkqwbQnpmj6OC/+CNJlNObpreszM8bbLV
 eomV2T9ZZWldmfYF6kGtbgfw2sTiFVmG7vCAZJH9sJ8pvlyTKgjFlRBOy9dysCS6kC
 2jExxl7CEELCKaGSt9LbHo6S5gG1+JH1e2OFPazlvJESQcbTfSN4qDIazFMM3Pnst6
 7YGnlEjH9erEDBaLJYsMuA0tSEXGVk2Z+TE/KTSjjtNv0E7gfN4Apd4C3lPHpyOnIw
 hPOkP5cDCKw/DDHot9Ztn+BoTo7eBIPAyecY959EoA4FpdXXoOSzkc1ougYUz29PgA
 QBcRNShZgABvw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH] ASoC: Intel: KMB: Fix random noise at the HDMI output
Date: Wed, 21 Apr 2021 20:03:36 +0100
Message-Id: <161903027032.13397.5757063542180832008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210421005546.7534-1-jee.heng.sia@intel.com>
References: <20210421005546.7534-1-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 21 Apr 2021 08:55:46 +0800, Sia Jee Heng wrote:
> Random noise could be heard when playing audio to the HDMI output.
> This is due to the IEC conversion is invoked in the external loop.
> As a result, this additional loop takes up a lot of the processing
> cycle.
> 
> hdmi_reformat_iec958() process the conversion using an internal loop,
> it is safe to move it out from the external loop to avoid unnecessary
> processing cycle been spent. Furthermore, ALSA IEC958 plugin works in
> 32bit format only.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: KMB: Fix random noise at the HDMI output
      commit: 62bad12bceebd7d336ced4e44f408b702c151ba0

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
