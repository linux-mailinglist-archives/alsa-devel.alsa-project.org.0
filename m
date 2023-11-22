Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD97F4D34
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 17:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861B6AE9;
	Wed, 22 Nov 2023 17:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861B6AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700671802;
	bh=2eaEiOuJiPmI83K90hZDYAc0bHogYH21CSUhgSS445U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0vjBcZhrbsxkB4A9nr3ylgFKRYmWxg+JEPTNoUfSQrY60JjN/nGqqnoTpvkNnnvb
	 r5HrVhvtHUuqPNOAm4041AvN0IydfavgQccPIB60ZOSJ40rJTvVgUwoF1PS280VNof
	 uaqjNmdjPpGgdLF2uz8f4auA5aStfsckr3GvOSYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A76DF80567; Wed, 22 Nov 2023 17:49:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47EE6F80578;
	Wed, 22 Nov 2023 17:49:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2ADEF802E8; Wed, 22 Nov 2023 17:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F6E9F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 17:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6E9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ORj1pfHG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADF96CE1EDE;
	Wed, 22 Nov 2023 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8454C433CA;
	Wed, 22 Nov 2023 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700671760;
	bh=2eaEiOuJiPmI83K90hZDYAc0bHogYH21CSUhgSS445U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORj1pfHG383ZfGaFkbkiJgiyVzT867/J3dvmvSCkgZjFKYDqfDi1r0OZVm/DgP6Pc
	 ViDz4j7NPKGSEHCU89SrvFBF26SpBNuujZefGAI3o59WqwP5mDCxAJyQfHf0SsDk8o
	 /7cBjVVVl+wR4K/Bw3d5CMQi3JMdYWoNMT1YjlJ9kR7rv9F7OSDtbCMy4Hu8H5oky0
	 6VAS0OsnEAZ67VYK/If2gZXlU8RbpjZtBiyaw0NZ8Pzwm33LSt99itdWXw2Kajo1RE
	 +xzRw9Cu3yotvsq/wa0g9kfhYSXWGN6+k5gCsNKBvUkeKUPeFNIR/CWtWM7pgBIeHQ
	 BAglB2rz/XVaQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5qPv-00031n-0F;
	Wed, 22 Nov 2023 17:49:35 +0100
Date: Wed, 22 Nov 2023 17:49:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZV4xH0lBhlwWYtLO@hovoldconsulting.com>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
 <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
 <2023112225-crop-uncle-9097@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023112225-crop-uncle-9097@gregkh>
Message-ID-Hash: ZSWZSZZVXS5VFFWIAG3ZMMFXIQWDQ7GU
X-Message-ID-Hash: ZSWZSZZVXS5VFFWIAG3ZMMFXIQWDQ7GU
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSWZSZZVXS5VFFWIAG3ZMMFXIQWDQ7GU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 04:35:17PM +0000, Greg Kroah-Hartman wrote:
> On Wed, Nov 22, 2023 at 04:41:37PM +0100, Johan Hovold wrote:

> > These fixes are now in 6.7-rc1 as
> > 
> > 	f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
> 
> This doesn't backport cleanly, can you provide a working backport?

Sure, I'll do that tomorrow.
 
> > 	805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
> 
> Now queued up, thanks.

I don't think this one will build without the former so better to drop
it from your queues and I'll send backports of both patches tomorrow.

Johan
