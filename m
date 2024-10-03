Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA898EB15
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 10:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2824A74C;
	Thu,  3 Oct 2024 10:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2824A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727942967;
	bh=e5W2aYSP1MKqfdbHXFkLuzX4Zd/Z/L7WAazVK9xYHEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CyJR/EWcAM1S+RJnSJBf3T40I3wquJswqzovSIBG73HsMIb+13sgW+rEvz/z4IfFx
	 BN0lPpRdwWR33RBwUxYng2hJskCFBPYZ4AsProWllKi6yVJg+8MQVbyLNIhT+qDYhU
	 92nlo6tOi6C4kU9g9f9+TMz4mDghdpIBIC3w6fLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12FE0F80527; Thu,  3 Oct 2024 10:08:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E82F805A8;
	Thu,  3 Oct 2024 10:08:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 131A4F80517; Thu,  3 Oct 2024 10:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FEEEF80107
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 10:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEEEF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DqfZFW6E
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6D51A43435;
	Thu,  3 Oct 2024 08:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D226C4CEC7;
	Thu,  3 Oct 2024 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942924;
	bh=e5W2aYSP1MKqfdbHXFkLuzX4Zd/Z/L7WAazVK9xYHEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DqfZFW6E8ftGnXrPuTs7A+tykuu7TcfmXmDLQefs4Uc82jjQnHTsLbeOR6TfeyZI7
	 DEJ1U27tIbAHT+6yHsTDFKIVY0BZXAIoq0PdFQYGYMGlBik8koADz68tu9xEP6QFFM
	 gcY0YbXFpLs9szVzjOMFlPM6f2XlSTHCIbis7sBiW4oVWlwjob4eBtBd3NtIrfnz/x
	 vC2Z6NrIukyh8uCiYuv0RZxjY609DDhvdhWQPSI0buiflKsqvLRL8F99Est4FDa4NL
	 YEqw/Ika+TjAwleXlPraM3J9Jxc6C1KThEkzHE2VJAazf7MkC2XRHVJOaGy0QsYcVf
	 F59Qq4yfoHU7A==
From: Vinod Koul <vkoul@kernel.org>
To: broonie@kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/4] refactor amd soundwire manager driver for acp 6.3
 platform
Message-Id: <172794292092.250995.1839758557261465524.b4-ty@kernel.org>
Date: Thu, 03 Oct 2024 13:38:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
Message-ID-Hash: 5TS4KK5DVA6KFG7KY745GJ42RYXJQLH4
X-Message-ID-Hash: 5TS4KK5DVA6KFG7KY745GJ42RYXJQLH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TS4KK5DVA6KFG7KY745GJ42RYXJQLH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 24 Sep 2024 13:48:42 +0530, Vijendar Mukunda wrote:
> This patch series refactors the amd soundwire manager driver to support
> acp 6.3 platform based on acp pci revision id.
> This patch series prepared on top of asoc tree for-next branch.
> This patch series should be applied at one go.
> 
> @Vinod: Please help to review soundwire patches and provide ack-by for
> this patch series.
> 
> [...]

Applied, thanks!

[1/4] soundwire: amd: pass acp pci revision id as resource data
      commit: ced20ea315fe8591093f19574ec32222c1ab71ba
[2/4] soundwire: amd: refactor existing code for acp 6.3 platform
      commit: 7b54323dde29452dd06e6acd2701d9b489c9547d
[3/4] ASoC: SOF: amd: pass acp_rev as soundwire resource data
      commit: 1bb50ead592ceaf2b1572c7d08797b8b3229432e
[4/4] ASoC: amd: ps: pass acp pci revision id as soundwire resource data
      commit: 425f598ea69713b9e60f08e48a19be56b7bfddbc

Best regards,
-- 
~Vinod


