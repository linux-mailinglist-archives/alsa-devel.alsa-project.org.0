Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A226D06C6
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460591EB;
	Thu, 30 Mar 2023 15:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460591EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183139;
	bh=JZaITdhdfC4tki3iGI5J6uwXTZ9V7Hz95pZBLCYOsDc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0AmZH2Va2lqygtLgoyHGrF6jTM21aB7i8mTFz3Ku8tnrwxhYTPYiz+WF4Zluj8y7
	 YVN9JWkj7n4GwQDqso75eSsqir9xAhLf660EQqokf+oFDg8GQXcVirdYZJxiyziZS/
	 Tp1CJjwx6xtPLo8LshM7Jr0SxIIkzKG4TbWQCvh4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E74BF80529;
	Thu, 30 Mar 2023 15:31:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA95F80290; Thu, 30 Mar 2023 15:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8907F8024E
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8907F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X0Qmg2/6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1F1361EA3;
	Thu, 30 Mar 2023 13:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E08C4339B;
	Thu, 30 Mar 2023 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680182907;
	bh=JZaITdhdfC4tki3iGI5J6uwXTZ9V7Hz95pZBLCYOsDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X0Qmg2/6ufTPJX5slSJwyp7cUjqVFnuoZrYcN3N0isB9p54dGPX9o/rKP44MxH1wf
	 b6AmZFWy6m7BhCRyVTZCknA1egmt9PIOL6n3PMelbHAMsvkZ8EAn+uIdGPkeUDAj6N
	 kbApanc8clju5BZDIZdCxvQmowuIdIMfNrn1HZyH2dP5/SVceS29EDjioZD6sYTg7V
	 Bzeh2gKqhXGBoADOciL3Q1JsvfFSTtU+0DYj7uKld3Ag2JSvJKc9cDlnuDXV1Ed9fx
	 3t4L9H43fIP2gi5rRRBevzHr0cGe1h14MmgycC2iok1Ukmfka+gatxl3D3BWdGV/z8
	 /Ein7hQy/+DOw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20230324-asoc-dapm-spk-v1-1-e1f27f766505@kernel.org>
References: <20230324-asoc-dapm-spk-v1-1-e1f27f766505@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Sort speakers after other outputs
Message-Id: <168018290529.3345013.7500694410301653664.b4-ty@kernel.org>
Date: Thu, 30 Mar 2023 14:28:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: JBS6GUVBHEOFD7S5TYF35XGCORLBZPX7
X-Message-ID-Hash: JBS6GUVBHEOFD7S5TYF35XGCORLBZPX7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBS6GUVBHEOFD7S5TYF35XGCORLBZPX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Mar 2023 16:33:28 +0000, Mark Brown wrote:
> Currently we sequence speakers with line and headphone outputs in DAPM.
> This works well when speakers are integrate into a CODEC but when there is
> an external speaker driver connected to a line or headphone output it can
> mean that the speaker driver ends up getting sequenced such that it picks
> up pops and clicks from the CODEC. Mask this by moving speakers after the
> other outputs in DAPM.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Sort speakers after other outputs
      commit: 24e9e57f581dd3e90c4b63f066dab96c6ba4e05f

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

