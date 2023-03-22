Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86866C5416
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 19:49:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138CDEBC;
	Wed, 22 Mar 2023 19:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138CDEBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679510993;
	bh=u8UI3anzvvAnUM7lDxG8OSsCeqbCrYbcKIou7gbQiO0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KnsLrgosI2huVeaSqR9T4vF8ChuOa0Ie5nOUYfk0BpRzOMVdm7FiFvfZZ8zOIutyA
	 tYS6PAUBg5auijkqau2zp5+5BT3rsRXxjn/t+OubTR4dbsQknVRIG5f3o+wGW5ecaN
	 R0ZM0R7018Bq7lmGA5qe2ze88UYvT/M/h+8mD+Xk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2200F8052E;
	Wed, 22 Mar 2023 19:47:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45EA5F80482; Wed, 22 Mar 2023 19:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80832F8027B
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80832F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d5L8Ulkw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79BE161D9B;
	Wed, 22 Mar 2023 18:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6634BC433D2;
	Wed, 22 Mar 2023 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679510851;
	bh=u8UI3anzvvAnUM7lDxG8OSsCeqbCrYbcKIou7gbQiO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d5L8UlkwOmiMvW1Ci3xQaHqkhzMx8WEMMEy+gVMlth9c4VVAXoN8K5BPZMyEAAgQh
	 hXWgDA52UnBQpAkAauWlPic8ML/U53LDT0qncnlYkGte5ZJfq8GeeGpUW8xYSM+voA
	 wWmqvggAAI6sskpVHXYNNcX76aHXyXNQ9x4mCon0PD7W8aIS7B7oJ2sCPwolfGanGc
	 hWj/LMLMHSV1pXLH6lF8oDihzfU6nJ4p3qJvtT3lwAmiazEbYbO+LeILg9tBzITwvg
	 Il2d4oQodVziSwt22ZevbLfmb+0iOTw5DQGQRJDug/HpkFzrJw+ebC9z1TwT28Fmuf
	 T1b8DpXCwF0xw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230322014330.97079-1-jiapeng.chong@linux.alibaba.com>
References: <20230322014330.97079-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: tegra: remove unneeded semicolon
Message-Id: <167951084865.1092488.3890931311762738091.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 18:47:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: GQGR266SQSZA4UQVFOSAVHAWMMPJ6LDP
X-Message-ID-Hash: GQGR266SQSZA4UQVFOSAVHAWMMPJ6LDP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQGR266SQSZA4UQVFOSAVHAWMMPJ6LDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 09:43:30 +0800, Jiapeng Chong wrote:
> ./sound/soc/tegra/tegra_asoc_machine.c:206:3-4: Unneeded semicolon.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: remove unneeded semicolon
      commit: 59385ed41c37b609c70a1ebb46003e4cc6685ec0

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

