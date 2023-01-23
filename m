Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6A6787E9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 21:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911551F2;
	Mon, 23 Jan 2023 21:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911551F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674506146;
	bh=FmnPLtlEEZLnIMIwawfGix9wzSwjvgWL7c11CtPG7VM=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=jP9aVyxfLfeMR/P9yzsSCaKlkKCJnymzq8FDDLhVzkZsltgc/4j6iQOzJKPZdGtR9
	 CIZRB3EKAo0v8iKbDGFU/x+w3zPz2FclNNoGkI+Oto6OGGl06ZCwomtTgOduSqiBWQ
	 VwkBd3RaaKzduTYOVwSeb1DLkHQIL080vLt593Bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29924F800FB;
	Mon, 23 Jan 2023 21:34:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E695F804C2; Mon, 23 Jan 2023 21:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11BE9F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 21:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11BE9F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gF5F3tET
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02BDAB80E8F;
 Mon, 23 Jan 2023 20:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795F8C433EF;
 Mon, 23 Jan 2023 20:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674506075;
 bh=FmnPLtlEEZLnIMIwawfGix9wzSwjvgWL7c11CtPG7VM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gF5F3tETTnRMP1JPBnu7Ptp/If+nrlkHmh1UvayGFWUyXYmpvpFIlY+pg0zyr7IvH
 EVxJOqmXmJX4Qp/NQU69I9zkedvW44RZCoOXej3wWBme0Mdka7wWgcqiXHBS0ZO9AT
 gCCeJ5Uq2QZnfqQa2fxLrDKyt14RL6D7czuJJnAOpLLNhbfPWA+yt32/GYape34E4O
 F5mvBPdKOsbsv8biqPPZmtLiy9WobD+Fa+Nr4SCWtPIUvLRWLgmYTlf3NVqXtdDuWD
 rOx+KcDSyNsyRQHtz5q6KnNbBnT517gw8xLmWe7kphfoQ/6r8WJFEAIN5ITvVAGWH0
 7e32wlfHKB2Xw==
Date: Mon, 23 Jan 2023 14:34:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 1/1] Docs/subsystem-apis: Remove '[The ]Linux'
 prefixes from titles of listed documents
Message-ID: <20230123203434.GA979965@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230122184834.181977-1-sj@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-doc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-hwmon@vger.kernel.org,
 Iwona Winiarska <iwona.winiarska@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Jan 22, 2023 at 06:48:34PM +0000, SeongJae Park wrote:
> Some documents that listed on subsystem-apis have 'Linux' or 'The Linux'
> title prefixes.  It's duplicated information, and makes finding the
> document of interest with human eyes not easy.  Remove the prefixes from
> the titles.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

PCI/index.rst change is fine with me:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

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
> 
> diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
> index c17c87af1968..e73f84aebde3 100644
> --- a/Documentation/PCI/index.rst
> +++ b/Documentation/PCI/index.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> -=======================
> -Linux PCI Bus Subsystem
> -=======================
> +=================
> +PCI Bus Subsystem
> +=================
>  
>  .. toctree::
>     :maxdepth: 2
