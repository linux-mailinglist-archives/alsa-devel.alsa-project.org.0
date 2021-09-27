Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACE419DA8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D3D16EA;
	Mon, 27 Sep 2021 19:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D3D16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765367;
	bh=rmEeqBYM9LuHb+thct8OrwB+y0kgIxvtDtMa3Kaq5AI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDFi26BfzYZQbAmazZ26Apxu1A2dIpJDjlvkCyxqn/G1pf+CeH8wX78gAH6+Xg9pJ
	 dQ98KxK1GPuIhR4ebzhEMcqXUovgSVfyOilZMITdp2f2H+3xJa/vWxs56y01ZsMY1I
	 I+vpZHNwZ3ajdMi10aJwSXKUes5vp6tywYB2idlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0638FF805AA;
	Mon, 27 Sep 2021 19:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05B4CF80588; Mon, 27 Sep 2021 19:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13433F80579
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13433F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JSgPG2wI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9411760FD7;
 Mon, 27 Sep 2021 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764886;
 bh=rmEeqBYM9LuHb+thct8OrwB+y0kgIxvtDtMa3Kaq5AI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSgPG2wIrp+hK1v9Z7r3cRHnWDXms51O/9Aj6qVOnS/tkR8c6GPWyDOA+lWwWwCll
 gYmZMDlWZEjr5wLvSMmCB8RukqstRgNylNB/aMhchhJYOT/1WD2NssiSUYRRWbEJyw
 xR3czgOP+VUAQ0lvplDbaBpbQ+e+nEDMhapColg6M3ymoGnL+hXexLONul9fyqMI32
 WpuFC9OZJ0qsJVA7KmrGIORFmed+z2Ybeu+SxUi2LmN+9B6+/PTNy1rqJ/QRa0wly/
 70WFp+TT098hB8+WIQZ30i6JW7bh3SUvJlGp5VU0MGR/7KaKx7+zfx3TO32K2iPmvd
 y0AaQWQAnNJBg==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH 00/16] add driver to support firmware loading on Cirrus
 Logic DSPs
Date: Mon, 27 Sep 2021 18:45:47 +0100
Message-Id: <163276442023.18200.6494204806311200005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, 13 Sep 2021 17:00:41 +0100, Simon Trimmer wrote:
> This series of patches gradually separates the ASoC specific wm_adsp
> code from that required to manage firmware in Cirrus Logic DSPs.
> 
> The series starts with renaming, progresses to splitting the
> functionality before finally moving the independent functionality into
> drivers/firmware so that it can be used by both the existing ASoC
> wm_adsp and new non-audio parts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: wm_adsp: Remove use of snd_ctl_elem_type_t
        commit: d07a6d454ffa310ee306d57f486eb64380bbdfff
[02/16] ASoC: wm_adsp: Move check for control existence
        commit: 6477960755fb2c0ca9b0497bc86abfa4ee173556
[03/16] ASoC: wm_adsp: Switch to using wm_coeff_read_ctrl for compressed buffers
        commit: 04ae08596737c4d3872dfb6e617c918d9ecf073e
[04/16] ASoC: wm_adsp: Cancel ongoing work when removing controls
        commit: df6c505c129a114da783ae82b9f0b4d2d4691c91
[05/16] ASoC: wm_adsp: Rename generic DSP support
        commit: 5beb8eeade2c03b55ae729c05bb9fa245633fe74
[06/16] ASoC: wm_adsp: Introduce cs_dsp logging macros
        commit: 6ab1d0cc8470100cc8e0b478d94ff00b44df1625
[07/16] ASoC: wm_adsp: Separate some ASoC and generic functions
        commit: 25ca837ba6f4dd8f969b41aa202a62facdd2370c
[08/16] ASoC: wm_adsp: Split DSP power operations into helper functions
        commit: 186152df4d431650154c3e3aefc7d3e1004987c8
[09/16] ASoC: wm_adsp: Move sys_config_size to wm_adsp
        commit: 6092be2d93b3b28dfeca4e5944052a1a21f51ca3
[10/16] ASoC: wm_adsp: Separate generic cs_dsp_coeff_ctl handling
        commit: 0700bc2fb94c28459f57a10d2ee2c7ef4cb70862
[11/16] ASoC: wm_adsp: Move check of dsp->running to better place
        commit: edb1d6d7f03913b2b6ca299b1f6fd8dc96d511f5
[12/16] ASoC: wm_adsp: Pass firmware names as parameters when starting DSP core
        commit: 2169f2f15185f9393b1c16eac6e7c7d4adb6279b
[13/16] ASoC: wm_adsp: move firmware loading to client
        commit: a828056fa1fc044beab3cbe32f484fec5f38fe98
[14/16] ASoC: wm_adsp: Split out struct cs_dsp from struct wm_adsp
        commit: e146820215910d889ab16d6c2484fd51a6bb8f1f
[15/16] ASoC: wm_adsp: Separate wm_adsp specifics in cs_dsp_client_ops
        commit: 2dd044641ec3672433b9fe3ec47b236621757aa8
[16/16] firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs
        commit: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7

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
