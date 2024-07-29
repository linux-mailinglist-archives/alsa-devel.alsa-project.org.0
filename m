Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA293FE62
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 21:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6146B846;
	Mon, 29 Jul 2024 21:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6146B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722281903;
	bh=lQ1UwaSVRVCr28nA9MaSL3OK4CCm3hBI4Kq6+31BSqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPnwAIf5/hbuMijutQLeZxUC0q+KaXo2VPPYC9wpqMH2LQsOL3EAqCDOZab7OMkOe
	 qAoN4/ryXrQQrykCb1yHCDu1AK+sJ6oSoVngHVMXC0f5dJcjn4KaLu+LhTYtNVvT1R
	 9MNjt+7LkwzlD64ttto77wrG8HiSl5UfvBB+dc0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65387F805A1; Mon, 29 Jul 2024 21:37:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9640F80579;
	Mon, 29 Jul 2024 21:37:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D07F802DB; Mon, 29 Jul 2024 21:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46955F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 21:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46955F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XUrKe0VV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E1CB6149D;
	Mon, 29 Jul 2024 19:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA431C32786;
	Mon, 29 Jul 2024 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722281854;
	bh=lQ1UwaSVRVCr28nA9MaSL3OK4CCm3hBI4Kq6+31BSqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XUrKe0VVUZj94jTxc8zqQQzjE9ymJYbBPAUKm9WXeaaAPjwudJ7XUgr5DtcD8uGRA
	 ohdogn/7LFCPN6kcrLqkohq92gXMdVL0ax9ubaiNZm3wzk3cCIlP5aGqpSdi5u//jO
	 6iqRrBkbVBHQqU/JWZmqshQQ0MAy2llTqnskQIa/ahzK7h+ACyj7PuR4K5z06DaPUU
	 ZtRddCROjSiT0Zk3uiOWXDx+979TCIIucX2imDjjOChWD+zKmQD8Ug8wLUBRPvjWkv
	 19fqCpUw7U0J3rRrKVDwRTf9WCjZwWcIuVXMpshJ+CpzHw5VUT6no60zqNoYx3SyOs
	 i4zSuUNixVwQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
References: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire
 ports mask
Message-Id: <172228185142.141226.9862825989484734633.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 20:37:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ODCLRKOWGVKYV6VDMRANCKZL3XIOQCOP
X-Message-ID-Hash: ODCLRKOWGVKYV6VDMRANCKZL3XIOQCOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODCLRKOWGVKYV6VDMRANCKZL3XIOQCOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Jul 2024 16:10:40 +0200, Krzysztof Kozlowski wrote:
> Incorrect mask of Soundwire ports - one bit too long/big - was passed.
> 
> Theoretically, too wide mask could cause an out of bounds read in
> sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
> driver, e.g. adding incorrect number of ports via
> sdw_stream_add_slave().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: wcd937x-sdw: Correct Soundwire ports mask
      commit: aebb1813c279ce8f3a2dfa3f86def0c0ec1cbb8d
[2/6] ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
      commit: 3f6fb03dae9c7dfba7670858d29e03c8faaa89fe
[3/6] ASoC: codecs: wcd939x-sdw: Correct Soundwire ports mask
      commit: 74a79977c4e1d09eced33e6e22f875a5bb3fad29
[4/6] ASoC: codecs: wsa881x: Correct Soundwire ports mask
      commit: eb11c3bb64ad0a05aeacdb01039863aa2aa3614b
[5/6] ASoC: codecs: wsa883x: Correct Soundwire ports mask
      commit: 6801ac36f25690e14955f7f9eace1eaa29edbdd0
[6/6] ASoC: codecs: wsa884x: Correct Soundwire ports mask
      commit: dcb6631d05152930e2ea70fd2abfd811b0e970b5

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

