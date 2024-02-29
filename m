Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B847B86D13B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 18:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C68847;
	Thu, 29 Feb 2024 18:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C68847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709229336;
	bh=wcTJ+jcw4JHQfD5Uq2LZ/uVm9cXm5XQGypXgvX5wUZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f6jq4F83L8rif5B5IfT+rDwQbmlF5H843hMkWw9qC0xtHvFKo6z3TEnEhHY3R8ktx
	 uRplB/HXyKmw/JgnwF9NxUJFwwKiHVyUv2DDiqI0OxRWwR/V8+O977bMylG6tfMkPu
	 Hmnuw7i0HIlPMv42FFy0dXGGz9c3V8S/9AWgOkPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8BBF8057F; Thu, 29 Feb 2024 18:55:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF37F805A0;
	Thu, 29 Feb 2024 18:55:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5546CF801C0; Thu, 29 Feb 2024 18:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F4CFF800F0
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 18:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F4CFF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iTscuO98
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58CFDCE17A3;
	Thu, 29 Feb 2024 17:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930CAC433C7;
	Thu, 29 Feb 2024 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709229291;
	bh=wcTJ+jcw4JHQfD5Uq2LZ/uVm9cXm5XQGypXgvX5wUZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iTscuO98vJO1y21Tyz5KLRiBR7J4pdyIJq94pLizg1TyEe+7QGAsSai9L/gJ5PLey
	 NwG7Hz3R3YjQ5GAQ0MF8A7gqLkUCpUTGtQuc9oELROVq7Q3qi5I22H32/V36mjgodE
	 59c9vmnH0J5aizaW4sGBmVAXmiFuUbgVLfvb/jgq6/4yLVXo6/UmppJyPRd/0EUH3l
	 4uCMaep8BYYacjXJmypJ8F5BYIhquO97Yjn2GPEwNTXU6FG4J17roQNmzsf0hvHJpD
	 +tJ4b3VotRrEede2ginFiPjOA4gu+DwoPLt3V6akZ+H0IOJCEXocNbMEc87b3qrgtb
	 o7D6fQznOlX9Q==
From: Lee Jones <lee@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20240229155616.118457-1-mstrozek@opensource.cirrus.com>
References: <20240229155616.118457-1-mstrozek@opensource.cirrus.com>
Subject: Re: (subset) [PATCH] mfd: cs42l43: Fix wrong register defaults
Message-Id: <170922929033.1634028.9810093983638212642.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 17:54:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
Message-ID-Hash: 6LPTE2HZPAQTLCXJRS6B2Z526SGS2G6X
X-Message-ID-Hash: 6LPTE2HZPAQTLCXJRS6B2Z526SGS2G6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LPTE2HZPAQTLCXJRS6B2Z526SGS2G6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Feb 2024 15:56:14 +0000, Maciej Strozek wrote:
> A few regs have unnecessary values in defaults, change them to match the
> datasheet
> 
> Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> 

Applied, thanks!

[1/1] mfd: cs42l43: Fix wrong register defaults
      commit: c9e1e505cde1a8ddd0968b4d54ec2ea1937dfe00

--
Lee Jones [李琼斯]

