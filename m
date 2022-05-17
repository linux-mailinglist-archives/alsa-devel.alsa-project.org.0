Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FE52EAE2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF1F172B;
	Fri, 20 May 2022 13:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF1F172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653046452;
	bh=qB+Y2b64SyCD76/3XYAEBdye3lfRy7RB0EKRB7eIy44=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2aBeyN5l73XYUZsD+G1pq3YsMfJwO8BDciP07JuuBXcDSeA32Ka3pgIv+51uCBY7
	 Iz0wjy5y7jLwKWnSOlRtDv7mFgZiv0Zt8bYyeLwY+s3LuDsf+kKCxedMcTBaFgccGz
	 ymG2QyVRDMmBYQJY/tZysAuafVVwhtcdhvxTx9Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FD8F801F5;
	Fri, 20 May 2022 13:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718B5F800F5; Tue, 17 May 2022 17:59:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D82C5F800F5;
 Tue, 17 May 2022 17:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D82C5F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ic77Vldu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C211960EC7;
 Tue, 17 May 2022 15:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF9AC385B8;
 Tue, 17 May 2022 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803165;
 bh=qB+Y2b64SyCD76/3XYAEBdye3lfRy7RB0EKRB7eIy44=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ic77VlduGWC/bBx4kKkKWri6PpIr+WNQkfPakgMeHzOYKy/3leM0YedDNBvNKlxCD
 otWAQX0IiJfU+Wv52iV+tqz/8Scfzy+wn90H09iQ6aHMq/5xfRkAQdjTWu/3FQ60OA
 NE1TeWbfVRjKp6Clclo+taeyj9mzoHZ/mYJ+ygbLq/hPhiddlJftI8a6/tK2uJhSMH
 ICMD1PCKO4WuSEPs+2muB6YeZlDylFHoqHFPQKpeghUGK+KCmqcbAr8f3LFkwyRRnV
 kOk0b550GvXmG3KUmVgwz0ngaIjb6xnj8l1DGqMUt4bBIKBRlqQPKGFCRVROvSEtEy
 //2+hgNIPKTFg==
From: Mark Brown <broonie@kernel.org>
To: cujomalainey@chromium.org, tinghan.shen@mediatek.com,
 john.stultz@linaro.org, javierm@redhat.com, cristian.marussi@arm.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 geert+renesas@glider.be, yc.hung@mediatek.com, tzimmermann@suse.de,
 lgirdwood@gmail.com, perex@perex.cz, kai.vehmanen@linux.intel.com,
 tzungbi@google.com, bp@suse.de, ranjani.sridharan@linux.intel.com,
 bjorn.andersson@linaro.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 Arnd Bergmann <arnd@arndb.de>, simont@opensource.cirrus.com,
 daniel.baluta@nxp.com, xueshuai@linux.alibaba.com, msuchanek@suse.de,
 yangyingliang@huawei.com, sudeep.holla@arm.com, allen-kh.cheng@mediatek.com,
 matthias.bgg@gmail.com, daniel.vetter@ffwll.ch,
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20220512082215.3018-1-tinghan.shen@mediatek.com>
References: <20220512082215.3018-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v9 0/3] firmware: mtk: add adsp ipc protocol for SOF
Message-Id: <165280315828.1635268.5394864574806411839.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 May 2022 13:33:12 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Thu, 12 May 2022 16:22:12 +0800, Tinghan Shen wrote:
> This patch provides mediatek adsp ipc support for SOF.
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> This patch was tested and confirmed to work with SOF fw on
> MT8195 cherry board and MT8186 krabby board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] firmware: mediatek: Add adsp ipc protocol interface
      commit: 9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c
[2/3] ASoC: SOF: mediatek: Add ipc support for mt8195
      commit: aea9350108ed1627f8610c93de44578162b3ee91
[3/3] ASoC: SOF: mediatek: Add mt8186 ipc support
      commit: e0100bfd383c7d994d2e957e85ca56a5fe5a3f43

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
