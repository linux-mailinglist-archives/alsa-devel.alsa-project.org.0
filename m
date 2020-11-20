Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C442BB851
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4F5173D;
	Fri, 20 Nov 2020 22:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4F5173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605907874;
	bh=SIwPyXFAJOKpZYR+49+ogfv8MIu+ApLDZCx05NIzIAI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQVQOLew8QD5BCitXEq2xxcjaB1RYf/v947a76TwcTWQx/TiSobGLbL6BkZ9wozpO
	 eHX5Qf/Hagxxt/fE4jluc6NTOa8LlC+kM3ax8zRl247NKSuEFmgrYbnbXhfQTHlPvI
	 1maR4TeBuBFPBkhkLLdpc+awwZZbUn1W4fRBVCRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8E2F802A9;
	Fri, 20 Nov 2020 22:29:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF5FF8016E; Fri, 20 Nov 2020 22:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD090F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD090F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lC2NCRQE"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09D7F2240A;
 Fri, 20 Nov 2020 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605907758;
 bh=SIwPyXFAJOKpZYR+49+ogfv8MIu+ApLDZCx05NIzIAI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lC2NCRQEDqOLWWzXWkcH1B2rOjFNNs3huDHoPWH4FdC89nmtk/xSxvcdqBfRoiI+y
 dWbCIznqhtsn0c6ohacFwgmB60S31HVx3HLQMHJ7UW3ejnqVPAbNM0bk0LJFYEqVXi
 e3M31XjaQHvjpy1LwMJQFHoFngBXSEAahewpp4sc=
Date: Fri, 20 Nov 2020 21:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201120141653.2160134-1-kai.vehmanen@linux.intel.com>
References: <20201120141653.2160134-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: nocodec: modify DAI link definitions
Message-Id: <160590773743.47461.8532171065460752507.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com
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

On Fri, 20 Nov 2020 16:16:53 +0200, Kai Vehmanen wrote:
> The ignore_machine field in the component driver is used to
> ignore the FE DAI links defined in the machine driver,
> override BE fixups and set the stream names for the
> DAI links defined in the machine driver. This is required
> to make SOF compatible with the legacy machine drivers.
> 
> In the case of the nocodec machine driver in SOF, there is
> no need to rely upon this ignore_machine logic in the core.
> Modify the machine driver to set DAI link stream names and the
> BE hw_params_fixup callback appropriately.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: nocodec: modify DAI link definitions
      commit: f805e7e09c8f6d56f3e9bd2e7cec729f9d0855d0

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
