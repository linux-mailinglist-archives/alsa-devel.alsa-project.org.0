Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F863ADFA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D3D168A;
	Mon, 28 Nov 2022 17:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D3D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653633;
	bh=NAGBW7jVQtQ3XhXFNz8vKgIt9eWnUGvhfyXZ1qUgZnE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZY9z1Q00y26k58XwWAJR5e1/aZUHznME2uJblMKM0rKIq9lwMeEa0Dyw8mdAGtunz
	 0aea2XaSljE6MzUTMHdrQ1POyV5UTTU//b/O4o4WRWrTS1Ecb0BPhf8iWHLZj9aSIo
	 WpNTQbjL1j19fgSeSVIn6SttuQZE0nzsJTDO9P3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7938F804AC;
	Mon, 28 Nov 2022 17:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC79AF804AC; Mon, 28 Nov 2022 17:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63540F8027D
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63540F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ccc1tr19"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D745061262;
 Mon, 28 Nov 2022 16:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD5DC433D6;
 Mon, 28 Nov 2022 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653550;
 bh=NAGBW7jVQtQ3XhXFNz8vKgIt9eWnUGvhfyXZ1qUgZnE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ccc1tr191aYCv4ZgyhVSrKD1blmbGU6ZtK0HpoY++V/fovAJ3SIxnZtpIYvumwjeo
 +dJPMxmL+6BNVvwMnwx+pLJbUTuPiRVGoTudnOXhHYfhfP2JJ/Rd3l6KJqIuy4ulgO
 qq7ULwboAKe/MkUx47L0IcIo2/Ug+vjb5/RMQIutzlfoajZrsKtPEJEeBzpWq0hjwx
 0gRJ/3N2jJwDKqyri3mmlIK0K/FSv5ectpmXZs1TgNBn40JbXn2ccf4LnRmX3Sds0W
 e9XewrNdHEhJUFsbWgoUUAq8fhdBDT08Ld29I/0cwcR1xzFiOQCdjpZwW1H7Fz168P
 I0wtHr3BabEng==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Banajit Goswami <bgoswami@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/11] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
Message-Id: <166965354669.629583.1450673554092513884.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: quic_plai@quicinc.com, quic_srivasam@quicinc.com
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

On Tue, 15 Nov 2022 13:02:24 +0100, Krzysztof Kozlowski wrote:
> Changes since v1
> ================
> 1. Patch 2: Keep compatibles in qcom,apr.yaml.
> 2. Patch 3: New patch.
> 
> Description
> ===========
> Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
> some changes to APR/GPR services bindings.  These bindings are part of
> qcom,apr.yaml:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
        commit: 0dd3618e06f86bbdacad3a40b25bf79b8917000c
[02/11] ASoC: dt-bindings: qcom,apr: Split services to shared schema
        commit: 41288c30583646e2b4158c75ccdbddc62597e1fa
[03/11] ASoC: dt-bindings: qcom,apr: Correct and extend example
        commit: cd9ba3d065bb94f3c20e36ed400269a285bfa46d
[04/11] ASoC: dt-bindings: qcom,q6afe: Split to separate schema
        commit: 3e9c0c86267377f1404bc55051f476a0456dcced
[05/11] ASoC: dt-bindings: qcom,q6apm: Split to separate schema
        commit: 6180b3252010f7cccdef896faf305456df4c45cf
[06/11] ASoC: dt-bindings: qcom,q6adm: Split to separate schema
        commit: f26a776ea5ea22b5a92b0619af54d202e4027524
[07/11] ASoC: dt-bindings: qcom,q6asm: Split to separate schema
        commit: 83c8fa5e85e556e6aa3e95e7070ef738964ebd17
[08/11] ASoC: dt-bindings: qcom,q6prm: Split to separate schema
        commit: 8009abe0f14052bbfadcdaba7887226b40dfdb51
[09/11] ASoC: dt-bindings: qcom,q6core: Split to separate schema
        commit: 7eea2bed3602a2b2e71146e0110d42f6edf917f5
[10/11] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
        commit: 8c7ac825481602e356d96db9424b4d4e23a6a1d3
[11/11] ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node
        commit: b386acc043f44a730d5117b71b75e818cede21cc

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
