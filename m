Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989807F8A40
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 12:39:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34E60E86;
	Sat, 25 Nov 2023 12:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34E60E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700912367;
	bh=u3Ud7opf3X4nqSGw+IYKVKYse4XkAAm5XbEyGIYTOsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=esq28T85ERousJXWPuF7Yxts2ITZpx+mEMGETqS5HLuI4rRex7ChF7040AofuTPH0
	 OVlYOvk0PF4EAqrCDVgaHqGIBMk4Xra6Ki5JElwDad8xMs/aBLKrI+teydxC6g35Eb
	 c/x7XyGk34A6sfVVNuPtdgIGxglG8V0ox4R4QbLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 533F9F805B2; Sat, 25 Nov 2023 12:38:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A560F805B0;
	Sat, 25 Nov 2023 12:38:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 404D1F80254; Sat, 25 Nov 2023 12:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8B34F80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 12:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8B34F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iIWVavDM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 73A42B833E0;
	Sat, 25 Nov 2023 11:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDB5C433C9;
	Sat, 25 Nov 2023 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912230;
	bh=u3Ud7opf3X4nqSGw+IYKVKYse4XkAAm5XbEyGIYTOsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iIWVavDMX8IIeDCrFAW/9zo0uBiYVTpuBL154mdUZyTf/phmfF6G4/Nr/80KelrKX
	 ye78qPsyZfB5pF1+3eooBB24/CtiTaA7i8tf1H4UFk0jYR8oaM+8iVF6a9+gmQlHym
	 HNZ1p5+Z9F/8pua29v34JB4PplpeslfN6VCZ1B9BkgK3K8PAFzjnwwtzoArZFFjBSJ
	 xoK8/T9rWaKH1INhp5+Fj6Czlgt8Pp7jZJ/pifmAw1wmv5RsePb3TUk/DGIeFlHDT1
	 c/Hu4vxkMhsW4SJTeaw78VKNQ5gEVUye/ztPBUtc38IYrhIUH/cmJF6s4i9KeY0Hre
	 MlsikZsY0euQA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Seven Lee <wtli@nuvoton.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
References: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: correct white-spaces in examples
Message-Id: <170091222492.2632109.16193424114633167533.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MSZSZU7Q6YW6JAD3RMQAQ4W4HBTLAVCF
X-Message-ID-Hash: MSZSZU7Q6YW6JAD3RMQAQ4W4HBTLAVCF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSZSZU7Q6YW6JAD3RMQAQ4W4HBTLAVCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 09:38:03 +0100, Krzysztof Kozlowski wrote:
> Use only one and exactly one space around '=' in DTS example.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: correct white-spaces in examples
      commit: 29b0b68f25ae6f9454c3e1c31b054595af0a80fc

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

