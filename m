Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98D8B8B2E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4985EE65;
	Wed,  1 May 2024 15:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4985EE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714570069;
	bh=QtCYznDFxAqU7kOOd/hY0Cb2aqW53mLPzwqiX702hVM=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GwI1XDcnsnIS+xcM6isWOyNh4C1DY8fX5yhgBV/Cx76vBTllZJaNQ3oujnaD2O2hf
	 y7HB9OcVY9wWc944FscZgME2gWvpTT9wUDyqvhFGC2VXq9qksxTB/yuCrPbhGmLgkD
	 TVjxA+bRrXDKuZQELeuURhW5jOR01WHkuypGThVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE70BF804F2; Wed,  1 May 2024 15:27:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A34F805A1;
	Wed,  1 May 2024 15:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CC3EF80266; Wed,  1 May 2024 15:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CF4AF8003A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF4AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=gfm9KiI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1714569989; x=1715174789; i=markus.elfring@web.de;
	bh=iS/r3J9lwCCODjyNXcaefNMyX7CRPZrNN91+KUc3PB4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gfm9KiI213O4FGS2IDi3MOi5TLT1a5yfTjYqtTsLqkCMt8rHZHsHEdvNDEfKKMH0
	 uOgZwR5ufGuJJKTg8tlJrBEHgQDvmQbwZJVckzntSM6tFCKLNMYCX7c0z45qMZzwh
	 V2qo32T3mogEqYf92/qlWm2FFp9w2rXSqSvpkTeZEvzKWuacKpTCwiQ6CC8iRZnu3
	 gbBlA0sQFIVNY+EyanpAFzKGQVEWaUWKqlJHGx68uLAuaUDnCAaAJk3oskEEGzRne
	 idv5/M9CiNG4XfW/pXSYutyTkuy5JC7/bhuMkFsFDq1N8PuIIxtcXqZ25qs6Olu2z
	 qyeB1/Te+P/QzlqVHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwjFg-1sqIf83FmM-00ylNB; Wed, 01
 May 2024 15:26:28 +0200
Message-ID: <d69ce186-6406-40ec-b8a3-a4b66d005ad6@web.de>
Date: Wed, 1 May 2024 15:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shenghao Ding <shenghao-ding@ti.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baojun Xu <Baojun.Xu@fpt.com>, Baojun Xu <baojun.xu@ti.com>,
 Bard Liao <bard.liao@intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,
 Cameron Berkenpas <cameron.berkenpas@gmail.com>, Gergo Koteles
 <soyer@irl.hu>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu
 <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, mimperial@lenovo.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shenghao Ding <13916275206@139.com>, Takashi Iwai <tiwai@suse.de>
References: <20240501122252.1215-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ALSA: ASoc/tas2781: Fix wrong loading calibrated data
 sequence
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240501122252.1215-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tC3X+GrzsotPgf+R/O7R1QzbOvKPtHRkYGtPGuFEp6iXPQyKEsb
 sCfhQHr+xF90jdOxVxhUmudOdLZB0aJwka+qTur5jv34SPxWBD2/sr/xDhuU4tDhfGO/6Px
 aopo2bxCZ1HfiAor+Rga88jCHsBAeLDKxHh761DdERfoXcH2wL8eeatxNIH8SWSnV5zmtep
 lNLON/93vd8Ab/LR9RZ2Q==
UI-OutboundReport: notjunk:1;M01:P0:2AKk/GKNh8g=;DIT/7tzccpnbJLKqm6tsIt75NpI
 aWJarwT56NcwoY13VQFhfeqfTrfiXm5Bl8jUwZNNdbxut7Src4TEm3BWh4GhFONIHezvTvWjV
 uAcIBU+YyWb+yJjs3J3vFMR4WeBK4TWfeooN+Bp7W3RkQaS0DW06EKAVlnNQMm8AXaITXBdYB
 jxiwYlU/pxE9xypmgCUX0xBwQIHtL82FDWNc+t9impuUZPbOfQ1SXkQqH7Qi2ErIxLBqykb+0
 v/ZOZLhjkObxaElawDIm5VCAFEA5e5pv/edEX8m1GI0+c+E4DCtqGc+AI1/rfWQBpjSX9J5zb
 CmHZvh3QrtTJwtvKeEM4N7dVSi2FAy358EHRGZ3jau2H+uYnfKRPxgETEV4O5N01ezjiTjLbL
 uRtd4FjvCebmu/35H5BEAD4PC5uW72pv1NVl0PjfHcRMkDQMy7JIZ7hxF65yhopKkhlcGnF0M
 K9/yY4qBGKztNR1OAqeqBlpv+TPd8N1EuyLsmX6NWzquTyL80AP0N1KBLaVS22bOJ+lnwOmSQ
 6nFktRzAf+PslYRG23Atkm54lAQMZPAGlV+L+udlUuNtmvi4+XaUXy1BVWED6fWeWF4rYPqmK
 3DMlQ+7LYaPV28A2NH0c6LmaVtv82rTLcrChU+eEg6nmM8hKt6l4fTfuamwTVyeh/sPh8vwXC
 ihr2xa9SvaLFrduH+/nMb2GL/0+cQ4RLeVl0Kvkfe+SO53F5p+G2aLgI0eXW4HiGI0IEX/bRx
 tbnHwAAyu49s1BmpgWb9kySsxa44No6nJfxvR8bupqH+G+xL40pX0YUOZnusx3IQ9Tm2YTguK
 XmSQb2wFpaaPieFpc+qEHnNlBw+2nh5Y11t1jaQJxHcTE=
Message-ID-Hash: AJYOPXH2CXR5QVF2EJAPUE6RKAXPEJJI
X-Message-ID-Hash: AJYOPXH2CXR5QVF2EJAPUE6RKAXPEJJI
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJYOPXH2CXR5QVF2EJAPUE6RKAXPEJJI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> 'Fixes: 0a0877812628 ("ASoc: tas2781: Fix spelling mistake "calibraiton"
>  -> "calibration"")'

Please improve this tag.
Would you like to omit a line break?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc6#n145

Are you looking for better ways to embed double quotation characters
in the corresponding commit =E2=80=9Csummary=E2=80=9D?

Regards,
Markus
