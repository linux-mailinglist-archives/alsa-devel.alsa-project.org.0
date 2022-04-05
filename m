Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3F4F298B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89147182F;
	Tue,  5 Apr 2022 11:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89147182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151436;
	bh=0vz34CJ0FB+7vsvfoFBThEvYA29dXDDzlk1RjUZ6jzo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4QCGUJfMB79fM0Q/UdwslyAXiQ1HTQs/pL71J1ug8PWm1L5DinAjsWbginYHfx9h
	 eqvSb8oC7k6BOjDJTg5ARMd97b8gv+YGyKZeBdJYWLvmsDeRxdx64y+JWAqRRf0kxl
	 apXBVmAVv9hfsPg0IWVR1COZUPwcGIyO31xyXXsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACFE2F805B4;
	Tue,  5 Apr 2022 11:31:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4621FF805AB; Tue,  5 Apr 2022 11:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B13F8058C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B13F8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qSISWvFG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2EE1B81CBE;
 Tue,  5 Apr 2022 09:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF3FC385A6;
 Tue,  5 Apr 2022 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151105;
 bh=0vz34CJ0FB+7vsvfoFBThEvYA29dXDDzlk1RjUZ6jzo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qSISWvFGSM/JmHiXv+7rPJJbQWnZdmHQr08bYw3h9WynMjFRIYq5H3wHWKrEgOiCK
 5DilHVjdh7sokm3AJS2hkWFbQsaIN2pxu07k+uLP6s58BK4kW21b4SiCd6fUOxVRB4
 Vb9fNRDFW8Tqew12kuMrVKPEuMunu0Zu4gcQAPp4uvCl5nTOPPJ2jHyVGhmyIeryTJ
 zVP+izIqC9UBoqLpyNl1YW6uWgZDlAItD/Leoq6b0BOhBvI7umpHapklCqTQcnrbXJ
 tFPCTGJ+5Y3RDGU5hVgQeAjVmoAuhw2sJqe/BYL6POag6s+KdqxyaknhozDKyjQ1oX
 3E6n9UjmnaaRg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220331114757.32551-1-peter.ujfalusi@linux.intel.com>
References: <20220331114757.32551-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Set scontrol->priv to NULL
 after freeing it
Message-Id: <164915110405.276574.9680395728506086018.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Thu, 31 Mar 2022 14:47:57 +0300, Peter Ujfalusi wrote:
> Since the scontrol->priv is freed up during load operation it should be set
> to NULL to be safe against double freeing attempt.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Set scontrol->priv to NULL after freeing it
      commit: a403993ce98fb401f696da7c4f374739a7609cff

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
