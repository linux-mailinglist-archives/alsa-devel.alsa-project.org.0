Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B1518918
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 17:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46C5843;
	Tue,  3 May 2022 17:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46C5843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651593157;
	bh=akc4P1CT2JMs8+Y04oGAJTGvBEGi+T9fXK9A+hSt5zQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/DefWtV/5J1uBsFMJQSe1q4jnSiADkkUxn9PYGCAKZJLudwbLnuSl6Ll/mse5wcD
	 4PV0znYiORTDqO2tQE2DA3TpSmOtqilIDZqgavr5fMJwHfWsIPDKH+Fzd+6btn8v+Q
	 ap3ugAZkO/KrC1nFeMTj8Jv0JQyZpgIDSwMn3FfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD429F80506;
	Tue,  3 May 2022 17:51:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DAB9F804AB; Tue,  3 May 2022 17:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 278B0F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 17:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 278B0F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QNwadGzK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8111661685;
 Tue,  3 May 2022 15:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A34C385B1;
 Tue,  3 May 2022 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651593056;
 bh=akc4P1CT2JMs8+Y04oGAJTGvBEGi+T9fXK9A+hSt5zQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QNwadGzKxeUhgHNEJ8lR+79whi+iSFS3MKeSLzzuQud/kJbDvkA0YVeWH/1O8yLvm
 z/PXeygU+djtFbLoFeYjqOGARb++ncN0fcIwk/JEF/IZRRsF+APQsEoVOhxmjzqiS/
 ffIYUPqptykzkj0xJeCjc2GGUcoilpmGlHJ1wnm7mkX4ZgaDSKoDXNQaIR3Y9E3Gpz
 pXz4S6dxYy9xT0JpbZuiM0wu5pp8CcMF61pGtJHfo0mVoQH7sl9Z/skCOuXH+21csQ
 ibqqJ45KqWzPaIe7Bbuu2A3Kd8nbozXAvetJYoVsnwo7K4ojd6CAq/S3u05hnDJsoG
 SaMA/W1YO/wfg==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: SOF: Miscellaneous preparatory patches for
 IPC4
Message-Id: <165159305599.184114.6184107807430721548.b4-ty@kernel.org>
Date: Tue, 03 May 2022 16:50:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com
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

On Tue, 26 Apr 2022 10:17:32 -0700, Ranjani Sridharan wrote:
> This series includes last few remaining miscellaneous patches to prepare
> for the introduction of new IPC version, IPC4, in the SOF driver. The changes
> include new IPC ops for topology parsing to set up the volume table, prepare
> the widgets for set up and free the routes. The remaining patches introduce
> new fields in the existing data structures for use in IPC4 and align the flows
> for widget/route set up so that they are common for both IPC3 and IPC4.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: Add a new op to set up volume table
        commit: 48d2a1ceae03610a431535aca9106eab4201b191
[02/11] ASoC: SOF: sof-audio: reset route status before freeing widget
        commit: 33a3facdf8ccf1b777ef0c39841425ca8d8d4a40
[03/11] ASoC: SOF: sof-audio: Set up widgets from source to sink
        commit: 5da0590a090b096279227cf2b044b1ef9b9c6c1b
[04/11] ASoC: SOF: pcm: Move the call to snd_sof_pcm_platform_hw_params()
        commit: f0d31dbb3fc44ac9cb0d9991cc0a629c88e80ac8
[05/11] ASoC: SOF: expose a couple of functions
        commit: 7b3a5be546a131f806fa015d1c78987daf1eb5c9
[06/11] ASoC: SOF: Add a route_free op in struct sof_ipc_tplg_ops
        commit: d77d7795547ae8e2ed23d1ce835b539ee1d794bb
[07/11] ASoC: SOF: Add two new fields to struct snd_sof_widget
        commit: 36cbc9df3faca01500480acdda016222663da761
[08/11] ASoC: SOF: pcm: remove unnecessary function declaration
        commit: f18ad9caa0dfeb12cb386777b1130c5fba9a0079
[09/11] ASoC: SOF: topology: Skip parsing DAI link tokens if not needed
        commit: a5ba725e9dc928832ba97a4418e36fef8d0244c6
[10/11] ASoC: SOF: clarify use of widget complete flag
        commit: 463a809ba8efa127484d16ff588e3bcdb63fe41e
[11/11] ASoC: SOF: Add a prepare op to IPC topology widget ops
        commit: 66344c6d92113e605d8212e79b1219406893ee05

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
