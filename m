Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAFB2BC537
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Nov 2020 12:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1EE168A;
	Sun, 22 Nov 2020 12:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1EE168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606042865;
	bh=scwEBBkoZKneSQXM1pTGdUeijoiUX9cfVYZuVSl9rHY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jiJNwDOONdPxiYOeysbuyB1G0mJWU5gm8NCqBa249SR/EpqkvPr4C/RkWJwXKFKpO
	 HU9Jo8da0/KnfkLiExw3ibcqjszUaz4WT5Bd3URoIBcCDVzH2/Hx1iIn+eh53lzmir
	 rNvvmZlCD49TsfIAkWCNuDScWEPtWxu7XlIRiMk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E95F80166;
	Sun, 22 Nov 2020 11:59:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 330B8F80165; Sun, 22 Nov 2020 11:59:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83EF6F80113
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 11:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83EF6F80113
Received: by mail-ej1-f66.google.com with SMTP id 7so19237994ejm.0
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 02:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kEmJgdOt9epBAyBXuoK443XqdXUwSvrAQGvWlpK7B60=;
 b=e6SX/xgP8KeGvlZnVY0/qbLcL/PV1Ud49E0yTOBVTd75KpwJaoXRaLx8oat+FJjW4U
 hOQGKck4eURlIk5zfjmQD0J8u1xXsrKIGs4XdUQi7iqg9O1DrBL/YmIP88GONgdXlb79
 UW1bUsVkwVZcHIhL2dyM+c8zYmcTMdpZOHUIW175fU7jQsChAJp4dvcwvcYeuDf19K00
 jm2knMSxv9QEi58OeTXI2coF0p8DvRjr0vD1sk+3D4sTrQVXx1BSnO5HUPrZwOAN8bpb
 4dzh40a9vFDKJqcsPqR8OsaNMWr8/+jvsYzQOdV5GIRX/K24Ur2VWZ7oXfOA9xlj1xTJ
 JUkw==
X-Gm-Message-State: AOAM530Oq20gUD+5gAN57JC69bRrmwDBUR21aftRYWxy5pJbN3qZ2Qrk
 YMAj9xJ3JMtGwAuIEjev/Uk=
X-Google-Smtp-Source: ABdhPJx9/at7TqslKqBC1FttD6Qn1HkD8A1lfWiRV3W7aMzo2tQ1gL48uK3RYrJDXbzJbIaGcfMtow==
X-Received: by 2002:a17:906:b783:: with SMTP id
 dt3mr39218452ejb.534.1606042763050; 
 Sun, 22 Nov 2020 02:59:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id p25sm994520eju.63.2020.11.22.02.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 02:59:21 -0800 (PST)
Date: Sun, 22 Nov 2020 11:59:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201122105813.GA3780@kozik-lap>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120200429.GJ6751@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Nov 20, 2020 at 08:04:29PM +0000, Mark Brown wrote:
> On Fri, Nov 20, 2020 at 08:42:45PM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Nov 20, 2020 at 04:56:34PM +0000, Mark Brown wrote:
> 
> > > It would be better to fix these by annotating the table as potentially
> > > unused, if nothing else it means if someone wants to add ACPI support
> > > (or it just works on their ACPI system with the plain old I2C ID) then
> > > they don't need to revert this change.
> 
> > The point is after this patch - removal of of_match_ptr() - they will
> > already support the ACPI matching through the PRP0001.
> 
> > Keeping of_match_ptr() and maybe_unused will prevent any ACPI re-usage
> > unless explicit ACPI table is added
> 
> Surely if that's the desired outcome the fix is to change the definition
> of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
> perhaps hidden behind a config option for PRP0001?  That seems better
> than going through the entire tree like this.

That could be indeed an easier way to achieve this.

+Cc Andy, Rafael,

I saw you were doing similar way as I did here [1] for the 698fffc2705c
("rtc: ds1307: Drop of_match_ptr and CONFIG_OF protections") with the
same reasoning as mine ("These prevent use of this driver with ACPI via
PRP0001.").

Do you have thoughts on Mark's proposal above (to change the
of_match_ptr())?

[1] https://lore.kernel.org/lkml/20201120161653.445521-1-krzk@kernel.org/

Best regards,
Krzysztof

