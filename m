Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6350B9FABDB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 10:13:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C098601C4;
	Mon, 23 Dec 2024 10:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C098601C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734945179;
	bh=istvPy2pFGaVu762bO58v7w7Hn58Yh7LMqpm7I69E7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cvFDu4ffzbenE8YRoKaDHrOm1/4w3NJxep3s8mUSYE/g9vhKwmeL09neL0u5YqFN0
	 obLE/OZKlRrclrMvLDkvpe/2c8p4HHvU3bEx3ff3tm6/K/XXaLGvApV+nopLo1wsMm
	 IMwv33+dxlBF8us7VaC1V/KecGPAt/kz7WTqeOhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F100F805C6; Mon, 23 Dec 2024 10:12:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D58F2F805C1;
	Mon, 23 Dec 2024 10:12:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE44F80254; Mon, 23 Dec 2024 10:12:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA83F8012B
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 10:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA83F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HhQmfnY/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861DC5C568C;
	Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713BDC4CED3;
	Mon, 23 Dec 2024 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734945135;
	bh=istvPy2pFGaVu762bO58v7w7Hn58Yh7LMqpm7I69E7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HhQmfnY/NAeCFPzoHTBlLDUtjrk/a9QtbBc8YPRlsBKY1yg9vQD7/MLZ5jlB5cggf
	 EpCCusij4ZDU7AcMn/9uXYTVo4G2DOI8rz+Yd6wsyoFKzefjzWDWAMuZ73AnP06+0a
	 Cq7HxJbr+h42/fbxU5Vz1Ol/yaJmxglbgMpPAEmjC0GlMjX886k9EYaw/hdF0SE729
	 2SRasm7qkmQZgOgWxrYNlsT5hLQsWqNOlVMEz6QmxtLTm/gxXsu9pqWdZvwYf+6tON
	 F/Is8y9Vy9wpuRcp7mzaLksTo+mzDXrcZWVSafIhgRB9AM0azpppe7ygIkTni6CqqL
	 ajIQPDm1gJ+XQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com
In-Reply-To: <20241112185138.3235375-1-Vijendar.Mukunda@amd.com>
References: <20241112185138.3235375-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] soundwire: amd: clear wake enable register for power
 off mode
Message-Id: <173494513209.830310.16014116903746147360.b4-ty@kernel.org>
Date: Mon, 23 Dec 2024 14:42:12 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Message-ID-Hash: GIEHCA6QUP7462CJA4ZB7MSTTR53XBWW
X-Message-ID-Hash: GIEHCA6QUP7462CJA4ZB7MSTTR53XBWW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIEHCA6QUP7462CJA4ZB7MSTTR53XBWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 13 Nov 2024 00:21:38 +0530, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: clear wake enable register for power off mode
      commit: 74148bb59e2064b87eb1715d9eb109adccb75316

Best regards,
-- 
~Vinod


