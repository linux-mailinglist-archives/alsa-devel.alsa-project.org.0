Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1674D4E2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 14:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD21203;
	Mon, 10 Jul 2023 14:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD21203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688990535;
	bh=hi2KjYVNB1fgMeU4P1IicTBxc+ULEU0k8ide4WBCPI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WtXMXuHRJivShBxSp0qKJMr2m2h6PU2fxfK4r5kHHwL9unSFQqvu0kkxo9lyo7qoN
	 W8morE0p04Q0urYSA63iQbVANcF5pSeszGuUl69CDdqBaJ/MpInIU8n3BKegKwPokF
	 dTlAMVpEz21WvlRUAkjRHvBKP+qJ3UCHOFPZZYRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E44F8027B; Mon, 10 Jul 2023 14:01:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1418EF80153;
	Mon, 10 Jul 2023 14:01:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC8F9F80249; Mon, 10 Jul 2023 14:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D7CFF800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 14:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7CFF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eUf+bOsB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEED460FD2;
	Mon, 10 Jul 2023 12:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18618C433C8;
	Mon, 10 Jul 2023 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688990471;
	bh=hi2KjYVNB1fgMeU4P1IicTBxc+ULEU0k8ide4WBCPI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUf+bOsBAEEtyVa+Tu1NcCxNEphDSnC05lrP4V2VIQBaufImErwI42F5EzPJ0MezX
	 SKXml0eAJvfoOhNufaG/FFftOj5O85WkSU+EoDWLvENzmFx3yMOfr58/Cf1Z0cKQvc
	 43NWvDGjxTh58W/y+ucwfNf12IomMSRZh9iZUPtDAl5l8bAoI9bLjUJsyy6Qp9O1kt
	 VpP37cZyPeIkUkFQe9ycH3/S/plF5OkiXOA8SZ92QcKQshxDOzXiWgPQIWhgciIf05
	 JfSeULY9SLcRUHCMIBMkqQxmfAjcqdKcFA/++E4awkkOmZtLjY1Rea/dBIhZx/KQSh
	 baWFwlbKT/rGg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qIpaD-0003Lu-15;
	Mon, 10 Jul 2023 14:01:37 +0200
Date: Mon, 10 Jul 2023 14:01:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Alex Elder <elder@linaro.org>
Subject: Re: [PATCH 7/8] ASoC: topology: suppress probe deferral errors
Message-ID: <ZKvzITFLCQzmw72w@hovoldconsulting.com>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-8-johan+linaro@kernel.org>
 <ac232872-734f-d192-d46c-555ebe3625c5@linux.intel.com>
 <ZKZbzctgLpV-67hJ@hovoldconsulting.com>
 <f464d5b1-c708-4b3f-f1d1-031c5def5b38@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f464d5b1-c708-4b3f-f1d1-031c5def5b38@linux.intel.com>
Message-ID-Hash: HWWZVBXQC6UWZCX2LB5QXPNBK73MV7GL
X-Message-ID-Hash: HWWZVBXQC6UWZCX2LB5QXPNBK73MV7GL
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWWZVBXQC6UWZCX2LB5QXPNBK73MV7GL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 06, 2023 at 09:25:26AM +0200, Amadeusz Sławiński wrote:
> On 7/6/2023 8:14 AM, Johan Hovold wrote:

> > In short, it is not correct to use dev_err_probe() here as this is not a
> > probe function.
> > 
> > dev_err_probe() is tied to driver core and will specifically allocate
> > and associate an error message with the struct device on probe
> > deferrals, which is later freed when the struct device is bound to a
> > driver (or released).

> I guess you mean call to: device_set_deferred_probe_reason(dev, &vaf);
> perhaps functionality could be extended to allow to skip this call and 
> just do prints? Or just add separate dev_err_defer function without this 
> step, although it would be best if they could share parts of code.

Feel free to suggest adding such a function if you think it's
worthwhile. It doesn't exist today it should not be a prerequisite for
suppressing these error messages.

Johan
