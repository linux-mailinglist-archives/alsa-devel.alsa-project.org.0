Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E531784485
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 16:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA3A3E8;
	Tue, 22 Aug 2023 16:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA3A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692715188;
	bh=1+RJ1M6QJX8MLAXrvtw4SmvGw+B+4yYVB2UUeN6A+zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O1E7fWSob97ATz2PUXeLxkATaGMMhXogHQEdw3Hx8lDR8ZYDo3LRcFtTSC1iJ3eQo
	 7040cu1dExxqfU5qyljLFGdQGyF/goD+xFdf5E0o4FyKut980sEvRFAITqVX1U5rDd
	 xlfLle++2FZKBEt2h/ORcCDm319wD7U67swzTs4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E782FF800BF; Tue, 22 Aug 2023 16:38:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCA0F800F5;
	Tue, 22 Aug 2023 16:38:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 753F7F80158; Tue, 22 Aug 2023 16:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E5D8F800AE
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 16:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5D8F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kkssIQIy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40434624C0;
	Tue, 22 Aug 2023 14:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD58CC433C7;
	Tue, 22 Aug 2023 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692715123;
	bh=1+RJ1M6QJX8MLAXrvtw4SmvGw+B+4yYVB2UUeN6A+zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kkssIQIy+tpavbENVGV+TbD3Q/lvmWOhmT72sjkTzTtHjzBpzUndVdzDath4cEwYd
	 9uGqk0Ufu03x7mSsSsa6ZHF4/DUPD5MotI8zweCY8Tz6lLGvf+Rp0113++Mdd3o3JS
	 dJ+4sxLvCnam1F+/qyeGMBmF9PPJZPl6UBxIeDJQuxXkw5BuZPARvBsel4jJVfwuXU
	 s0A5HB25wKRFVYjvv0/tMb0yay/18trXA2GqcFZe7cPj4fl7BYvIQzAP9NX+vuDudl
	 mqSdkvr/3fW+mZY2W16IqVuNxS0CzNQgh0IrpfufiOgFRANURVjmWZ0pqYWDdqdNZl
	 tKPvMatD/wYNA==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20230802061947.3788679-1-yung-chuan.liao@linux.intel.com>
References: <20230802061947.3788679-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_ace2x: add DAI
 hw_params/prepare/hw_free callbacks
Message-Id: <169271512146.281392.3704161093550026838.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 20:08:41 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: LZPQVLDES6VT2VLTZC2CX5XMN7KNETIY
X-Message-ID-Hash: LZPQVLDES6VT2VLTZC2CX5XMN7KNETIY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZPQVLDES6VT2VLTZC2CX5XMN7KNETIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 02 Aug 2023 14:19:47 +0800, Bard Liao wrote:
> The code is fork-lifted from intel.c and is mostly similar *except*
> for the SHIM configuration which cannot be done here with the
> introduction of HDAudio Extended links. The ACE2.x SOF side also
> requires the hw_free and trigger callbacks to be implemented for
> HDaudio DMA management
> 
> 
> [...]

Applied, thanks!

[1/1] soundwire: intel_ace2x: add DAI hw_params/prepare/hw_free callbacks
      commit: 8c4c9a9ae5aff2125ea44f0b26f9e3701d56d6db

Best regards,
-- 
~Vinod


