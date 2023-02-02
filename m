Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF56881C9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 16:24:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C71C886;
	Thu,  2 Feb 2023 16:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C71C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675351483;
	bh=0YIlhLQM4vruCq5Gzqgsdm7w/F6iwRUJvFRBV7ba3nU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k9POfTIRW0WCY76nAyWWVLAQc6y4fZIc0deQn/Wkj44xOAojo7YBcO1ciaOEIuRAH
	 2oB4FGIy7rR77JEKB0bR5WT5OC4+T9DHNc/VBrvru87kEpWhBjS7pyaDWV6CviaWNA
	 CsA5rolNcy5gJZJjtNHHAMiN0t+u/3qGwGhRJOO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 734CAF804DF;
	Thu,  2 Feb 2023 16:23:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C218F804C2; Thu,  2 Feb 2023 16:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 565DAF800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 16:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565DAF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hGHOPS9h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5004EB826AD;
 Thu,  2 Feb 2023 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD114C433D2;
 Thu,  2 Feb 2023 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675351414;
 bh=0YIlhLQM4vruCq5Gzqgsdm7w/F6iwRUJvFRBV7ba3nU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hGHOPS9h9OO2OydzGQsguIxn9y10+P6scImajKzEEcw0MwvTg6k5dxz20bertJZqk
 taPrZikLRyw4da7wNVyfOBx0VNrZloTZQLhgTSlkR3zfvB98JnOs9uZZBKgxWlOQW/
 E87kdo5y+I0bPnXVADWiaDujfx7O0Y+/rC8pXRchZhZKKs9fiLiBKsjk3uEu4ntbzM
 1bo//LsrbKKgrJQL+FOvGkGqzICKwZyfRrPqkVNeGni39D4QJ62Ds2q5CKph/iJNUm
 CYYdRLQ/BnP/bl7zAYNir+i8rSWgiyLbVFqdTLIoHEHIS6/P15n1CvDWZdJRG163P1
 ZO17vvtE96nuw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bruce zhao <zhaolei@awinic.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Nick Li <liweilei@awinic.com>, 
 alsa-devel@alsa-project.org, Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20230202103236.270057-1-colin.i.king@gmail.com>
References: <20230202103236.270057-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: codecs: aw88395: Fix spelling mistake
 "cersion" -> "version"
Message-Id: <167535141146.392917.9691227972443524961.b4-ty@kernel.org>
Date: Thu, 02 Feb 2023 15:23:31 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 02 Feb 2023 10:32:36 +0000, Colin Ian King wrote:
> There are spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88395: Fix spelling mistake "cersion" -> "version"
      commit: 2a096315be7d8ccad883203876c4b53e7b024f12

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

