Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D37348572
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 00:41:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBBF8167E;
	Thu, 25 Mar 2021 00:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBBF8167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616629309;
	bh=EimFBW3SCXo0+WwU4jzLeQWKMLbyziufk9GU5wuitos=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWcPzCjzyXNTjtlmmcFjUl/4Bi05urB6S20Yt00FZ2BXrN7+bRIaK6Wl9PHX/muxZ
	 +UEGhs5yG2KgGQHRTTkb2zhl1trEuzeQeIy/dMsK3iO/O62yj40VKTUtz9dOvN7TgE
	 2JtniE0YafQ6SJjMRTAG9lm2j2Ek6BDxCnX8ofzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12283F80246;
	Thu, 25 Mar 2021 00:40:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F67F80240; Thu, 25 Mar 2021 00:40:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC41F80156
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 00:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC41F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RO0K49SE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EF2061A26;
 Wed, 24 Mar 2021 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629198;
 bh=EimFBW3SCXo0+WwU4jzLeQWKMLbyziufk9GU5wuitos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RO0K49SE3550+F4GgLw+ScpoFl/tuklH6AFLxgywLtqs9ZO97HmtyDyId6lONX9Lc
 TUQRM+8wFCrPXtLDey2pIU4oBaPimpvwu7bjc00rDbGG/08aI8zw4IAhjYfZdsZGOR
 wmEdohfcvwWRMYeq7ASkK6Ztyny5/7LbeOSYH4bepDt+ln4uw43D+6iXqkHfPGB3DC
 2SgQsQIzVSjpHu9bWz15gPWxjO1OQCWD1173TT9m/FrKPefmpzn07MsJSUMpWIYNL6
 X883yUmU+1+z6mIP0EiIoaDGX0OrDmh/bdozmYa76vWqvSut8pLiOxnfCFrQZfjvC5
 5EhKB7xMoTtEg==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: intel: atom: Stop advertising non working S24LE
 support
Date: Wed, 24 Mar 2021 23:39:37 +0000
Message-Id: <161662872373.51441.3814240028664055092.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309105520.9185-1-hdegoede@redhat.com>
References: <20210309105520.9185-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 9 Mar 2021 11:55:19 +0100, Hans de Goede wrote:
> The SST firmware's media and deep-buffer inputs are hardcoded to
> S16LE, the corresponding DAIs don't have a hw_params callback and
> their prepare callback also does not take the format into account.
> 
> So far the advertising of non working S24LE support has not caused
> issues because pulseaudio defaults to S16LE, but changing pulse-audio's
> config to use S24LE will result in broken sound.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: atom: Stop advertising non working S24LE support
      commit: aa65bacdb70e549a81de03ec72338e1047842883
[2/2] ASoC: intel: atom: Remove 44100 sample-rate from the media and deep-buffer DAI descriptions
      commit: 632aeebe1b7a3a8b193d71942a10e66919bebfb8

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
