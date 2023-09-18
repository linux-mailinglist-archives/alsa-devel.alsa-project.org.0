Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AA7A4B1A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 16:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20ACB822;
	Mon, 18 Sep 2023 16:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20ACB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695048127;
	bh=72A3RMIZJmHx8XBk/HX5om5J8tMSKPisdGFQjimNloY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJFkVhQeuyTV1VuFlVAh89LjUmyymDRRBnjM7uQEa19JuPsnCMby7wWg0bpsvARPU
	 RvcjuzHwtSnG20q2Ymfda7ARbXx/BkKrI8SL1KkQ79YrC3NfmmetqMES1xVi+iDv/n
	 JOKXje7prLiQEnyDHe/O8i2W4otzEnfJxYqtmGaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF780F80125; Mon, 18 Sep 2023 16:40:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 464A5F801F5;
	Mon, 18 Sep 2023 16:40:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1147F8025A; Mon, 18 Sep 2023 16:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C392EF80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 16:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C392EF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K15hjWmA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E51E5B80E86;
	Mon, 18 Sep 2023 14:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5744C3278A;
	Mon, 18 Sep 2023 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695048038;
	bh=72A3RMIZJmHx8XBk/HX5om5J8tMSKPisdGFQjimNloY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K15hjWmAXXINZIdK+qe8cDfi7qyrC+LpFHt2Kw8DsEfq7LWdUA3gozCcNTIZEau/L
	 Lmd0xPiS1yfrDRe3VIldChXs+tTT31RmcZUAnine+flaLZCo5WzMab/bR4LvvWXX7c
	 +Dx2zBgkOvb8vu2zRKY2MYAfFX6sG3ddTO4f8UTw6hcm5RoWVrv3eKZonCjnYxar3a
	 99uCqo1Q4DrgkmHPnxFpoJ9No95POaBkQfkbO77I9eCPiIcu9tZHsYSuCbrcqqXePd
	 tdkqyYoIMNhC5oCQqiIEMT6JddjMnahAI2s6M3nZqz9Q2s6RHXWdX/ZW4TeJQGGyEx
	 dYUayDs8IeCew==
Date: Mon, 18 Sep 2023 15:40:33 +0100
From: Lee Jones <lee@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: linux-next: Tree for Sep 15 (drivers/mfd/cs42l43.o)
Message-ID: <20230918144033.GQ13143@google.com>
References: <20230915120127.1bc03420@canb.auug.org.au>
 <fb3f00ab-178c-45cf-ba39-baf61bb3f117@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb3f00ab-178c-45cf-ba39-baf61bb3f117@infradead.org>
Message-ID-Hash: GSGWOAXDBM2VDNQGA6HBYDXM67RYCYDW
X-Message-ID-Hash: GSGWOAXDBM2VDNQGA6HBYDXM67RYCYDW
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSGWOAXDBM2VDNQGA6HBYDXM67RYCYDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023, Randy Dunlap wrote:

> 
> 
> On 9/14/23 19:01, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230914:
> > 
> > The btrfs tree gained a conflist against the mm tree.
> > 
> > The device-mapper tree gained a build failure so I used the version
> > from next-20230914.
> > 
> > The kspp tree lost its build failure.
> > 
> > Non-merge commits (relative to Linus' tree): 5026
> >  2501 files changed, 391711 insertions(+), 34318 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> 
> on arm64:
> 
> aarch64-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
> cs42l43.c:(.text+0x19d4): undefined reference to `devm_regmap_add_irq_chip'
> 
> Using GCC 13.2.0 from kernel.org crosstools.
> 
> Full randconfig file is attached.

Who is the intended consumer of this report?

Are you planning on following up with a patch?

-- 
Lee Jones [李琼斯]
