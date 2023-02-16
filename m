Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EAD6989B5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 02:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8381A832;
	Thu, 16 Feb 2023 02:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8381A832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676509906;
	bh=xNdqVa3Vj9dpZHH5NFRkFb1vvoPFguNMFCvVdLtMjog=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPSYeXH8WLX2lhPo/0Kdr5m30CqWR0HKCA3FdU2Vcm1pfR6yqUULWr3kx8t6PsO1T
	 hbYA+i42XvNhFEWaBbzFduxBPCnraUJMmvODqdQJuIet3Afcp5+Ivv0LDfhcK/FpBo
	 XgwbQpfDV03hY/eOHQK/WEVnuYSA8ijQ4yuT7FjU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C4AF80542;
	Thu, 16 Feb 2023 02:10:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 649CBF804B0; Thu, 16 Feb 2023 02:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DE09F8047C
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 02:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE09F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ksqQqXwW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B45BFB824EB;
	Thu, 16 Feb 2023 01:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC500C4339B;
	Thu, 16 Feb 2023 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676509796;
	bh=xNdqVa3Vj9dpZHH5NFRkFb1vvoPFguNMFCvVdLtMjog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ksqQqXwW+dsztZioHbF4bKLQTljX+JNXMAFDpUPL7bBvosYEJv/Q1z4BeYibo9lkL
	 vu3apCBZeUX0jztpFOa9COUeR7z9VQLvujCqAkrCGQBPZRbZRKkX2AdA3V6PMlWJGe
	 G9b9guZCa5JmoaqKzCQNypWfYdi9Uh1Dr4VMgOY5/uzlPtiS7v/UE1cL7a4qvgwdy+
	 EUa916gc30V1zueqRoTpKI5OWTFSzRKAdK7Z8b+2hvB9FngJpjjQQlCJ0Bkx1KhZwS
	 8alc24259dOWMqhpBP5FQU5KnJej87bippnDzWcPLDSxj+oDPGoagAHYUBXfQaQix0
	 ImN2ftLyLFXoA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230215132343.35547-1-andriy.shevchenko@linux.intel.com>
References: <20230215132343.35547-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: soc-ac97: Return correct error codes
Message-Id: <167650979440.3620645.14876076040377125402.b4-ty@kernel.org>
Date: Thu, 16 Feb 2023 01:09:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 3FGIQYJCGGDE47MFERK2BF2ABSYF2GXS
X-Message-ID-Hash: 3FGIQYJCGGDE47MFERK2BF2ABSYF2GXS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FGIQYJCGGDE47MFERK2BF2ABSYF2GXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Feb 2023 15:23:43 +0200, Andy Shevchenko wrote:
> With the switching to dev_err_probe(), during the conversion
> of GPIO calls, the return code is passed is a paratemer to it.
> At the same time a copy'n'paste mistake was made, so the wrong
> variable has been taken for the error reporting. Fix this.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ac97: Return correct error codes
      commit: 76f5aaabce492aa6991c28c96bb78b00b05d06c5

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

