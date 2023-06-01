Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E60719F5F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 16:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CC373E7;
	Thu,  1 Jun 2023 16:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CC373E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685628855;
	bh=dtgREO1rMn6LkUwpPKQhnN0y9K6Zffo816EVEew9pHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W6RfmUlN9TVrSJhodB9AFz341SE1rGegZpVDSPPOMkNC4zQFws653HrX1iNT+o6/g
	 as5QUlYZjU4kmOqlEpcctjp9vgQXJquQ8zfu/K/OMOYuS3bGher33avmx035rYPKbI
	 aZ0AU/Kru3E0MotXhl8kDyLYjwJiVG8Vohl/b0cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE690F8055C; Thu,  1 Jun 2023 16:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D9F3F80149;
	Thu,  1 Jun 2023 16:12:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8115F80149; Thu,  1 Jun 2023 16:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86ABBF800C8;
	Thu,  1 Jun 2023 16:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86ABBF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fb3putoi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D203263530;
	Thu,  1 Jun 2023 14:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E41C4339B;
	Thu,  1 Jun 2023 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685628749;
	bh=dtgREO1rMn6LkUwpPKQhnN0y9K6Zffo816EVEew9pHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fb3putoiBUseFxJkwI+s9QSkuvasX8/A5gDmxQ/w+TyYMG/Llp8B7QBEANUoL3TVf
	 3KTFmwfVkMp6gdOD6qu/yIyW3otXaK3GSmzcZHIZ78D22dYUBZiyvVbvhYNwQBB+Q8
	 /7LFB3TfGtd6w2fCNPxg0sDfgWxq8xY/eXxGHZwvLeJhCbxj5YUwdFLfeVCFG8q6SP
	 rqQJ6mQoJkHMx9+ciFXdNxltmvar6WyiIO2K/rfAdIHwWLYJksfL7pOmDow5tH5Pmp
	 L7OqQZXGNbn/AW1Pzsu/79pnsKVx93OBf/Z1fDVMLaS6vtL++NK14gemju4XYvG1SB
	 XhNTl8argwSCA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230601034939.15802-1-trevor.wu@mediatek.com>
References: <20230601034939.15802-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 0/1] ASoC: SOF: add mt8188 audio support
Message-Id: <168562874539.66708.811919351455149149.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 15:12:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: IEHYEN7KMEQ6YWPRZGHWP4DLNVOCQBTY
X-Message-ID-Hash: IEHYEN7KMEQ6YWPRZGHWP4DLNVOCQBTY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEHYEN7KMEQ6YWPRZGHWP4DLNVOCQBTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Jun 2023 11:49:38 +0800, Trevor Wu wrote:
> This series adds mt8188 audio support and dbg_dump callback for
> mt8186 and mt8188.
> 
> Changes since v2:
>   - resend the correct patch for adsp debug dump
> 
> Changes since v1:
>   - fix typo
>   - adopt reviewer's suggestion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add adsp debug dump
      commit: 089adf33701426869dd50d1b8b8a4abd25ae39ae

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

