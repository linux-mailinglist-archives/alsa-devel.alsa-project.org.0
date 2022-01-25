Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515A49B13A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959C02083;
	Tue, 25 Jan 2022 11:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959C02083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106187;
	bh=lHbr/XHtohtZv4WPTENAycbeFslCLLfzxFh1ho8lZgs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JV9Rtx6R9MocktMtNgAhzTV/AMu+NJgbOnEUztdlS+n8u03VI8/eNHCnUn1cm0Zik
	 94rxd9TPZ+UH4H3b5dikeH8RybayY90IOJXB+nQ/1uuP/8hgS4IaTc6bHKpXRTl4AJ
	 EYpu4vth8P5dasPpqoqHhM1adX6tZkZ+lEvVLIfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBFC5F80528;
	Tue, 25 Jan 2022 11:20:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F819F8051D; Tue, 25 Jan 2022 11:20:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED80AF8051A
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED80AF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jNURRxl1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A1FCB8174B;
 Tue, 25 Jan 2022 10:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C82C340E5;
 Tue, 25 Jan 2022 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106028;
 bh=lHbr/XHtohtZv4WPTENAycbeFslCLLfzxFh1ho8lZgs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jNURRxl14bETE3BtGe0qCU395qFA0Kx4q6IVWgyK/MP8hKX4rlXVC450RpYifAgLz
 amsiHAMzJptke7eXPMElmmUibwYuTkiiHS12MYNgibT4EA53R+/sjxRu1/QEDz7NsQ
 cALJlDqk01DZrmCrWMoxpTa82MG52ARTYO78I5TEgLqzeIIYP0vmP/dG98s6+jfc5+
 UM6K7JGVNdJEJyQA82toL6u0W/GcV6+Z+yPAAByqH0iQ/p75ek0OO46M0UFUlrm3vZ
 +yp2kHGc2nbY6Iz6JIUF4sB59Z9WfPjOIoirIeVEexhehBLt9qD7deWiz2OadueUDh
 Y7l2TQuJs3s6A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Beer <daniel.beer@igorinstitute.com>,
 devicetree@vger.kernel.org
In-Reply-To: <cover.1642298336.git.daniel.beer@igorinstitute.com>
References: <cover.1642298336.git.daniel.beer@igorinstitute.com>
Subject: Re: [PATCH v3 0/2] ASoC: add support for TAS5805M digital amplifier
Message-Id: <164310602619.74844.8879999031786613742.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Derek Simkowiak <derek.simkowiak@igorinstitute.com>,
 Andy Liu <andy-liu@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On Sun, 16 Jan 2022 14:58:56 +1300, Daniel Beer wrote:
> This pair of patches implements support for the TAS5805M class D audio
> amplifier. This driver, and the example configuration in the device-tree
> file, were originally based on a 4.19 series kernel and have been
> modified slightly from the tested version.
> 
> This resubmission differs from v2 as follows:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: add support for TAS5805M digital amplifier
      commit: 2e5a74c68d601b11a496f91f76fa7bb236d10bd0
[2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
      commit: b8aec7a4a01b75973c22f004377a48593a3fef03

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
