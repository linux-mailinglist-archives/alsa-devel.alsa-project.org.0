Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F53346BE2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 23:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886EE167F;
	Tue, 23 Mar 2021 23:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886EE167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616537658;
	bh=8jHtcyQnu/VSZYfYhOCQiM7CrK40g6+TchzXrIUIuug=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7cX570crB4m2nKV6iOUwR35xlt5Kh5fvwemNc/DrKPcjDq4mjB4/PFUccW6NU31p
	 g4eFrkXhYIujsya+gqVDK5UASOgsWMSb9KVxu6QVMJD8VZ8sxeM3vJ8EJpGSpMKwuq
	 UZBDYiK2HWuRT20JBKfZIzt7Py6T6D/UEK72wvMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FA1F80290;
	Tue, 23 Mar 2021 23:12:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69393F8025F; Tue, 23 Mar 2021 23:12:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B5ECF80257
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B5ECF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fRgyxtLW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F136A61879;
 Tue, 23 Mar 2021 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616537548;
 bh=8jHtcyQnu/VSZYfYhOCQiM7CrK40g6+TchzXrIUIuug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fRgyxtLW3cqQO38t9DeYJvCeUKmJOLFEXGoVcUj2ED73u1drKmzrMkW9d1e56dsGZ
 LFg0YhT1CtUBILN1bBXBzPHTFgMabgxcRYIC9KVmUhQBI4YpL0SEiUicIcDbi6YwDY
 BuEkP/ehHozo5d0ay517os4rXsoWwt1f76C9nEAF3+5w3VmSMFwtS4nrDOkMphptWq
 /RyoV59+M5ltj7VNJcg3WMb6Xq7xP3ntaSwPECI/BkWx+3K57x5mYz5rCIdcSHpanC
 YZfFZXydf5auT138CSZKvsz+ihRt+tBCmt+0DQVzyuLCsOlDLbAWgIvN9M6qomDuTB
 yJJAXmjJasLPQ==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: drop display power on/off in D0i3
 flows
Date: Tue, 23 Mar 2021 22:12:13 +0000
Message-Id: <161653747938.32729.17016573143292707136.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322143830.3880293-1-kai.vehmanen@linux.intel.com>
References: <20210322143830.3880293-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Mon, 22 Mar 2021 16:38:30 +0200, Kai Vehmanen wrote:
> Controller needs to ensure display power is enabled only for
> HDA controller reset. Drop the display power-up/down calls from
> D0i3 entry/exit paths.
> 
> This was previously not possible as codec drivers could not resume the
> links, and instead controller kept the reference to display power. The
> state of display power had be maintained in the D0i3 entry/exit code.
> With commit 87fc20e4a0cb ("ASoC: SOF: Intel: hda: use hdac_ext
> fine-grained link management"), this is no longer needed and the code
> can be cleaned up.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: drop display power on/off in D0i3 flows
      commit: dfb81e3b5f47aa0ea5e4832eeb720bc22f07d0c1

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
