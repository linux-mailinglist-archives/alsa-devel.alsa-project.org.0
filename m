Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC63E4959
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E8C1685;
	Mon,  9 Aug 2021 17:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E8C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628524655;
	bh=W3pO8W0KJSy21xkzS1pcJP2BKEiaIyTIyjakzt2o/Ps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBiy/FGLAvGTMIMqjA94Jv5JL0hmuz5dr7akXVHl10B+DCdlAPJCvJDZFO/uRTLK3
	 +PUG9uIcjBF7Lus6r9wByG/EcmA3w5ZZtUpToD01McS34iIO/4tpAro9Es1N6Obpf5
	 2cyAyXbvw3uRYQMpIMifllcnT2dxE0aAaGGy5gc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F18FEF804E5;
	Mon,  9 Aug 2021 17:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0EB3F804E4; Mon,  9 Aug 2021 17:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D1EEF804D2
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D1EEF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qQ2j39Aj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A951361056;
 Mon,  9 Aug 2021 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628524502;
 bh=W3pO8W0KJSy21xkzS1pcJP2BKEiaIyTIyjakzt2o/Ps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQ2j39Ajiy8hvDtZrnbFBe77bwYSpywu6kbo3bWaiwVvbZjb73PCxtcr0COshzwul
 5I3maLb0I6Fm1gV8IgTxyOgsRVQXlLIBGrfFJeNJmc8V/DgD3Vkwu4SYJgkMhwVGXz
 77MJMEwTT7ZaASkRKTTJ+HVb3/nBJ5xh9lgUoi4V7d+OdVY9ndSJOvuiBaAEGuedz9
 Gsh0aUu2qFu6Rt8u5D+M4WGNW7i/gknU5yIlggskG1qI9hw1SmWK+1EHdbQvUZlpca
 CQc8SeiBexX1WWcUnDvzam+FC45ryePDiBY8zbYdeA/QhCUtH/A04EPXi7q/AWqf+k
 3RL8fRtVdUNPA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org,
	Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH 1/2] ASoC: rt1015p: add new acpi id and comapatible id
Date: Mon,  9 Aug 2021 16:54:36 +0100
Message-Id: <162852418088.21716.15412811132955133865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <22be83429956486f9f64b424c26be810@realtek.com>
References: <22be83429956486f9f64b424c26be810@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de,
 =?UTF-8?q?kent=5Fchen=20=40=20realtek=20=2E=20com=20=5B=E9=99=B3=E5=BB=BA=E5=AE=8F=5D?=
 <kent_chen@realtek.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Derek=20=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 =?UTF-8?q?Shuming=20=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On Mon, 9 Aug 2021 10:27:05 +0000, Jack Yu wrote:
> Add new acpi id and compatible id for rt1015p.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt1015p: add new acpi id and comapatible id
      commit: 6d0a764d418fb508119e129c73f39ecc66826675

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
