Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1257918A2C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 19:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78091923;
	Wed, 26 Jun 2024 19:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78091923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719423202;
	bh=bgYoAiD8CvH9vNhk+zX4YQSH6S0k8Ew4gkWwTOzazV4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VQ5Yi8GRSNdu0AgUBs+8o5F3qQ853/T/xjVw9qsbmbJJYlGogeKdD1OHsyPTugCdv
	 Fl4/Z50ACeTJR/VIcr8lXtc/Uemx0GB8GGpjs4dBl0BWda4aYZDVORbBEbug9KmUGy
	 d+0srDj3eAlaasl6AZSsTVib3nw94/4m5B6T52zM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 941F3F805B3; Wed, 26 Jun 2024 19:32:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8290CF80588;
	Wed, 26 Jun 2024 19:32:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74695F80423; Wed, 26 Jun 2024 19:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 750DDF8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 19:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 750DDF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g4IYeIuC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64987CE2BD3;
	Wed, 26 Jun 2024 17:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58F0C116B1;
	Wed, 26 Jun 2024 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719423118;
	bh=bgYoAiD8CvH9vNhk+zX4YQSH6S0k8Ew4gkWwTOzazV4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=g4IYeIuCanVePZMW3hpekPLgDETXrfYnffoBGXTrlwF/6BGz36iUjS+LdkXK3hPBB
	 cYALT+KXvBQkQva4NbbbsR4rgk27cpIFfMEZsGtaPQhVUjyVfr/LN158o25/Bxefzt
	 n+kuaxvXvn4JIo+PgfdLy4+PbsAI94WNs/GB6tqe2DuBuwwABIC/r2HUoO82pXqaFz
	 ODzJhB0ZMzvp8ZphOjuNWZvn1UzR7wQLFx60ByPlFsq+RIu65GA33vkLx2Ovjlw9j8
	 w+NuHXpFCtvsGq2jqRX/Dvb+CwK8Rd52nkbr9FkTB+5qvvhWMM14qDKt4/vdMnqNM2
	 oCZljRXuPIE3g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle
 unknown version
Message-Id: <171942311637.1650281.3350190675006482081.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 18:31:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: YGEGHPNXDBXJUYJEEI2EIZD2OGU3NDD5
X-Message-ID-Hash: YGEGHPNXDBXJUYJEEI2EIZD2OGU3NDD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGEGHPNXDBXJUYJEEI2EIZD2OGU3NDD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 18:57:35 +0200, Krzysztof Kozlowski wrote:
> Qualcomm LPASS macro codec driver parses registers in order to
> detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
> we know that there are earlier versions and 'enum lpass_codec_version'
> has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
> version, driver will use random value from the stack as the codec
> version.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown version
      commit: ebc1a54051b58d1aa3a8855faac8bf16b88b8af7
[2/2] ASoC: codecs: lpass-macro: Use enum for handling codec version
      commit: 06462d6f3fb3c445b5abac7b134d9fe9e361113f

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

