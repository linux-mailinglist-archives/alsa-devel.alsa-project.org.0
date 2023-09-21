Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3987A95C5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5684BE9C;
	Thu, 21 Sep 2023 18:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5684BE9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695314046;
	bh=UPQ0Zrax+eCF7OJmrL4/OguCSthZYXjp/oX9HvOnGL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WMBs9gE55BZcsbhpzScMs6oLfSmaFCg/V1ehQxqBpHfstNz84ecOQ1qgQ8VtrCoiC
	 DrPA1ZcjctpE9gVyeneb+TO63qvcuY7Na7dTxRbdHj8CIeAoDQwkqWIuH6fpGu6gyS
	 MjmmvQcBs/brsIh2y+AHe55Q/yc4lvtw888ifICw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43999F805FC; Thu, 21 Sep 2023 18:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B387F805F3;
	Thu, 21 Sep 2023 18:30:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB16FF80558; Thu, 21 Sep 2023 18:30:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD9D6F80558
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD9D6F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LmAUkdzO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E1988CE228C;
	Thu, 21 Sep 2023 16:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18BDC611A3;
	Thu, 21 Sep 2023 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313829;
	bh=UPQ0Zrax+eCF7OJmrL4/OguCSthZYXjp/oX9HvOnGL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LmAUkdzOtEMtKAUpDJ9biKyq9g9za06Y1rbG0zzk78BMLel6ZScB76w3n5vUeYGmC
	 qhqGNCyetFmcBDupj8QQA2SgL5nIIzFfjQTmqhcP5zA3MdXZg5SAcirkd1nm4qAtI6
	 GC6kF1S3/nGkia3D24Fm2y6IrYtY9w0LDNoIlrbMhFs3XiSyJsT8APodpml2Itu7PB
	 tPhZUAswa6oMJNIrLMREdAxWm1I+4B8jUuyfzdhlVaKgseXwqzke+soj0DQRZx2bLB
	 N8usMxTKDJM52g031/iX27WClVkDImwkFgm/i4sv5mOE3CZdHr0GMssRzAF5SCPj3F
	 wknJTfhQcg2AA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, rander.wang@intel.com
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: Use generic IPC type identifiers
Message-Id: <169531382764.61074.12617582283625643667.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 72XVFU7RTX334PT35XOID2B672BZUNAY
X-Message-ID-Hash: 72XVFU7RTX334PT35XOID2B672BZUNAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72XVFU7RTX334PT35XOID2B672BZUNAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 13:42:17 +0300, Peter Ujfalusi wrote:
> rename the IPC type defines to be more generic and intuitive:
> SOF_IPC -> SOF_IPC_TYPE_3
> SOF_INTEL_IPC4 -> SOF_IPC_TYPE_4
> 
> No functional change, just renaming all around.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Introduce generic names for IPC types
      commit: 6974f2cd2fa94fef663133af23722cf607853e22
[2/9] ASoC: SOF: sof-pci-dev: Update the ipc_type module parameter description
      commit: 1dff26582677849684204f3231cc7cdcb49fdb9a
[3/9] ASoC: SOF: Kconfig: Rename SND_SOC_SOF_INTEL_IPC4 to SND_SOC_SOF_IPC4
      commit: 82f4b383829322a19f91159cdfdaf6437f56dec6
[4/9] ASoC: SOF: Use generic names for IPC types
      commit: ebe18b1587aa548df09875c372ebb66e63cd5141
[5/9] ASoC: SOF: amd: Use generic names for IPC types
      commit: 3104c3267e95aec0e3bb41c4f13ae7b1703ad3f9
[6/9] ASoC: SOF: imx: Use generic names for IPC types
      commit: 6a645a5537619e43a8561462d5a8dd2cc74d26b6
[7/9] ASoC: SOF: Intel: Use generic names for IPC types
      commit: a8fffb94475fbcced74527a20182741b5ef3e5d4
[8/9] ASoC: SOF: mediatek: Use generic names for IPC types
      commit: 0f7e753fc3851aac8aeea6b551cbbcf6ca9093dd
[9/9] ASoC: SOF: Drop unused IPC type defines
      commit: 7b5300e90a781a37a058fce68dac0f7aaebf041b

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

