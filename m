Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA633983E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 21:26:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403C718AD;
	Fri, 12 Mar 2021 21:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403C718AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615580816;
	bh=PiAVnNdcv0wxF9iybfaUy8tQqGnHkVEy3c5oroa2KHM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iT7w8PeAjz/CGHWyIqUf8AdprkpSo4wdb1BQPClR/v0SapcqaNz7yI32uTfvIj5OU
	 i4DkYovVs5XGY+INa/ZePY+HNstTSSapgNmez+YicDraaHaEaYJ5fjqipooryMnopE
	 nuiXbn1Omy4TwsGd0cmNXIfljQtlNQo98Wy5amRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018AEF80279;
	Fri, 12 Mar 2021 21:25:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A047F8012A; Fri, 12 Mar 2021 21:25:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD4EF800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 21:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD4EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o8FQyHky"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3700A64F85;
 Fri, 12 Mar 2021 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580708;
 bh=PiAVnNdcv0wxF9iybfaUy8tQqGnHkVEy3c5oroa2KHM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o8FQyHkyzFenyo0UuWd6wh2j7bC0C04wtwqWUTHR4M6gmRaPuUJJ0NeDg8Fmlanw2
 KSYKf7p7QQ4SNM1I7HJv4xWx58gznLpo74xx6feJk9xU386bqRU9lIITw7CfVHOWsy
 atv/kXx9b2boDhplUT1gjRlcMjIBYFfbiOWt+ShunEcrGBnurneffMQ3cdnYcWIxZn
 1WWJbtunZwpJtk/Uk3tWK5yniysUib3d3ky5edhHFPQ4EIF8POI75wlUpIWCnXrbwY
 UfEyccrXQXTbzulEbsv30wi5hrAQFolBhUA1qMPIN5Uq/3ENnWwqwydP2M8FBG0fhn
 +WgQaR5gA8vKQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tzungbi@google.com, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, matthias.bgg@gmail.com
In-Reply-To: <1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix tdm out data is valid on
 rising edge
Message-Id: <161558062956.11113.8460883520488854945.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:23:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com
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

On Fri, 12 Mar 2021 10:26:45 +0800, Jiaxin Yu wrote:
> This patch correct tdm out bck inverse register to AUDIO_TOP_CON3[3].

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: fix tdm out data is valid on rising edge
      commit: 8d06b9633a66f41fed520f6eebd163189518ba79

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
