Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A536B0A34
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:57:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F74E1832;
	Wed,  8 Mar 2023 14:57:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F74E1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283875;
	bh=W62mZSxOfvoczA7MWsFaTEDbrxGUd8C1IMUtlRQl93U=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZYWxwXE+qB8MwZTaoWI7wGm5LcXYKaGXCa26ulJCauKhI1PXFzE+xBZKj/n0ZW0DG
	 PKnISjCHWY7CSpg0seY9PxfV+aJnq20t1NmBFj8+OS1dTbOmBMKWuZz6anAGgOeBnN
	 Wt6+4t0yHqcoN2yZ8UfGFRTtuha6GPOL2ip9fikQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABC7F805C0;
	Wed,  8 Mar 2023 14:53:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40F64F80571; Wed,  8 Mar 2023 14:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52CEFF80567
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52CEFF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JO9mVAYO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8E812B81CD1;
	Wed,  8 Mar 2023 13:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A3FC4339B;
	Wed,  8 Mar 2023 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283576;
	bh=W62mZSxOfvoczA7MWsFaTEDbrxGUd8C1IMUtlRQl93U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JO9mVAYOfaa1P43l8JJt83vhUiUHGHi3JMvf9fH+c/IJthfZ/OXlPX0CtQw5g3T0C
	 iVw8QCzBkVSZow7s00PCjKj/sXbESk8Xu4Wu9pnu10D2YDgIVf7bjhA3faTbkRr53O
	 f/wdvYkTKME5MxmboRgbhsz7QKEYnATHOWzh8SZygnNAZfzBVE7JGs0x72wJiYpQIx
	 dXXejwCYNupUPVE2sm5QkO/+zbsGzt0oiUr/SNaecRWOfY3651hvIO9muyZGoz9IS/
	 tWVtc6GoBSuYaXMpCRfu4vgMtUcOgxLCSDYxolIX5/cbJfa1+NkUYFPycm2GrAkanH
	 FSxaZjQPcbWRg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307110751.2053-1-peter.ujfalusi@linux.intel.com>
References: <20230307110751.2053-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Fix incorrect sample rate
 print unit
Message-Id: <167828357458.31859.1022642298028830193.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: MLQG7W3GSWVP2BTFSPGX3TPG4MD5OLYU
X-Message-ID-Hash: MLQG7W3GSWVP2BTFSPGX3TPG4MD5OLYU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 seppo.ingalsuo@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLQG7W3GSWVP2BTFSPGX3TPG4MD5OLYU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:07:51 +0200, Peter Ujfalusi wrote:
> This patch fixes the sample rate print unit from KHz to Hz.
> E.g. 48000KHz becomes 48000Hz.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Fix incorrect sample rate print unit
      commit: 9e269e3aa9006440de639597079ee7140ef5b5f3

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

