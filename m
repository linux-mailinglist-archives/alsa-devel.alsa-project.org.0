Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2387A0C29
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 20:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A24AD846;
	Thu, 14 Sep 2023 20:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A24AD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694714661;
	bh=8NOwEimiz5utIwlrYbbH86DF07k5LPS1/j4o7pD0F/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I6cz2iWYDi2+bCrsaFmbup4PCa8ok0p7FTwZ7Mn1Ur811gePEGFQ11E8yX/l3ueyw
	 hqfaPMtUFwtJiujqFPXOSn64IoNjBPiRPAMlVosniJBxxtSxVEDzbsgKcW5Jx4e3WI
	 0ZzHBXa7Cxzy3lrk7taSEuAEY85cBkefjP/twGqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF27BF8055B; Thu, 14 Sep 2023 20:03:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3EFF80246;
	Thu, 14 Sep 2023 20:03:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2099FF80425; Wed, 13 Sep 2023 06:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5846F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 06:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5846F80212
Received: (qmail 79719 invoked from network); 13 Sep 2023 13:16:45 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.38)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 13:16:45 +0900
Received: (qmail 9269 invoked from network); 13 Sep 2023 13:16:45 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 13:16:45 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230913131645_26618989>
X-MailFrom-INFO: Info <country_code:KR|rbl_level:0>
From: Myunguk Kim <mwkim@gaonchips.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fido_max@inbox.ru,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	mwkim@gaonchips.com,
	perex@perex.cz,
	robh+dt@kernel.org,
	tiwai@suse.com,
	u.kleine-koenig@pengutronix.de,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] ASoC: dwc: Add Single DMA mode support
Date: Wed, 13 Sep 2023 13:09:03 +0900
Message-Id: <20230913040902.1496711-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZP8Irf6g+sG6Ax9j@finisterre.sirena.org.uk>
References: <ZP8Irf6g+sG6Ax9j@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DN6YOAS4ZQGOFBAAYPHCFDQ5A3H5GFKU
X-Message-ID-Hash: DN6YOAS4ZQGOFBAAYPHCFDQ5A3H5GFKU
X-Mailman-Approved-At: Thu, 14 Sep 2023 18:03:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DN6YOAS4ZQGOFBAAYPHCFDQ5A3H5GFKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> This feels like something we ought to be discovering from the DMA API
> somehow, while it's not quite a property of the DMA controller (but
> rather of the SoC integration) in this case it could be a property of
> some DMA controller elsewhere and the whole process of finding and
> figuring out the properties of the DMA controler is handled by the DMA
> API.

In this case, it is not used through the DMA API. 
The connection relationship is as follows.
  i2s --- pcm_dmaengine ---  DMA IP (ie. pl330)
So, control was possible only by directly setting the maxburst property.

And, I will send v2 (separate code and bindings)

Thanks,
myunguk

