Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED47CD38B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 07:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0904882A;
	Wed, 18 Oct 2023 07:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0904882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697606992;
	bh=1/mW/bzeFJ8Aw6FXaWiwdS9K7P5WuBUcS5pi6y8F3Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omP0bnouy4PkxJ9cSnQ8ts34StmX0JUuLcbHJoOSADNWe3+kp0Y9lhwg1IA6+l2de
	 X5IXJNblKOyV6vYLeieM837+4sJtwJg7ai21Pwk8esGJXeXeqy2Nj49SnXXK4Ijl6m
	 nFYbDK6WDfXlolsfHkEH6wG7Ubheu6Vq3FHhPvFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8AF8F8025F; Wed, 18 Oct 2023 07:29:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC50F8024E;
	Wed, 18 Oct 2023 07:28:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A6D0F8025F; Wed, 18 Oct 2023 07:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id E0316F8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 07:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0316F8019B
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 45DE78027;
	Wed, 18 Oct 2023 05:23:47 +0000 (UTC)
Date: Wed, 18 Oct 2023 08:23:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
	bcousson@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231018052345.GK34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
 <20230921121626.GT5285@atomide.com>
 <20231006102348.GK34982@atomide.com>
 <20231006213003.0fbac87a@aktux>
 <20231007062518.GM34982@atomide.com>
 <20231015234815.637f5c14@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015234815.637f5c14@aktux>
Message-ID-Hash: J3JWI3YR4WSELLYAVXKNL43AJV322NSH
X-Message-ID-Hash: J3JWI3YR4WSELLYAVXKNL43AJV322NSH
X-MailFrom: tony@atomide.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3JWI3YR4WSELLYAVXKNL43AJV322NSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* Andreas Kemnade <andreas@kemnade.info> [231015 21:48]:
> On Sat, 7 Oct 2023 09:25:18 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> > If so then the following might be a fix, not familiar with runtime PM
> > done by ASoC though and not sure if some kind of locking would be
> > needed here.
> > 
> just checked: that one fixes the regression. runtime suspends again.

OK good to hear. So is there some fixes tag for this one or where did this
start happening? I'm not quite following how the dropping of platform data
could have affected this, maybe it just hid the problem because of
returning early?

Regards,

Tony
