Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D278425F42
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2901664;
	Thu,  7 Oct 2021 23:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2901664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642747;
	bh=LnM69uNfSHqFm/JN32p/Z48yLK7e9Udj6Zp+QoLE4+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7gbc6ruI+jrh7zimMzoZ0nC2t4rFN78h7gf/+z04+f9u/TkMlcuB73elUBgmrVeU
	 yCRc0QOmKfreaATeAaVaTAPNZCED5sToGOWtZv9dGyYX3NMfdL+vUo3Cv13XMEK1p4
	 QpGQKIG4hs3jjMA0H9jDHiAYKlSiNiXwOjsrh1GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D98F8028B;
	Thu,  7 Oct 2021 23:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C360F8028B; Thu,  7 Oct 2021 23:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C918F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C918F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C/NxVNmC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 769C560EBD;
 Thu,  7 Oct 2021 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642662;
 bh=LnM69uNfSHqFm/JN32p/Z48yLK7e9Udj6Zp+QoLE4+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/NxVNmC8TapIoPJI/2BXWPniDR3aZwE8q24Or+tcTfs6IevxBGUhzFRzuOEFBYRl
 EFh5Xw7NSQbr4qtGbh+VyBBgEGcwhfKVVRQ1g4O3UbnTOzsx2O1gqx8Blt2X8osOCT
 v/oowuF4VLDKA+3saL1ijOiOZ9OCdiRUYuLmmw8CWpCQ6Ty9bkuBSMd4CF7I9J4c9f
 oc1pmDqtG+WvKBRHqhR1XBIRY1gmIhz6Rc5JuQIk7AD0G23corbH+1l/0rCjCUp+ce
 746Areb1KOvw/atwBrlphWNvJdQ7yW+Vvtgze98+NX6+PMcAzc4/qqb1gaR1SWh5gI
 EDTjdn2pucjMQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org,
 perex@perex.cz, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 plai@codeaurora.org, swboyd@chromium.org, srinivas.kandagatla@linaro.org,
 bgoswami@codeaurora.org, judyhsiao@chromium.org, lgirdwood@gmail.com,
 rohitkr@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH] ASoC: codec: wcd938x: Add irq config support
Date: Thu,  7 Oct 2021 22:37:23 +0100
Message-Id: <163364264608.649699.14778607826601877244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
References: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, 7 Oct 2021 19:21:15 +0530, Srinivasa Rao Mandadapu wrote:
> This patch fixes compilation error in wcd98x codec driver.
> 
> Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wcd938x: Add irq config support
      commit: 214174d9f56c7f81f4860a26b6b8b961a6b92654

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
