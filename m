Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D76C5484
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 20:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F03EB3;
	Wed, 22 Mar 2023 20:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F03EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679512008;
	bh=6rcg4uj15QVYMi2J+hY4jBwV1ucCpwKHQq8ZSr5pQ80=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSAT5ps3egqtIJSxpKPLbeeYvx5Hh292Vrg8F3ASThkWK7Gbt+rab/1K9eLEozQcW
	 GcHqy2M5C08uA0u6q6KaJulOQ+zQel67I1LcVOFh6LsYFS+rVh8zvOCvOMnDMoK0Zw
	 QAZFO0ICE5sfrkbpA6VvlG7mvX1AKKyETsFy0lUE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F390F80254;
	Wed, 22 Mar 2023 20:05:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36672F8027B; Wed, 22 Mar 2023 20:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D8FAF80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D8FAF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ToNCA8IG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1201B81DB5;
	Wed, 22 Mar 2023 19:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B9FC433EF;
	Wed, 22 Mar 2023 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679511949;
	bh=6rcg4uj15QVYMi2J+hY4jBwV1ucCpwKHQq8ZSr5pQ80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ToNCA8IGfn4Beadm+osz7HXxavprKcjqS9q9DGjGWPsXWaIZ13griAm3Oc1M3OZvR
	 JwFTYxKu+eQclO9l00p3ayqYr0LoShd0GKtNXLh1zKBLhhZAw49EHhlBC6QpT63Tvc
	 qL1L/11IYAr++hIiTlmSmrH204UlyiJK9Ptp1zxLpWOzQNosNe7DpipPR0H/QwoZoE
	 Kr0CUXNiF8XLO/61nNFd5a4zLja1hwlhUiH8HJDeAjiq7D/qhveQpn7q5vJJUKcFpi
	 rwPZJy3jP9AXvxOpBNf4IOqiuP+ZICRxBNWE49JnuEKewrASJkebeXhzTq58PCs6CH
	 UGbEBRnMlUu8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230322085538.10214-1-peter.ujfalusi@linux.intel.com>
References: <20230322085538.10214-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: Ensure DSP is in D0I0 during
 sof_ipc4_set_get_data()
Message-Id: <167951194699.1096244.1422143438627508157.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 19:05:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: LUCCZ33WM7MPJ5V5EQTBZCUALT2HVGUD
X-Message-ID-Hash: LUCCZ33WM7MPJ5V5EQTBZCUALT2HVGUD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUCCZ33WM7MPJ5V5EQTBZCUALT2HVGUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 10:55:38 +0200, Peter Ujfalusi wrote:
> The set_get_data() IPC op bypasses the check for the no_pm flag as done
> with the regular IPC tx_msg op. Since set_get_data should be performed
> when the DSP is in D0I0, set the DSP power state to D0I0 before sending
> the IPC's in sof_ipc4_set_get_data().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4: Ensure DSP is in D0I0 during sof_ipc4_set_get_data()
      commit: e51f49512d98783b90799c9cc2002895ec3aa0eb

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

