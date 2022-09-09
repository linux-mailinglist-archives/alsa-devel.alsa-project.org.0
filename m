Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A65B429D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 00:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A273169F;
	Sat, 10 Sep 2022 00:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A273169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662763658;
	bh=TycSWmIMYfOSFcfvx1izVknLB7zi2sU9zxghk1psAn0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p3wXYQOCR6r7oZJE8zB8cwPcR8u5ogqouT04K8ov9B8nWRuxrQZBuX3hn9izzWCoy
	 z7O6Yns+DaNtErZJJC6P9KxlWyIWug0TMopVnAHLtEmV0SufZDnnX5DgI8Q8h6d/cP
	 FZrTNK6U8tWUNOyHNW7evmCUge1q2qwuU+U7lBY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8A2F804C2;
	Sat, 10 Sep 2022 00:46:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80102F8016D; Sat, 10 Sep 2022 00:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23350F8016D
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 00:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23350F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TQrhTw/W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3484B82660;
 Fri,  9 Sep 2022 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376EDC433D7;
 Fri,  9 Sep 2022 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662763557;
 bh=TycSWmIMYfOSFcfvx1izVknLB7zi2sU9zxghk1psAn0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TQrhTw/WTISdbvOky6upC7pi3MCfxDIBq6BubhPfF3Ya4IjiAx64xIX2TyXUaStAB
 w/P4uIF6cQbg4UCSSHJ50w/jj264AVy/+cJ084DOOjmgRa7G5f/v2sHe2YaDQDw+xC
 hmmWgS99WHTKvpPaDN/SQuCNXN6wW3Bv2Q6jldrz/6Dtyiwitdg9b7hqNVn3JVDurj
 5LGCL8U0dACQ6kFWIyYXjCukCxWpGHB+azWZBdZO4+RBp9Ug6sbf8W1RJLqobm3cES
 paEwbB8ldUexsyqBQxGfMQ87uwzpvNqz2vvusIG5Z1Qh5y2voQyrbESLoi0xzEMjHS
 Tgcdm8DU3C9dg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, 
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 perex@perex.cz, festevam@gmail.com
In-Reply-To: <1662695098-24602-1-git-send-email-shengjiu.wang@nxp.com>
References: <1662695098-24602-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
Message-Id: <166276355495.332114.11561275882220746760.b4-ty@kernel.org>
Date: Fri, 09 Sep 2022 23:45:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Fri, 9 Sep 2022 11:44:58 +0800, Shengjiu Wang wrote:
> If the initialization is not finished, then filling input data to
> the FIFO may fail. So it is better to add initialization finishing
> check in the runtime resume for suspend & resume case.
> 
> And consider the case of three instances working in parallel,
> increase the retry times to 50 for more initialization time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: Add initialization finishing check in runtime resume
      commit: d2de3f5ead84e230f4651cddf7658ab74ce1a70c

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
