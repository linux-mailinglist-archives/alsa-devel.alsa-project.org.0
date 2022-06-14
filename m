Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0554AE4D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0B531865;
	Tue, 14 Jun 2022 12:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0B531865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202465;
	bh=ara93JcDausydIv0dKZ05bk1yebcZhVs+EBO4mMnW+U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YeV58rk5NB5m173fvGRzPRsHMwTReX6m8KnfBa3ppSUW7+169h0/J+SUr8CRDyggd
	 dZ5FjMZcni9oKJK9AMiIGSUJTFgzThUUmgF0r4CKc5zly5Fk5UBdmuH0Vu5Wz/yFcg
	 Sr7LW4/xqt8QeUmrawoIpxvB9g/TLDK8G87foz4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B5EF8053A;
	Tue, 14 Jun 2022 12:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D972F8053A; Tue, 14 Jun 2022 12:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79AFEF80528
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79AFEF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TZuAoXd6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7E2760C82;
 Tue, 14 Jun 2022 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D37C3411B;
 Tue, 14 Jun 2022 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202316;
 bh=ara93JcDausydIv0dKZ05bk1yebcZhVs+EBO4mMnW+U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TZuAoXd60brq2hDBrHiRp8PL3/7IrMYJWUapXTrXsk2fZzcG9E5ydZQG6Yn6u+rr6
 wMb2+q4sRB5LggCLQuWbmGA1rCg6evjkJqR4ebthIfvnQ93RwN01addykUlBXSWyCq
 pYwThWbSwDm4gULQyPTmYjb1onnATFZiwiyGcSEAsxQHuHtqS+JRiNMNylv0ejOloU
 4gNzK+KVxsMGKzFM0vVXXJnH6S+zHqvlJG4IHy4G3LOi8DsSTPy8wHRj72vSwlLKbt
 FrDVq4G0sv+lhfT9BMLP6aZ27ndJ5ArjG/inAQPdZuijXNofZivv12EHGlcALWHf8B
 8v82c2NY6jWLw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 AjitKumar.Pandey@amd.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20220614075251.21499-1-peter.ujfalusi@linux.intel.com>
References: <20220614075251.21499-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: add code to parse config params for
 ACPDMIC dai
Message-Id: <165520231508.3607327.17616908154449647533.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 14 Jun 2022 10:52:51 +0300, Peter Ujfalusi wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> 
> Add sof_ipc_dai_acpdmic_params and tokens to parse dmic channels and
> rate params from topology file
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: add code to parse config params for ACPDMIC dai
      commit: 689614ce48b0310b50d8d6c9a64f8a98cfc6f195

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
