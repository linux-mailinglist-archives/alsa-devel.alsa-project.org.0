Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDAE74D34A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 12:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33719207;
	Mon, 10 Jul 2023 12:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33719207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688984775;
	bh=8wbTdNkehE98Ctimhl7nOewzsLGVvoA8c+GqiH1ZOE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HTSQK7GgWh+n41AWJ4wZb7PpEj/wu/zTdpBV6LUpRMC3TOjrliLqMngyy1wqJXugp
	 F15Q6o+Y/Zzn+ZxydEgm5EJ6tSu0uXNb5NTBNoyr96N/CJvXHvxrG6JuSnYFvCcLsK
	 SyJJskR0nMh/7M5kh/hjaSGQn1BNc5bJ2w2zurKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD9BAF80548; Mon, 10 Jul 2023 12:25:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0ACF80153;
	Mon, 10 Jul 2023 12:25:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37CBEF80249; Mon, 10 Jul 2023 12:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 702C7F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 702C7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iXl9Eo6S
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E555F60F99;
	Mon, 10 Jul 2023 10:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235FBC433C8;
	Mon, 10 Jul 2023 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688984712;
	bh=8wbTdNkehE98Ctimhl7nOewzsLGVvoA8c+GqiH1ZOE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iXl9Eo6SSYgH/eoyMB8fQr2XK36z/x0kVrQoG0lLfPMq4Cq2yaOBoYJZDKOouKCh4
	 Th5NHzsbFXHwpkAiqmUe3tqLsosQ/JXuG9J4JyHvEMD+7AqcA1BCXi4L4Dod/Of97y
	 YVvqOyixLfaW9ipq+55G58aF0PKUA+J5zBRbOj9A2+poIPhv78PboITZx4EFXiJcoQ
	 ytr9DI4SpwIN9SVA5fNNOOciZU5IuyZVQBs3ymqU41csMMGYtUFI+jt7Y/NVmAgOLK
	 pkAIP4/QGeeq97MOPxblc8QlYCH/w+UethpuLGdyc+u/JPUMNTubblqlinnacnkOjW
	 v814xFgVJEo7A==
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
References: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
Subject: Re: [PATCH v2] soundwire: amd: Fix a check for errors in probe()
Message-Id: <168898470975.164858.364870274805965240.b4-ty@kernel.org>
Date: Mon, 10 Jul 2023 15:55:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: K3OQ3LHEQIAUVRFNB3BQPWMVL5NHTHNK
X-Message-ID-Hash: K3OQ3LHEQIAUVRFNB3BQPWMVL5NHTHNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3OQ3LHEQIAUVRFNB3BQPWMVL5NHTHNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 08:42:10 +0300, Dan Carpenter wrote:
> This code has two problems:
> 1) The devm_ioremap() function returns NULL, not error pointers.
> 2) It's checking the wrong variable.  ->mmio instead of ->acp_mmio.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: Fix a check for errors in probe()
      commit: a06d6088cfd49b63a2759910f2328ba28d6a342d

Best regards,
-- 
~Vinod


