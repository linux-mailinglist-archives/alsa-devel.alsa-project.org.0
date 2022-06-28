Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC955E546
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 16:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51CFC829;
	Tue, 28 Jun 2022 16:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51CFC829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656425919;
	bh=/2o6Cn+wlOC6M4+LDwBixIIRgNm0JkPO5/D8l7zwm1w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qlJMV7DzPd6kdjTMEgPIOuRLzjXK3W4F+zb3Dad4pUKRo9TWtfphHH0IBlqYw7Cbg
	 1aI/oR/AtGws7Ue26k0z5Fr23gDNIRWMBbkmJ5GHIxN353f2v+MTDb9W8hgyZr2WPU
	 dx94rDr7l99a24oFxXQbdYAUwNuL4NKAEVCY91AU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B170EF8025B;
	Tue, 28 Jun 2022 16:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10027F80167; Tue, 28 Jun 2022 16:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFE5F80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 16:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFE5F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jV18BWsK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D38D3B81E3B;
 Tue, 28 Jun 2022 14:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521CEC3411D;
 Tue, 28 Jun 2022 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656425854;
 bh=/2o6Cn+wlOC6M4+LDwBixIIRgNm0JkPO5/D8l7zwm1w=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jV18BWsK2+4axT3lbN28G1XGohb2mLJv2qK16Odx0NrsY7knbqE+10Ye6BiCSxcFi
 FA9Q42hpZO+IVoErbHYkkdimpm9Wbp9K5taJY9iM/KuPcKBRvM/rLwLF1KsSYreG7U
 43AxwETYWO/iTsGS2KHOagMI+mATxE6lHvcJhqeoswffLiLqsxEo4mtVNdimpTNsDa
 9AAdNVn9vj4kz3Kcxw3VthIOGSWbx1OFbOhLgLcvch8vQOZlgt3Nsa6UNDG7JD6SE2
 tu7ofZGzVg1pa/CF0SN2YlGNmHYAwPYFf+XLJUEN8TUI3RKIK6BcNBupNJuO8r9nwa
 DHreUPgMYyG3Q==
From: Mark Brown <broonie@kernel.org>
To: quic_plai@quicinc.com, lgirdwood@gmail.com, judyhsiao@chromium.org,
 agross@kernel.org, quic_rohkumar@quicinc.com, bgoswami@quicinc.com,
 quic_srivasam@quicinc.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, perex@perex.cz, tiwai@suse.com
In-Reply-To: <1656326662-14524-1-git-send-email-quic_srivasam@quicinc.com>
References: <1656326662-14524-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: Add driver support for audioreach solution
Message-Id: <165642585106.1712503.17346348780044575252.b4-ty@kernel.org>
Date: Tue, 28 Jun 2022 15:17:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 27 Jun 2022 16:14:22 +0530, Srinivasa Rao Mandadapu wrote:
> Add Machine driver support for audioreach solution, which uses
> ADSP in SC7280 based paltforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add driver support for audioreach solution
      commit: 5f78e1fb7a3ed1acc355145536ddd54f183b635d

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
