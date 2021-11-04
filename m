Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2244553D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 15:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C075B1684;
	Thu,  4 Nov 2021 15:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C075B1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636035703;
	bh=ByZ++88aqm+rxOyVNmjgldyzNjdaWDgCe3kEuMai6Kg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvMgr0MdHw1afABg760oCbgvExAaO8lNwT3MzExUT7y/QXBLpSprOW4JaDWcJKEzI
	 xa+VFdgsGlcAqK8+Fj8Jl8RhTLo2OOKXSZUWb3q6k4EyJMFd3nA/IF/RGYi0kqVpYR
	 14yhQ0y/n0FtacmrSaoeNmqSe4KEeHuytlSdMYTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 555ECF8025F;
	Thu,  4 Nov 2021 15:20:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5222F8025D; Thu,  4 Nov 2021 15:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CB61F80125
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 15:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB61F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qfM3OqgB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F8E7610FD;
 Thu,  4 Nov 2021 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636035614;
 bh=ByZ++88aqm+rxOyVNmjgldyzNjdaWDgCe3kEuMai6Kg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qfM3OqgB/Xp7oPskJDD7f19qbEK7NGXijlsdcyPEwRt9M2KZlxvdCKlnxSrSxKYJh
 mJzKwfrNFST2+hL0edwKhxuS0366JCmKFe2qq/pyzuyL9ExKWcKgZqddAkDgJDUtk9
 7L2EVYr7UhE0tfr5fI1WD9TRH8Zajq+xHLVlJT+Uk0rXyPAJV4chcJlYU7VGJFRXo4
 vWkrF30xAzZ+grQoLlf8Ii6LK9ghDBdJ8T8LhyMWke+LPZMRT4v7a+zGRkcfR30a7u
 AHiZl2TJqineurqFJAheWMAP1riMG4lnuOx+R3gth1G2biQBgK8WQCcrzj68OHMxcj
 UByfpQZ7zT7hQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20211103082710.17165-1-peter.ujfalusi@linux.intel.com>
References: <20211103082710.17165-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF:control: Fix variable type in
 snd_sof_refresh_control()
Message-Id: <163603561215.857840.11871752299643012196.b4-ty@kernel.org>
Date: Thu, 04 Nov 2021 14:20:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Wed, 3 Nov 2021 10:27:10 +0200, Peter Ujfalusi wrote:
> From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
> The second parameter for snd_sof_ipc_set_get_comp_data() is ipc_cmd, not
> ipc_ctrl_type and the type is u32.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF:control: Fix variable type in snd_sof_refresh_control()
      commit: d9835eaa3e9fb4770745294fef3f8416446178c0

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
