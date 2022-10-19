Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D968604474
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F260AA27F;
	Wed, 19 Oct 2022 14:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F260AA27F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666181166;
	bh=C+sotepzrG+P1ZG2FS2Y5ZCcRArn0JseAY06t7IHhZ8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=burxs2swbhv10SU4g8mR9Sde4KrfTjSTVemktH9E29vBLgIrEZv7wglie3JXR3pjb
	 r1BpkmmFpPjNWkWm+/wVycZppwof6smEmAPmM7QROiU33cRvSFscToERRO++Qph1qu
	 4IKLNJUdVHaLybDg97stBd2n1BR/wlC6yiyQEIKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0F7F80137;
	Wed, 19 Oct 2022 14:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61724F80137; Wed, 19 Oct 2022 14:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F25F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F25F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uArMu4/a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBA7C61755;
 Wed, 19 Oct 2022 12:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052F8C433C1;
 Wed, 19 Oct 2022 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666181104;
 bh=C+sotepzrG+P1ZG2FS2Y5ZCcRArn0JseAY06t7IHhZ8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uArMu4/abArcC2RinOawpJGUuehQ3gHVHZhxBoB33aUkWVaAEU1tGiuSpHw+jNoRJ
 q5d7/x6W3JtqwQy/Kcn/K1E7+WHkey/kx9su3xq+wtp0dwMyg94lLqmlmpcP+bU4Ca
 dHSAYuE1k+W6+vftLhUh2aqvc1xfELdS0PwKZEd0vLra44NvA4oJIY9D5kraVODr0X
 o1+iVEfsPC/iOzRBBcr5G3QegKAS0lkZp1UjAvQoJg5LJE1Sst7bVpWaSXb/cOI297
 FkzFQVIlj+uNoQCds1eMHedugbJs3pq+ork4tqKuWNarsP1cdMrcyDqnVoz2c5k2B5
 x06z5jvW7dh+Q==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20221018133843.16958-1-peter.ujfalusi@linux.intel.com>
References: <20221018133843.16958-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3: Log the tx message before sending it
Message-Id: <166618110274.80223.448031052478531692.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:05:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
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

On Tue, 18 Oct 2022 16:38:43 +0300, Peter Ujfalusi wrote:
> It makes more sense to log the message before it is sent to the DSP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3: Log the tx message before sending it
      commit: 73e4981f12325d9d128af68faedc3e36b6ff7c37

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
