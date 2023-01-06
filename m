Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E07660841
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 21:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521231426D;
	Fri,  6 Jan 2023 21:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521231426D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673036723;
	bh=62nxf5aNBYDvGdXhyDdjTj6yHB6Fp13Om6wUB5lwOZw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FVPXMWvnesAqp11PruG7VGRE3oNs8odwNK0KD4dv6FU7MfO+ZhL9fO9D9w4vgyj0V
	 YAbC0od6fxwDZwZXdF6mzUXHIg8FhYUb8flRUqARDSvHDG41SB67m+zlgndOK9lFYt
	 ibzKlwbyVrRF0HgvkIVesYGdgsyGF9FP3uK/Eru4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 242A4F802DB;
	Fri,  6 Jan 2023 21:24:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AC01F8022B; Fri,  6 Jan 2023 21:24:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88742F8024D
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 21:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88742F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lY1mco5A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51ED8B81E5C;
 Fri,  6 Jan 2023 20:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB8DC433F0;
 Fri,  6 Jan 2023 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673036663;
 bh=62nxf5aNBYDvGdXhyDdjTj6yHB6Fp13Om6wUB5lwOZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lY1mco5A1QWWjL2vwwUkyFzMKZ1pRLhUDUDaPQeOiFxOOkjAjKdu9QQuhxOphRVJP
 YU2aSyEQW35dWt4hOBa1vlFhEp9nmJ+FzSruVQteZXMjObaEKDyNVj31mMz+RYxXEE
 08bVAp9dgNAmAkuySkJslUXwkWp9k0De8ESdQVQyX/fvwwxBXcjtDnp4Ny4aFQIXOt
 Of3FfwOBBQDNfmbBE/1xti47Ym/wAGx4UrA49CP1UUc2I9zTLqiKez2Yhn66kr2kQi
 2Jttz58DDl+J2N3O5wJ2Ayk4EKs//paFKROKfRFUdzTkga6FnO3B3raVIYrSx9f/yn
 QME2akopsw29A==
From: Bjorn Andersson <andersson@kernel.org>
To: stephan@gerhold.net,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 0/2] Fix APR audio regression on 6.2-rc1
Date: Fri,  6 Jan 2023 14:24:18 -0600
Message-Id: <167303665353.1802272.239146565837187502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, jiasheng@iscas.ac.cn,
 konrad.dybcio@linaro.org, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 ~postmarketos/upstreaming@lists.sr.ht, bgoswami@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 29 Dec 2022 16:16:46 +0100, Stephan Gerhold wrote:
> These two patches fix regressions in the Qualcomm APR driver that
> prevent audio from working on MSM8916 (and likely MSM8996). In previous
> kernel releases the "qcom,protection-domain" property was optional, in
> 6.2-rc1 it is now required. It should remain optional because the
> protection domain functionality is only supported starting with MSM8998
> and is not present on older SoCs [1].
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: qcom: apr: Make qcom,protection-domain optional again
      commit: 26658868354963afbff672ad6f7a85c44c311975
[2/2] soc: qcom: apr: Make qcom,protection-domain optional again
      commit: 599d41fb8ea8bd2a99ca9525dd69405020e43dda

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
