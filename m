Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977A93940C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 21:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5576E67;
	Mon, 22 Jul 2024 21:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5576E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721675606;
	bh=08Ix2ICoI12/cLhY4GIhbhpOUaxPusqc257F2p4YRgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S07b8eRO1BgIjTKRU4gSFZJshundTA41QHy3D7zQmIDsi//fU6xy3YubhFGijoH93
	 2jKZFro6WtfiSQDbmexQqY4tzU9KwcUvFvVpNc4qn5lcsFWwleRMpKfYHaMguij4Sx
	 oQ99QMtsRor2B3yMPnn3KEGsMp/NB0WSFy9h3ysw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B8BF805D5; Mon, 22 Jul 2024 21:12:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5A0F805C6;
	Mon, 22 Jul 2024 21:12:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51EC8F801F5; Mon, 22 Jul 2024 21:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30FF4F8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 21:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FF4F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IZX7dIjw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4436E601D7;
	Mon, 22 Jul 2024 19:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A204DC4AF0B;
	Mon, 22 Jul 2024 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721675546;
	bh=08Ix2ICoI12/cLhY4GIhbhpOUaxPusqc257F2p4YRgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IZX7dIjwMPLhTMKg000zPem6udIF24kPaDuiDggQk3CWEcji8KaVHC3rsAK+5x+aL
	 12eckH04vW7DW02IiuZnuxQjCsAWS0EsuBOX3ExIA/+RDep67EIuAr0CTuAokRKxY4
	 t8u7uYyrTzMdKMyzaXIQUJae1gw9K02phDM1i1pal3dRvdAoTo5GC1dYh/x6+cWrMR
	 XrCi0EjU0zISuMaN5O5izRLhr6PccUY+SF4oTRrSKIDJBi98/Z/t9eE00FPNOnc4W0
	 U3Y0afjAATl06kBHC3A/9yNVugX6TYYpqUvcexza1yz6kB5c+wmI9LmNJb5BGXtI0u
	 TzhjArwt7inpg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <18a29b68-cc85-4139-b7c7-2514e8409a42@stanley.mountain>
References: <18a29b68-cc85-4139-b7c7-2514e8409a42@stanley.mountain>
Subject: Re: [PATCH] ASoc: TAS2781: Fix tasdev_load_calibrated_data()
Message-Id: <172167554332.83479.1180608727450798301.b4-ty@kernel.org>
Date: Mon, 22 Jul 2024 20:12:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: DBSX7PVLPG7VZLN6SSPKEPQ7UHDCXXI2
X-Message-ID-Hash: DBSX7PVLPG7VZLN6SSPKEPQ7UHDCXXI2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBSX7PVLPG7VZLN6SSPKEPQ7UHDCXXI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jul 2024 18:53:48 -0500, Dan Carpenter wrote:
> This function has a reversed if statement so it's either a no-op or it
> leads to a NULL dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: TAS2781: Fix tasdev_load_calibrated_data()
      commit: 92c78222168e9035a9bfb8841c2e56ce23e51f73

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

