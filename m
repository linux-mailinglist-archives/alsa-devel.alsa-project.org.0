Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A6696C34
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7505C93A;
	Tue, 14 Feb 2023 19:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7505C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676397752;
	bh=glzSBf9J8cZ4ew5UfhwWw3WrgWyGvUQxrXgqyzbIHNU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g+0Ssi9gmOwBnQz6GBAZjMCAZhIoKeOLYwS26kuLkgwjA/NYacbdOzz4eMtZmSzBb
	 2I/zpyFc+/789XcoRH4RXZx1qadVmC4QbTw1xtioYN1f3iiduGcyVBpIygOgJEO6h9
	 CjBGq1VD1PEGTz053FPqUoTstqxWrYZLw3W/ABak=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0335F800B6;
	Tue, 14 Feb 2023 19:01:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F5C7F8047C; Tue, 14 Feb 2023 19:01:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93577F800B6
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93577F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SgpDSDVG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD0A3B81D56;
	Tue, 14 Feb 2023 18:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11D2C433EF;
	Tue, 14 Feb 2023 18:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397692;
	bh=glzSBf9J8cZ4ew5UfhwWw3WrgWyGvUQxrXgqyzbIHNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SgpDSDVGGlwDpfTALfT1lzuuFQYreklZfT1SVFNjnVxts+pICkWKKPCgMOUXovvL+
	 KDK0jmfK1ajlm2c+zTQlDnR9UesOdHi289+lgLUGYHF4roAOrpVS8V2EhojrjIUh44
	 dMwvx+42CgvsZ0l6Le0qMZy3xpIWQ4WreM9Up9iStnm90sxPAHRVn4succ8r7l5N5O
	 3QRU3JMyzGyoPFyATRPND6V/M7VGSnVVQsu/Z0J1SHLlLbPvxCkXctKFj2NyGwKoow
	 6rt8jF4l+xrRCRM3z7U9v7elDB7FzBW5qxpOKkX0QBzMt1bumccbNz++PibJRbPNtb
	 W7DQnWBgx4ypw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Alexandru Ardelean <alex@shruggie.ro>
In-Reply-To: <20230214091051.16323-1-alex@shruggie.ro>
References: <20230214091051.16323-1-alex@shruggie.ro>
Subject: Re: [PATCH] ASoC: tlv320adcx140: extend list of supported
 samplerates
Message-Id: <167639769059.3067697.1942659379266251180.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: Y5SS7IRFPI3BZ2W3QYVNE3SHO4OF7ORV
X-Message-ID-Hash: Y5SS7IRFPI3BZ2W3QYVNE3SHO4OF7ORV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, steffen.aschbacher@stihl.de,
 patrick.frick@stihl.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5SS7IRFPI3BZ2W3QYVNE3SHO4OF7ORV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Feb 2023 11:10:51 +0200, Alexandru Ardelean wrote:
> The 'tlv320adcx140' driver currently supports 3 devices: TLV320ADC3140,
> TLV320ADC5140 and TLV320ADC6140.
> 
> All 3 devices, support higher samplerates, up to 768-kHz according to their
> datasheets.
> 
> In our applications, we only tested (and worked) with 96 kHz and 192 kHz.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: extend list of supported samplerates
      commit: 7af4222832a10c2726a93c2600652090ae06ecb9

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

