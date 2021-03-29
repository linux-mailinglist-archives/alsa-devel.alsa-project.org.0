Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849A34D8C2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 22:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8DBE1682;
	Mon, 29 Mar 2021 22:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8DBE1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617048104;
	bh=cagF9z9H9XGRlnG7ZauPa6/nZ/FK4Kpymd5hlVK8rts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6KZ+QIcApwdmQcrvmoZXOeuYU0KvpFidCn89usOdSVFKqHX438HvxLjVNa3CXMbE
	 TRFThVDpfWJVeGywiwEuplvXWQd0Eom0YUtOHP2yFJLKK+Lfg9qCTsqUlqs90WhmbX
	 Nn/lKo8Fs5KuQpm3TeIjwJ8KNV39c8cQDtjY6Vig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F1EF804AB;
	Mon, 29 Mar 2021 21:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B626F8020C; Mon, 29 Mar 2021 21:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94572F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 21:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94572F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eGGJIm0v"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4773B6198F;
 Mon, 29 Mar 2021 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047919;
 bh=cagF9z9H9XGRlnG7ZauPa6/nZ/FK4Kpymd5hlVK8rts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGGJIm0vgz4kDC/IT5mC80M18rk/rLEWgIEEOmornsFsc5+agI+pyQUQnSdvq30Ky
 1BOTFIBt05gox5l5z9xPpPTbGtRd4y2IhTpHYWlQqOqKM8k4k0QnFQkt6zKhWJvJCO
 VawOnwXbIjifyaduY7pspYkZzzVVWN3DOaraJ++izK4NEkwXMgQuaSzt/HDyXjy/Pm
 JNGZhawMr27KPIqz5aZuT3rxzviVd3AcgOW53cPBN6FwGlklmpsa6AvJdlBJl8xCwm
 1xJovr1iF418Ax0G7CKjpQ+hP1Q4B2gH6lRziA699RPQAnqyj7iGdA2VyKRdpRfXY0
 AIWlInuwaZ/8A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: SOF: parse multiple SSP DAI and hw configs
Date: Mon, 29 Mar 2021 20:58:12 +0100
Message-Id: <161704724765.10039.12657890713396706992.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326165150.255533-1-kai.vehmanen@linux.intel.com>
References: <20210326165150.255533-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Mark Brown <broonie@kernel.org>, yung-chuan.liao@linux.intel.com,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

On Fri, 26 Mar 2021 18:51:48 +0200, Kai Vehmanen wrote:
> ASoC parses multiple hw_configs defined in topology. However currently
> in SOF only the first config is used and others are discarded. First
> change SOF driver to parse and save possible multiple configs in ssp
> case. Also save the default config value provided by ASoC. Functionality
> with only one defined config stays the same.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: parse multiple SSP DAI and hw configs
      commit: c1c03888f1e89e669aa6da0c9a491f02fd6a999e
[2/3] ASoC: SOF: Intel: HDA: add hw params callback for SSP DAIs
      commit: e12be9fbfb91173b3aa358466ce0474823be2695
[3/3] ASoC: SOF: match SSP config with pcm hw params
      commit: c943a586f6e49998b323afbd7f788afabf6ed89b

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
