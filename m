Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F162D678208
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:44:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C751DA;
	Mon, 23 Jan 2023 17:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C751DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492242;
	bh=Gp/sHUAF/Y3sVRfaZNIQFlqIoGtOg5ivA5AeoKmU7nU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j41gtkArf/35klj2CkxDIe/82u+rrFS0MZ/URnmNiAya8weU41udQMleLqELI2h18
	 wrkQzIuD504DME3sU1g8OiHzgxQv4Oe8ImnsvUkc9fySGqKqTnnF2AJxycDMKmK655
	 jlhP9b0NrBDrNmVL9/T+M0nTZVI6SdZixdRH1et8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90B1F801D5;
	Mon, 23 Jan 2023 17:43:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CEF7F804A9; Mon, 23 Jan 2023 17:43:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05ABDF80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05ABDF80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BYFJLINb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CB1E60F6F;
 Mon, 23 Jan 2023 16:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14C7C433D2;
 Mon, 23 Jan 2023 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674492176;
 bh=Gp/sHUAF/Y3sVRfaZNIQFlqIoGtOg5ivA5AeoKmU7nU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BYFJLINb1MVlmux8e0wgfeCtt2XTXSejtsdRVSTGO3jhyuxPuk1165Y0/ag40/fzn
 v7ZJ2e2gyLMdKkvT8tvvNSWPDV2fEAvE56eGrwcW57oZIL9Rx5GxFR63wDWU6FKcfF
 3fPbPaERoSLO4C38Cd4Y/BqFaW6BZJWgoI4tDbKTtXumipDzRLUFuVoI+QoVgac8Tf
 r57Rnj7CarrFVwi6b3/uyrE4hscmuQ56XCSx6kXVTYiGHwnWpWqxkhJRb3pXF/RdeM
 HIMFoemrsMxp8TIgNs3tzA9kBOiht1e0kwah7J1l/kf+hchezULDOikhAltdCFV/b4
 ipQKdBiaq8s7Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230123122144.1356890-1-cezary.rojewski@intel.com>
References: <20230123122144.1356890-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Simplify probe-component implementation
Message-Id: <167449217425.1484410.9989028192081889435.b4-ty@kernel.org>
Date: Mon, 23 Jan 2023 16:42:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 13:21:44 +0100, Cezary Rojewski wrote:
> There is no need for the probe-component to be part of the PCM component
> list as it does not make use of ASoC-topology and does not participate
> in creating any PCM streams.
> 
> To achieve that, remove probe() and remove() functions.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Simplify probe-component implementation
      commit: f337703b229f6031a40199dfe050e04065cea0e8

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

