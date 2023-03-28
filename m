Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4746CC031
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 15:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E9AD3E8;
	Tue, 28 Mar 2023 15:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E9AD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680008892;
	bh=78JRunLDvvfVdfw3wzQQtOxNldDlOvWFkPPkuRdbb0Y=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hRiqoeQ1PabJDXRWa+OmQTLBmc3w7RqQi+N+bJaJrpkv5XxpROzQ2SEh4rVBhEd2h
	 2Ia5vFk64Uv3MvgR6549aM4P8m/lR8Fq3wolFrl/sTJGIDhEmjo4sILCDAJR5uUZPY
	 +QwxNYO4oGgN36t98ZlbLrPz4pVOQbEbZ+5+HZGk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D87D0F80529;
	Tue, 28 Mar 2023 15:06:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18285F80272; Tue, 28 Mar 2023 15:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C01A3F80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 15:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01A3F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p95xKFBf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C45D1B81CB4;
	Tue, 28 Mar 2023 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1848C4339B;
	Tue, 28 Mar 2023 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680008779;
	bh=78JRunLDvvfVdfw3wzQQtOxNldDlOvWFkPPkuRdbb0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p95xKFBfS/+qDnMjd+QdrEATefuR2eTtIL8Jnwy3byX4noxSAHcCPYkcHUarT179r
	 F4mDx5hJqi4Ikf8zhiNeROBfP9rL6VPyrXXFGmNh6+B2ZdmmdN6PvcrCjfPWw4JKFk
	 p77QGkh43+kA3gXbCAX/0iOPi7tYSl+nci7eZo7BTxL5KpOw3cFjMGHzxsOI7wBhZb
	 tbe3bCL82Xbn/NOaTtljCOdnC8doiRgDQzJ8Mn/WwCVNrpNGwAwNqDM4A4MZdCvwfi
	 FzWqZNJXIaC5lck9KIshKIHniIb1vIOCHeKswTk0A1rMKY2oQsOdO3BZjnsVrHptyi
	 0GEOcoq4ga7ig==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
In-Reply-To: <20230327145555.19351-1-johan+linaro@kernel.org>
References: <20230327145555.19351-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: audioreach: drop stray 'get' from error
 message
Message-Id: <168000877638.3186216.17344443847618791242.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 14:06:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: Z4EHGFPYMSS5ZVSVFIXXQGZ2Z43HV6TS
X-Message-ID-Hash: Z4EHGFPYMSS5ZVSVFIXXQGZ2Z43HV6TS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4EHGFPYMSS5ZVSVFIXXQGZ2Z43HV6TS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Mar 2023 16:55:55 +0200, Johan Hovold wrote:
> Drop the stray 'get', which appears to be a copy-paste error, from the
> registration-failure error message.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: audioreach: drop stray 'get' from error message
      commit: 8908c36dabad7dd52872034f9f42c6c077bc7270

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

