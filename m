Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF07B6E61
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 18:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A0983E;
	Tue,  3 Oct 2023 18:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A0983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696350287;
	bh=TNU9ipzGbwPhcDS9xrUC4LpxTUdjs0JhjZFYvHpGT0w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZzKzQzVRXoNee1HeJszaF9eXzJY+YIrMtcMgQaKMALdTOVSWNIDO5ZPP+++hBzCId
	 IJHDcu9eWQl9L/BtqBq/Sk5U7Y2j0iUuGTwm4xw/xIeV/uQ47f3EZ4BHijIa6OfVpt
	 V7S1RywCSqJMb+5SXd+qCOqysr7Rq4s9A4tBnUsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F587F8055A; Tue,  3 Oct 2023 18:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABD1F80310;
	Tue,  3 Oct 2023 18:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29BA7F8047D; Tue,  3 Oct 2023 18:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0904F80130
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0904F80130
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4S0NRf3F6Lz1sB7V;
	Tue,  3 Oct 2023 18:23:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4S0NRb4yb1z1qqlS;
	Tue,  3 Oct 2023 18:23:39 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id aP66i6RqkI-7; Tue,  3 Oct 2023 18:23:37 +0200 (CEST)
X-Auth-Info: DEcWQ3O3Q8oqxyW+2oC9tHdwulLSJUIRdEt3IUmb5jjP2Lci+dS0J9Uj4ULe5Ygi
Received: from igel.home (aftr-62-216-205-214.dynamic.mnet-online.de
 [62.216.205.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  3 Oct 2023 18:23:37 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 690602C0052; Tue,  3 Oct 2023 18:23:37 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Ding, Shenghao" <shenghao-ding@ti.com>,  "broonie@kernel.org"
 <broonie@kernel.org>,  "robh+dt@kernel.org" <robh+dt@kernel.org>,
  "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  "lgirdwood@gmail.com" <lgirdwood@gmail.com>,  "perex@perex.cz"
 <perex@perex.cz>,  "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,  "Lu, Kevin" <kevin-lu@ti.com>,
  "13916275206@139.com" <13916275206@139.com>,
  "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
  "mengdong.lin@intel.com" <mengdong.lin@intel.com>,  "Xu, Baojun"
 <baojun.xu@ti.com>,  "thomas.gfeller@q-drop.com"
 <thomas.gfeller@q-drop.com>,  "Gupta, Peeyush" <peeyush@ti.com>,  "Navada
 Kanyana, Mukund" <navada@ti.com>,  "tiwai@suse.de" <tiwai@suse.de>,  Arnd
 Bergmann <arnd@arndb.de>,  linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: fixed compiling issue
 in m68k
In-Reply-To: 
 <CAMuHMdXRGxnGpVHiB+Zvxq+G4K-BL8JsJGbG+7CNtJiqGwHOsQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 3 Oct 2023 14:15:36 +0200")
References: <20231002090434.1896-1-shenghao-ding@ti.com>
	<CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
	<79c4d534ad20452c992d8ace138e4384@ti.com>
	<CAMuHMdXRGxnGpVHiB+Zvxq+G4K-BL8JsJGbG+7CNtJiqGwHOsQ@mail.gmail.com>
X-Yow: I am covered with pure vegetable oil and I am writing a best seller!
Date: Tue, 03 Oct 2023 18:23:37 +0200
Message-ID: <87v8bn3cae.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 5NSWRR7VX63RSRXBWWH2ECWXATD76QYK
X-Message-ID-Hash: 5NSWRR7VX63RSRXBWWH2ECWXATD76QYK
X-MailFrom: whitebox@nefkom.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NSWRR7VX63RSRXBWWH2ECWXATD76QYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Okt 03 2023, Geert Uytterhoeven wrote:

> Looks like the compiler is sharing the jump table at L95 for two
> different switch() statements, but the PC-relative offset to refer to
> the table is too large when using -m68000.  It works fine with -m68020.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
