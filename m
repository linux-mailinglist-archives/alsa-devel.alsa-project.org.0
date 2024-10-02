Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C398E255
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 20:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF15836;
	Wed,  2 Oct 2024 20:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF15836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727893391;
	bh=vrEwO142Vt6SPOAdlphqDikIDAg1+nVpkIbjIETDyC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GE+wJJ7MlXWEFY+oROU+LyblEcKSvezEBaxera8O7eZISIFSKyYv/eDC80bJkSVZ/
	 OPj/H/CX6R4H+o+xD9CA09qXncFy5fbLlme9yLvaBkgpnMdr24+E7syPb8K3PFUJgu
	 8o2j9NNiE1XYE+ZjUuKP8zQfVfgpXt+5/JvU8TzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADCE5F805B0; Wed,  2 Oct 2024 20:22:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1C3F805AB;
	Wed,  2 Oct 2024 20:22:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 493FFF80517; Wed,  2 Oct 2024 20:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 709E3F800C9
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 20:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709E3F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HeKlvi7Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 537CCA431C6;
	Wed,  2 Oct 2024 18:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7437CC4CEC2;
	Wed,  2 Oct 2024 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727893351;
	bh=vrEwO142Vt6SPOAdlphqDikIDAg1+nVpkIbjIETDyC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HeKlvi7Q7CEwPk/CifDRD2PjgNdtz7KGMKKJHrKkui4OM6lvXfno9FXsyrMCSztTQ
	 tWKDI2w0xO2Oqy8oaQv31Go61tlIK4NTmS//ms5jcYwEWcAXTdvNY/4PFbfWoOjgeO
	 Ny1gR62gaQMYvsS8orTxh1pshkKMhtP+gKjQh3bsnaFAT/411n67Jrm9ipZoeaUdHi
	 uoxZ5KF94bXG9Cmkgzr1kar2dlkD+Xcl2XlXp8gx2BSeTVYRYK4K5VBxeMITs4QIJf
	 X6ZFjtDiqnDHlmVQJsacmIFN/vQd3jlolht/ECqAnD1SXnjLg1aIMuPnyhTPfbmkvi
	 VW0e0bIRSRf2Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, lgirdwood@gmail.com,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org, a39.skl@gmail.com,
 Konrad Dybcio <konradybcio@kernel.org>, Alex Elder <elder@kernel.org>
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback
 support
Message-Id: <172789334720.173380.12816331564584587389.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 19:22:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
Message-ID-Hash: KCIW655Q572VRHYR55FBOFM43OD6BGJT
X-Message-ID-Hash: KCIW655Q572VRHYR55FBOFM43OD6BGJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCIW655Q572VRHYR55FBOFM43OD6BGJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Oct 2024 03:20:08 +0100, Alexey Klimov wrote:
> Rebased on top of -master, tested.
> 
> Changes since v1:
> -- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
>    and disabling it causes audio delay on playback start;
> -- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
> -- moved lpi_i2s2_active pins description to qrb423310 board-specific file
>    as suggested by Dmitry Baryshkov;
> -- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
> -- lpass_tlmm is not disabled;
> -- lpass_tlmm node moved to sm4250.dtsi;
> -- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
> -- added some reviewed-by tags.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
      commit: bbd1e5ea66f6ca88624faefe0a153637f53ad15d
[2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
      commit: b97bc0656a66f89f78098d4d72dc04fa9518ab11

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

