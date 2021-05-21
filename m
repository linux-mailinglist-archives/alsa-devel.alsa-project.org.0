Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6838CE47
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 21:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785FB16C7;
	Fri, 21 May 2021 21:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785FB16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621625976;
	bh=/JJtWSxL7X10UdoL0Qg9p+7yXU5zypGEXSphis/GHdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFxD3hLSnJHJUGKwpT916vnOY+WKmcO8y9yu6WQ9S4nB/5RiM2hUut2imxSE0ySO9
	 MeJc9YlJgYBnbLAIOv8UTnB0JHuLAn6VwKkPplZvtOI1AC2rs/HBaicqNRsW7off+4
	 ytR8T7UgJlDQV1inmN+1kFsdQ2iMzjbxaDIVUkOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8515F80246;
	Fri, 21 May 2021 21:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D32F801DB; Fri, 21 May 2021 21:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AEB4F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 21:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AEB4F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MuoTmAPA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0028A613E1;
 Fri, 21 May 2021 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621625879;
 bh=/JJtWSxL7X10UdoL0Qg9p+7yXU5zypGEXSphis/GHdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MuoTmAPAUykKOkLMJ4QMOY+KhkXO7yWRCG6oCrsjaRH/v0d/8xIGkjzYsWummkKuV
 SkAhxG5Yeb8jrekT50jYdMEVmq6Av+eOU/GPePDwyiwfqz0K1G0YQSoEXnWfLjAhD8
 z/hrSsFTLJdqU1GE5T2yM5goaSgK7zQjyiKhS3kSzaotCdM8gzDCYk7l0fVyvCEkrP
 qTQNXobQ8MHijw4Q9YaMC9Dv87m0xwZGIT9wwg7poyQ/GyfPoaQS/s7TPexm9qODv9
 HRYmOGSK/759WyAkpW8dVpl0JJBx6iuuyGt73Gg7zpsKIWAeypAXMtV2fLqkI28rv9
 vbMD8YSLEgWOg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: common: Add entries for sdw codecs in
 ADL match table
Date: Fri, 21 May 2021 20:37:53 +0100
Message-Id: <162162572418.40821.5764580959034015322.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210521155632.3736393-1-kai.vehmanen@linux.intel.com>
References: <20210521155632.3736393-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, Jie Yang <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 yung-chuan.liao@linux.intel.com, Bard Liao <bard.liao@intel.com>
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

On Fri, 21 May 2021 18:56:31 +0300, Kai Vehmanen wrote:
> RT5682 and Max98373 are added with SDW0,SDW2 links respectively.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: common: Add entries for sdw codecs in ADL match table
      commit: c0fbe9fd311a07bd8919e61d412db22e4b08dc43
[2/2] ASoC: Intel: sof_sdw: add quirk support for Brya and BT-offload
      commit: 03effde3a2ea1d82c4dd6b634fc6174545d2c34f

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
