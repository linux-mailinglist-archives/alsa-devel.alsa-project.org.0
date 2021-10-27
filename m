Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A343CFC9
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4FA16BB;
	Wed, 27 Oct 2021 19:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4FA16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355999;
	bh=6wsO8Dsm+4j6Y2prOkQU1DiQ+MPRHE4swcm5Y0P5IlE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zi/MRVI86aTE7+ykY93x4cT9io15ogDxADT9eBc/EuJhypucby/XtNmRmivQS4bsn
	 bv0iCfHhaFUg1NvBpqwphC8S6OES1w0Jvq2BNp+t66rpaYqEOeayafH6VNQqnUIk9p
	 E6whnHgq6qt2d3B4m5a9bCsVpkQimgo6by1F50N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C646F80511;
	Wed, 27 Oct 2021 19:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD7AF8032B; Wed, 27 Oct 2021 19:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF29AF8025E
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF29AF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mOanx7Q1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9910460E74;
 Wed, 27 Oct 2021 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355748;
 bh=6wsO8Dsm+4j6Y2prOkQU1DiQ+MPRHE4swcm5Y0P5IlE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mOanx7Q1jg/7w32g5vd2IuU9n9BT9qL9mMFesenajTPvEYd60go/MMuVOEiDcaniZ
 fzwT3nO7BjPLEY9rAXLSIWP5m36Sqh3z0/YsQ8YtzVdx74TAQIbU1S7jRngw5zE0qX
 ccps4m9QnlVW2Zca/7zNR+rN07efi/+PVswyRyCWshwmOA32NyRQgDyu+5JdWtxjzB
 qTf2gSd23mFJ9M0+5hz5ANMt2VXeaJ3zFuzVM6MLeaw8WvnwIfpmGh+ypGmIE2JYjx
 o+2pf1DGjI0i/I5j5lCwFVYAITeTmE/Cxj3c22eLMsK0bFGYrmZaVT9p4IoBmIIpYv
 dP6tn4Luxx/Rw==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 0/2] Make genaral and simple for new sof machine driver
Message-Id: <163535574636.4012075.14687154285140094237.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On Mon, 25 Oct 2021 19:38:56 +0800, David Lin wrote:
> The series of features will make general and simple for new sof machine driver.
> 
> David Lin (2):
>   ASoC: nau8825: add set_jack coponment support
>   ASoC: nau8825: add clock management for power saving
> 
> sound/soc/codecs/nau8825.c | 48 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: nau8825: add set_jack coponment support
      commit: c6167e10e76fb97d37613004046e66027b3a569b
[2/2] ASoC: nau8825: add clock management for power saving
      commit: 6133148ca08a097ed8c57d7f5a7826723273049b

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
