Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234D677E9E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 16:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84B883336;
	Mon, 23 Jan 2023 16:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84B883336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674486232;
	bh=CclE03KygtDHtfeXJDWAfP/Pao8MYAQFo8WO4viasOM=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DLtkFDkrCY4aJtjCza9ruU4raczkyO5l2pclpq34uyKcpdr0A6n4c+BHz+47xRmR5
	 N7B5o8QSAvdGxePhOz/ugUO0T1IxgxQUvshTcAzw43IzBfUUhCB9Py4BQzxTbnmlp+
	 IBvIIa8VbttdyrgWHPv+S2c7mBRfYHSwpBzbLCmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC388F804F3;
	Mon, 23 Jan 2023 16:02:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C963F804C2; Mon, 23 Jan 2023 16:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96EBDF800FB
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 16:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96EBDF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=NmRRM54u
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8D62E4E5;
 Mon, 23 Jan 2023 15:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D62E4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1674486157; bh=wxSnxIUwdkEE3c/KbtJ9Rj/dEJdzd01IhaDBd3YRbOA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NmRRM54uhrNW9CPQE0Rj7FopmjfzAKSU48AkFmXI0PBahR3aZFhVv/eI2ez+LoQdt
 GAwYh6oeA5wECwc1VQwN51GdGKYJ3pRv9sjFAyB5PU6NyuPRJB5Fj49M9rtpAg90hA
 mGPUpT3XUv7qqmpuYvcPec8YgT+TOBIcluJ1TZ6CAVlJnVS8pi6FNVqF+QhufMW4B+
 FV+OdLKAsAKEypABjdte4J85m/2O/g6sbTnwMqgqCRN+jZ4f78bASoJqxscJz6dI3F
 Hho+mHPNvcZo038OgNds35wZPvtdAVg0kaVxnJntVPoQ1g5X7wLgwH/M1nzD8v/OGH
 XykY+7P/t3Ggg==
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
Date: Mon, 23 Jan 2023 08:02:36 -0700
Message-ID: <874jshl2er.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Airlie <airlied@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-hwmon@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SeongJae Park <sj@kernel.org> writes:

> Some subsystem documents are missing SPDX license identifiers on index
> files.  This patchset adds those.

Documentation/ is far behind on the SPDX front, and I'm all in favor of
fixing that.  I do worry, though, about sticking license declarations
onto files that did not previously have them; do we know what the
original contributor's intent was?

> Changes from v1
> (https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
> - Separate from index file content changes
> - Separate patch for each subsystem doc (Alex Deucher)
> - Use MIT license for gpu (Alex Deucher)
>
> SeongJae Park (8):
>   Docs/crypto/index: Add missing SPDX License Identifier
>   Docs/driver-api/index: Add missing SPDX License Identifier
>   Docs/gpu/index: Add missing SPDX License Identifier
>   Docs/hwmon/index: Add missing SPDX License Identifier
>   Docs/input/index: Add missing SPDX License Identifier
>   Docs/mm/index: Add missing SPDX License Identifier
>   Docs/scheduler/index: Add missing SPDX License Identifier
>   Docs/sound/index: Add missing SPDX License Identifier
>
>  Documentation/crypto/index.rst     | 2 ++
>  Documentation/driver-api/index.rst | 2 ++

I added this one, and GPLv2 is fine there.

>  Documentation/gpu/index.rst        | 2 ++
>  Documentation/hwmon/index.rst      | 2 ++
>  Documentation/input/index.rst      | 2 ++
>  Documentation/mm/index.rst         | 2 ++
>  Documentation/scheduler/index.rst  | 2 ++
>  Documentation/sound/index.rst      | 2 ++
>  8 files changed, 16 insertions(+)

Thanks,

jon
