Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42ED791A2D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2511CAEA;
	Mon,  4 Sep 2023 16:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2511CAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693839499;
	bh=lSogzzno6crleiVA2VrKeMQYvVrENZwQWRFLzD0t5zk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RuAJcYmc9n4kovrzl7rsuUe3fFh8y7inPwUC8oj1+tYu3tWaquPlTu0sHrhZgI/hI
	 4q0Mo/2Gd7MJUGkNu+6LduOUvca3+Jpyd2znNB2lrZ8Ba++wa/xXP1JiqbmPUVRLlU
	 Nb6AdpLh1oMT8pk/0C9EXzvzVO7wrYdYyFK0sRwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E46F8057C; Mon,  4 Sep 2023 16:56:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A6F8F80571;
	Mon,  4 Sep 2023 16:56:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A577DF8055A; Mon,  4 Sep 2023 16:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CF71F804F3
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF71F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r00O1+cx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B76DB80E6C;
	Mon,  4 Sep 2023 14:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F79C433C7;
	Mon,  4 Sep 2023 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693839322;
	bh=lSogzzno6crleiVA2VrKeMQYvVrENZwQWRFLzD0t5zk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r00O1+cxAhpSXvL+ZVTK+TiHOtncmOR8xJX7ex72LTI5P8BwA7PjlI0k/NJ9nq/Ld
	 pgwY0FBX1yjqY7gC7GgPb6svDlZryNmJvrWJtaRV9AnAIRadMeoZA5zIgEsHfvqErh
	 jGio5NRPDPoG4ysGoypukk4Hl9VXnUcI/TmTDrMFnGsJeOmDDSc20VuFhwQCcggWxL
	 3sO1CK+gB69p1r7FUq3EyO4WUeyYGKmIepB6mbWzs5wsJtcdaud9V1JmA6l4cR3UkY
	 1FVa0zhXZ8DLO/yfyHa7HC062R7yAEQ5ic+tYFeUqHUp1LWZEnBc5nhwnyX5mCLbEV
	 8IXBfByvaM4iw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Shubh <shubhisroking@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230902150807.133523-1-shubhisroking@gmail.com>
References: <20230902150807.133523-1-shubhisroking@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP
 Gaming Laptop 15-fb0xxx (8A3E)
Message-Id: <169383932048.34217.18361652872072310930.b4-ty@kernel.org>
Date: Mon, 04 Sep 2023 15:55:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: HJ24OTFOCXZTPO5ZILZELDQPSX5VEOFU
X-Message-ID-Hash: HJ24OTFOCXZTPO5ZILZELDQPSX5VEOFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJ24OTFOCXZTPO5ZILZELDQPSX5VEOFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 02 Sep 2023 20:38:07 +0530, Shubh wrote:
> This model requires an additional detection quirk to
> enable the internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI entries to support Victus by HP Gaming Laptop 15-fb0xxx (8A3E)
      commit: d1cf5d30b43f1a331032ebf3e11d9e366ab0f885

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

