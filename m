Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1582749577
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 08:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9931F210;
	Thu,  6 Jul 2023 08:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9931F210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688624283;
	bh=VF7EajoQhYvqmxOEcoOLJjSq1A7k7YQBhV8Tz0D7gM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rno5sUTjl7V2LEAEBHm1XefLRpowj1+diSLlmfyv9LzdETzVhZ+QqelePXw0IXgZ/
	 gYR8MDLSgnbSpT0Mke3t0Y3Nh5aSPI5s7XgoH3RbMwevK62Nr9sssuoTgawNFiRzYU
	 UPW8K/O+x4nJRvFJIAKM7CFlZGz22Em4mgnosY0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 118DDF80100; Thu,  6 Jul 2023 08:17:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA923F80124;
	Thu,  6 Jul 2023 08:17:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 019F6F80125; Thu,  6 Jul 2023 08:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07C02F80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 08:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07C02F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J11t8+3r
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E2C4615E6;
	Thu,  6 Jul 2023 06:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86ACC433C7;
	Thu,  6 Jul 2023 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688624055;
	bh=VF7EajoQhYvqmxOEcoOLJjSq1A7k7YQBhV8Tz0D7gM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J11t8+3rmnuCwBxgU75U8OwLGHb2mVbqY8RGPxIakNjiNFMdqRvt8Yo8L0uNSdINb
	 nufZLNutYsTEjmkApL9bJ4sPV9DKWe75wcTA3HDfbPtqC6HuPqmm5ET36q59G9xqRH
	 poOp5Mp+YioNqGz3IwjwOgO3F0UhJRKWfoMUqirS4yUKSm+T/Qvh76I+oxPD1XE2He
	 Xu4bXAtF6AxiZZNyui8MTxeRE17Bi5TO3RBI4ei1RkC991aB7wEf42CeEQhZtmyClH
	 YFnUKsCCi9NyBSiKH3Tuct0voE/1KDBbBwVzVUk7g6eXpisthmgMR2/JFMeMzeyf4Y
	 TPo0rR6Yci6FA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qHIGD-00045E-1x;
	Thu, 06 Jul 2023 08:14:38 +0200
Date: Thu, 6 Jul 2023 08:14:37 +0200
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
Message-ID: <ZKZbzctgLpV-67hJ@hovoldconsulting.com>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-8-johan+linaro@kernel.org>
 <ac232872-734f-d192-d46c-555ebe3625c5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac232872-734f-d192-d46c-555ebe3625c5@linux.intel.com>
Message-ID-Hash: H67M3EN3STNPDPTB3JL5KGAXLCXYQBY5
X-Message-ID-Hash: H67M3EN3STNPDPTB3JL5KGAXLCXYQBY5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H67M3EN3STNPDPTB3JL5KGAXLCXYQBY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 05, 2023 at 05:07:22PM +0200, Amadeusz Sławiński wrote:
> On 7/5/2023 2:30 PM, Johan Hovold wrote:
> > Suppress probe deferral error messages when loading topologies and
> > creating frontend links to avoid spamming the logs when a component has
> > not yet been registered:
> > 
> >      snd-sc8280xp sound: ASoC: adding FE link failed
> >      snd-sc8280xp sound: ASoC: topology: could not load header: -517
> > 
> > Note that dev_err_probe() is not used as the topology component can be
> > probed and removed while the underlying platform device remains bound to
> > its driver.
> 
> I'm not sure that I understand that argument... what's wrong with
> dev_err_probe(tplg->dev, err, "ASoC: adding FE link failed\n");
> instead of
> dev_err(tplg->dev, "ASoC: adding FE link failed\n");
> ?

In short, it is not correct to use dev_err_probe() here as this is not a
probe function.

dev_err_probe() is tied to driver core and will specifically allocate
and associate an error message with the struct device on probe
deferrals, which is later freed when the struct device is bound to a
driver (or released).

For ASoC drivers, the struct device is typically bound to a driver long
before the components they register are "probed". I use quotation marks
as this is not probing in the driver model sense of the word and the
underlying struct device is already bound to a driver when the component
is "probed".

> Personally I would prefer dev_err_probe() to be used as it also provides 
> debug message.

Yeah, but it would be conceptually wrong to do so (besides the fact that
it would waste some memory).

Johan
