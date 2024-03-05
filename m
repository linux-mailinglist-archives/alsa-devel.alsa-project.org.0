Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09F871BBF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 11:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB8A83B;
	Tue,  5 Mar 2024 11:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB8A83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709635306;
	bh=fDlN5HGLItWU94tsGbGVj8uU9vIMn50cMaUnHApy5eQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VS3CD/0SO8xNxhtp42eamE9lOQKphvPiMKocCNGwoI+XvZQfOwfAv+7Q6q+qJF1y5
	 lwyKvGoKAyXJHFlfQef+oQaVsBof6uJW+7igXJ4JNi3J5su0jt0dA+qTpe99HKousE
	 FidmVQXdtwW9tcIf/Q19WkDFTXZIbwPHCkvm++AY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 694E1F80589; Tue,  5 Mar 2024 11:41:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D02CF8014B;
	Tue,  5 Mar 2024 11:41:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6466CF8024E; Tue,  5 Mar 2024 11:40:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA474F8014B
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 11:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA474F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vlk2GqID
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5380861460;
	Tue,  5 Mar 2024 10:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C5BC433F1;
	Tue,  5 Mar 2024 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709635246;
	bh=fDlN5HGLItWU94tsGbGVj8uU9vIMn50cMaUnHApy5eQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vlk2GqIDqBVE1UH49lZkW0JcOqudwvqlb34gphleBZOxNKjGqfEmVXqT9ztvSoRFj
	 wX3/kn/foaV9dvJq+cS2tCAF+0TPHitUaDsjrfxKpA6AaZLQJFEH+ql9J4KiLJKAhz
	 bI/1xkKPiAH2PG2HSyLVmhg7RxSnAf1F4JVUZyDkyP1dOICydaWnkWHL7A6zdlBoUF
	 gH7FFvSEwDIJgGYC+IlMThiN71WHgTMQE2K3qtv57n8XwSoSmPhbtk3mqKyX5sh97P
	 yKaKmNe60gkGEowdh8kYkKOGoLSTV7tFPWy9Ru9Bul8vzLBZmqdyvPuz+1PBNBlnXi
	 4iYkQeYvQH18g==
From: Lee Jones <lee@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20240301101547.2136948-1-mstrozek@opensource.cirrus.com>
References: <20240301101547.2136948-1-mstrozek@opensource.cirrus.com>
Subject: Re: (subset) [PATCH] mfd: cs42l43: Fix wrong GPIO_FN_SEL and
 SPI_CLK_CONFIG1 defaults
Message-Id: <170963524448.85157.8424824978966890082.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 10:40:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
Message-ID-Hash: 45SQLVLNSJZCV5LOOYAUPDMTXOK2AF4A
X-Message-ID-Hash: 45SQLVLNSJZCV5LOOYAUPDMTXOK2AF4A
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45SQLVLNSJZCV5LOOYAUPDMTXOK2AF4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Mar 2024 10:15:47 +0000, Maciej Strozek wrote:
> Two regs have wrong values in existing fields, change them to match
> the datasheet.
> 
> Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> 

Applied, thanks!

[1/1] mfd: cs42l43: Fix wrong GPIO_FN_SEL and SPI_CLK_CONFIG1 defaults
      commit: 78334c343bef528b911da83a6b041d15a1a72efb

--
Lee Jones [李琼斯]

