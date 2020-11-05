Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388552A83F3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:49:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D051116B5;
	Thu,  5 Nov 2020 17:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D051116B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604594948;
	bh=3mLgC7lshSCAhLLNfQFl7W9K+GdtDK4zxHxIeFZBLiY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QynK69R8VaDVCOxWkr0XgnoerBYgw+2dAndHQ1QAe6U2FyDciidtuj8mAOwrHd057
	 hlHvp5K8B7mylxT9p2zRd2BwJK7q8sO8NIkI9ze/9htw20WgPnNY7VpyyS3260gKw/
	 Yzj0ocEQcMLm5w7saKsZqZrCqDtQr8hpW0Eskn7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F24E1F804E3;
	Thu,  5 Nov 2020 17:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B53D2F804E2; Thu,  5 Nov 2020 17:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24454F804CC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24454F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CHLDGYX7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9505921734;
 Thu,  5 Nov 2020 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594763;
 bh=3mLgC7lshSCAhLLNfQFl7W9K+GdtDK4zxHxIeFZBLiY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CHLDGYX7UcSq3mV9D/0IPslYOkDMlbnKgtSUcm90v7qIoyeBsFpluSPKQU1vnXt7+
 5kYBFRkFNKuH+o/qUCxHt5zxydHnEN0jPW4bX3+bK0s9UDVdBRVRO43HXz+A2TB82m
 Uzr3fV2Tdc0kh+legu7WJG/NciKOW6hXopQZiuVw=
Date: Thu, 05 Nov 2020 16:45:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201105114100.18647-1-srinivas.kandagatla@linaro.org>
References: <20201105114100.18647-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoc: qcom: lpass-cpu: fix warning on symbol scope
Message-Id: <160459472201.54851.16145337656308904668.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

On Thu, 5 Nov 2020 11:41:00 +0000, Srinivas Kandagatla wrote:
> This patch fixes below warning when module is compiled with W=1 C=1
> 
> lpass-cpu.c:677:22: warning: symbol 'lpass_hdmi_regmap_config'
> was not declared. Should it be static?

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: fix warning on symbol scope
      commit: 20f64a1db8a06fdf4ed03375546f8d3555cb6cc9

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
