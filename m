Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A714D72E7D9
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B2CE89;
	Tue, 13 Jun 2023 18:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B2CE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686672436;
	bh=Dl0OghRMzPviG4eXWfhJlqKwsFaEmHV8aUPmsmdalV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B0CiQxppPRkgd3oLavr2sw79oVqPhIu5KtxtHCNi6cdiBzsZFD3u8PVa8nXnkSkRn
	 halWuyMLCfh9ZeFRS43OPuS+Yj/upJhOH+Sm5IXsjNJyM067BbQQH8reMjFQ2DPnfu
	 W7A62k2Xf/fNBNL1VEsDL7NfbOEWvGZPaDpNUr64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBB44F80132; Tue, 13 Jun 2023 18:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21736F80132;
	Tue, 13 Jun 2023 18:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB469F80149; Tue, 13 Jun 2023 18:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 112D6F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112D6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B0EpYklY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44BEA629A6;
	Tue, 13 Jun 2023 16:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A49C433D9;
	Tue, 13 Jun 2023 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686672373;
	bh=Dl0OghRMzPviG4eXWfhJlqKwsFaEmHV8aUPmsmdalV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B0EpYklYr58JrxjWPakYbw+Oh9g0ZAraoGWskKrC/bm67cjTAYQQcyL6mBIXvq+co
	 XhL3jzv0qVejQ+dYci9EOYsVb1K4uPCNgth3tE0dNNA5apMEgCGkU/aC8+bAO8K7IF
	 pToSIHtkdXeJDY5n4tybCLniZcplv3iG7/mq52OoWMeyIGfJy4F7z2T/coFp+EAex+
	 xTleLghp+T4njsDJGCs5PijzVlXgnjH3D9mo7+jUGvx2Cic/JC3cBy02F1UiQ17370
	 vIFBzdjUm4l28EK+JYAyUUStfXJB8mxv/M+BKHLlDnB19eKCfQ+yTedOuGgILTFcWn
	 Nw6SrIoa6C8oQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230613112240.3361-1-tiwai@suse.de>
References: <20230613112240.3361-1-tiwai@suse.de>
Subject: Re: [PATCH v2] regmap: regcache: Don't sync read-only registers
Message-Id: <168667237262.96226.5408735800913182259.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:06:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: FHKY574MUXCOGRZIPIBSOXQ764AWIIDE
X-Message-ID-Hash: FHKY574MUXCOGRZIPIBSOXQ764AWIIDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHKY574MUXCOGRZIPIBSOXQ764AWIIDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 13:22:40 +0200, Takashi Iwai wrote:
> regcache_maple_sync() tries to sync all cached values no matter
> whether it's writable or not.  OTOH, regache_sync_val() does care the
> wrtability and returns -EIO for a read-only register.  This results in
> an error message like:
>   snd_hda_codec_realtek hdaudioC0D0: Unable to sync register 0x2f0009. -5
> and the sync loop is aborted incompletely.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: regcache: Don't sync read-only registers
      commit: 44e46572f0bae431a6092e3cfd2f47bff8b8d18c

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

