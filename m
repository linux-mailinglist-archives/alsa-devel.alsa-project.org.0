Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44837A6684
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9D0A4E;
	Tue, 19 Sep 2023 16:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9D0A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695133381;
	bh=OLGKg2iMG9dTfJrkzQ0h2s08cPlYG/WKcUNh8bwvzmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQl+tSvo3g1jvNwNncrwjSuPZkP0xATD5+J19qtgqLoaDShITVRpWkxIvAJ9Cr8r0
	 rJcMZknvrQzekFFGOJjRc8MwVb9Ib3dk6H82N75DLrKmJbLdJgeKFj/W0HXgRGn3Va
	 PT1sRi9/Nd6VIEIuSRMNzuFScpV7x8Q+8PSdO64s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FEB9F80494; Tue, 19 Sep 2023 16:22:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D224F801F5;
	Tue, 19 Sep 2023 16:22:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1988F80125; Tue, 19 Sep 2023 16:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2E84F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E84F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n2j0iOKx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0681DCE1346;
	Tue, 19 Sep 2023 14:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E5AC433CA;
	Tue, 19 Sep 2023 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695133305;
	bh=OLGKg2iMG9dTfJrkzQ0h2s08cPlYG/WKcUNh8bwvzmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2j0iOKxNtUkqLvfzDXhvYimWUm8r+S8EBHfqaAGSlAWope2jGcd6faUDZBwC49if
	 TcPqvbMhk2vsqLC8vCB944/K3k8RoGLic9rgiuqk/9WmfJANhTDHZr9DmlmG5fLH8q
	 nUnA6og0rqNTrKjuq8tfZGxCWZV1NE9B6tusxEUF70r2ZSOWVgc4dvybsNcb3c7hJS
	 um9ze8RmQN1oKsPMXxgUBjHsCP9xndy/jHp8J6Ngiize8EWQqdPYiXwsdUsx6j/u6E
	 iTzwc5fAwlk3lq0zNGAGZMB7i4wik8TpWeKPg/sm5SBKa6OJbvA48jVQryuC1pKUo8
	 Iscv9W81Sqa+g==
Date: Tue, 19 Sep 2023 15:21:40 +0100
From: Lee Jones <lee@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: linux-next: Tree for Sep 15 (drivers/mfd/cs42l43.o)
Message-ID: <20230919142140.GW13143@google.com>
References: <20230915120127.1bc03420@canb.auug.org.au>
 <fb3f00ab-178c-45cf-ba39-baf61bb3f117@infradead.org>
 <20230918144033.GQ13143@google.com>
 <5baf9fcb-1c53-48b3-8742-ca3c98d82ebc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5baf9fcb-1c53-48b3-8742-ca3c98d82ebc@infradead.org>
Message-ID-Hash: KSOMWDTEDA4UD476GFJWWAVPBAB52K4S
X-Message-ID-Hash: KSOMWDTEDA4UD476GFJWWAVPBAB52K4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSOMWDTEDA4UD476GFJWWAVPBAB52K4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Sep 2023, Randy Dunlap wrote:

> 
> 
> On 9/18/23 07:40, Lee Jones wrote:
> > On Fri, 15 Sep 2023, Randy Dunlap wrote:
> > 
> >>
> >>
> >> On 9/14/23 19:01, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20230914:
> >>>
> >>> The btrfs tree gained a conflist against the mm tree.
> >>>
> >>> The device-mapper tree gained a build failure so I used the version
> >>> from next-20230914.
> >>>
> >>> The kspp tree lost its build failure.
> >>>
> >>> Non-merge commits (relative to Linus' tree): 5026
> >>>  2501 files changed, 391711 insertions(+), 34318 deletions(-)
> >>>
> >>> ----------------------------------------------------------------------------
> >>>
> >>
> >> on arm64:
> >>
> >> aarch64-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
> >> cs42l43.c:(.text+0x19d4): undefined reference to `devm_regmap_add_irq_chip'
> >>
> >> Using GCC 13.2.0 from kernel.org crosstools.
> >>
> >> Full randconfig file is attached.
> > 
> > Who is the intended consumer of this report?
> > 
> 
> I Cc-ed the driver maintainers and the subsystem maintainer.
> However, I missed Cc-ing the person who git blame identifies
> for this patch. (added now)
> 
> > Are you planning on following up with a patch?
> 
> Sure, I will do that.

Thanks for considering it.  Thanks again for actually doing it.

And sorry that a fix (that I hadn't yet seen) was already on the list.

-- 
Lee Jones [李琼斯]
