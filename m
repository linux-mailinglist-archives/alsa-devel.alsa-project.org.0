Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E912E619C19
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 16:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D24A1EB;
	Fri,  4 Nov 2022 16:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D24A1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667577039;
	bh=Lf8JCJgjgUQ53WHCpkUyzYaK8iGnPpryq97fFhrWBQw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGkB8rLlQT0/IYu2SFpff5WaidJ40U084EJitfdkuud+7dD00i/vyPgG29sipvR4M
	 J+82AJfwsUhaYcrvtXDrReWJ+oP4AMsjXRr2kvG8w3VGPkh9pgSmBvYJuJrUX+VQi/
	 3v1j4NAl5GVYL0Qwg5cozoflWZcGQcZZDmFC6kYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E3CF8047D;
	Fri,  4 Nov 2022 16:49:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE33F80155; Fri,  4 Nov 2022 16:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73B5BF80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 16:49:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B5BF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IWqcHhUC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A768B82EBF;
 Fri,  4 Nov 2022 15:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09C1C433C1;
 Fri,  4 Nov 2022 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667576973;
 bh=Lf8JCJgjgUQ53WHCpkUyzYaK8iGnPpryq97fFhrWBQw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IWqcHhUCaJST3EpTW+B9ZO+VXxkf4XUFtPwQ9+1lSLJIUehn7JeDn4emOPcRtMkM7
 GnM6BrtBvYIscE4zZUYPBxWhgkgNHEsXC/pg3POWotODXnJwMf0Sp+L6BadS/8ndNm
 r6rvLsAHiJ07f+WFPtclFlFspOO4x54XrozeF3/EGZafFsUgSVbatE8T2PQv/A2sJC
 m8Ddqcg2+Qvt0UfNyVqUJklyye28agBYqDfMt72wCGzPmwsJ3QXBSTpg8jxMc1CWjM
 gMDa0aeSbx8meh6e9Eq0dwks5hNCfduipctu7XHalgIxVDCgE7f9iS38QxLEJCRBLs
 nOjOqYvcJPR+Q==
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221104121001.207992-1-Syed.SabaKareem@amd.com>
References: <20221104121001.207992-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: fix ACP version typo mistake
Message-Id: <166757697041.399796.7667715854379542495.b4-ty@kernel.org>
Date: Fri, 04 Nov 2022 15:49:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Sunil-kumar.Dommati@amd.com, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 syed saba kareem <syed.sabakareem@amd.com>
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

On Fri, 4 Nov 2022 17:39:07 +0530, Syed Saba Kareem wrote:
> From: syed saba kareem <syed.sabakareem@amd.com>
> 
> Pink Sardine is based on ACP6.3 architecture.
> This patch fixes the typo mistake acp6.2 -> acp6.3
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix ACP version typo mistake
      commit: 4b19211435950a78af032c26ad64a5268e6012be

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
