Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4B6B0A31
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 646E51861;
	Wed,  8 Mar 2023 14:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 646E51861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283841;
	bh=dUV+vMEkhSg44gNlkHa5ot1gNoXPiDu/fkA8PAKVDjk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvIFeu8J39DQeWNi/r/TGIL6+/j+TooT5/f/96BTFoqV1C7LDSd4HZpOJbOCVmiwF
	 ewip6FFDlawvlcexqjueLYc45/4/kIVTfB427IkkwzibKwiUKLK6rRT8zA4oH12rPM
	 6HXG87yMY6ZbY+RK2sTk2B2xHCZ58bTK3vHndcGA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B118FF805B3;
	Wed,  8 Mar 2023 14:53:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C7A6F80563; Wed,  8 Mar 2023 14:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC68EF80557
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC68EF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DAD6kGYU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85410B81CD1;
	Wed,  8 Mar 2023 13:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CDFC433EF;
	Wed,  8 Mar 2023 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283572;
	bh=dUV+vMEkhSg44gNlkHa5ot1gNoXPiDu/fkA8PAKVDjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DAD6kGYUN4bdXCY9fxRjTwNZup29S7sB7CAHTu5j4pEwNy/EnNnUP9uu8tL+IuDQG
	 g+K6StOgWaWwAcS5X0GoUVkmPnI//I0aGk85zWw5PyuNy7azYfqOu6SiE9oBAfjDMW
	 zNspyqX6DRgoB8woD44d960M8zFpMj9FEEPlEqHix3WrFHglXJwdF76cVZfs9/UWyO
	 Z+PlfT28h7mhRz6a2jUpm0ovVogTl8anY0zOqGzHAKzxgnWbwBeGmF+brbpdKRJ3CK
	 fQY2SKlDituLJGVBmwrMwOWRi25WZb8RjeNJm+WkoLVneJTR8//mCuL0hjqPm2Wl5P
	 IWYfAtR2Jvs/w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307110656.1816-1-peter.ujfalusi@linux.intel.com>
References: <20230307110656.1816-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: IPC4: update gain ipc msg definition to
 align with fw
Message-Id: <167828357038.31859.11609018754626425635.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 6AYC63SSQYLKU77JKT7M557QOQ2NZADT
X-Message-ID-Hash: 6AYC63SSQYLKU77JKT7M557QOQ2NZADT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AYC63SSQYLKU77JKT7M557QOQ2NZADT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:06:56 +0200, Peter Ujfalusi wrote:
> Recent firmware changes modified the curve duration from 32 to 64 bits,
> which breaks volume ramps. A simple solution would be to change the
> definition, but unfortunately the ASoC topology framework only supports
> up to 32 bit tokens.
> 
> This patch suggests breaking the 64 bit value in low and high parts, with
> only the low-part extracted from topology and high-part only zeroes. Since
> the curve duration is represented in hundred of nanoseconds, we can still
> represent a 400s ramp, which is just fine. The defacto ABI change has no
> effect on existing users since the IPC4 firmware has not been released just
> yet.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: IPC4: update gain ipc msg definition to align with fw
      commit: e45cd86c3a78bfb9875a5eb8ab5dab459b59bbe2

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

