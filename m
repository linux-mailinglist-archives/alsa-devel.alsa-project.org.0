Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7DF7A0C2D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 20:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3BFDEE;
	Thu, 14 Sep 2023 20:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3BFDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694714715;
	bh=e76tetz0/W+MU34AEbp7BxOKWrLWgK3XahhKTkpggMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldjruHZk0pMCZF2iO0WZp+hq5n4OHDPCakpIvHkU1hjP/uqh45wh4BT2OX2qOVj6y
	 sDOyoZA0uVuwAmSQ5/WfCF57RYI3WAEegXFEtqUFkwDxp8+zwWCNwyYL7Jd2IYvtro
	 i9AWSqrUSO73KyhbOCkIoMyVuXbGRvyr7iKDiOLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981F5F8056F; Thu, 14 Sep 2023 20:03:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4662F8056F;
	Thu, 14 Sep 2023 20:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE30DF80425; Wed, 13 Sep 2023 08:50:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp1.hiworks.co.kr (smtp1.hiworks.co.kr [121.254.168.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 247C4F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 08:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 247C4F801F5
Received: (qmail 137128 invoked from network); 13 Sep 2023 15:49:58 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.37)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 15:49:58 +0900
Received: (qmail 192671 invoked from network); 13 Sep 2023 15:49:57 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 15:49:57 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230913154957_8612192425>
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
Date: Wed, 13 Sep 2023 15:43:07 +0900
Message-Id: <20230913064306.1862804-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <644e3564-994d-0b51-7d58-dac6afc1e0ec@linaro.org>
References: <644e3564-994d-0b51-7d58-dac6afc1e0ec@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TI7TLEICESXQFCNWWICP4WAVKLCXBJQ6
X-Message-ID-Hash: TI7TLEICESXQFCNWWICP4WAVKLCXBJQ6
X-Mailman-Approved-At: Thu, 14 Sep 2023 18:03:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TI7TLEICESXQFCNWWICP4WAVKLCXBJQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> This is not dependent on a specific vendor, 
>> but is intended to describe 
>> the properties of the signal(single/burst request) connection 
>> relationship between i2s and dma.
>
> How does this relationship depend on hardware?

When designing a SoC, it depends on the RTL and Bus connection.
My company has two types of configuration SoC: single and burst 
to meet ASIC customer's requirements.

Thanks,
myunguk

