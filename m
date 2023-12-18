Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D38178B5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4715B844;
	Mon, 18 Dec 2023 18:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4715B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702920565;
	bh=vwrl1pDVKX3UhF1iN/1SsAJqfg8Jw0RWC9zVOH+2bi8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VjpM6Pm+ggPMUG1rQzZ6oYHNBraQQwYp/3xMmxLyYlveHBhf3zSMeY/+qB4CdaLYx
	 ZQxUvvRyPBgIS9Ev/X3HahbrKG7ykmmCdU5epBvdWh3L+Iit054skHPSJzCmflT9ju
	 UD+3h3pPGf93e4pQYU4kyjs6CyArpLVuMxX4pFwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B87FF8057B; Mon, 18 Dec 2023 18:28:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 244F5F805AE;
	Mon, 18 Dec 2023 18:28:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C458F804DA; Mon, 18 Dec 2023 18:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A100F80212
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 18:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A100F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y1idzLJF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29A9661129;
	Mon, 18 Dec 2023 17:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AA8C433C7;
	Mon, 18 Dec 2023 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702920495;
	bh=vwrl1pDVKX3UhF1iN/1SsAJqfg8Jw0RWC9zVOH+2bi8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Y1idzLJFNjREKXSIes3/KLE2InfMkMdkIDs58SpzvJ8PtsS7n8yQ93gDtF1ROEglo
	 xgdvR42+9IJCR5iB1PabGXxKiy0OD0gJGgyym9mF+xCOqLBamcDS2LufxedHtiu2cY
	 L8rm6cjQ3pUaQ8a26zgKyhEMdSUafUOabxYeAtadKGI0o3aOPTlN0hVJZYcOV+of2V
	 lVF27r8qYCwABjmFFpCrcBfBAeUUkVg/YU7wfHi/xib/15oBLQxWEu3D+xWkkChk5U
	 A81n6U5u/NIxrZLamnBF0Y3ZX7zv+YQkJ27QDfUkIU0MLuItV4x09GZAJ7167PHlj0
	 6Zt1WgYLsu9oA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add
 X1E80100 LPASS RX
Message-Id: <170292049267.89121.1314873749419554799.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 17:28:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 2UVRSKWFPHIJDWH2YJ3CFFPBIE3LNTZN
X-Message-ID-Hash: 2UVRSKWFPHIJDWH2YJ3CFFPBIE3LNTZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UVRSKWFPHIJDWH2YJ3CFFPBIE3LNTZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Dec 2023 13:31:01 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> RX macro codec, which looks like compatible with earlier SM8550.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS RX
      commit: 2f4734f3f48fff9437e4d38531c699b0a62ff8a8
[2/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS TX
      commit: 7de2109ce1619951e957eaafab83545a4cab8609
[3/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS VA
      commit: f990306adf2715cc2bdb85470065f7326a42081b
[4/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS WSA
      commit: 173a3b20a4980265bab52dbc60b616e739664b0d

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

