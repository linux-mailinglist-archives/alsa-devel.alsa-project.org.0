Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CD86F56C
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Mar 2024 15:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE78847;
	Sun,  3 Mar 2024 15:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE78847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709474651;
	bh=D4QlXce0c91s/ffFvETgwwOIaFxWa6yMBjLyBctvMOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aH1KN2F0UVidr2gVq6JSc1TX5dfcGfsmv/OEwHB3xUWM+Jxg4/PJpnOUI9HsPTpxl
	 Mq8Zn0mRtESMiFBNIhcUBsElF9YNUhSRrWoaCshUCZIPcumNuM9ULqk92hUP9Xigwy
	 9AM8gieBhjKbhMDybLVobz7eBnrop53ri1yfUPqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10CE0F80570; Sun,  3 Mar 2024 15:03:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A96F80571;
	Sun,  3 Mar 2024 15:03:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EF8EF801F5; Sun,  3 Mar 2024 15:01:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F4BCF8024E
	for <alsa-devel@alsa-project.org>; Sun,  3 Mar 2024 15:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F4BCF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ScUlgv/8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 445D560BB8;
	Sun,  3 Mar 2024 14:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C821C43394;
	Sun,  3 Mar 2024 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709474483;
	bh=D4QlXce0c91s/ffFvETgwwOIaFxWa6yMBjLyBctvMOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ScUlgv/8P7vVsi/iIa0rTXlTkk7w2dsZL1Erbny1qdbbCnbX/YAn2Xrnf7oEdqU+b
	 5exRWZJfDUukjgcah+Z5d4fkPLlGOrCS7DvDnnGHs7cZ+fvdCXz6C+OTfcVwkyXRxL
	 ArCRacqborrmxvMVq6EpnHR6RrU9C/SsX68LM3HprxfT68HVGCCisnYcvVqLS1FN0P
	 CZ2K4EL/60oa5QTITKsZP+b2yahPa3JmlHK6iGE/a7ZlMHCHacK2f9EhbWyX+WVwGm
	 Od6iwNLOVmpWN/+2YKSzY2Viv0rmdpXmlWJOADvkB5xPUdhetwPgUwKnuk9TO/xZFQ
	 OBQH9isk6eNWw==
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20240219105206.335738-1-cezary.rojewski@intel.com>
References: <20240219105206.335738-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] soundwire: Use snd_soc_substream_to_rtd() to obtain
 rtd
Message-Id: <170947448017.763853.3989657204347502636.b4-ty@kernel.org>
Date: Sun, 03 Mar 2024 19:31:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: TCLLYV6YNCICTBGNLUSTUS572B7SOCUL
X-Message-ID-Hash: TCLLYV6YNCICTBGNLUSTUS572B7SOCUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCLLYV6YNCICTBGNLUSTUS572B7SOCUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 19 Feb 2024 11:52:06 +0100, Cezary Rojewski wrote:
> Utilize the helper function instead of casting from ->private_data
> directly.
> 
> 

Applied, thanks!

[1/1] soundwire: Use snd_soc_substream_to_rtd() to obtain rtd
      commit: e17aae16acf53938deb4b7702aa4f6cee2c4a073

Best regards,
-- 
~Vinod


