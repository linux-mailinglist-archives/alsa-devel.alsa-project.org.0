Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468976CC847
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 18:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A3A1EB;
	Tue, 28 Mar 2023 18:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A3A1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680021742;
	bh=puCNRpwmEqJetbrROPl1Vggv5627DYtpnEIhZnhgltU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lmx7RceREIS1H+M1jMJ6ufbl6NTO/Z3RbiDEUNeOLTUNlrHD+mhmzZ/vgj+zDX2LA
	 S7O7lw7TE3Re+NeN59yBj18oMerAYH6Ty+/mvqh1oDZ2f7PGjJKRpIBQm/pOoovByS
	 9qX7KnNN/z/n5bkI6Z213eYuPSH3RDiHmPO0bH90=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49961F8024E;
	Tue, 28 Mar 2023 18:41:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1DF9F80272; Tue, 28 Mar 2023 18:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B4E6F80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 18:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B4E6F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f8g1IPFu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 981A4B81DBC;
	Tue, 28 Mar 2023 16:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9D2C4339B;
	Tue, 28 Mar 2023 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680021675;
	bh=puCNRpwmEqJetbrROPl1Vggv5627DYtpnEIhZnhgltU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=f8g1IPFus2nyhjwbRIIMFTOz+6qNnpSGGL2tYJOnKy8VQn9vCMe27AlwPqZPVRs+v
	 tJk0Xn1UVFqiiMlNDq24yvVFfeKa9CJL4p8aXWehSRCyWGAc/2Hpjt2b8JqDQXWH0Q
	 kv2BE1KIbe1Ay7Sepna3QVj20bwfoAP0bwMayGREvVzE0lUs9gi1KMsdbHbiHNED9X
	 xu43/VinAzcXE+y1/xclLIKQGI2DouaM2FiMeHP/wj8fxjx4eAWhiAL0yBNVx9wOt4
	 EIXyIG0g8OjglQDrOeIRlrYWoH53ZYmuNJNhTA7sxNkCYq734gonl4xma03uKIrjgu
	 dDhJ3kxW1p44A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313075551.17290-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075551.17290-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/9] ASoC: add audio digital codecs for Qualcomm
 SM8550
Message-Id: <168002167217.51443.3734911880079647013.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 17:41:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: YRK5JF6IOUOCOUZPPDLQWYQMHSLWWBBO
X-Message-ID-Hash: YRK5JF6IOUOCOUZPPDLQWYQMHSLWWBBO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRK5JF6IOUOCOUZPPDLQWYQMHSLWWBBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Mar 2023 08:55:51 +0100, Krzysztof Kozlowski wrote:
> Dependencies
> ============
> For va-macro bindings:
> https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
> 
> NOT a dependency
> ================
> The patchset can be applied independently of my previous fix:
> https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
      commit: e4cf7805f084772cccf2094b634a16bccf2f444f
[2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
      commit: 0fc109f875721f9cef29bb68095f50d67343b4b7
[3/9] ASoC: codecs: lpass-rx-macro: add support for SM8550
      commit: 492fe974fed0754f7076580e069e1e182e7b3603
[4/9] ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
      commit: bf4afbf950938d42cf0df1ecd915affeb26f4d76
[5/9] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
      commit: 050578c6f18c28e95f9659493a52a67b68b4b667
[6/9] ASoC: codecs: lpass-tx-macro: add support for SM8550
      commit: 5faf6a1c5256559af98c998b7416e4db8fb09b75
[7/9] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
      (no commit info)
[8/9] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
      commit: c1bda22bd2f382f9c3b27fb7a899f8804d92f897
[9/9] ASoC: codecs: lpass-wsa-macro: add support for SM8550
      commit: 6b004b836ced4d9ce655b5f1c810833c1a880369

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

