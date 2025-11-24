Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE6C819DE
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Nov 2025 17:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D693E601FD;
	Mon, 24 Nov 2025 17:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D693E601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764002346;
	bh=cEq3a+SbvaGMkg//fn0vsCMK6eNMFbN5ySP+2VT9Zjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTDb7ulQY7NjbpNKYFKH1a/izc78O3DSyDfXhlQk5E/5UVh6CszhA6MYvsZbyweyd
	 xTvaVI2V49+9lg775o6Vh++eUDlTIxcAgZceByDkESYI+B47otB6G5lakfxp+tTKXS
	 8ltD7wNbauVfuZB2JvzOx9LkZ7DLzTOe5Zr+NIOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6983F805CA; Mon, 24 Nov 2025 17:38:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B6EF805C1;
	Mon, 24 Nov 2025 17:38:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECD72F8026A; Mon, 24 Nov 2025 17:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9316FF8003C
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 17:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9316FF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s356yYM5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 071D76016C;
	Mon, 24 Nov 2025 16:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA32C116C6;
	Mon, 24 Nov 2025 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764002297;
	bh=cEq3a+SbvaGMkg//fn0vsCMK6eNMFbN5ySP+2VT9Zjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s356yYM595Uxb5WeOQrtEQfrOqPL2R45rEBngA/Hz1CQuU2stBJWQEOfKYKC+KlYH
	 z+s869xNdpMQ3Y0RFjfQxTEnY3fICJEPX+3WpMRJgsflKqhzaSjYA8Xxw82MMpRIiK
	 /aqNGM+JyASbQAbVuxV7n1NvhavUp8Wo1BMkbdxPwdoxQsc3EpUeDx3g8Do3z+ONLO
	 2tYiCd7v7bp5IlqkO/M+eur/6a+wBAZ8C5V9bMDptAsKEeGLScq1YEfTnKyfuLXOAW
	 VevtZA9qTmKrxTz3hDKp7W22ATdXkRgeN5ql4TaPY3PVhOj0eJK9GmIIhrZFbcVahI
	 9/3Sp85Rd1G6g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
 13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
In-Reply-To: <20251121234427.402-1-shenghao-ding@ti.com>
References: <20251121234427.402-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: correct the wrong period
Message-Id: <176400229612.72424.2907787117202810877.b4-ty@kernel.org>
Date: Mon, 24 Nov 2025 16:38:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
Message-ID-Hash: FVD5OWJZN2TILH5MEP4XQXNY62A3CS4F
X-Message-ID-Hash: FVD5OWJZN2TILH5MEP4XQXNY62A3CS4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVD5OWJZN2TILH5MEP4XQXNY62A3CS4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 22 Nov 2025 07:44:27 +0800, Shenghao Ding wrote:
> A wrong preiod at the end of the sentence was reported by one of my
> customers. Their thorough code review is greatly appreciated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: correct the wrong period
      commit: 950167a99dfd27eeaf177092908c598a31c79a7e

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

