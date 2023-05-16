Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD1704A1A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014E1100;
	Tue, 16 May 2023 12:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014E1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684231750;
	bh=9rwHmSwT7dbAEIPo156SJSK+Xaa+4zJir8iTQqqilwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFIma83XJAGIwjgm54zDBAcB5abd9PxFjmFpaJTfU1p3acpxgwlRZaBGY5pwHE+1d
	 J529IJY2tZVemvFEvczgh2tCTBLsgvA6qRtk5g6ClS9gJNfdbMEUXdd/cgUuTU/uAw
	 wngB1uGFHbS4PC2afRlQTFaOvkUheMokPMHxKPys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43874F80431; Tue, 16 May 2023 12:08:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4551F80087;
	Tue, 16 May 2023 12:08:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E89AF8025A; Tue, 16 May 2023 12:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B78E7F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78E7F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fmNhx/lc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8EF261A14;
	Tue, 16 May 2023 10:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B29DC433EF;
	Tue, 16 May 2023 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684231685;
	bh=9rwHmSwT7dbAEIPo156SJSK+Xaa+4zJir8iTQqqilwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmNhx/lcnsROh7wR1TaHGtfMENiJUolfSpwCka1PRPcWcef52D+RUVjt1lMQpdij2
	 VMqSbc0lkDTLfjZqsnLvzHUusDw6BhIsaw8DxfGe9GZ0fl/dc9DL8jt5Mp2uAuuUxx
	 gFtZDuqvlToE8f5ILadJUrkBfPRwaScOdRN8DyfYfKQlr4QjX2UNZvA3zK9Ns07Q4D
	 7Mf2t8aCfgtrmIDv6rN1SL8igBkeaELZLp+p5H5McQhlemZk/5ae2Rh3jwov9pxeta
	 JG1pqdX6EMlNIJkT4N9TFyjp7N+MbmYDYkqt197TAEclYWC6N2C6qyCoxAjCXofzyx
	 uERUFIEq1Kc9w==
Date: Tue, 16 May 2023 11:07:58 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, tglx@linutronix.de, linus.walleij@linaro.org,
	vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <20230516100758.GE10825@google.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
 <20230512164233.GN68926@ediswmail.ad.cirrus.com>
 <ZGGGGcZNEx7o8GC6@finisterre.sirena.org.uk>
 <20230515095752.GQ68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515095752.GQ68926@ediswmail.ad.cirrus.com>
Message-ID-Hash: 72FUPA5FHT44PIBR5ZBRQO7OOHGGRLGH
X-Message-ID-Hash: 72FUPA5FHT44PIBR5ZBRQO7OOHGGRLGH
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72FUPA5FHT44PIBR5ZBRQO7OOHGGRLGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023, Charles Keepax wrote:

> On Mon, May 15, 2023 at 10:08:41AM +0900, Mark Brown wrote:
> > On Fri, May 12, 2023 at 04:42:33PM +0000, Charles Keepax wrote:
> > 
> > > I guess if Mark doesn't mind I think the only internal bit of the
> > > device that uses the IRQs is the CODEC driver so I could move the
> > > IRQ handling in there, it does seem a little odd to me, but I
> > > guess I don't have any problems with it.
> > 
> > The obvious (and previously standard) place for it would be the MFD.
> 
> Alright I certainly have no objection to moving it there, although
> would be good to get Lee's thoughts, make sure he is happy with
> that too.

Submit a patch and we'll take it from there.

-- 
Lee Jones [李琼斯]
