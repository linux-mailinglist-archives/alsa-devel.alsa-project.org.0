Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4456248D1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:58:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0B11674;
	Thu, 10 Nov 2022 18:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0B11674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103130;
	bh=KpaJ08+7Inv1pshC88zvELNo+88rPM7Ao6Ms2xgVwr4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDEp83oL48tV6IJhmsQiPruECZ8GcMUOhaTzHGZswaSiZ60HhEN3WQYnUGNa0jsZm
	 qewUDoZ23Tsj2WOiQKx1zgq49f71uNoPIdk3Su9AUy0DvVlidahA5qMpgL8p4MMvU+
	 4lzbzQ0OCaucXQgoF6YsjPlo5O6OXtpvTQpj0wIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21FEF8059F;
	Thu, 10 Nov 2022 18:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02B87F805A0; Thu, 10 Nov 2022 18:55:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED9BF80587
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED9BF80587
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cg8j/HWB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FC3C61DD4;
 Thu, 10 Nov 2022 17:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA69C433D7;
 Thu, 10 Nov 2022 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102942;
 bh=KpaJ08+7Inv1pshC88zvELNo+88rPM7Ao6Ms2xgVwr4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cg8j/HWB5ob50pJvPFIFKkfvRbuOwO7e4EIdDgwNSsEhk5ZCKfv2OTVuwOd7WxDTQ
 ncOFrqlyGq1GM3XlvXvg3dwZEaO5vcBIb7nu+aKSz4Ta2PKVhPmphSaFTI7ER8OzNJ
 Fa3bJ79gsuHXcSF+pKByTuGvzO+s0yig9csgVMwIrQWGr7jKbwmv08SDN5IrKdG2DS
 yica+B3fMk4mz+q8FDTF9dK2o6W8wECBw+yVc+N1x5ys5MBhWcmlWC39PHGwf1bGC0
 EWAo+izxzhH6dfSmW2frzV/2feY3qyMEbPzm+fvfkOp3QKn9+RC82xJDpaV1paE+8W
 qMN9UOUrCVdtg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
References: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: get pipeline instance id from
 pipe_widget->instance_id
Message-Id: <166810294061.959181.16649379299519468762.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

On Tue, 8 Nov 2022 08:29:07 +0800, Bard Liao wrote:
> Currently we set pipeline instance id = swidget->pipeline_id, but
> pipeline_id is from topology and can be any number. In fact, the
> number of pipelines is limited. This patch use ida to allocate pipeline
> instance id and will be used for pipeline instance id in the IPC
> message.
> 
> Bard Liao (3):
>   ASoC: SOF: ipc4-topology: rename sof_ipc4_widget_free_comp
>   ASoC: SOF: ipc4-loader: get max pipeline number
>   ASoC: SOF: ipc4: get pipeline instance id from
>     pipe_widget->instance_id
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc4-topology: rename sof_ipc4_widget_free_comp
      commit: a29b2d029f79376fa2bdf18bd5285eeeb6bc73b3
[2/3] ASoC: SOF: ipc4-loader: get max pipeline number
      commit: eb2eaf50395a8164f4f9e0021609ddb40ad97e87
[3/3] ASoC: SOF: ipc4: get pipeline instance id from pipe_widget->instance_id
      commit: a2ba1f70b301b366666e739a1f951f57b8af2cce

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
