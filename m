Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3184C6CF
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 10:03:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2092484D;
	Wed,  7 Feb 2024 10:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2092484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707296594;
	bh=n16H6C7qD7/PvLAlbp7IuAkQRMQk1BEPXl8o0SoT2aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jMfQbT0TFwkLFMtfb2Oq8k05msMHOp4iSC+nflzZqHPz22LudLdHHEc7ZSuGzEl5t
	 Q62qgiPsFZcYNoGcvudFJSK3DSaRRaHbK86ZoJY7K+HsEGhaY5rk63VX9Z019RiM+R
	 JGoI5cLpgrmxVmz+54pyFIYGZWpX9jUbl2Alj2Xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CFD9F805A9; Wed,  7 Feb 2024 10:02:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36B5AF8057C;
	Wed,  7 Feb 2024 10:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB282F801EB; Wed,  7 Feb 2024 09:56:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44B5AF800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 09:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44B5AF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PN2f31id
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E3DECE1853;
	Wed,  7 Feb 2024 08:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9E1C433C7;
	Wed,  7 Feb 2024 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707295970;
	bh=n16H6C7qD7/PvLAlbp7IuAkQRMQk1BEPXl8o0SoT2aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PN2f31id9dC3HHooKnb5zlqeGbDCI0DBE4S4hu7tV02unUDSqAg0Ohg0zslx5qvR0
	 l8HSalsVwsUxb2B1kgKmdpGpDxvsPaQK05gkFQNCnl/j0DeXMVhQePES0H1Z89MaoC
	 IwDzDxUa52ebr8mvjj5tHBmpw5EHUEiavCEbuk6SlXytznQ1NwwkhBhn6h26wY81WE
	 TjnCSocstnvYsNdbLctmwfXhRCwlg3qWuQjvJhTC+eu20hnVxiiTWJAFExe940ODis
	 GufMk0ZBR8mMzFDsUE77hvYqn+yT6Ahn2mZjq5CFszZ72EpQ2V26zhLn+QY42hqxEH
	 1pjJCv7ZeFKZw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240205182436.1843447-1-colin.i.king@gmail.com>
References: <20240205182436.1843447-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] soundwire: intel_auxdevice: remove redundant
 assignment to variable link_flags
Message-Id: <170729596857.94552.8333430107320887182.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 09:52:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: QHPW4RLXBBVT3LALDPIEULOIIKTDSND5
X-Message-ID-Hash: QHPW4RLXBBVT3LALDPIEULOIIKTDSND5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHPW4RLXBBVT3LALDPIEULOIIKTDSND5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 05 Feb 2024 18:24:36 +0000, Colin Ian King wrote:
> The variable link_flags is being initialized with a value that is never
> read, it is being re-assigned later on. The initialization is
> redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/soundwire/intel_auxdevice.c:624:2: warning: Value stored
> to 'link_flags' is never read [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] soundwire: intel_auxdevice: remove redundant assignment to variable link_flags
      commit: 9282cfa2eb080e3bbb95f488af35618b614cdf76

Best regards,
-- 
~Vinod


