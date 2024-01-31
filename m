Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE858447AC
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 20:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28510A4D;
	Wed, 31 Jan 2024 20:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28510A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706727637;
	bh=zhKuq+LkCXaKbrjTf0rz7m44R1nLItf93tzKRFen818=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ABNCAp/J/h1k0tNocdCPVMdGyhpmWyXTu/YlT3/PWyHYE1+deFSGrXD9bKiPad+cl
	 MwICmGDPy3dQGv/iRtD9iv4wxiGN5uw7gcJTppj6GNUJSM8EDCCNA6ab1tMbKWO/4L
	 PI2z/zQyDYddVvSOOdu9ShKAKQTE5ufu78q/fcEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3434EF80568; Wed, 31 Jan 2024 20:00:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F67F8056F;
	Wed, 31 Jan 2024 20:00:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61625F8055C; Wed, 31 Jan 2024 19:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 174B9F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 19:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 174B9F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J2T2tZJE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6CE961938;
	Wed, 31 Jan 2024 18:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B6DC433C7;
	Wed, 31 Jan 2024 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727591;
	bh=zhKuq+LkCXaKbrjTf0rz7m44R1nLItf93tzKRFen818=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2T2tZJEsLoBpHrkqTKdor3Ee8fR4osEdkaiIsbw0pFM+JUAISnyhSeqEXLzx1zHW
	 tDWEjLTaTOZ+IySnxgNoy/AkBn3s/9CRKSqPMOk4D/+TyVZxprDrOPnqFIdegcTrAE
	 QcDTN8RN3UhFnEYNy4/+hRJfLDx5XO2xp6flSfxddWXTHT9mNL38pghll2fTkxV4FE
	 8VeVNXUgKLEGn+QwFZYUjkYhrhAVqcOcTTWduvG93lYLSzqXtkF+L3mo6vE1ZEThiL
	 /JcbcL/4cAsG3IRKMKK9njFUPPKYCz2amdTdITfWYfX0ri0I97rF51GHMZzgZl8JUb
	 04l6+s8vY7qJQ==
Date: Wed, 31 Jan 2024 12:59:49 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
Message-ID: <20240131185949.GC1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: B2CUTWQNMQD7LXW3U3O7MEOKJKT6JDXN
X-Message-ID-Hash: B2CUTWQNMQD7LXW3U3O7MEOKJKT6JDXN
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2CUTWQNMQD7LXW3U3O7MEOKJKT6JDXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 29, 2024 at 12:54:44AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()

I also noticed that your mail setup has an issue. You have some utf-8 
encoded email names, but the headers say it is ascii. git-send-email 
should do the right thing here, but maybe Exchange is messing things up.

Rob
