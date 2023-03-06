Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BE6AC150
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE7F1106;
	Mon,  6 Mar 2023 14:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE7F1106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109698;
	bh=BXZROgul7p0wR6XPSJeK7cD2IBPYqzyTYqEG61d9fQA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=W9JVvOXIe0v2PyVMxydeV+PSlEA/GjgMVBdR3BufvtUb421pwae5ftzqwZSQbT2ua
	 9zyxrHLefESR1YC/4jRhriR/7ML/PQidfj7D7HdOhIMysSjMWY/eLs44lw2ncVoASS
	 O7xKNnm7V9ea5D/VLuJKP2NVd0hKakcqrthKpW94=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0531F80544;
	Mon,  6 Mar 2023 14:33:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E411EF8052E; Mon,  6 Mar 2023 14:32:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38987F80482
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38987F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xkcd6yRN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E2DB6CE119E;
	Mon,  6 Mar 2023 13:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDACFC433A1;
	Mon,  6 Mar 2023 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109523;
	bh=BXZROgul7p0wR6XPSJeK7cD2IBPYqzyTYqEG61d9fQA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Xkcd6yRNgOGHBjHNbbLGAOG7yAFGErGuCY7rckfNPUe+AJSuG9vvdGjuHw2QSaB1c
	 /rinzeDi+OMSawmiZcK1sMeyrrsTGKZVyIYKJBhGXkJUiANE2vnZjnjF/jpO9nYNOB
	 xsP9/ZBNIgBfdBg1U6gEdeA763/A1GKu/uG7JEv0cSp1NmPNIHvYXJbyB/sPs0DcBO
	 nHF+4DYdts0eWeXHSltVcGw3Enoqy8CffF3ngS+aj0KuMLIq7IRBt6+nve3lq/bLPp
	 Gc4yKJ5uy8UdnmTHAvmMYvrSrv/Eq3V/TRWZX9k7mQ9IoGx6a4tw5ahaSEk0ZAK81g
	 GvgkMpGYD8ceg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230227091938.1671416-1-chancel.liu@nxp.com>
References: <20230227091938.1671416-1-chancel.liu@nxp.com>
Subject: Re: (subset) [PATCH v2 1/2] ASoC: dt-bindings: wlf,wm8524: Convert
 to json-schema
Message-Id: <167810952063.75807.2679139979822517456.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:32:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: DNY6RWILZCNHJIHVH7LD2NYXC3W3HX4J
X-Message-ID-Hash: DNY6RWILZCNHJIHVH7LD2NYXC3W3HX4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNY6RWILZCNHJIHVH7LD2NYXC3W3HX4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Feb 2023 17:19:37 +0800, Chancel Liu wrote:
> Convert the Wolfson WM8524 24-bit 192KHz Stereo DAC device tree
> binding documentation to json-schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: wlf,wm8524: Convert to json-schema
      commit: 5ddcf9768f7a15da997259038c16a9e00c06aa87

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

