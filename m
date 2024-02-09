Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581AF84FA66
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 17:59:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF315827;
	Fri,  9 Feb 2024 17:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF315827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707497996;
	bh=kuhUnzCpcWAZsuKu51d9PcrOT0KC6o/IE8So0bTZM10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIJyGauhhH2ORCnzuY6fxQt5o1Lbf+SwAOfih0oEAmCEayi89DJuePtbwiIHzrxZW
	 Ery9YyCBgElIFwt/UrgBRl5BtVVXwFJ6SbvQ+NLFuD83G4w/APcfC8KMZuSzGBINyo
	 XV+tn4yDB88+H6pHOWmaZRxJO7UuNXzTakvRVUQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A91B7F805C2; Fri,  9 Feb 2024 17:59:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D511F805A1;
	Fri,  9 Feb 2024 17:59:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC050F801D5; Fri,  9 Feb 2024 17:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90DC0F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 17:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DC0F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Scr9FsGX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10F0CCE192C;
	Fri,  9 Feb 2024 16:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9A2C433C7;
	Fri,  9 Feb 2024 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707497928;
	bh=kuhUnzCpcWAZsuKu51d9PcrOT0KC6o/IE8So0bTZM10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Scr9FsGXcsuBKOvlL+iVqVzpnGXSG3msIvejh70Wp12tO2or4+9Xs0dxwa4knQq6h
	 rcAmrlG2Or8IxrQ6xq4xv0cRGfdEiZGwHUWKghHVh2ziIqoQ76WAMD3GnRLLH033Ww
	 O+jx2KCrE/Z0xF73YvIO2LSQ7fkeFApvh6/U2USGApatkAoTnZ0NGRRB8+zbGvBgrG
	 eTjCB+JIdijR44mUWme3djHlHvZzuyFEm9NNBLUpmLRpXtL+3QUnoA/Q2iciQUgr5i
	 hr6A3pYv3miKz7Iiv9l0EaMrYmvIcf5Ohy4phucoSvkmdKBaZiuphUj2cOVbBNQL0F
	 fb25VuaKDO7aA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Gergo Koteles <soyer@irl.hu>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <454639336be28d2b50343e9c8366a56b0975e31d.1707456753.git.soyer@irl.hu>
References: 
 <454639336be28d2b50343e9c8366a56b0975e31d.1707456753.git.soyer@irl.hu>
Subject: Re: [PATCH v4] ASoC: tas2781: remove unused acpi_subysystem_id
Message-Id: <170749792315.2378624.13516253552080654959.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 16:58:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: M4MYZHF4HB7GWVQ4VZZVG6O3QW5OJQDD
X-Message-ID-Hash: M4MYZHF4HB7GWVQ4VZZVG6O3QW5OJQDD
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 06:59:34 +0100, Gergo Koteles wrote:
> The acpi_subysystem_id is only written and freed, not read, so
> unnecessary.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: remove unused acpi_subysystem_id
      commit: 4089d82e67a9967fc5bf2b4e5ef820d67fe73924

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

