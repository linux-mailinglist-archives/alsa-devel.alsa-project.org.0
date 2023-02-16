Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14569ADB5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 15:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBE8F20;
	Fri, 17 Feb 2023 15:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBE8F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676643317;
	bh=vjZqTQspToWPU9DQB0dweXSBbejTCss84sFN0Gmq70c=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZBwshbxx+NdEFVSAaJ1/JgjCIcIH2JDtKfNVoAkL5HlFWEz7eXMZ/zuBs/dAbutK0
	 Oa8kDLa9mdWS/Qv20o8VcjnpFRETGJRN0JkVHrzbLx34yr9Ui3d6IHfMJ1XcCJQ+SQ
	 gHaQ1FJVcDJh4Wq7fMvwLpMTgV20IK3bKU/sF7uE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18338F800E4;
	Fri, 17 Feb 2023 15:14:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889A4F80171; Thu, 16 Feb 2023 17:26:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1077F800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1077F800E3
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 4018826F7A9; Thu, 16 Feb 2023 17:26:46 +0100 (CET)
Date: Thu, 16 Feb 2023 17:26:46 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Message-ID: <20230216162646.GK17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
 <Y+5TGKoMuRr4XQ+b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+5TGKoMuRr4XQ+b@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MailFrom: janne@jannau.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NKKHFFNKUWX4FUKPS5YBS3NNAUKPLLOA
X-Message-ID-Hash: NKKHFFNKUWX4FUKPS5YBS3NNAUKPLLOA
X-Mailman-Approved-At: Fri, 17 Feb 2023 14:14:22 +0000
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKKHFFNKUWX4FUKPS5YBS3NNAUKPLLOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-02-16 16:00:24 +0000, Mark Brown wrote:
> On Sun, Feb 12, 2023 at 04:41:24PM +0100, Janne Grunau wrote:
> 
> > This trivial dt-bindings update should be merged through the asahi-soc
> > tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> > series.
> 
> I didn't get a response to my query about the nearness to the
> merge window and the prospects of the series hitting v6.3, though
> I do see that there's a new version needed for some of the other
> patches.  I'm just going to go ahead and apply so it's there and
> I don't need to worry about or see resends, in case the rest of
> the series is going to go in it's not the end of the world if it
> gets applied twice anyway so

Sorry, I forgot to answer. The devicetree commit is too late for 6.3. If 
some of the binding updates make it into v6.3-rc1 it will get dropped.

> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks

Janne

