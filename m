Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D874D1EFB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2450C1868;
	Tue,  8 Mar 2022 18:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2450C1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760289;
	bh=0Pup0kqUdWqlcyJomdjunEqEJGqGniyjbOPsaaeqU3Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCV6CeWPI8LSsDM5Uvap5JuLv78aUgOc+SH5cPcUCXB3jjBXoOaxavuijmmCN/poO
	 0NBDQJ5DxKkMqY3cz+nfnVyYSxLbsBB7071cRqxtsY+ki+D13YSQDOP8Dry6MxSuGX
	 K8TJD1ZiPMWcJ62GTfyvfJ01hNC5WZEJzAAKmr9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15686F80527;
	Tue,  8 Mar 2022 18:21:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9903F80518; Tue,  8 Mar 2022 18:20:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF618F8026D
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF618F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uPcFOLxP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8289261256;
 Tue,  8 Mar 2022 17:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E38C340EF;
 Tue,  8 Mar 2022 17:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760053;
 bh=0Pup0kqUdWqlcyJomdjunEqEJGqGniyjbOPsaaeqU3Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uPcFOLxPFLCtTqBbNacOvEiDv2k6hkJp+xu+OHwzVVcrlRPuxIx6Iafbjo4OfG5Dv
 dNTs0iFe+HfT+24vJydJXAyW79MRf1vy/8IpDOMjHz4JZZMT+4Woz0myJopG74HOZI
 ROU7h6xqmXY1n0cBmNRXDmhkiqvte4DGsXCeXphYWlr5RGPf2ITgKUowh07XtD9RK/
 54OS/5Mq6h4rDR6VbEYDO+2mz5dMpP+A/mXpm/shEF1MVbdzwjKHMLs80KyT51uXR3
 cOWU8wldpWIeEZbn+QlMNk8kPUJZbDFOQIbkgOddP88zb9CLbjrC2sQR3wb4F8iAM+
 2aAM/LlFQNqZQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/18] Clean ups and preparation for IPC abstraction in
 the SOF driver
Message-Id: <164676005240.54315.3667089137740295088.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 7 Mar 2022 10:10:53 -0800, Ranjani Sridharan wrote:
> In preparation for adding support for the new IPC version that has been
> introduced in the SOF firmware, this patch set includes some clean ups
> and necessary modifications to commonly used functions that will be
> re-used across different IPC-specific code.
> 
> Pierre-Louis Bossart (1):
>   ASoC: SOF: sof-audio: removed unused function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: SOF: remove snd_sof_pipeline_find()
        commit: 5187357e45c3b3d4cab3b990a893369eb8ca6f70
[02/18] ASoC: SOF: simplify snd_sof_device_remove()
        commit: 80df2226268f039326f9daebd25047cf15e22497
[03/18] ASoC: SOF: set swidget's core for scheduler widget
        commit: 3a790f3a7c283d94325a85ac6ee4d1458e89b645
[04/18] ASoC: SOF: sof-audio: removed unused function
        commit: c99b70a2d21ab744bdee7a2ea7ec8a35caba9725
[05/18] ASoC: SOF: topology: remove redundant code
        commit: fb763299bd8e075f1e9fb0a1cd296b0400fe8442
[06/18] ASoC: SOF: topology: remove redundant code in sof_link_afe_load()
        commit: 9911ce06db9dd26d62cd131318588dc039696a99
[07/18] ASoC: SOF: topology: Drop the size parameter from struct sof_topology_token
        commit: 6a6b5727f8eedff8932db6056c07a81eeeca9250
[08/18] ASoC: SOF: topology: Modify the get_token op for string tokens
        commit: 5ef969e2f8e199d8881ea4cd78cb86df1c67d92b
[09/18] ASoC: SOF: topology: expose some get_token ops
        commit: ea7e5ee67fb71d92b0eb0be8467fd34b0e2def6c
[10/18] ASoC: SOF: change comp_dai to a pointer in struct snd_sof_dai
        commit: 40bdb2fd6b151e34fdf841238627dd0cfa960093
[11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
        (no commit info)
[12/18] ASoC: SOF: topology: make sof_route_load() IPC agnostic
        (no commit info)
[13/18] ASoC: SOF: Add a tuples array to struct snd_sof_widget
        (no commit info)
[14/18] ASoC: SOF: topology: Modify signature for token parsing functions
        (no commit info)
[15/18] ASoC: SOF: topology: Rename arguments in sof_parse_token_sets()
        (no commit info)
[16/18] ASoC: SOF: topology: Rename arguments in sof_parse_tokens()
        (no commit info)
[17/18] ASoC: SOF: make struct snd_sof_dai IPC agnostic
        (no commit info)
[18/18] ASoC: SOF: move definition of snd_sof_ipc to header file
        (no commit info)

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
