Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A6857C48
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 13:04:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7638EE80;
	Fri, 16 Feb 2024 13:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7638EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708085059;
	bh=5Q+kd71G8dshq5qDySGQ0Qz6DT8zy+MvtrCDJcuOJ8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M6Xj+CfVebrIA73BaOHJjMYSDZQt9SHskH2BHfn3uP4xzU5d4RHOal9WC5D4FOKJM
	 uTLkysLqAxJz3pJrIwmzyoKiqvvp2HBuZKL5nP6Ry65d/7DIXcAuLFLV6kp/IoiIQY
	 oUsFzWYgFEaYZ5cb8EDZlsQ3QYqpIaqKQvC5iWV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C725F80588; Fri, 16 Feb 2024 13:03:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A63F8059F;
	Fri, 16 Feb 2024 13:03:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F51F80238; Fri, 16 Feb 2024 13:02:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB2ECF8015B
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 13:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB2ECF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DsZBIPWg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4183ACE0BAD;
	Fri, 16 Feb 2024 12:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29113C433C7;
	Fri, 16 Feb 2024 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708084953;
	bh=5Q+kd71G8dshq5qDySGQ0Qz6DT8zy+MvtrCDJcuOJ8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DsZBIPWgxa3vItensb1wYxtotyg7XoIFnRPrb+p1LEepBCK1rJvY/HkdbQiNOAQ1k
	 fzWZCS+OFtBvLJztcG8Ff8mqyaluQs0J0un8JNfijpoLbyPNCmTwZw61TlZvF8dsUW
	 25Ft1Yxo9A/5dx+uUaJIkea+4dYJWBkmWZ6cU390DUvfqrhybyxd7SA7xypeta+8pH
	 0UfuzlbMNepNIj4+lxIKZEZk5/0BaY5EBQ27lsbEcW9LswIVVZWRwoYwM/sD4KiKvp
	 sl2PoZ46i7gtCJd6z0gCYqoFXeUgsIQQcsE5kpVFQJsis2Gknuwu47uW9GaQCGsRFN
	 mRQjt950K7c+A==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240213-bus_cleanup-soundwire-v1-1-3878b00f6f57@marliere.net>
References: <20240213-bus_cleanup-soundwire-v1-1-3878b00f6f57@marliere.net>
Subject: Re: [PATCH] soundwire: bus_type: make sdw_bus_type const
Message-Id: <170808495076.353215.12668005796440668308.b4-ty@kernel.org>
Date: Fri, 16 Feb 2024 17:32:30 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: ETQ7KZLUFPOWWBCWIC2W7EPBBAY7XOQF
X-Message-ID-Hash: ETQ7KZLUFPOWWBCWIC2W7EPBBAY7XOQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETQ7KZLUFPOWWBCWIC2W7EPBBAY7XOQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 13 Feb 2024 11:36:56 -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the sdw_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus_type: make sdw_bus_type const
      commit: 81a7d0c4d059cb5c122110acbeec7bedfb91a741

Best regards,
-- 
~Vinod


