Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68777CEC9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 17:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9580874C;
	Tue, 15 Aug 2023 17:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9580874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692112452;
	bh=SnD/2a2t+S0PRYsG05gJG58orUnzSs7NBYZZ+Kbo9Eo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z1U3bmDT4ChaEHINd3N9uvG/c8zb9haBy+aTSuh14AtRntKafC8h2pvsDO5hsPV0l
	 2ru+3USL6qhG5tVL/3GhwQ7JH9vuOu/66bZ4Te8qNKOc+8DQCjsxw7HneLFIs+54+i
	 DKy2YT71rCEuqfip6eWMngna0LYbsYoe6xwzBj98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3783FF801EB; Tue, 15 Aug 2023 17:13:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BEEF8016A;
	Tue, 15 Aug 2023 17:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B72E1F8016D; Tue, 15 Aug 2023 17:13:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76316F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 17:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76316F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZyDYyxi8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D81A20004;
	Tue, 15 Aug 2023 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692112383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHudGMEyhYeKG88YzAkDWG9Nax8kvFylfT1Z2ot33EM=;
	b=ZyDYyxi88xv2zoXsgP4HpMgAdt28vf7rZTYrbUkxG2X3HNczJfbbGwrQ3jLQ3hbMO9Dced
	x/zG0jG5awb3gxWYLEpHnjq9nwGeW1zGWg5nAnOKDBguzLuWhPERyaNDBDXZvy2P6HKjM7
	6cAxo9gYo+qG0l8zAQfh3DsnoGKPEC0Wq3G6mR8h8qR1fNWYFRVeLKNlc2mFDC8GoJKgNJ
	McuHfcJ/OxjP+whZaHdVa8nAmehlQC9bwF3jCuYPVB4yKQTaYXgiiSlQyGd7FTOJ2eF5eY
	5scrL/n9rql6maJBYnwBLOGWh50eNDKCaPegocmGTzBSGtGD66v49tn253VzrA==
Date: Tue, 15 Aug 2023 17:13:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 1/1] minmax: Deduplicate __unconst_integer_typeof()
Message-ID: <20230815171301.6076cbc0@bootlin.com>
In-Reply-To: <20230815113534.10592-1-andriy.shevchenko@linux.intel.com>
References: <20230815113534.10592-1-andriy.shevchenko@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: XSQ3E6RVSN3VKG4LE3G7R3YZBITEAAU5
X-Message-ID-Hash: XSQ3E6RVSN3VKG4LE3G7R3YZBITEAAU5
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSQ3E6RVSN3VKG4LE3G7R3YZBITEAAU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Tue, 15 Aug 2023 14:35:34 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> It appears that compiler_types.h already have an implementation
> of the __unconst_integer_typeof() called __unqual_scalar_typeof().
> Use it instead of the copy.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> As the initial code is in Linux Next via ASoC tree, it's assumed
> to go via that tree as well.
> 
>  include/linux/minmax.h | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 

Sure. I missed the __unqual_scalar_typeof(). Sorry.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
