Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FC297A00
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 02:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5C4180E;
	Sat, 24 Oct 2020 02:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5C4180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603499426;
	bh=32XWQhmf2fVSD8v1CY5v7gHT3K2lKMcNN/oPnMyqnMM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGt0JN4C3CHJu5aMspKP3/6Be8k9FcnzIXAy05r2EX9Tqkc7upYamo/C/UcIWQlSv
	 VDea2dJ2o3d1Ch/SX/dN1QfEx6FnLX1kQxVJzeDcYyaApnx/kxLfybI/XSTItpZBDV
	 nrN43aw1VUGaMEFT8NrtrOaiskTpwbn5Bgkyd7NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8883AF80264;
	Sat, 24 Oct 2020 02:28:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69797F80253; Sat, 24 Oct 2020 02:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F79F800BD
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 02:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F79F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JPGAuEs7"
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9958622274;
 Sat, 24 Oct 2020 00:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603499326;
 bh=32XWQhmf2fVSD8v1CY5v7gHT3K2lKMcNN/oPnMyqnMM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JPGAuEs7+4VUhMKKdXZG/LQTnx1a+EStQyyQ6fkoVqfPgjFgmepkBZDsV/h20Bd4B
 P8/Sm6HsBShl7Ko/IhG8Q/XiWPSgahyb4A/ColiqD4Bp4V2NuyHnN+DXyO3bC3cG8/
 +x+Cj8IJzevU9ULTEYXsTeiKGuhdL0W4QfHr/CoQ=
Date: Sat, 24 Oct 2020 01:28:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201023095849.22894-1-srinivas.kandagatla@linaro.org>
References: <20201023095849.22894-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: set driver name correctly
Message-Id: <160349931942.28438.7096729717850687887.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, 23 Oct 2020 10:58:49 +0100, Srinivas Kandagatla wrote:
> With the current state of code, we would endup with something like
> below in /proc/asound/cards for 2 machines based on this driver.
> 
> Machine 1:
>  0 [DB845c            ]: DB845c - DB845c
>                        DB845c
> Machine 2:
>  0 [LenovoYOGAC6301]: Lenovo-YOGA-C63 - Lenovo-YOGA-C630-13Q50
>                      LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sdm845: set driver name correctly
      commit: 3f48b6eba15ea342ef4cb420b580f5ed6605669f

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
