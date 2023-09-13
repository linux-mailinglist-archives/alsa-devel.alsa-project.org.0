Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB27A08A1
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B765E93A;
	Thu, 14 Sep 2023 17:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B765E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694704109;
	bh=vNpK3vKTvXAn2nEQwG4uNUlRiH/o4ga8EvveqoV30vA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cNi3m3TOGwVUtH3Q6SEgKqLIZoxyxiibGN0+ffF54CqBOf7RCJW7isPz9kUqI1j5L
	 kktcnwr23TPlQhYPtSHB/HmyiLkXooG5avPw8ayagzqEbJp8xL7hoxNeCcmRHD5oqz
	 4x+5VhHS+tkTaw+e2mc7dk0HdReT5dv5RFGSix8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB7FF805AD; Thu, 14 Sep 2023 17:06:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF78CF80587;
	Thu, 14 Sep 2023 17:06:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1570F80425; Wed, 13 Sep 2023 05:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9B09F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 05:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B09F80212
Received: (qmail 13978 invoked from network); 13 Sep 2023 12:54:47 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.101)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 12:54:47 +0900
Received: (qmail 62196 invoked from network); 13 Sep 2023 12:54:47 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 12:54:47 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230913125447_297661931>
X-MailFrom-INFO: Info <country_code:KR|rbl_level:0>
From: Myunguk Kim <mwkim@gaonchips.com>
To: krzysztof.kozlowski@linaro.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
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
Date: Wed, 13 Sep 2023 11:53:43 +0900
Message-Id: <20230913025342.1460157-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bf43b771-35e3-1b37-24f5-e21b2c34a415@linaro.org>
References: <bf43b771-35e3-1b37-24f5-e21b2c34a415@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MLJOZIN7BBNEW7ZENLOYLUPAJROZBW4A
X-Message-ID-Hash: MLJOZIN7BBNEW7ZENLOYLUPAJROZBW4A
X-Mailman-Approved-At: Thu, 14 Sep 2023 15:06:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLJOZIN7BBNEW7ZENLOYLUPAJROZBW4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Bindings are always separate patch.

Okay, I will send v2.

> This was not tested. Missing vendor prefix, type.
>
> Anyway please provide some explanation why this cannot be deduced from
> the compatible.

This is not dependent on a specific vendor, 
but is intended to describe 
the properties of the signal(single/burst request) connection 
relationship between i2s and dma.
