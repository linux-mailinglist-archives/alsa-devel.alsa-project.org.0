Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79FCB00F2
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A1D60217;
	Tue,  9 Dec 2025 14:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A1D60217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287016;
	bh=+UPd69c3uCQEUerH3JffVdWKFCrvfaGg3OFt42G6gFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HVWtsDm8Cx01iMdYzDYo7hR1lIjyBSAGDQ+dzPAsIkje/t1eX2nP/2UGjE3Mzhh/V
	 /2jM6/clZWFZV4kpq7SQZgqz0jhCol3lIbEGB3EWmkaIIwC06Nw4B1L79uRz7U6USN
	 sX13Rjf48/fknCtU5mkYtB2mQTLy8XJoBv1OGEY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E09FCF80634; Tue,  9 Dec 2025 14:29:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F49F8063C;
	Tue,  9 Dec 2025 14:29:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7083BF804B3; Fri, 28 Nov 2025 11:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9A4BF80086
	for <alsa-devel@alsa-project.org>; Fri, 28 Nov 2025 11:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A4BF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K9TsZUkL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764325534; x=1795861534;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+UPd69c3uCQEUerH3JffVdWKFCrvfaGg3OFt42G6gFM=;
  b=K9TsZUkLKY7wiP1JsWo0AmJXNXoMkqbPHVUTkiFacEFomMeYl7bq7kA6
   sU1/8uAkMQ0xTEQvZ7Jo2Y34vp7euoP/sVCR6xSKigLjR5TMcd6+UalZn
   Q42iBIxRa25swvyNy908TDUtfdd84wHW3oQ1xYDU6/zxJCncy9eJYm+09
   scS5gctFg9R6Hye7RSMvHEL7a/EAwxjI/kMeKgPctf3Rv/60bg+UuTm1n
   h3DCIhweMYMXAGJXWN/jUOImoPD4za8X1kWq9FBeFxpu9QIwOee9Ab39f
   SWHIdar5s5lWqfn2s3eELJ1Qp8DDXFQfjjZOoTItjFpcWPtHilmnBslf7
   w==;
X-CSE-ConnectionGUID: vDvHP3kKQKW3UGCF/rnTIg==
X-CSE-MsgGUID: SesbxOQzQjCfxr9QG/pCmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66255995"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800";
   d="scan'208";a="66255995"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 02:25:28 -0800
X-CSE-ConnectionGUID: vd5D/beaTMqQLgv6t21X1g==
X-CSE-MsgGUID: KuZn0GKDSp+sCJo2CzdZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800";
   d="scan'208";a="197905542"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.229])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 02:25:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: tiwai@suse.de, hansg@kernel.org, Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, andriy.shevchenko@linux.intel.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
References: <20251126141434.11110-1-baojun.xu@ti.com>
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Message-Id: <176432551630.7427.14238398482885718801.b4-ty@linux.intel.com>
Date: Fri, 28 Nov 2025 12:25:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EXILRG3IHSMZM2BNK5HRVXN6C6T2U3O6
X-Message-ID-Hash: EXILRG3IHSMZM2BNK5HRVXN6C6T2U3O6
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:28:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXILRG3IHSMZM2BNK5HRVXN6C6T2U3O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Nov 2025 22:14:33 +0800, Baojun Xu wrote:

> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ missing projects
      commit: 1d1b8b0734af5149946e687415bf6be05ae55bd6

--
 i.

