Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA89455098
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9C118CD;
	Wed, 17 Nov 2021 23:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9C118CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188439;
	bh=iSDarEnFNoad8U3qY5c/ydBpw3ujHCMjwwnb+PZeiXU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X17Zd5qwYLeL3XfVMhBu+NptOt2oxYl7DH7tV4YQFlGkDNNSQ2Z41BWz/E4zRYhwS
	 WE532sodwp2SKz77jicLHEoEknCerGqHgTJbGl3vM2n/HmxNQ5f4uHO1BnPg1AXhxn
	 sYX/UcAIwDoaD9Si3fLYbxQURxLHZG2jmEVK1xn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2169AF804F3;
	Wed, 17 Nov 2021 23:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95E19F804EB; Wed, 17 Nov 2021 23:31:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69852F8049C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69852F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N843isnn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16C7561B72;
 Wed, 17 Nov 2021 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188288;
 bh=iSDarEnFNoad8U3qY5c/ydBpw3ujHCMjwwnb+PZeiXU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=N843isnn5cJDKaOw3J6nP/DygWeI3F9ZThJSd6J6wTlCXL+dG2wNZTqP69fRhW4B9
 OYgvmB2z6RIGRuwGg5Fv+yoEBHo2uEmGwzloDLB1fDv9Q6GBjYEnAVTqKy8bbx6I8o
 sIAM2DOXONJQXostsnPLHzfTBm7bkwf3bFuR/p/ne2xjFSr5hmFxY2DfJ9CIz/B3rq
 K/5IS+4r3RdiVTF521bwd1uKhM2c6D/oNv0B5TBVuew8ZaA4TJaOTBhr46ThqFm8fm
 IMU7+b/k5KhML5pTXmSzk+hVX2m4GlGigAyaLBXhAueHZWuoqg5Nr1oTaZlIC/fZNT
 4eu7bpVtUpNDQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 01/10] ASoC: wm_adsp: Remove the wmfw_add_ctl helper
 function
Message-Id: <163718828783.136850.1412694625868493502.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Wed, 17 Nov 2021 13:22:51 +0000, Charles Keepax wrote:
> The helper function wmfw_add_ctl is only called from one place and that
> place is a function with only 2 lines of code. Merge the helper function
> into the work function to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: wm_adsp: Remove the wmfw_add_ctl helper function
        commit: 56717d72f7a811799e8d138ff3d49325272c5cf6
[02/10] firmware: cs_dsp: Add lockdep asserts to interface functions
        commit: 5065cfabec21a4acf562932f1d0a814c119e0a69
[03/10] firmware: cs_dsp: Add version checks on coefficient loading
        commit: 2925748eadc33cba3bded7b69475a1b002b124ac
[04/10] firmware: cs_dsp: Add pre_run callback
        commit: 14055b5a3a23204c4702ae5d3f2a819ee081ce33
[05/10] firmware: cs_dsp: Print messages from bin files
        commit: 40a34ae7308682bbbf5827145afa23dcdfb1f090
[06/10] firmware: cs_dsp: Add support for rev 2 coefficient files
        commit: dcee767667f44ed0d40a3debf507a3ba027a1994
[07/10] firmware: cs_dsp: Perform NULL check in cs_dsp_coeff_write/read_ctrl
        commit: 86c6080407740937ed2ba0ccd181e947f77e2154
[08/10] firmware: cs_dsp: Clarify some kernel doc comments
        commit: b329b3d39497a9fdb175d7e4fd77ae7170d5d26c
[09/10] firmware: cs_dsp: Add offset to cs_dsp read/write
        commit: f444da38ac924748de696c393327a44c4b8d727e
[10/10] firmware: cs_dsp: Allow creation of event controls
        commit: 5c903f64ce97172d63f7591cfa9e37cba58867b2

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
