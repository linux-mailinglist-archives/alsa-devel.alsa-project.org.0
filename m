Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67267B562C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1EA3E74;
	Mon,  2 Oct 2023 17:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1EA3E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259927;
	bh=tBXplhjLBUVmn/j4ZoUk9kfVVHtW2nJRQ5brH7z0kH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nyc8/IOUTC6ia56eWuYQO8P2tCzPgJJsKBfrRNdkBT4JX6heZlK4/ayoKndXxRcOL
	 +wJLXuoRIQb2UO2HhXVMvnMhxbPC/128Pw9cp037yy4+3uJMAV6BH3ESeDhomC5qcM
	 vEtuengeBVnWioTBEAchO3bEHhCI8i9uQca7vzX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B366F80578; Mon,  2 Oct 2023 17:17:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0557DF802E8;
	Mon,  2 Oct 2023 17:17:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E446F80310; Mon,  2 Oct 2023 17:17:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B48F4F80166;
	Mon,  2 Oct 2023 17:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B48F4F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LBPnyMGb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E9972B81188;
	Mon,  2 Oct 2023 15:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6A7C433C9;
	Mon,  2 Oct 2023 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259848;
	bh=tBXplhjLBUVmn/j4ZoUk9kfVVHtW2nJRQ5brH7z0kH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LBPnyMGbql6bRxwdrjfUsJuOtPhRl4WUZglBOH7y/JjdWMYw37+xy8QaCfBNLYyjl
	 DpVF8IEBmnDA6GMAWIC9WcNi6B4KmYPZKLcx2/vdQ27HZ3F2lumHq3ors8WV6Wkm4n
	 uVUpEVrrWgHzb3B4DXbaOAqvBGPmrKqj+ooSX/7tXrGeVrHHY+WzLaaf90N3W34kv5
	 ol6OMH14+oTEMk1j4axFNjTpAu88KZHReH2R3+shMuxBfdskOmbJMJNg6bRq9jRyWI
	 BovnntrLB8mZUAM8fPbilce10pbReLOxdOu685/C/B2OfOWsM/nPV14KH/lufK/W59
	 uqxLKIY8njs/w==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <ZQSr15AYJpDpipg6@work>
References: <ZQSr15AYJpDpipg6@work>
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-Id: <169625984488.65718.9772394979337795498.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 16:17:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 4BLU4M2DWSLNLRZ3JCDUI6NXLPMIM5GC
X-Message-ID-Hash: 4BLU4M2DWSLNLRZ3JCDUI6NXLPMIM5GC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BLU4M2DWSLNLRZ3JCDUI6NXLPMIM5GC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 13:09:11 -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
      commit: 3746284c233d5cf5f456400e61cd4a46a69c6e8c

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

