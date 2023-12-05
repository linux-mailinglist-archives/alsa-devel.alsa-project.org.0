Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCD5805592
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 14:12:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9211857;
	Tue,  5 Dec 2023 14:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9211857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701781959;
	bh=1TCYwVKEloYGEL2guMDbGsAh6Bv9GHm+H5QB2DEoszc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2Y4IxgVtOxyKR1ac6E4IyO+lQMgXuEVeHluasObRM9Yx01Dxj9+Ba8S/8F8sBKI+
	 FzRi8EZK1oD0vJ3ct+A2nrbRe7ttQIbKbz/xiZpNHDdpgsTNDhMrcsrg3fixjfm02G
	 XlqVbdYNDJzBAvnMZE6AnreJ1t6KqvxW+C1QoijA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9983EF8056F; Tue,  5 Dec 2023 14:12:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FA1F80578;
	Tue,  5 Dec 2023 14:12:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 470D5F8025A; Tue,  5 Dec 2023 14:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E6C7F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 14:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6C7F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IYQDcemZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E92CCE1005;
	Tue,  5 Dec 2023 13:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68367C433C8;
	Tue,  5 Dec 2023 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701781911;
	bh=1TCYwVKEloYGEL2guMDbGsAh6Bv9GHm+H5QB2DEoszc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IYQDcemZy4fOvY4j6DGWriCZAhFx5utnLusxL9J8g6lMx7UGl+mr16IpLf3NrBR+u
	 4zjZvGY7iEkXpsSEiC5uFTSXUOfIoTBvUDy8p+iEezUASMeSO4+zY6syRQZm6uzaGu
	 +WDreO+v+Z2Lce9oE3Ndlo+muvV3Q/VQBagDCc+fq7V9AFySVsslXJTERTn7JQg0qS
	 w6JweKbbPYWNxVKJ9Sh9lGL9buuE/tvN55OCeXK3+tPnJOMqZer0VWa6U62B1TpHWo
	 F6c7LBsaupDWuhHBLnTLvIuH3vSLzWMww4yqaeZFykFq3tgBACRFRdjYehtCWnJHcv
	 jlNbJZ0MY1O5Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qcom: Limit Digital gains on speaker
Message-Id: <170178191007.32878.14836362585756098271.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 13:11:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: VZPMGG76BZ5WJWVXJJMOWRNXWDI344IW
X-Message-ID-Hash: VZPMGG76BZ5WJWVXJJMOWRNXWDI344IW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZPMGG76BZ5WJWVXJJMOWRNXWDI344IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Dec 2023 12:47:34 +0000, srinivas.kandagatla@linaro.org wrote:
> Limit the speaker digital gains to 0dB so that the users will not damage them.
> Currently there is a limit in UCM, but this does not stop the user form
> changing the digital gains from command line. So limit this in driver
> which makes the speakers more safer without active speaker protection in
> place.
> 
> Apart from this there is also a range check fix in snd_soc_limit_volume
> to allow setting this limit correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ops: add correct range check for limiting volume
      commit: fb9ad24485087e0f00d84bee7a5914640b2b9024
[2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
      commit: 716d4e5373e9d1ae993485ab2e3b893bf7104fb1

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

