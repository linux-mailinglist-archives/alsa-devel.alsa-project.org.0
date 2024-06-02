Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FB8D7671
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2024 16:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5940857;
	Sun,  2 Jun 2024 16:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5940857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717339838;
	bh=qqpqDZSrYTMw/+DH41TIxGx0oYZrcIkZ38JENHmMPBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQB+h851GYrwucgJrDlcW0MTM+Lwgx7E5A3NNy873sL7M8h50zo5lP8n0F1T3iAEA
	 C7l0PIWE5YDYWm5WbI6w+2lDNwzEfcnOWjMQYQO0ZB1KnZ8BLShM5d6uwuq6Wp1Qan
	 BUqtIC6aVAvzOqSqAEUDm5RUUautlI9kJK/GVpmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB9AF8058C; Sun,  2 Jun 2024 16:50:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 719DAF8058C;
	Sun,  2 Jun 2024 16:50:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 260EDF800FA; Sun,  2 Jun 2024 16:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C635CF800FA
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 16:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C635CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iJyg7vR7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1449CE09AC;
	Sun,  2 Jun 2024 14:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F8FC2BBFC;
	Sun,  2 Jun 2024 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717339785;
	bh=qqpqDZSrYTMw/+DH41TIxGx0oYZrcIkZ38JENHmMPBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJyg7vR70GoaKryNgXpEIw0bOarjnZ/mKREJ/MOVm2FtiinHu2v4otRv06gM4NHRf
	 DvYR1BQ0dfsLVjIGOzncbYbDwBGi1rDLIBeeFMOhYeJpkvnqSzcjyE1BHq9NiWmjFL
	 OUk2SeQEXkqqLyKs3fC+lGgU7jyhG2TUeuPLk0AqpbS+PUVes2MS0+648YfHh01E91
	 DPgjCIrRQPp9G4N5uXUCVyMPhfiD+wqUbmq9jCDBp/UW1DXdCuDimMYgfsfIf0WMBa
	 FGpEoINOsqJWrd/5x87AB/wJ6hL6AX7/s47wGSpxfxYOcuHLxRjTxOoyFjhQxmpuEQ
	 Dc/05BvAjbCnA==
Date: Sun, 2 Jun 2024 20:19:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, rafael@kernel.org,
	andriy.shevchenko@linux.intel.com,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] soundwire: slave: simplify code with
 acpi_get_local_u64_address()
Message-ID: <ZlyGhHNkcgrojyqs@matsya>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
 <20240528192936.16180-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528192936.16180-3-pierre-louis.bossart@linux.intel.com>
Message-ID-Hash: OCJEUE3OMJRYM77NW53HCTWFGTBMGYBO
X-Message-ID-Hash: OCJEUE3OMJRYM77NW53HCTWFGTBMGYBO
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCJEUE3OMJRYM77NW53HCTWFGTBMGYBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28-05-24, 14:29, Pierre-Louis Bossart wrote:
> Now we have a helper so there's no need to open-code.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
