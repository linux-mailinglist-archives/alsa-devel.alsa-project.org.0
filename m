Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958FE3AF57F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05EC216E3;
	Mon, 21 Jun 2021 20:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05EC216E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301322;
	bh=BWOLJ0W+DyN0bIwjEcQUXM9qVf1PU48ef2v/ZiY7EAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbFlF0ufjOs980Eo6cA4uRI7+KNFARUf8xA2DQ/56E+1e59iEQjrHqCeuoeHmn1al
	 Mee5PLgKiSCfvdkROvAK9MIG8o4+mIZVru7zrOhBMXPibhQ4QeQmLmT9YpQaVC296E
	 gyKiYduVdYYEpOsO7xD5Pi7nPxuE1OO6Ti5E0cNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF528F80245;
	Mon, 21 Jun 2021 20:47:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1FEF80163; Mon, 21 Jun 2021 20:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB6EF80137
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB6EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qKXQvMHH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 520396128A;
 Mon, 21 Jun 2021 18:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301208;
 bh=BWOLJ0W+DyN0bIwjEcQUXM9qVf1PU48ef2v/ZiY7EAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKXQvMHHlHKMPaPgxtLqtGD3L131cTrUjohy4lRa9n/F4bwGD55w7e0XY+VMWRuQp
 LO/iTFSC5GkwHF7Ncw0ebm99YUpZQXs1/XbwLr5NGFQY4paX6VZgAY7ZNHJV7rDN4o
 YKSVDyF2YK29KWJmbJ0vtkdawZtphPLBla79SkRErneNdzDnoKfDPua2zrgbtPrZhR
 XtaG0NhsjLkHxeqC7La/GtHg/eMxYifPuVEzIQuNCcP57IstV/SHhjdfaQqa80IelM
 lQ1Gnt2q9wJFRNsPQJi3oTdmrCrtCkTyXwcmlb9+4zB2BYEPPVA7WpotGXQO4y9YYq
 ElrPyhBYF8Slg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	shumingf@realtek.com
Subject: Re: [PATCH 2/2] ASoC: rt711: add two jack detection modes
Date: Mon, 21 Jun 2021 19:45:56 +0100
Message-Id: <162430055262.9224.15115096030073154792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617090822.16960-1-shumingf@realtek.com>
References: <20210617090822.16960-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 jairaj.arava@intel.com, lars@metafoo.de, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, bard.liao@intel.com, sathya.prakash.m.r@intel.com,
 flove@realtek.com
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

On Thu, 17 Jun 2021 17:08:22 +0800, shumingf@realtek.com wrote:
> Some boards use different circuits for jack detection.
> This patch adds two modes as below
> 1. JD2/2 ports/external resister 100k
> 2. JD2/1 port/JD voltage 1.8V

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt711: add two jack detection modes
      commit: 683b0df26c3333a5c020a2764b71a70d082c1c61

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
