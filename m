Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E674C737FBA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 12:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC9E822;
	Wed, 21 Jun 2023 12:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC9E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687344898;
	bh=8b+uU3Bs2sYqRmJk9/fT6n7FW28WjMTbPY0E1GKJS1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VcF6RYwXsdeIKfYLYT4NDYaab0G/vnEjPb4p8U4E6cuWfLy6YhYTT0Fx9uPeMMUSk
	 N+ICzzMk72gk6WB687YBlTbVpjS0DVB+qLHKsCIycEfDggfv1GOGDCb2Y5Luj80tO9
	 HeXdRko/JfgMSu7ZQB+LEnd9QDvU/jpt/PL1JI3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50FCDF801F5; Wed, 21 Jun 2023 12:54:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0863BF80132;
	Wed, 21 Jun 2023 12:54:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA1C9F80141; Wed, 21 Jun 2023 12:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD707F80132
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 12:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD707F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gMF6LhlQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACDE0614F0;
	Wed, 21 Jun 2023 10:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DEFC433C0;
	Wed, 21 Jun 2023 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687344834;
	bh=8b+uU3Bs2sYqRmJk9/fT6n7FW28WjMTbPY0E1GKJS1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMF6LhlQ8BB9kWB22e32blkxJkHYKdSnN11rulUgtPhi6lIpYQ5GY+v+qP1GwDNVS
	 AobbulHyeFXjObvKjs6whBlw2A87+z2ckauyf6gu46egCRue0gNn21iqItpjNmXQXG
	 FrUPT2O5nKVyv9rRr31X3tkKP1z8xnBtb188e+tSHJXpDQ7Hh2bw/0CMwX+qIIF1vh
	 ujJidCroEGOWsNy3mS7EUGGtTo6RlSw77kU7b6Ug+QRoLi9l4VQN+kSzxFAUPuZdev
	 FWauUE17DS5B/0PHHVu4JHfmECqb7W3jPBI/bOw8ORmEK97BRE/UE4ufKgUSCOgaht
	 /K4EfiN1xnDBw==
Date: Wed, 21 Jun 2023 16:23:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] soundwire: bus: Prevent lockdep asserts when stream
 has multiple buses
Message-ID: <ZJLWvSRevDmdP/Cy@matsya>
References: <20230615141208.679011-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615141208.679011-1-rf@opensource.cirrus.com>
Message-ID-Hash: IS4ZBHSEJIB65RXWZSDOV74KHYJZNRDP
X-Message-ID-Hash: IS4ZBHSEJIB65RXWZSDOV74KHYJZNRDP
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IS4ZBHSEJIB65RXWZSDOV74KHYJZNRDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-06-23, 15:12, Richard Fitzgerald wrote:
> Give the bus_lock and msg_lock of each bus a different unique key
> so that it is possible to acquire the locks of multiple buses
> without lockdep asserting a possible deadlock.
> 
> Using mutex_init() to initialize a mutex gives all those mutexes
> the same lock class. Lockdep checking treats it as an error to
> attempt to take a mutex while already holding a mutex of the same
> class. This causes a lockdep assert when sdw_acquire_bus_lock()
> attempts to lock multiple buses, and when do_bank_switch() takes
> multiple msg_lock.

Applied both, thanks

-- 
~Vinod
