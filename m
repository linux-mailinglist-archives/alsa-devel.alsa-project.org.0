Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486177314E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF5F083A;
	Mon,  7 Aug 2023 23:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF5F083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691444114;
	bh=22bRif7V2dJUaXsbaCC2E5u9/BoioldPpvRGmueyqdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HDpLlTChyl0XJgVXfCH9vHlqsWuvQ8lC+E+xCHqmls+AiZzFGWoDE5CSxOxTj/ul7
	 XtNr9M+7+lGFaMvrcbiIYRnu3ng+t9rjhjxOyJjEyuIhpgFQhAoWwQ1RrdHBe53T5g
	 SRbRryRW380LYT5gM6IhInVk56678y5VWv1r0+rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4662F8053B; Mon,  7 Aug 2023 23:34:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D265F8016B;
	Mon,  7 Aug 2023 23:34:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5759F8051E; Mon,  7 Aug 2023 23:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAEEDF80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEEDF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h3JXNdKl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7314D6207D;
	Mon,  7 Aug 2023 21:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3599EC433C8;
	Mon,  7 Aug 2023 21:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691444050;
	bh=22bRif7V2dJUaXsbaCC2E5u9/BoioldPpvRGmueyqdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h3JXNdKl0LjlFEK0936RI+pbGDnL1GtIvrE6ark1MGHIgbRFteJ5OV+DswQEn+obc
	 6UEFDRixAtbj50TmQBE0bLvM9HKVFcx1lF7aewysSlWK3jP1vd/2oibXNMGaF0og9+
	 NeFRyDRusUYbzxoi+PZuE/BRM5UEIpfNewj6KuIZfY/Zn73Dqnm/Qy6Itd1AlXJHSc
	 zaN/9SnCSQtthtBRDfKSGVQx9er/eIcPQBYVAKSO2F7W+JabwJnUIHol7X+nxObMpB
	 dThjWqFuxvOjm2bzFN8IyzvuTP2fAw8GZCUVpLfihnExV4WTzOVqdFyv1eGp8/wxyt
	 96qK2H9BcfsHA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230804132628.302385-1-hdegoede@redhat.com>
References: <20230804132628.302385-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Message-Id: <169144404994.324168.1873422887016627834.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 22:34:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: L7CVFN2RTCOF5GHRR67NDVC65Q7EUPDF
X-Message-ID-Hash: L7CVFN2RTCOF5GHRR67NDVC65Q7EUPDF
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 15:26:28 +0200, Hans de Goede wrote:
> If SNDRV_PCM_IOCTL_PREPARE is called when  the mixer settings linking
> frontend and backend have not been setup yet this results in
> e.g. the following errors getting logged:
> 
> [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
> [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: lower "no backend DAIs enabled for ... Port" log severity
      commit: 1f566435141047ca7db26aa4b0b6647a25badaee

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

