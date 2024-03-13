Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2523787A85C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 14:29:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08AB21A4;
	Wed, 13 Mar 2024 14:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08AB21A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710336540;
	bh=CHtNAQTIT1rvRWPPhR3rIHeiRbGPnmXiD2gTyBFLaGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t4XxFg0NlHP5HZyZ3XL5fxQ0eRWw2uDZ81Tg4FyKcqAxqNJ9UzwzkmrMm+m1VMRgi
	 0UR5cIMqXlJSOePhV0KcjCdkS3CfrfGf1jfOdSsAdGQNFm8dLhGE56IeOZpnGFaQDH
	 47brXVoUjF9kLlO9KeK6plMz1i8xytG0ttlXGB/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6801EF80579; Wed, 13 Mar 2024 14:28:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9124F805A0;
	Wed, 13 Mar 2024 14:28:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979CAF8028D; Wed, 13 Mar 2024 14:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86614F8014B
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 14:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86614F8014B
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrt96D1qz4x4T;
	Thu, 14 Mar 2024 00:28:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Dawei Li <set_pte_at@outlook.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Message-Id: <171033598348.517247.10069683831844972530.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HNCTWU3PJF2AJCVBGSMZHEN6WX6O7HVL
X-Message-ID-Hash: HNCTWU3PJF2AJCVBGSMZHEN6WX6O7HVL
X-MailFrom: michael@ellerman.id.au
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNCTWU3PJF2AJCVBGSMZHEN6WX6O7HVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Feb 2023 22:36:19 +0800, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: macio: Make remove callback of macio driver void returned
      https://git.kernel.org/powerpc/c/9db2235326c4b868b6e065dfa3a69011ee570848

cheers
