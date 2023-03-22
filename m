Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4F6C58A1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 22:16:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167E7F0B;
	Wed, 22 Mar 2023 22:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167E7F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679519778;
	bh=3OcMtAwVCVTk3fxEOINaXblRIkfJB++1ofjraGTQbWU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G96Tqdk/DqiFVnbrp16KS66iWngBxA6jfeoHe83X0Y3/q5i3Ex/vghRjir4LYhPwx
	 SMY+2Xfowh1HUgOZ7N+PTrlta/nRm0LjzNyhnP0+6Jj7kpKJV47Put8WNvdRHO/eLC
	 Dd8qKhbNAi70cdwiqUqKaRD0AZbQb0use1hd2EsM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9F70F80254;
	Wed, 22 Mar 2023 22:15:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32412F8027B; Wed, 22 Mar 2023 22:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2E37F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 22:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E37F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rD7l1bvU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BA89B81E22;
	Wed, 22 Mar 2023 21:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC09BC433D2;
	Wed, 22 Mar 2023 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679519720;
	bh=3OcMtAwVCVTk3fxEOINaXblRIkfJB++1ofjraGTQbWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rD7l1bvUIGpYovtnO+hFtqZSDQ1vw2CwIqJtMz5sKZs6vJ6jdNAi+XpNZi/g/oy3A
	 2FtOiP52NLEp8ueA3S0dglj2SFHEYfTM0D90BwdPZnwkfTXBiroWyXlRcZ+1koR6wx
	 UYOe82UwH6L0LtpyDvK95b1I4b7RkbBNJSixlZe/ChvUrujJv1LWcCNloTzZUVPegp
	 IhRnIM0iPJUrxrMkfY4K2HpJxo154S3UGb/ikkl8HyuJnLuGLchkLQ+LzQQvsLYm+U
	 1ZKy5zmFf073hrCHnBB8idrOG/vsFdLfWdbE5JkFtPRy7kilIxQu5YTQFCAPnzkK1v
	 qSfghdOqrskFw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322145332.131525-1-hdegoede@redhat.com>
References: <20230322145332.131525-1-hdegoede@redhat.com>
Subject: Re: [PATCH resend] ASoC: Intel: bytcr_rt5640: Add quirk for the
 Acer Iconia One 7 B1-750
Message-Id: <167951971796.1351141.13026018831927360162.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 21:15:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 7LF64Z2TT6CRGIIDDVXBWSDDHMXJ4XWQ
X-Message-ID-Hash: 7LF64Z2TT6CRGIIDDVXBWSDDHMXJ4XWQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LF64Z2TT6CRGIIDDVXBWSDDHMXJ4XWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 15:53:32 +0100, Hans de Goede wrote:
> The Acer Iconia One 7 B1-750 tablet mostly works fine with the defaults
> for an Bay Trail CR tablet. Except for the internal mic, instead of
> an analog mic on IN3 a digital mic on DMIC1 is uses.
> 
> Add a quirk with these settings for this tablet.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750
      commit: e38c5e80c3d293a883c6f1d553f2146ec0bda35e

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

