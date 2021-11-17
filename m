Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABD45509C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:34:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6A318FC;
	Wed, 17 Nov 2021 23:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6A318FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188477;
	bh=Z+MeT6LT5Kb9JkETeAPAoQPtL76Z5bYCfF+s92dnR40=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xliq05eUB+MFEn806gu1d2yHOPhxCGvSvct8dws3UTqitdlFnFVHbgG+VEB7jShTH
	 HtkvVOP70KMAmleTYR9eQFRHk27tIpjRU6dy4JvDWFgcEkahJOlWVkrSJFpvJV88LN
	 dEq8tzw1LGxWGlwIJxrhdtJmMq+XhwrTFKL+wA1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1AEAF80515;
	Wed, 17 Nov 2021 23:31:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE1C6F804F1; Wed, 17 Nov 2021 23:31:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6DC8F802A0
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6DC8F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rN8HDXYy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A219361B6F;
 Wed, 17 Nov 2021 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188295;
 bh=Z+MeT6LT5Kb9JkETeAPAoQPtL76Z5bYCfF+s92dnR40=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rN8HDXYymUxaa8b0YMukBak1XAWQF82pA3DESm2D0B7qCbDzJt0qVu1K6HE1LbwDU
 SvRaDSunpkf7B0Te5m0t3cHpLhNlQG9mv1lFwXlxHfGPljxQyNlzZnQJBZJEdxagQT
 EtZPEpkuhlI5VFGzga+DWwT3NFxaLENq0uerKEbICOEIs10l/ebc800ExBhoulxZAW
 06Ax/ND55Vt15qV+KjWZbcX/JmnctVOROtNhJ04eW8Xixq+KJZrhFB2v+Y+lpyBiV/
 //hJRelwxWMRUMdCBU4wYoTHTzM6fl/GbLBOsa0b6AZrTQC+hf5RweAt6vZQlzU9oK
 eG1D2TYwjuSEQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, peter.ujfalusi@linux.intel.com
In-Reply-To: <20211116152137.52129-1-daniel.baluta@oss.nxp.com>
References: <20211116152137.52129-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/4] New debug feature: IPC message injector
Message-Id: <163718829340.136850.578880691226569719.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

On Tue, 16 Nov 2021 17:21:33 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> With the new SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR it is going to be
> possible to inject arbitrary messages via the debugfs/sof/ipc_msg_inject
> file and get the reply from the same file as a binary.
> 
> The main use of this feature is to stress test the firmware's robustness
> against maliciously (or erroneous) crafted messages.
> We also receive firmware crash reports with only a binary of the sent
> message which caused the firmware crash.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: utils: Add generic function to get the reply for a tx message
      commit: 8ae77801c81d16a09f6b67a6f8d91255d34f5f2c
[2/4] ASoC: SOF: imx: Use the generic helper to get the reply
      commit: 18c45f270352fb76c8b5b133b3ae3971769f8a22
[3/4] ASoC: SOF: intel: Use the generic helper to get the reply
      commit: 0bd2891bda4550774946abbfac88443a16c15d5a
[4/4] ASoC: SOF: debug: Add support for IPC message injection
      commit: 2f0b1b013bbc5d6f4c7c386e12f423d6b4ef3245

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
