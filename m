Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDD1A8927
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E411692;
	Tue, 14 Apr 2020 20:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E411692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888515;
	bh=NnLbFxwBkZAZnHKG8To7A6gsmGeVcpnFoFaiP4dqol0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3DaELpHEubyG8WLz9X7f1o7MZCxH4h4C+mV6KK66efi4zEIiXguJyZz0tL6XM/Ji
	 NCfnyCnm8aL/FAB1rnQgye2twYYK44/MBVZpZzDTO3G7Z2H/O8OP2MmqPSI2yQYa7A
	 uUdA4daWP1zjxsCI8iVFgC5iG4NqsTpKLm6XS598=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1243CF802DB;
	Tue, 14 Apr 2020 20:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D6BF802DB; Tue, 14 Apr 2020 20:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75DDF802BD
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75DDF802BD
IronPort-SDR: 2CVYmijLgwmIpzjbN5J+VSwavOugxCxvtdBsoz8fjGoh4BXfQgV9ygCJk2bUUzUf+UcmH7Lk30
 H7bLDR9QeOfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:17:18 -0700
IronPort-SDR: 5lyFjFvie6Jr1Scluu6p9FywvYzd2cC611xzdxvp39cgHG+5hYMl4fymMKk04cou6bbuIhRs4Q
 5dOrT+/KJ2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253272997"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:17:13 -0700
Subject: Re: [RFC PATCH 16/16] ASoC: dt-bindings: add document for Hifiberry
 DAC+ PRO clock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-17-pierre-louis.bossart@linux.intel.com>
 <20200414172741.GF34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ff3739f-be84-1e07-072c-f8a5cf5ef385@linux.intel.com>
Date: Tue, 14 Apr 2020 13:10:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414172741.GF34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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



On 4/14/20 12:27 PM, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:41PM -0500, Pierre-Louis Bossart wrote:
>> The Hifiberry DAC+ PRO relies on two local audio oscillators exposed
>> with the clock framework.
> 
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license requirement nowadays.

Darn, yes, I should know better. thanks for flagging this.
