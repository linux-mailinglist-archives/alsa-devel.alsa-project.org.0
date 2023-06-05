Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D645722095
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 10:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F9D41D9;
	Mon,  5 Jun 2023 10:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F9D41D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685952561;
	bh=TpPjlkIU5EWObdMV+nSZFG8cwg9HbzjckLadCVt3k1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JHKLGCCUe3mGb+SXLD+3lz8jFZdkf/7k550i/9JsCo2Lmn4GiqaoqSVPB7jlWbJuX
	 +tPzAjgPjBD1Rj4qxzqI5DAFiVCUvg1Qpt6TfqwPQ04PZI4lHqPP6HPKZflKwOgd2w
	 RJcV3rGBYTF8lA09GfOxipIHM3I4z8PAvgGniGCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F48EF80520; Mon,  5 Jun 2023 10:08:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49879F80155;
	Mon,  5 Jun 2023 10:08:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A941BF8016C; Mon,  5 Jun 2023 10:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FFF2F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 10:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFF2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OkBB8p7a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4524611C6;
	Mon,  5 Jun 2023 08:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453B1C433EF;
	Mon,  5 Jun 2023 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685952497;
	bh=TpPjlkIU5EWObdMV+nSZFG8cwg9HbzjckLadCVt3k1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkBB8p7aQFZz1fRe9MXHNxHv4DKDVy3UOSy0DG9k3ykbAtkiudIIntqqEcOGyNmQJ
	 BiSk+A07iKDwgupsiINQ96xNs6ro1W8hoL99J37uXiHxPhiUKALpIX4lvxEYBBWl2x
	 CNcp2/kCEJBWkdSit/+vwSBet9u8mGtC+oV/eyY4TVSwgm04vO8M4EGVrBW4cgIr+5
	 AID8/GwHIQowmhK9TosI6J5U9VcrtIm6KEqojJ4muD48HDkENeesGUqPUPShBFzczD
	 1eGlXMiV+iEw/lgjWphpRxYVj0Kayd9Yg7h8+He4bpzJ4qSwu7Unzch1ONJSsMG3u8
	 bJb1KFkr9xmDA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q65GU-00081o-Cn; Mon, 05 Jun 2023 10:08:34 +0200
Date: Mon, 5 Jun 2023 10:08:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <ZH2YAmBY-GNKABSB@hovoldconsulting.com>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <168492769030.49784.4719862081052299023.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168492769030.49784.4719862081052299023.b4-ty@kernel.org>
Message-ID-Hash: FB7MZ3A33S7NXNUSFO6MES6SDPHOUL3U
X-Message-ID-Hash: FB7MZ3A33S7NXNUSFO6MES6SDPHOUL3U
X-MailFrom: johan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FB7MZ3A33S7NXNUSFO6MES6SDPHOUL3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 24, 2023 at 12:28:10PM +0100, Mark Brown wrote:
> On Tue, 23 May 2023 16:46:04 +0100, Srinivas Kandagatla wrote:
> > regmap-sdw does not support multi register writes, so there is
> > no point in setting this flag. This also leads to incorrect
> > programming of WSA codecs with regmap_multi_reg_write() call.
> > 
> > This invalid configuration should have been rejected by regmap-sdw.
> > 
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/2] ASoC: codecs: wsa883x: do not set can_multi_write flag
>       commit: 40ba0411074485e2cf1bf8ee0f3db27bdff88394
> [2/2] ASoC: codecs: wsa881x: do not set can_multi_write flag
>       commit: 6e7a6d4797ef521c0762914610ed682e102b9d36

These were merged for 6.5 but the corresponding sanity check for regmap
has now been included in 6.4-rc5 which consequently breaks these codecs
(similar for wcd938x-sdw):

[   11.443485] wsa883x-codec sdw:0:0217:0202:00:1: error -ENOTSUPP: regmap_init failed
[   11.443525] wsa883x-codec sdw:0:0217:0202:00:1: Probe of wsa883x-codec failed: -524
[   11.443554] wsa883x-codec: probe of sdw:0:0217:0202:00:1 failed with error -52

Is it possible to get also these fixes into 6.4 final?

Johan
