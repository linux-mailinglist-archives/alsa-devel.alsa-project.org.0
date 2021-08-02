Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6C3DDBD4
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAA51740;
	Mon,  2 Aug 2021 17:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAA51740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627916655;
	bh=NnxcVtIQ8H09f9yPch21fQNcIfoSSOrNp+cjh//dxaA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=br/qJdU7RB4MFwuRUMblQZ2ZUnJUqqvbMSJ+8Z48vr6WYQVqvPScaptDcrdDz5gaa
	 D+mQ+RAN9gfizRns+Vs1IE3HWjD8SD+B1Xzxf82jGpX4yyuwcM/mh5nA4ftEFVlQ5G
	 YRPW7nbyiDmVvBFOog5nRwPlWov0ZqMjHpqyzxAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E92F8025F;
	Mon,  2 Aug 2021 17:03:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3652F80279; Mon,  2 Aug 2021 17:03:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ACD0F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACD0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P3nsPfLl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFEF5610FB;
 Mon,  2 Aug 2021 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627916573;
 bh=NnxcVtIQ8H09f9yPch21fQNcIfoSSOrNp+cjh//dxaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3nsPfLli4a8mWNAKvy5aAwivIic5HPW7TBEkNzi3BRGosekAz4siyGZxTnF9WQLk
 OFDpc8yyVsGP4AAF7jiLDjaD8gCe1oPY583hy+wTGSf0TRXdv4tgffzTgrvoYzHpEr
 ep6IHzwwoQ5EoM8B6wR9boCZ9f7Y327VRTTB9Mp+ikpIcsIzq7p4WMYcD3XO5kAL8m
 gSu6KGsld6sWwAu8/bvLcVsIYg+HZmeWLyME2sPRJiimac/DbrJ+drscGABeO3nsgo
 9DOpnXkbS7rO1oWnPvenDjkJgqMZU4Y6xBo4T2k+91CC+dKKH/bOr/Iw6c1fjDnEyU
 oWq76JEku2lOw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: soc-topology: cleanup cppcheck warning
Date: Mon,  2 Aug 2021 16:02:33 +0100
Message-Id: <162791613031.1468.13355473007712973727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87tuk8wfme.wl-kuninori.morimoto.gx@renesas.com>
References: <87tuk8wfme.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 02 Aug 2021 15:00:09 +0900, Kuninori Morimoto wrote:
> Now I'm posting audio-graph-card2 patch-set, but it seems it needs longer
> discussion. Thus I want to post more easy patch first, and reduce my
> local patches.
> 
> These are cppcheck warning cleanup patches for soc-topology.
> 
> Kuninori Morimoto (5):
>   ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_process_headers()
>   ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dai_elems_load()
>   ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dapm_widget_elems_load()
>   ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_kcontrol_elems_load()
>   ASoC: soc-topology: cleanup cppcheck warning at snd_soc_find_dai_link()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_process_headers()
      commit: f79e4b2a38eda4e365f765d363f47cf0c2183ab4
[2/5] ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dai_elems_load()
      commit: 65a4cfdd6f2bc04b0c3d3607c48ceeac999c9424
[3/5] ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dapm_widget_elems_load()
      commit: e9aa139f95f5995d7010f46c285f5b9a19695b2d
[4/5] ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_kcontrol_elems_load()
      commit: ea8f6b29b4a5676ca4b67b571a63ebabec245fd2
[5/5] ASoC: soc-topology: cleanup cppcheck warning at snd_soc_find_dai_link()
      commit: b81e8efa245af00e152a485297c611fe84a514a9

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
