Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CC86F547
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Mar 2024 15:02:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A2E1CE;
	Sun,  3 Mar 2024 15:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A2E1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709474535;
	bh=j3VKp9c7J/45+77Ghwq5NjSO2ANNztfISOGtRk1wXBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F/AliYHqjiArSBaWX4oTfgKuADBcsvIDm1p8Lb2EaIXxzg5UXiWiwS7VC0qbMIgb4
	 Y3XDv1XErcS5sGrpk74h3Gs3L430YHCSuIkoJEp67TBCx6ct//VaoOjX8R9wXRr0oA
	 nXEMAmHNZeCrUyIlzZ9wgTcc3jMC4Q6WYmIOcenM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15797F80580; Sun,  3 Mar 2024 15:01:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9267EF8057F;
	Sun,  3 Mar 2024 15:01:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF7DF80494; Sun,  3 Mar 2024 15:01:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6B52F801F5
	for <alsa-devel@alsa-project.org>; Sun,  3 Mar 2024 15:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B52F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n1tYmTYS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 492B3CE0F96;
	Sun,  3 Mar 2024 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CB3C433C7;
	Sun,  3 Mar 2024 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709474479;
	bh=j3VKp9c7J/45+77Ghwq5NjSO2ANNztfISOGtRk1wXBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n1tYmTYSegn+1bkfjyFV1OqxIrXKrk5S+W9kdIDzn2EPUo6a5bf3lECn6F3Aq+I09
	 DhkaYloAzBFK4R6TxBPXEpPq8reeOUetf/ygg7Kx+uUupW4WKl1zYeytb+XTRs7hz4
	 /yw1CLOppw037wySUUonJQq1Icq3vinoE+bFAe5rtk4dM/PtEA+gOGpV/DtmJI+HxJ
	 g8XuhJ8tjvS3iEtzTwzZh6IMT/d1TNnRH0HKFzx2yl97E6N1Pe3P/Aq/gwRgkkBgch
	 htRXyUmdcWnZnamUdiViU4Xa79mFJ3z2Z3+Gn+YnV+e+yiOkiGdEvOPWMyJ5gzWj4n
	 FECSQu9PIJ6Lw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: 
 <20240219-device_cleanup-soundwire-v1-1-9edd51767611@marliere.net>
References: <20240219-device_cleanup-soundwire-v1-1-9edd51767611@marliere.net>
Subject: Re: [PATCH] soundwire: constify the struct device_type usage
Message-Id: <170947447688.763853.15642162619059844196.b4-ty@kernel.org>
Date: Sun, 03 Mar 2024 19:31:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: OYG4QBSK6SJEOYZTMXREEFL6Y2AWFVEP
X-Message-ID-Hash: OYG4QBSK6SJEOYZTMXREEFL6Y2AWFVEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYG4QBSK6SJEOYZTMXREEFL6Y2AWFVEP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 19 Feb 2024 09:14:36 -0300, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the
> sdw_master_type and sdw_slave_type variables to be constant structures as
> well, placing it into read-only memory which can not be modified at
> runtime.
> 
> 
> [...]

Applied, thanks!

[1/1] soundwire: constify the struct device_type usage
      commit: 99fea943d9dc2500227bced9acd671e5b39a1471

Best regards,
-- 
~Vinod


