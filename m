Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643303ACAA1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 14:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21881739;
	Fri, 18 Jun 2021 14:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21881739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624018208;
	bh=7qgOWH+nPcb2n6CEaH8HR2FF25lTlE4tAE8bf61gk/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+qPyqQRNMwUrpB4hColASpt6tBvuoG491I4RpHrrcoAElZzxMI5QYieo0ok1nYlk
	 KTlfl2bRxHFg9raXgf6sBgISy11oscIBc/kxRRMO1ckKKOztDzOd8X0J4n/qyIrrD0
	 xU4BolYJndjFpfPMzDyx7hzJu632UdSHHHrUe1pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5967F804CA;
	Fri, 18 Jun 2021 14:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D558BF80084; Fri, 18 Jun 2021 14:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43291F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 14:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43291F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bgWnRLDs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 002FD613EB;
 Fri, 18 Jun 2021 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624018099;
 bh=7qgOWH+nPcb2n6CEaH8HR2FF25lTlE4tAE8bf61gk/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgWnRLDssZJpxPfygsD+SOhyfBaYcSuwZvA7pBGgiCVv2zqvo5aMG+lv4ahDHiGNQ
 VXydgXhDNzxmYKp+ATYVdKRQ+wuHUby2A237gLXe2LXbHjcfE0OtksCRhmKjJHCsHY
 ibhuTCN/YTSdHtRrhxeoh0btoHnh28h8+AskaLOZXd+61jwE/yCeKq8aTd53mnP7i+
 eHnQV3ociVgEBrbvBMR7Bnd0QksQuUTU3HDAP0s5d39YZNXBi+mUzKvuk3dKxNM/Y0
 HOkuPIehep6Cu7xzMTmSbeUS6mWPewaykw3CIfrY3fh71ziSj4woKJCl9OfV2bsPw4
 hJBECVMvJaupw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] ASoC: fsi: fix spelling mistake
Date: Fri, 18 Jun 2021 13:07:54 +0100
Message-Id: <162401758813.52682.15832699521448200223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618085324.1038524-1-f.suligoi@asem.it>
References: <20210618085324.1038524-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Fri, 18 Jun 2021 10:53:24 +0200, Flavio Suligoi wrote:
> Fix "thse" --> "these" in struct fsi_stream declaration.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsi: fix spelling mistake
      commit: eb1e9b8f581a48943073c60adc3cd3cf63972580

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
