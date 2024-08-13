Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9799509A6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 18:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D28F2345;
	Tue, 13 Aug 2024 18:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D28F2345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564819;
	bh=/cDaT9MMZ7PXAGsvzduJNxiq9wgQt4bUH8UgICoMreY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FRrkgiJAbf9MPL+DUS9RbDmSUw+Kp3Q8R57GzoB+AcKQ2QIGzAMgYaJdh/F5sebGG
	 LvnHuorCR3m1b9JN9rzv/2gHplKsg1gIX7Rr1YvBcfTOVMn3jm3Pb7OhimrnbuO75Q
	 7V2wQKM5Ye5E8Hl/i9Ttm405zKZ6VVIa8teqkeCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B63F805E1; Tue, 13 Aug 2024 17:59:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D39F805D6;
	Tue, 13 Aug 2024 17:59:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CD5F8049C; Tue, 13 Aug 2024 17:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AEB8F80301;
	Tue, 13 Aug 2024 17:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEB8F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p1iQzcJY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6910A6176A;
	Tue, 13 Aug 2024 14:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4F5C4AF11;
	Tue, 13 Aug 2024 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723560783;
	bh=/cDaT9MMZ7PXAGsvzduJNxiq9wgQt4bUH8UgICoMreY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p1iQzcJYssZzZcK91NoTPOY5o0F0yzRU9O4/B1TcXOkx9PlrxWGIPAFAMdjRFlHAs
	 RTHqCr1REzfRgMPUgElmvU50Hycmv5I5iX7+JMJy2K0ybLQFv0uzYE08d5PUdqcayv
	 TMTcHltSBt6Y+/MH4KxKwLQD+ahYlsseo0sCM63IrxIYSHYzGMRgyOGoRiQOurA6ey
	 wtoHI3lt1Uz/TbcO/uBCjPywPuorpcY3LqZP6exZqMIkKDefrSZYOO3xXo/lTo8OQ1
	 a/ifJyopkUzV2UDWlUUDMrA8gvwmUaKaTMW3r6S/oZ5riGoSNq8fIa/7BFxBaqWgXG
	 lmIGuv44dqdcg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 cristian.ciocaltea@collabora.com, Markus.Elfring@web.de,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
References: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Message-Id: <172356077984.62411.5834566001022810605.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 15:52:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3W7DMNICQY5ST2XHPP3PLQC2JXB3HB6U
X-Message-ID-Hash: 3W7DMNICQY5ST2XHPP3PLQC2JXB3HB6U
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3W7DMNICQY5ST2XHPP3PLQC2JXB3HB6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Aug 2024 16:29:43 +0530, Vijendar Mukunda wrote:
> The existing code modifies IRAM and DRAM size after sha dma start for
> vangogh platform. The problem with this sequence is that it might cause
> sha dma failure when firmware code binary size is greater than the default
> IRAM size. To fix this issue, Move the iram-dram fence register sequence
> prior to sha dma start.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: move iram-dram fence register programming sequence
      commit: c56ba3e44784527fd6efe5eb7a4fa6c9f6969a58
[2/2] ASoC: SOF: amd: Fix for incorrect acp error register offsets
      commit: 897e91e995b338002b00454fd0018af26a098148

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

