Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5DA349DD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 17:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C955C6025E;
	Thu, 13 Feb 2025 17:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C955C6025E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739464270;
	bh=Xo8DjJ7dkF4QvlEqmx7HWu1SRPK2cOD4V3F5nnSorQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lzPHKNoJSVdJOoWjsYdQb3xq5PCqYldNLlHGNOnloA5c8ZOR3w/LpbYYs5bpcaTW9
	 MUuCp3B1LbmQ449Bu1xfOl49I189P8PlmlOlPF5R66ptnq5Xw5ERh9jUpq1vUuyjm2
	 +wm60yQDfz78vMv/RgA/DBaPSHp0gwGHXSo8e1cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AEF5F805B5; Thu, 13 Feb 2025 17:30:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6262F805BA;
	Thu, 13 Feb 2025 17:30:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D330F80269; Thu, 13 Feb 2025 17:30:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50561F80185
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 17:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50561F80185
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kx8ZFKG3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1308A4274E;
	Thu, 13 Feb 2025 16:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C05C4CEE4;
	Thu, 13 Feb 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739464209;
	bh=Xo8DjJ7dkF4QvlEqmx7HWu1SRPK2cOD4V3F5nnSorQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kx8ZFKG3JO12fpbDgEZcg4pZJwugnoUKQqXHoLGZa2g5vpq8aJpBrno8DtPHD5k0D
	 BfqwW+w/St5IYOCzcSgJWyxzkIipI+U1HMs0GKmqqet2rGbns6edELrlrNeCI5b5bB
	 qIUx9X516wEWmDvBPzTcnzU3bLJAIA3C+jOsIaB3k3nEb0RWxGYIAMiWqDMu0e4mnm
	 4NI1KPcJVf9GMWjANHJJeBgWZvJFcTCNg4kj5WpT1m96RgUc4uhwmoNOCBTrVlK3UK
	 NGdlQdfoNtjWq1lijyRoecj0ni3TwWZ/wQFHeJ/VPG/sK/zX9R8YYcrhlA0nUUpSCu
	 7PWg0JwScNbMw==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V4 0/6] soundwire: amd: code improvements and new
 platform support
Message-Id: <173946420611.270661.6294707599627839150.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 22:00:06 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Message-ID-Hash: 77VTNYDAMADSVLHYWPRJAFKGGL7CCCA4
X-Message-ID-Hash: 77VTNYDAMADSVLHYWPRJAFKGGL7CCCA4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77VTNYDAMADSVLHYWPRJAFKGGL7CCCA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 07 Feb 2025 12:28:35 +0530, Vijendar Mukunda wrote:
> This patch series consists of code improvements and new platform support
> for ACP7.0 & ACP7.1 platforms.
> 
> Changes since v3:
> - Remove extra white line in amd_sdw_manager_start() function.
> 
> Changes since v2:
> - Rebase the patch series after dropping the patch which adds conditional
>   check for SoundWire manager device resume when wake event is asserted.
> 
> [...]

Applied, thanks!

[1/6] soundwire: amd: change the soundwire wake enable/disable sequence
      commit: dcc48a73eae7f791b1a6856ea1bcc4079282c88d
[2/6] soundwire: amd: add debug log for soundwire wake event
      commit: 19427c08b818c65f579cbfc78062e1ff4c37c768
[3/6] soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
      commit: 2c0ae8ef1e5edfd0e42727fba4617694f3aac2eb
[4/6] soundwire: amd: set device power state during suspend/resume sequence
      commit: 829c3e1cb4a3f60c5cef11963052009ea50d2941
[5/6] soundwire: amd: set ACP_PME_EN during runtime suspend sequence
      commit: 5818ed3636b3c63eddef299223c7369de86eefee
[6/6] soundwire: amd: add soundwire host wake interrupt enable/disable sequence
      commit: 3df75289ddc28b46121d51d2812943b78676497b

Best regards,
-- 
~Vinod


