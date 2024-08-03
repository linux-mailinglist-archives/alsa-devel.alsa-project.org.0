Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1F946A5A
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 17:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B317463D;
	Sat,  3 Aug 2024 17:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B317463D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722698717;
	bh=nm5cQkyRZVUeKzhFs1HWWxL1TF+UFk5CcqlIwj2tOzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OtW3N2k0zS7DGNyYDwLHlvBURHCq3e+0HO80FuUMgqMg4FqkAqMUz9l7CguzaM6Hg
	 4icF8GYGqCrOzPrg/nOWNGiXEgm809mvNQpat6HfPlrNZnyl6FKiBgMSnsfLKJttXY
	 DQ+s7vsdDO2gXIjZjX9xnSFg8Qo6oONY6wyzgOqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB874F805AF; Sat,  3 Aug 2024 17:24:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F03BF805AD;
	Sat,  3 Aug 2024 17:24:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE938F8007E; Sat,  3 Aug 2024 17:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B677F8007E
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 17:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B677F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LyEZKGg2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32B98CE0225;
	Sat,  3 Aug 2024 15:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBDCC116B1;
	Sat,  3 Aug 2024 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722698024;
	bh=nm5cQkyRZVUeKzhFs1HWWxL1TF+UFk5CcqlIwj2tOzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LyEZKGg23ciGyzuv/ViKG+lhWMW0xwIy+G/9YszNWN3e3/W/F4jOsZNhDatR5x1kn
	 ctW9Vi0ZMl2+YjV3zUNuubkOpwElaMOFANLliZLNOFNhuwLOGmeOD93jIqe5nsGJb8
	 IMxuesWYW/edUDdKv/9t/5yxJrScQpKovDeqkA+TKbenoLSGpnk0BNhQmeVqnBxpMV
	 PdxJyYI/76lqYrHQbzUp7cNKeXTGWf0WSjl1+22W4Z3oF5teO7s7bZVOu9QS0bLiUT
	 nzrPQ8Wyo+nm2XgsNr3NoPQA5L+R08HaDufq2qIx9Qo0pQ7suvWAXypfk9SE/t+MMo
	 stzuZoyndklPA==
Date: Sat, 3 Aug 2024 16:13:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: <fabrice.gasnier@foss.st.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno Sa <nuno.sa@analog.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/9] iio: adc: dfsdm: add scaling support
Message-ID: <20240803161334.5e627178@jic23-huawei>
In-Reply-To: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QXMD46WCEWNJHXSKFMLGXR3BU6NY4XSF
X-Message-ID-Hash: QXMD46WCEWNJHXSKFMLGXR3BU6NY4XSF
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXMD46WCEWNJHXSKFMLGXR3BU6NY4XSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 10:46:30 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> The aim of this serie is to add scaling support to STM32 DFSDM
> peripheral in the analog context.
> 
All looks good to me.  I'll leave it a little longer though as
some of the dt-bindings patches don't have tags from the maintainers yet.

Jonathan
