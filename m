Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3498EB16
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 10:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3552C84D;
	Thu,  3 Oct 2024 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3552C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727942988;
	bh=ODsvNPNH3sgvdZaMhzF87Edl9jlOg6OF4Z15ytN5G3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5Da1NRsBVDHEmLJx1Nso+g54eEBOxydKk/bnR/zhIi+wf24Nm8tcdXeGdlZYO1NV
	 b0BX0EoIROQCcTXI1yMS8P2f6v37LR+QLKp/sEfJJ30i/QU7F5FmJR+jXQ5xmZ+B8S
	 VdmzFY0VU9+yO5zGix3VCIDLD7cAbVkQUd8iOhPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61E7FF805C2; Thu,  3 Oct 2024 10:09:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D229EF805CA;
	Thu,  3 Oct 2024 10:09:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AF43F80517; Thu,  3 Oct 2024 10:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8794F80107
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 10:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8794F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VMtw5Cb6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 773125C59D3;
	Thu,  3 Oct 2024 08:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D658C4CECD;
	Thu,  3 Oct 2024 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942927;
	bh=ODsvNPNH3sgvdZaMhzF87Edl9jlOg6OF4Z15ytN5G3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VMtw5Cb6QLuTIsG7PmO6D7g0W5OCF5piz2+c8CylZxYn4GWOwJpRL2iwRMkmSIyUg
	 0X/4aIKMrFl+gTQmaPWcuWRIYc6uHBYL4guVapADf/++3WylrZ3XwG0QopjlJtBYne
	 JC/m1rBhRiG0kavfvT5+hvRKva+NvRpBS8zG3xmcDHH5jTte/HMjIcrv8V3eLGc93T
	 GpKtijujak3SHLOe+ZOu9lFyoQIJAUDr2Fn1cVGR2TpB7AGgwFS/nGEGc08yUV13hk
	 0g0VwsIRucLPB+TIqgV+Np8CvD377pXUZWRoT35Cxt8ZoQvAdIX3MwmBa4yDLV+YZ0
	 atWkPRzlaR2pg==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, Shen Lichuan <shenlichuan@vivo.com>
Cc: pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240925081134.10248-1-shenlichuan@vivo.com>
References: <20240925081134.10248-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] soundwire: Correct some typos in comments
Message-Id: <172794292500.250995.16416368820266397041.b4-ty@kernel.org>
Date: Thu, 03 Oct 2024 13:38:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
Message-ID-Hash: TWBIESDMHLAQ47MS67LZ3FBRQOQLOX2W
X-Message-ID-Hash: TWBIESDMHLAQ47MS67LZ3FBRQOQLOX2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWBIESDMHLAQ47MS67LZ3FBRQOQLOX2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 25 Sep 2024 16:11:34 +0800, Shen Lichuan wrote:
> Fixed some confusing spelling errors that were currently identified,
> the details are as follows:
> 
> -in the code comments:
> drivers/soundwire/bus.c:115: enumuration==> enumeration
> drivers/soundwire/qcom.c:1176: wil ==> will
> drivers/soundwire/sysfs_slave.c:218: highligh ==> highlight
> 
> [...]

Applied, thanks!

[1/1] soundwire: Correct some typos in comments
      commit: a54dc8c68a5b33ca00b8dcd3b87681aacfbfc9dc

Best regards,
-- 
~Vinod


