Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A57A1E79
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7DF61CE;
	Fri, 15 Sep 2023 14:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7DF61CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694780435;
	bh=IYMn0XydTsQdKgRIeo9p7qSKaP9DMvGzFzUjETrPlyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQdzwoT0sMarT+A3ifdDQ+CFM7zUlMUUejhJywB2m19sBPLMfOfNkEDouKeQf0sm8
	 CHbhnt1HGEJc4OX8kRfT54x3NrGlViGLllmco3MAxYUBi/KpvwRDFoau/7+VwfBf89
	 ZMkToH1S71VaIrqa8Xfof7NHCxkauBqwcdoIzUmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB4BFF80567; Fri, 15 Sep 2023 14:18:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12435F80567;
	Fri, 15 Sep 2023 14:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 148C4F8007C; Fri, 15 Sep 2023 14:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D422F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D422F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QnQr3F90
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD211B82B50;
	Fri, 15 Sep 2023 12:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCE8C433C8;
	Fri, 15 Sep 2023 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694780322;
	bh=IYMn0XydTsQdKgRIeo9p7qSKaP9DMvGzFzUjETrPlyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QnQr3F90vyTy00IQULOBUsagIH2ggZ/YMZJzuaLtIRaHt5upGvMAO7gcu74WeVyFK
	 GyijUAqCMnO55AMMRSpoqXyFXBgYlkwxwLUrj5ZW9/cNghLqdydA+38uNDGKS22YvI
	 bNgcPttcr0VzGqZSc+tLSb50uCffp2d9+ei5T7ksLL8gF3Sn7tINeYjdkImNy6bcn8
	 xSMF/b7SI0uCfKgHo7VTGkUa2b9wbBJAEI0+yXIbF3zmRB7D22BKWND8dyRwV09BYJ
	 61Lz3+Vf7SaiIXscpQADU4s9H28u48EZ4l5Jlo4mndQdsgCGQBM868SEuD+cwaq/wf
	 1GycuNTHcpSmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yong.zhi@intel.com
In-Reply-To: <20230914130303.13636-1-peter.ujfalusi@linux.intel.com>
References: <20230914130303.13636-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add deep buffer size to
 debug prints
Message-Id: <169478031932.22068.4090045440139083206.b4-ty@kernel.org>
Date: Fri, 15 Sep 2023 13:18:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: HE5IJCZVVJ75OV5SHV5I7S36XHIIVP4W
X-Message-ID-Hash: HE5IJCZVVJ75OV5SHV5I7S36XHIIVP4W
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE5IJCZVVJ75OV5SHV5I7S36XHIIVP4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 16:03:03 +0300, Peter Ujfalusi wrote:
> Print deep_buffer_dma_ms and dma_buffer_size for debug purpose.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add deep buffer size to debug prints
      commit: 642d1de63cea161c629afd2e82d9db5a1582ffea

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

