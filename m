Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5D67C52B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 08:55:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCDE846;
	Thu, 26 Jan 2023 08:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCDE846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719756;
	bh=fcBPj1RlmouTrt4xmiBVmnWCjXBQlpL/T8VkCeIhyQQ=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dDTSraMwqOJflr/2Gbew0Of9qcgY+kOmYWLluoYCC+8UwmclhBwlmcL3rT/ENoZRa
	 1CrtiU22Hm/FhlD9y9xdZ2zgW71a/7xxiQJbLQ1I2Riid2q2T0jpxWT93xOZF+87sT
	 O5GAxNB8KU+xLu/bXGAVR9R+UjyxmTm0LOsr+Rqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342CEF8030F;
	Thu, 26 Jan 2023 08:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11E2BF8027D; Tue, 24 Jan 2023 23:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A861F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 23:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A861F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=XW1biFoI
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 5D12E739;
 Tue, 24 Jan 2023 22:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D12E739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1674599273; bh=MTaO760PJgYwDFixyQndXwkcxJ6qlGsTUp+EUcJgaCs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XW1biFoIP9a4rIRf2cLd3puFe2cCFrQPnLjCIkaYxizp+J6e+ypbS83QROQV7RjZL
 x+AsBikpA3Vkk3ujbg62UV6QrSznWRdtlGR3w9N1P6p5SjPTaB1VvvVuFhl7bYnzao
 e+Pb9bvOHC00Tv7pEsztMhT9Z72Gat9MaqdsTs8TiPqfNYcDgG/+/KR+sn5dVczsue
 lu1v1+vuz/4hzlpLBA+KYbHbvLOlZ4/b/+Fc8THgu2Xt0YT87foyxCIQE79oboIidh
 ZhOk8JFsQO6mPuPHLHgprow+Ki52f77LDa52ffGAHq1nhkgYRnJAeU48pOJekm2FoI
 ARNZkhtCcl3AQ==
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 1/1] Docs/subsystem-apis: Remove '[The ]Linux'
 prefixes from titles of listed documents
In-Reply-To: <20230122184834.181977-1-sj@kernel.org>
References: <20230122184834.181977-1-sj@kernel.org>
Date: Tue, 24 Jan 2023 15:27:52 -0700
Message-ID: <87edrjftzr.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:02 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "Rafael
 J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 linux-mm@kvack.org, David Airlie <airlied@gmail.com>,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-hwmon@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SeongJae Park <sj@kernel.org> writes:

> Some documents that listed on subsystem-apis have 'Linux' or 'The Linux'
> title prefixes.  It's duplicated information, and makes finding the
> document of interest with human eyes not easy.  Remove the prefixes from
> the titles.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
> Changes from v1
> (https://lore.kernel.org/lkml/20230114194741.115855-1-sj@kernel.org/)
> - Drop second patch (will post later for each subsystem)
>
>  Documentation/PCI/index.rst        | 6 +++---
>  Documentation/cpu-freq/index.rst   | 6 +++---
>  Documentation/crypto/index.rst     | 6 +++---
>  Documentation/driver-api/index.rst | 6 +++---
>  Documentation/gpu/index.rst        | 6 +++---
>  Documentation/hwmon/index.rst      | 6 +++---
>  Documentation/input/index.rst      | 6 +++---
>  Documentation/mm/index.rst         | 6 +++---
>  Documentation/peci/index.rst       | 6 +++---
>  Documentation/scheduler/index.rst  | 6 +++---
>  Documentation/scsi/index.rst       | 6 +++---
>  Documentation/sound/index.rst      | 6 +++---
>  Documentation/virt/index.rst       | 6 +++---
>  Documentation/watchdog/index.rst   | 6 +++---
>  14 files changed, 42 insertions(+), 42 deletions(-)

Applied, thanks.

jon
