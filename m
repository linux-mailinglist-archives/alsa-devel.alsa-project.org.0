Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D5546882
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 16:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD83B1688;
	Fri, 10 Jun 2022 16:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD83B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654871963;
	bh=UUQvFPqtu5yQ5L4c38Guhq+gNx5JkvsI/OjiCjIFOKI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obwn2uMQG7IZglm0LbbLHLi7NGlnGvpXHPbFmokYW4vdbfBT7YrXLWJmCzQsrwUuF
	 cL9akxNsThsNaevIcgbCmjYjv+hdfaVia0/k6tUTGYxRRQoKWkOC3GMSCH7EKRkfJm
	 n5blzMOxoeDhdI317GPQgdK2YqznZVBxXxSd3/Gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B181F804D8;
	Fri, 10 Jun 2022 16:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D02FF804D2; Fri, 10 Jun 2022 16:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9770AF800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 16:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9770AF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kqMP8p0U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4197561BAC;
 Fri, 10 Jun 2022 14:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B25FC34114;
 Fri, 10 Jun 2022 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654871895;
 bh=UUQvFPqtu5yQ5L4c38Guhq+gNx5JkvsI/OjiCjIFOKI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kqMP8p0U+MDUW0+uTYunQbXQyP5LJEoyd365Ydb7JEoiX+P4rx8zPY4tJW6JBmppT
 J15SDSa+ejE3si48TpwwXXNlaSniXiuUNQq41z8vW/NO29TQXIwsUX07Ef3gKPXmOZ
 U/4qG73YKsX8/6G/3VFx+j4yxr5imwsAZmYm6ohVmod0wBYixmVPYvGm4W713Lo+a4
 Clcj7EkoXadzb651692tsx/db+y9BiV1vceRhoFTGjyoDhitLft8iFv1GJA0Re+sIq
 eSu5cAzAfTeYMw/4d9NNxFfQS2zZulrPUNey2vn/H335QkkmzxYfZ3GONMEpb6vdeM
 3kydAVhcTTULQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220610084735.19397-1-peter.ujfalusi@linux.intel.com>
References: <20220610084735.19397-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Move and correct size checks in
 sof_ipc3_control_load_bytes()
Message-Id: <165487189374.1493938.5653832664727807643.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 15:38:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 jaska.uimonen@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Fri, 10 Jun 2022 11:47:35 +0300, Peter Ujfalusi wrote:
> Move the size checks prior to allocating memory as these checks do not need
> the data to be allocated and in case of an error we would not need to free
> the allocation.
> 
> The max size must not be less than the size of
> struct sof_ipc_ctrl_data + struct sof_abi_hdr as the ABI header needs to
> be present under all circumstances.
> The check was incorrectly used or between the two size checks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Move and correct size checks in sof_ipc3_control_load_bytes()
      commit: 5702b838dd9a8be634f9c6bdfd769422c26e9162

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
