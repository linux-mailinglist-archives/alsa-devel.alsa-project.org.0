Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD35BD7F4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7FF86F;
	Tue, 20 Sep 2022 01:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7FF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629216;
	bh=s55DWAu8/BY5eJcThSTBlj+oordoB5IX7HMLQJTRbLs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVgLS3J35y4Lo4nY7FK33y2I6pevi/wz9Dh6HywbZZlTIstNeMMgb5uHMolZHMcNX
	 FORQRuJggg5tHbypkJsjH7C6IGPojdPaEMaPyUmmDbVUDKg0F+nqJvI3JcsNH2WT6G
	 qGc0FbzS//lZrWZBSnwEj0+IRM3d4Wc/dAyVTwDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8D8F80580;
	Tue, 20 Sep 2022 01:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B687F8059F; Tue, 20 Sep 2022 01:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB434F8057E
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB434F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LVqEd7US"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D35161F3B;
 Mon, 19 Sep 2022 23:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A7DC433C1;
 Mon, 19 Sep 2022 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629014;
 bh=s55DWAu8/BY5eJcThSTBlj+oordoB5IX7HMLQJTRbLs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LVqEd7USJWGQHcZ5w6vY2P3RmkV1hW18lxDDiqV/48pP0WElSlhY+tq8YtW+p7Lum
 PBEKPoRFRYgtq8ajSE/hcIlXFgTj/1Nbw7YcDgJ1yPNXz6YVQ+rZuJqcSTRMyW9qVb
 1LmL0PkSjGzaDJkJ8EgYQLeZkX993tm0VXbJ7s3heu2vFH5LUsKhf2PF3Dd6ugCA2n
 JMrMuNZ+t9qhPQztMwP+wGYpZyQD6MsawMOMEf+dRGUlRcl+0UOjCKsLWLPyOqQEpW
 7xx0BmO85rNrnJoHM0L/IxenLsabkJIA1Xf7jE6keHsQWMdgXZSH+2CpKhlBHZJG++
 +GFnBK0e1bi6Q==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062549.154114-1-ye.xingchen@zte.com.cn>
References: <20220916062549.154114-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_ssp_amp: use devm_kcalloc()
 instead of devm_kzalloc()
Message-Id: <166362900973.3419825.17929786282189866875.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 akihiko.odaki@gmail.com, yung-chuan.liao@linux.intel.com, brent.lu@intel.com,
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

On Fri, 16 Sep 2022 06:25:49 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_ssp_amp: use devm_kcalloc() instead of devm_kzalloc()
      commit: 09dea5acbe352481beed7d7114295171f5073dff

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
