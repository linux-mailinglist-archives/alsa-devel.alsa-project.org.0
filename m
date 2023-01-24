Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A767A6A0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 00:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299F1E71;
	Wed, 25 Jan 2023 00:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299F1E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674601492;
	bh=FInAJGM6hitQqEWREbqfiZT6RW4VKmJRYiGIyELSJQc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TyDPHNJ3DZk0i9SQVtB7Hr3SS4S6gq+CbDLCQtA8vZELJfPJ/1UoZnFbdxX3MgJLN
	 HhpILWwTLrOC85o2Acg3d77NJK07a7IBCoF47SBG9B+dlETNXrFmWo9cyoPwb+ySGh
	 LdYudBVDt6XnziVKUT4bX+UDvSdKSS+4G/dJNAAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D00F802DF;
	Wed, 25 Jan 2023 00:03:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83403F801D5; Wed, 25 Jan 2023 00:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74864F801D5
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 00:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74864F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VDav27Ox
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5ADA61353;
 Tue, 24 Jan 2023 23:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AC5C433EF;
 Tue, 24 Jan 2023 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674601423;
 bh=FInAJGM6hitQqEWREbqfiZT6RW4VKmJRYiGIyELSJQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDav27OxxZTsAQgsUUqCRxbi02UJHTXeQ4BNvRR2EVcVurslbfZQ1hQbAIbZQ0Dfe
 d2YSKzxKcs/H8PX8n256ShJsj1Yt/HpEuQvjdnXNW7LxK4qClB/5cWjD9N85pUzOHq
 f9gUdwmJmO9TH4Nu6ulKdR7s5iitURCwPLteuRHaK6g42tTBOlrwyVzrc/b54PXQrm
 FbSFiUK1nyUKX9eWCnkged8yubqQAufRoj0a6bqC3EvH/1rfsEWHb0Tb9HTxrVTird
 q9ZhjkXbmN7rMAWQP3zs8stWUwCCsCvl/nEQ1sr2UBHleUHB7lQ7F6o7uEEzUcCbTU
 KQ4JYbXPqsgEQ==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
Date: Tue, 24 Jan 2023 23:03:40 +0000
Message-Id: <20230124230340.113608-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87a627ftuf.fsf@meer.lwn.net>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 24 Jan 2023 15:31:04 -0700 Jonathan Corbet <corbet@lwn.net> wrote:

> SeongJae Park <sj@kernel.org> writes:
> 
> > Some subsystem documents are missing SPDX license identifiers on index
> > files.  This patchset adds those.
> >
> > Changes from v1
> > (https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
> > - Separate from index file content changes
> > - Separate patch for each subsystem doc (Alex Deucher)
> > - Use MIT license for gpu (Alex Deucher)
> >
> > SeongJae Park (8):
> >   Docs/crypto/index: Add missing SPDX License Identifier
> >   Docs/driver-api/index: Add missing SPDX License Identifier
> >   Docs/gpu/index: Add missing SPDX License Identifier
> >   Docs/hwmon/index: Add missing SPDX License Identifier
> >   Docs/input/index: Add missing SPDX License Identifier
> >   Docs/mm/index: Add missing SPDX License Identifier
> >   Docs/scheduler/index: Add missing SPDX License Identifier
> >   Docs/sound/index: Add missing SPDX License Identifier
> 
> So I've applied patches 2 (since I wrote the initial file) and 8 (with
> Takashi's ack).  The others are also fine, I think, but I hesitate to
> apply license texts to files without knowing that they match the
> author's intent.  I hate to say it, but I think the best approach is to
> send each of the remaining patches to the appropriate maintainers for
> the subsystem involved.

That makes 100% sense, thank you, Jon!


Thanks,
SJ

> 
> Thanks,
> 
> jon
