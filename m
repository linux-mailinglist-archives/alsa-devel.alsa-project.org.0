Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D637F5920
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 08:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6769DF9;
	Thu, 23 Nov 2023 08:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6769DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700724227;
	bh=CsnrSxt8LqWz3IlU5RxL7FNAeARoDHTOQPwscn2bFpU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PxU1X60NY+zrhWdOh1q2UxWqwpcSFGWb4xtqcTs2OLsNiEb+iiBl+XIgjt0LzwCrh
	 YVUXMiGNIESrv8LpjM82ji+7O7Io1JR6cZ6oGNjfnnH5iBB8QaBghLcXtyk6qqo6IN
	 zUbyQaHp5eG2CVSsHz0upHHKGNZKpD1OXw9VSJhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1564F805D3; Thu, 23 Nov 2023 08:23:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3F7F805BF;
	Thu, 23 Nov 2023 08:23:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B02F802E8; Thu, 23 Nov 2023 08:22:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50B5FF80166
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 08:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B5FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EN5QnXGX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 28DCFB81031;
	Thu, 23 Nov 2023 07:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561C7C433C9;
	Thu, 23 Nov 2023 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700724082;
	bh=CsnrSxt8LqWz3IlU5RxL7FNAeARoDHTOQPwscn2bFpU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EN5QnXGXMDpptcghyw9o8SG+qqcVf9CJSLaF+/zuGzWvy2Q8pJP7X2cFJm+m68l1K
	 Dav99GsszboT1/jgiSD5AHfFbyTo636ngZSDVVPLJFobKHVuLFhc5S+yWxtcWRaGxh
	 puSffdbv4LTlcE6rXhgZ/Bi9/liIxUEMaUIOy7VW1yXWjFgbwY0OTZXjuXH9p84ONP
	 JRCtLH7tCSKExOiLna09iAeB0pnLBligL1YUHIXWPkm4ufNdwXIo/jhWCXWedkMry5
	 OoYA4WH+/fVz+mkGDR8pcBxkWFVVMZPu5EAcsMjrJUIaAIYqEj4ctub9uGMZoUjcv5
	 BaO3F6CTiFNRw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231120174720.239610-1-krzysztof.kozlowski@linaro.org>
References: <20231120174720.239610-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soundwire: stream: constify sdw_port_config when
 adding devices
Message-Id: <170072407994.674978.4727113730635083960.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 12:51:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: 4YTBRRC7A5SMVVNSSCEFJFOYJ4R44G4Y
X-Message-ID-Hash: 4YTBRRC7A5SMVVNSSCEFJFOYJ4R44G4Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YTBRRC7A5SMVVNSSCEFJFOYJ4R44G4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 20 Nov 2023 18:47:20 +0100, Krzysztof Kozlowski wrote:
> sdw_stream_add_master() and sdw_stream_add_slave() do not modify
> contents of passed sdw_port_config, so it can be made const for code
> safety and as documentation of expected usage.
> 
> 

Applied, thanks!

[1/1] soundwire: stream: constify sdw_port_config when adding devices
      commit: 21f4c443731fdb064c0dd31a743aafd0b075156c

Best regards,
-- 
~Vinod


