Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D64842894
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 17:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B05EC1;
	Tue, 30 Jan 2024 17:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B05EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706630471;
	bh=BQnJxt/6OS3FdXXe/qYzui9WFCJCw4J5sxKUD01/dHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=keNcyHCtHcnceHUli33dYeOf28zBk3PtcNmmN6WW69nI0II05+Fsgb82pdzBIkqVO
	 a7cK06PdP8iAce9AU03R2MHNLMwboZ+uZeeO8aYuvZuoyV/7j9FjsJXTOmmddFvJXH
	 WL/ffeTOESvUGB7FLClJq2BNc2Rz6lm4CLfPIylM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7328F805C5; Tue, 30 Jan 2024 17:00:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2F3F805C1;
	Tue, 30 Jan 2024 17:00:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D588AF80568; Tue, 30 Jan 2024 17:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA9C1F8055C
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 17:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9C1F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FRElqKAs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7797460E0A;
	Tue, 30 Jan 2024 16:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06BAC433F1;
	Tue, 30 Jan 2024 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630436;
	bh=BQnJxt/6OS3FdXXe/qYzui9WFCJCw4J5sxKUD01/dHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRElqKAsjwznPAch1h3vrxzOFMRH5el1GKZjblMKFSM7PkGTgYZs70vvstZC7VjRh
	 s34ZZo9RYewygXrZfW2eYO7ogmY4BMWiTpoSGrW63oa4E+cGsUdhkaEV4gG3tck2zx
	 D7/aLnmWiwIVPgwvedvv1m+6XeV2wUUBG7lMNHg9wnRgOBYkUUJqI3PkEYGOu9s83U
	 amxgtZAq7RMQ7ccug70sW71+KgzclBQ34QBYTywE50nLfpSnDA21I5rhA4o1m3Df5H
	 SHr1h8pH0CJXVQbu4X5pVKiYog0EJrfsbhYhBjBhweqHEKuZ4fJjmskkNvKSQ7uJ1u
	 4rqpmnOQzTXPg==
Date: Tue, 30 Jan 2024 21:30:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 05/13] soundwire: amd: refactor soundwire pads enable
Message-ID: <ZbkdINFRDNr2KDWD@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <20240129055147.1493853-6-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-6-Vijendar.Mukunda@amd.com>
Message-ID-Hash: HGHTK3N3XUBBQP7I6DQKZ3553PWNA2US
X-Message-ID-Hash: HGHTK3N3XUBBQP7I6DQKZ3553PWNA2US
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGHTK3N3XUBBQP7I6DQKZ3553PWNA2US/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-01-24, 11:21, Vijendar Mukunda wrote:
> As sdw pads enable sequence is executed only once, invoke it from probe
> sequence.
> 
> Program required pads for both manager instances based on link_mask during
> probe sequence. This will avoid acquiring mutex lock.
> Remove unnecessary delay after programming ACP_SW_PAD_KEEPER_EN register.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
