Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685131A8679
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:00:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1607A16A6;
	Tue, 14 Apr 2020 18:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1607A16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586883606;
	bh=tB4R+fOXioP+AW5stKMx0G9BLCMV7wZXFnuEwckMbS4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0QTB7AZwxiIV0/l8MEffMypYtq4RY07HUq8IGBbun86kK9mSyKXpOKJtZDlyyeCa
	 O8feMf/qpsls1F+R1F5BPKYDjULKHxk+BNPdYRNFctQZkviKWI/+xT62pnT60N5KK5
	 LzG1J9DEyTOoV0pjPXuwtr4KL+PE+q4dtL7zM4gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26430F800B9;
	Tue, 14 Apr 2020 18:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DAB7F8013D; Tue, 14 Apr 2020 18:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27126F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 18:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27126F800F5
IronPort-SDR: ti3ejkOmpGKSxMb0FnV07Jj4drgjGo0MRAGdCSkcwsO6jnsgnYsmzjgGtgJRMFoP5K6XhlK0zf
 Mk5VM1z2H6mg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 09:58:04 -0700
IronPort-SDR: gMbE+QEekDU0/kio2XqaWcyspTrGOM24WgO+9PIqFcmMf+ocohTOzBvctElNLp6KpfsGLyuDFj
 QNG/IBZG2PwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253250831"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 09:58:00 -0700
Subject: Re: [RFC PATCH 00/16] ASoC/SOF/clk/gpio/dt: add Hifiberry DAC+ PRO
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200414165022.GZ34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7ea10ab5-a800-4c0e-8571-64dab08645c8@linux.intel.com>
Date: Tue, 14 Apr 2020 11:57:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414165022.GZ34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
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



>> Since this patchset relies on different subsystems, sending as RFC for
>> now. I chose to import the original code from the Raspberry PI tree as
>> is,
> 
> I don't see briefly what they are, any pointers like patch numbers in the
> series?

The prefix is the key, I should have added the following in the cover 
letter:

ASoC: pcm512x -> gpiochip creation

ASoC: Intel: sof-pcm512x -> use of gpio and clk API in the 
board-specific machine driver.

clk: hifiberry-dacpro -> use of gpio and creation of clock.

ASoC: dtbindings -> yaml description
