Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2794F9402
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052FD192E;
	Fri,  8 Apr 2022 13:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052FD192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417229;
	bh=HD2LcDKvmyG1fX0S/usHPsdJIssyypdemdstvg2vvdw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Di/OzQBk1JDfWsuDn0Lu+uCTH13UCaoa6hGer4LOmc4QQ3lq5uN9tnhJTvgM24+RB
	 vtJ+m5y0uR+6tOqGCo2EndwGHpsYDXAL4Dp3QyRS3HCv9RXZWV3VAr9SEyugRctKKa
	 C2VByzxYP21vPBX5H8gv69pHiXdJlZqckNReweUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04614F80537;
	Fri,  8 Apr 2022 13:24:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E12F80526; Fri,  8 Apr 2022 13:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB6C1F8051E
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6C1F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TTc4iqZs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8283BB82A6F;
 Fri,  8 Apr 2022 11:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5421C385A1;
 Fri,  8 Apr 2022 11:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417063;
 bh=HD2LcDKvmyG1fX0S/usHPsdJIssyypdemdstvg2vvdw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TTc4iqZsmw76TPVZAhs/N6k8UGhng0ic7zNL8SIQdiX7+RlQneGvUl7rVFqIp+vG8
 TKnViVdPqyQSx0wUPRlG6xxYqiONWmHQ9ZSnO2gCXJhjRUZ5+5RAjK0x2AOV4Osyqo
 cF3jc3PMjqUR9Atm0lnd5cJKyoJnAA1ruQbHfxS1lD2Fn7Y2YXxkUdswimHbu9ayD8
 XkNMUjOIdSVravNeTstKhO8pz9N5+94wu44Yv6myEvOaF82WMTh2OPGydisGEony6e
 /KgLROw6N8RsZgWt3JnYzMqUEoYmfUM17pdbiYmcJF0uBc+bdjHt3jQOkz1vuNd22y
 ZNX8TtrgxDr+Q==
From: Mark Brown <broonie@kernel.org>
To: mchehab@kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <cover.1649357263.git.mchehab@kernel.org>
References: <cover.1649357263.git.mchehab@kernel.org>
Subject: Re: [PATCH v5 0/4] Make headphone work on Huawei Matebook D15
Message-Id: <164941706065.1295287.8387779207290913522.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 yung-chuan.liao@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com,
 peter.ujfalusi@linux.intel.com
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

On Thu, 7 Apr 2022 20:49:55 +0200, Mauro Carvalho Chehab wrote:
> Huawei Matebook D15 uses two different GPIOs are used to control the output:
> 
> 	- gpio0 controls the speaker output;
> 	- gpio1 controls the headphone output.
> 
> Changing both at the same time cause spurious events that are mis-interpreted
> as input events, causing troubles on apps. So, a delay is needed before turning
> on such gpios.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_es8336: simplify speaker gpio naming
      commit: 890a4087a6c2045911b5002566d1528f710cd723
[2/4] ASoC: Intel: sof_es8336: support a separate gpio to control headphone
      commit: 6e1ff1459e0086312e61c2d1ff8b74395a082fcb
[3/4] ASoC: Intel: sof_es8336: add a quirk for headset at mic1 port
      commit: 7c7bb2a059b226ebadb14ce07460f6357023d56c
[4/4] ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook D15
      commit: c7cb4717f641db68e8117635bfcf62a9c27dc8d3

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
