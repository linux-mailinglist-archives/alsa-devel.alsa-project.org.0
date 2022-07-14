Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CB5750E3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 16:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883EB192C;
	Thu, 14 Jul 2022 16:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883EB192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657809138;
	bh=ZSVTTrbfOqs8s1xfYshXY9NDywr8b9nAJWhikYqRPNI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QstfvBcnobMkE4N67S9XTi/CRe1+NVRrkpaIHstdodTjCCOyKwI+MmuvCItR8bk/n
	 AJ7oVQkLf0Ue9N0k9tlfPOWLGa2hDwONkiHORjAjzVdmlcq6x4bpAjXD8j3UeW0WJe
	 LRTGMnvjnfUV+IvNGfwh9V0y0dJRFUZNtYePPfc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183E2F802BE;
	Thu, 14 Jul 2022 16:31:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3178F80165; Thu, 14 Jul 2022 16:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7F0F8014E;
 Thu, 14 Jul 2022 16:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7F0F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y+iZ+2DY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6440E61D41;
 Thu, 14 Jul 2022 14:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DC2C34115;
 Thu, 14 Jul 2022 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657809068;
 bh=ZSVTTrbfOqs8s1xfYshXY9NDywr8b9nAJWhikYqRPNI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y+iZ+2DYzoJZ5mtIpykj5shVub/8lsAQYXtt3K4EBoJY87XKOtqh9wMtmw4gAgnab
 qxy9jV8hT0GeGeGZ7oDFWHWnpNvY4OnPr1UVwcrWXwyZQIsEMXChK8tzEwm/ra9uaA
 q1+onVKtkPqvLK4/9563LBPNOG5LZrG6cR9YuL5ofuPfa1c5ooaOYEHl7qUfzw0ujB
 qNZ1KYz9zvQGOgrFfnr3AXcHvtuBkHxmOC9NWez1LTpLI1tPJQgDn0itA6RnI0lpLX
 0Zq7PT5cbAC7K34Ijp5PxgHuKPHvi/6Ojsibv9F8LPngikdv1O2sAR/rN1E5HHqVLD
 PUxlFcfMrJTmw==
From: Mark Brown <broonie@kernel.org>
To: dan.carpenter@oracle.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <Ysg1tB2FKLnRMsel@kili>
References: <Ysg1tB2FKLnRMsel@kili>
Subject: Re: [PATCH v2] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Message-Id: <165780906607.93789.3415889455075951387.b4-ty@kernel.org>
Date: Thu, 14 Jul 2022 15:31:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 kernel-janitors@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
 daniel.baluta@nxp.com, sound-open-firmware@alsa-project.org
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

On Fri, 8 Jul 2022 16:48:36 +0300, Dan Carpenter wrote:
> There are two bugs that have to do with when we copy the payload:
> 
> 	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> 			      priv->max_msg_size, ppos, buffer,
> 			      count);
> 
> The value of "*ppos" was supposed to be zero but it is
> sizeof(ipc4_msg->header_u64) so it will copy the data into the middle of
> the "ipc4_msg->data_ptr" buffer instead of to the start.  The second
> problem is "buffer" should be "buffer + sizeof(ipc4_msg->header_u64)".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc-msg-injector: fix copy in sof_msg_inject_ipc4_dfs_write()
      commit: fa9b878ff86f4adccddf62492a5894fbdb04f97d

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
