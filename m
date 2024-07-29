Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6593FD6F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 20:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59601A4B;
	Mon, 29 Jul 2024 20:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59601A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722278187;
	bh=PgElLeI3tFPy/LsURTvcVNpZeWCApAcr+hd4F8EhJ/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a5PnGyxomxln8jp3ojqLcRszsbOFAjcqd/UpzNL1pQZdI+eBtQ2QzKcJjCH2qkQrK
	 +023RabrCSGnoTRmO1mEsyQobnDXUudDzNK4MmukgAsFEF1qXWN+kgCVLy8Yzvoxx2
	 2zEMT1/1qm1TRWZoNKnmldSHSo08yipt16zqJ+UA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CB7F805A9; Mon, 29 Jul 2024 20:35:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5174F805B1;
	Mon, 29 Jul 2024 20:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E27FF80448; Mon, 29 Jul 2024 19:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A04EF8026A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 19:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A04EF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KWRUWMIQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D75761BBE;
	Mon, 29 Jul 2024 17:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E468C32786;
	Mon, 29 Jul 2024 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273465;
	bh=PgElLeI3tFPy/LsURTvcVNpZeWCApAcr+hd4F8EhJ/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KWRUWMIQdA/RvQwuPlYCs6Dtxi6qaZm+SsgMtmWr9hwxabdg2BhDaq4EMijH4kec9
	 V8hzV+g/HVG7F/57DtSm8Fl4vBcTuBd7vqtpCkkcBQIcxoDOBiLovpgI1qJeouFh+b
	 5dXSd8cOxY85kyj39TZ2lN44hOJyOcnOu4derSo0Ed7M0wpYE2Q2pLJ3ih+3lbdM0n
	 Vd7NvZvH0njAY6a3nvIaIjV82lCgXglUix9iuOXleR3bxbqDPU8gs5la2vl48mM4Jh
	 gBb9+/Ob/cFZdVOH6yh9uuM3RXdT1YP6CvguuUW8+BzMPH7zeTIlTWclAoQsihafT5
	 k87n9fNRU9JlQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
Subject: Re: [PATCH 0/7] ASoC: codecs: wsa88xx and wcd93xx: Soundwire port
 non-functional cleanup
Message-Id: <172227346318.109775.1944723976181257603.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: WFRXSYUHBVULVOACOPUYXCKSVDY3LC4D
X-Message-ID-Hash: WFRXSYUHBVULVOACOPUYXCKSVDY3LC4D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFRXSYUHBVULVOACOPUYXCKSVDY3LC4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 13:23:42 +0200, Krzysztof Kozlowski wrote:
> Few cleanups to make the code more robust or readable.  No functional
> impact (compiled objects stay the same).
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: codecs: wsa881x: Use designator array initializers for Soundwire ports
      commit: 874d04fe15d12cafa09dd36e8555cea4eb0653f6
[2/7] ASoC: codecs: wsa883x: Use designator array initializers for Soundwire ports
      commit: add41ea55060d5e41d62268aa0bda2a27e0f5053
[3/7] ASoC: codecs: wsa884x: Use designator array initializers for Soundwire ports
      commit: 125ed86b0d669334dbc567f441d10163ff0c44bc
[4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
      commit: 06fa8271273d8181cb8727e63aeec3f87a48d8c7
[5/7] ASoC: codecs: wcd937x: Move max port number defines to enum
      commit: 42f3a2caf80910d0c251b2a407d4d220c0d3a79f
[6/7] ASoC: codecs: wcd938x: Move max port number defines to enum
      commit: 5e388488f0a1dd6d340f3925e7b371e212ee3cc2
[7/7] ASoC: codecs: wcd939x: Move max port number defines to enum
      commit: a9d843e6b231e550f8141f27e930f90ded4edae2

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

