Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED6B70E7A2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E7082C;
	Tue, 23 May 2023 23:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E7082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878359;
	bh=zHVq50k7DbZjqBSZlH/G4JnZ1dYJHDa4rC6ODp4owhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bVE5u+AzbJWEVQym4BIEQ5Ng1CO6RfIX26i0b+iV2f68j5O0RbggXDKlDa6pu9i5f
	 QlUpIrgjucSJqhlYVVh3Bf4XefufVqDwnJmxTPspxOn4YZwV/01eJ9P+iyM7hWq7yA
	 lAMHtjTnMi2VDxAu3lS9LK1nv9v5uzQlziIuEGo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA20AF80567; Tue, 23 May 2023 23:44:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1661FF80548;
	Tue, 23 May 2023 23:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DF9FF8024E; Tue, 23 May 2023 23:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90F3AF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F3AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AzR5ZlIh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F2B2625CA;
	Tue, 23 May 2023 21:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D75C4339C;
	Tue, 23 May 2023 21:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684878249;
	bh=zHVq50k7DbZjqBSZlH/G4JnZ1dYJHDa4rC6ODp4owhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AzR5ZlIhTpi5h4bYNEPttRp0VDE9+KDUccSlJ203y698CwH4MU4uO+JxJ+16nz3Fo
	 j8ekD8gRJRcD5koVOa+fpC3EI1zqnZTmCoPqzMMzjORIkU6fqC9fAk3Z2oqPj7bg6w
	 V0WqgPdv40lNMDDv/xsBZZRdlg+Bt0shtMS4JZ0NEoy5VzYAlZk2rPHogyhx1ECSuA
	 tAzMaG5aRz8QJoHsqeVvtljroas5Veu15NEJRdwPJnYxyRWsj0ARuHy/J+QzcvYDOo
	 voGJ9uPTvst/DVbZabbeGIR6BGPdDtZKVhxxYErvopByCjxbXVea6BEB0n8sgd11vv
	 dHPlnsURAC/LQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@gmail.com
In-Reply-To: <20230503081049.73847-1-daniel.baluta@oss.nxp.com>
References: <20230503081049.73847-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/2] Improve support for sof_ipc{3|4}_bytes_ext_put
Message-Id: <168487824751.297010.12344595686520411932.b4-ty@kernel.org>
Date: Tue, 23 May 2023 22:44:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: HTO7IK5PVDLQOGYMTNKWSCK2V6KJORZ7
X-Message-ID-Hash: HTO7IK5PVDLQOGYMTNKWSCK2V6KJORZ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTO7IK5PVDLQOGYMTNKWSCK2V6KJORZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 May 2023 11:10:47 +0300, Daniel Baluta wrote:
> This patch series provides better handling of cases where sending
> a data blob to FW results in a validation error.
> 
> In this case we restore to the last good known value instead of keeping
> the data that firwmare rejected.
> 
> Paul Olaru (2):
>   ASoC: sof: Improve sof_ipc3_bytes_ext_put function
>   ASoC: sof: Improve sof_ipc4_bytes_ext_put function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sof: Improve sof_ipc3_bytes_ext_put function
      commit: 299f6c752f8f7dabb62fe4df62ebd233b58402bd
[2/2] ASoC: sof: Improve sof_ipc4_bytes_ext_put function
      commit: db38d86d0c54e0dbea063e915ce3e1fe394af444

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

