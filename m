Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445E299B50
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E5416BF;
	Tue, 27 Oct 2020 00:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E5416BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756238;
	bh=9AbYxVaOs4JLDjH4TqJYrI1yDoSHClRW3bLhQND9QQc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dy5aGddsT84PlLxrHTWakKsudOYABAKwporvb7rYqT9uNajSvP+Qr2/iJFqL+dnqp
	 YFTqwbOw7fgZNX253hbvOZRD3f6Hv8M3SxmCtmBDKu8h20alRFpmu73Mnp/P0LZVW2
	 B34Oxb35XgCejKs1VYCeyEKsl1GjBl9qayTuA9WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3666F80507;
	Tue, 27 Oct 2020 00:46:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AC5BF80507; Tue, 27 Oct 2020 00:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1A4EF804FD
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A4EF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ff0ltz1/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0B5020714;
 Mon, 26 Oct 2020 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755981;
 bh=9AbYxVaOs4JLDjH4TqJYrI1yDoSHClRW3bLhQND9QQc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ff0ltz1/baOuGcau/EHKSBsbDpjYtpS/+w4a196NqNZbOV09MvIQbqSe3lcPBS6v/
 VTjjxO6kXUm/95xoLikQuzTjXoRawaDc60RDg5oUspU/JAIqBLRLmVeHabJMKciP+B
 D53DOs3yz8C+/pHISFUY5D9sY3k5UtBmUomQduW4=
Date: Mon, 26 Oct 2020 23:46:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, timur@kernel.org, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 devicetree@vger.kernel.org, tiwai@suse.com, festevam@gmail.com,
 robh+dt@kernel.org, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com
In-Reply-To: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
References: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_spdif: Add new compatible
 string for i.MX8QM
Message-Id: <160375592348.31132.8709437914280376392.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 15 Oct 2020 13:28:47 +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx8qm-spdif" for supporting spdif
> module on i.MX8QM.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_spdif: Add new compatible string for i.MX8QM
      commit: 87b2fc1139a13cf81d0a95fb2cbaba7daeee8908
[2/2] ASoC: fsl_spdif: Add support for i.MX8QM platform
      commit: 516232e3609f485be04445b03723fbaed64a5321

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
