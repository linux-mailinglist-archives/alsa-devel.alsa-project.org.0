Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA9E964D44
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 19:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1370E83E;
	Thu, 29 Aug 2024 19:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1370E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724954023;
	bh=IyscI7y7AS5vyGO4ltoxUCnQBeiReO2ZEWbhbs353es=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fJQXWqKzpEqQYYLw3tbFWbnadn9fyaYARW81IGF66/X+RR8SAzfdBNGP6KbGg3UHs
	 y9p+XpicaUTeXxGuCoQKuP2yvwGA6tFs19NG7pNcp7CrGlr+HagV4V1bEgtJlhAeNX
	 EfeRBxwR5Mp8x2lDODcL3FtJt+bn/gtm8+H5zpNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 948C2F805AD; Thu, 29 Aug 2024 19:53:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB322F805A8;
	Thu, 29 Aug 2024 19:53:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A3F9F80518; Thu, 29 Aug 2024 19:53:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B073F800AC
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 19:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B073F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cVrb3ssf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 78D4EAE07EB;
	Thu, 29 Aug 2024 17:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C17C4CEC1;
	Thu, 29 Aug 2024 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724953972;
	bh=IyscI7y7AS5vyGO4ltoxUCnQBeiReO2ZEWbhbs353es=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cVrb3ssfm3PQ/qGzYjYNpS9HP4RejoFXv3Ai4Zuw97CyY/TV6Lh3BWUsJASunfL3l
	 u/ddu2Piv3AD578TFmNJmIDVwrutlHgTljQpfOF7kvsi43gCqiuV2jtDU4lKDe/Uu7
	 qUEnz661wtE29pqYZvG9BpIqGUq5SQePRxwuqXrOdAsjA2UqlatYPxAFuwBcScKcc7
	 4JdGg9F1MsClr9tn7phOSGPU3w1aFNAwhk9DBKggHdALOq7leVgqTsiygaYfD3jvM2
	 fOWrmt3t+hQX5rM0DrtXT1uZxkjYdUjR1UtJ7ltHyZBSq/MwUh9yZcTwbnpDDLFCa3
	 /9tOD4HYmlpRQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240809110122.137761-1-krzysztof.kozlowski@linaro.org>
References: <20240809110122.137761-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] ASoC: codecs: wsa884x: Implement temperature
 reading and hwmon
Message-Id: <172495396971.847387.2753598492467294945.b4-ty@kernel.org>
Date: Thu, 29 Aug 2024 18:52:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: RXBYSDYLX6ZVIFWZSEUNKMZKC4L7PUC6
X-Message-ID-Hash: RXBYSDYLX6ZVIFWZSEUNKMZKC4L7PUC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXBYSDYLX6ZVIFWZSEUNKMZKC4L7PUC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Aug 2024 13:01:22 +0200, Krzysztof Kozlowski wrote:
> Read temperature of the speaker and expose it via hwmon interface, which
> will be later used during calibration of speaker protection algorithms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa884x: Implement temperature reading and hwmon
      commit: 6b99dc62d940758455b0c7e7ffbf3a63fecc87cb

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

