Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8D41F8B0
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933AA1705;
	Sat,  2 Oct 2021 02:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933AA1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633133976;
	bh=4FJEAT/sxSlNVMftuJTDxDTjCTbqAA2ghJtUCLuVF5U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgJjprtYaAeqyeJfNbk9NS+hXKB7W5vAX/RDR1u6BJcs6t4EAx1g6EXBX8cKIXOHO
	 cTrAJKtZPrnW43mHAO2Fc8ieMb755fWZ9n1hvj8IaCPDc2U6zAdxc1qiyZCkbYKwD6
	 gRGsaEmkK3wVErCfsYf/cM1OfkfLSmGeeUJAzKlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F2EF804F2;
	Sat,  2 Oct 2021 02:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCA9F804B0; Sat,  2 Oct 2021 02:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63093F801F7
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63093F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d+eNdtvI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DB4D61AFA;
 Sat,  2 Oct 2021 00:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133824;
 bh=4FJEAT/sxSlNVMftuJTDxDTjCTbqAA2ghJtUCLuVF5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+eNdtvI+KQZbzHna6PIjBRzKpxPQ9BjY8vfgSOZipmOrXrhuE79cRlISyzSqJV6S
 MPcNf+vLpaQ1zDI0sWgztxO1kfUd4Je5KUNuGegpOULJePEED5m49hEFV5on/kzdCw
 te0NO131zjD87QDtU4kp7y/0YyIbZKSKshxJlNXfrQrMPpbWp9kWOlrCJ269HbrRJ9
 nRQHGWV6NkSb3n0LlrKdWgnNsDRVfPRo36bQ6R272NYlVtF+Bwdovtx+x2V034r/k+
 Knq3XHnOFMpQqemhQDkAHxswhhr083KkPoHBcMdlWYdfVALoQeIprpGFX51MN63rT5
 XshIFhxtlfwmw==
From: Mark Brown <broonie@kernel.org>
To: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3 00/12] Add support for on demand pipeline setup/destroy
Date: Sat,  2 Oct 2021 01:16:31 +0100
Message-Id: <163313339132.45396.4904854588894337857.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
References: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Mark Brown <broonie@kernel.org>
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

On Mon, 27 Sep 2021 15:05:05 +0300, Peter Ujfalusi wrote:
> The previous, v2 of this series was sent by Daniel Baluta:
> https://lore.kernel.org/alsa-devel/20210917143659.401102-1-daniel.baluta@oss.nxp.com/
> 
> We have agreed that it might be better that someone from Intel is going to take it
> from here as we already have the infrastructure up to test and verify the
> dynamic pipelines support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: topology: change the complete op in snd_soc_tplg_ops to return int
        commit: 415717e1e367debe6344533f98eaeceb2dce52b3
[02/12] ASoC: SOF: control: Add access field in struct snd_sof_control
        commit: 199a3754f2736808d7bfa4c962eaf89e1d17e462
[03/12] ASoC: SOF: topology: Add new token for dynamic pipeline
        commit: 2c28ecad0d099ff914a0675f064db6e5b75e0756
[04/12] ASoC: SOF: sof-audio: add helpers for widgets, kcontrols and dai config set up
        commit: 93d71245c655e639248c7c33db20074c71a89c1a
[05/12] AsoC: dapm: export a couple of functions
        commit: d1a7af0979292b187bde0d556d26fe21bd64b832
[06/12] ASoC: SOF: Add new fields to snd_sof_route
        commit: 0a2dea1f10106746e5ed033beaf403049cf8eb10
[07/12] ASoC: SOF: restore kcontrols for widget during set up
        commit: 5f3aad73fcc2b301ed7d7ed60c1364e8c29741b1
[08/12] ASoC: SOF: Don't set up widgets during topology parsing
        commit: 1b7d57d7178697ebdd9e6f21b4953ada168d2a61
[09/12] ASoC: SOF: Introduce widget use_count
        commit: 8b0014169254513bda914ba5d49a09458a919488
[10/12] ASoC: SOF: Intel: hda: make sure DAI widget is set up before IPC
        commit: 0acb48dd31e39b617bb12ca546b4fecd6ccb2972
[11/12] ASoC: SOF: Add support for dynamic pipelines
        commit: 5fcdbb2d45df6afb654674379546996b0027aa3e
[12/12] ASoC: SOF: topology: Add kernel parameter for topology verification
        commit: c0e7969cf9c4fd347b33a8056960e8448f6b51c0

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
